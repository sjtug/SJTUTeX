#!/usr/bin/env texlua

module             = "sjtutex"

sourcefiledir      = "source"
sourcefiles        = {"sjtutex.dtx","sjtutex-font.dtx","sjtutex-preset.dtx","sjtutex-lang-scheme.dtx","vi/sjtu-vi-*.pdf"}
installfiles       = {"*.cls","*.def","*.pdf"}

typesetexe         = "xelatex"
typesetfiles       = {"sjtutex.dtx"}
typesetsuppfiles   = {"ctxdoc.cls"}

bibtexexe          = "bibtex"
biberexe           = "biber"
biberopts          = "--quiet"

unpackexe          = "luatex"
unpackfiles        = {"sjtutex.dtx"}

checkruns          = 3
checkengines       = {"luatex","xetex"}  -- do not reorder this, related to runtest_tasks()
checkopts          = "-file-line-error -halt-on-error -interaction=nonstopmode"
recordstatus       = true
lvtext             = ".tex"
xdvext             = ".xdv"

packtdszip         = true

tdslocations = {
  "tex/latex/sjtutex/font/sjtu-*-font-*.def",
  "tex/latex/sjtutex/lang/sjtu-lang-*.def",
  "tex/latex/sjtutex/scheme/sjtu-scheme-*.def",
  "tex/latex/sjtutex/preset/sjtu-*-preset-*.def",
  "tex/latex/sjtutex/vi/sjtu-vi-*.pdf"
}

shellescape = os.type == "windows"
  and function (s) return s end
  or  function (s)
        s = s:gsub([[\]], [[\\]])
        s = s:gsub([[%$]], [[\$]])
        return s
      end

-- `l3build tag X.Y.Z` performs the release rewrite in one step: version
-- stamps of the split .dtx files, \changes{unreleased} assignment, the
-- manual header line, and the CHANGELOG move (see update_changelog and
-- tag_hook). The version comes from the command line only; the script
-- keeps no version variable. Idempotent: files already stamped with the
-- target version are left untouched.
function update_tag(file, content, tagname, tagdate)
  if not tagname then
    print("Error: missing version number, usage: l3build tag X.Y.Z")
    os.exit(1)
  end
  if not string.match(file, "%.dtx$") then return content end
  local filetarget = string.gsub(file, "%-", "%%-")
  local stamped = content:match(
    "%%<%+!driver>\\GetIdInfo $Id: " .. filetarget .. " (%d+%.%d+%.%w+) ")
  if stamped == tagname then return content end
  local tagdateid = io.popen(
    "git log -1 --pretty=format:'%ai %h %an <%ae>' -- source/" .. file):read('*l') or ""
  tagdateid = string.gsub(tagdateid, "%%", "%%%%")
  content   = string.gsub(content,
    "%%<%+!driver>\\GetIdInfo $Id: " .. filetarget .. " " ..
    "%d+%.%d+%.%w+ %d+%-%d+%-%d+ (.-)%$",
    "%%<+!driver>\\GetIdInfo $Id: "  .. file       .. " " ..
    tagname .. " " .. tagdateid ..   "$")
  content   = string.gsub(content,
    "(\\changes){unreleased}", "%1{v" .. tagname .. "}")
  -- Manual header line (only present in the main .dtx driver).
  content   = string.gsub(content,
    "{%d%d%d%d/%d%d/%d%d v%S+",
    "{" .. string.gsub(tagdate, "%-", "/") .. " v" .. tagname)
  -- Footer revision hash in the manual.
  if string.match(file, module .. "%.dtx$") then
    local tagdocrev = io.popen(
      "git log -1 --format='%h' -- source/*.dtx"):read('*l') or ""
    content = string.gsub(content,
      "\\newcommand\\sjturevhash{%w+}",
      "\\newcommand\\sjturevhash{" .. tagdocrev .. "}")
  end
  return content
end

-- Moves [Unreleased] to [v<tag>] - <date> and updates the compare links.
-- Pure function, kept separate for testability.
function update_changelog(content, tagname, tagdate)
  local verpat = string.gsub(tagname, "%.", "%%.")
  if content:match("## %[v" .. verpat .. "%]") then return content end
  -- The previous version is parsed from the [Unreleased] compare link.
  local prev = content:match(
    "%[Unreleased%]:%s*%S+/compare/(v[^/]-)%.%.%.HEAD")
  content = string.gsub(content, "## %[Unreleased%]\n",
    "## [Unreleased]\n\n## [v" .. tagname .. "] - " .. tagdate .. "\n", 1)
  if prev then
    local label = "[v" .. tagname .. "]:"
    local pad   = string.rep(" ", math.max(14 - #label, 1))
    content = string.gsub(content,
      "(%[Unreleased%]:%s*)(%S+/compare/)v[^/]-(%.%.%.HEAD)\n",
      "%1%2v" .. tagname .. "%3\n" ..
      label .. pad .. "%2" .. prev .. "...v" .. tagname .. "\n", 1)
  end
  return content
end

-- CHANGELOG goes first so it lands in the release commit. Note commit -a
-- sweeps all tracked modifications, so release from a clean tree.
function tag_hook(tagname, tagdate)
  local f = io.open("CHANGELOG.md", "rb")
  if f then
    local content = f:read("a")
    f:close()
    local updated = update_changelog(content, tagname, tagdate)
    if updated ~= content then
      f = assert(io.open("CHANGELOG.md", "w"))
      f:write(updated)
      f:close()
      print("Tagging  CHANGELOG.md")
    end
  end
  os.execute("git commit -a -m \"Bump version to " .. tagname .. "\"")
  os.execute("git tag v" .. tagname)
end

-- Similar to dvitopdf()
function xdvtopdf(name, dir)
  runcmd(
    "xdvipdfmx -E -q " .. name .. xdvext,
    dir
  )
end

function runtest_tasks(name, run)
  if run == 1 and fileexists(testdir .. "/" .. name .. ".bcf") then
    return biberexe .. " " .. name .. " " .. biberopts
  else
    if run == checkruns then
      local engine
      if not(fileexists(testdir .. "/" .. name .. xdvext)) then
        engine = "luatex"
      else
        engine = "xetex"
        xdvtopdf(name, testdir)
      end
      cp(name .. pdfext,testdir,resultdir)
      ren(resultdir, name .. pdfext, name .. "." .. engine .. pdfext)
    end
    return ""
  end
end

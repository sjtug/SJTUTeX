#!/usr/bin/env texlua

module             = "sjtutex"

sourcefiledir      = "source"
sourcefiles        = {"sjtutex.dtx","sjtu-vi-*.pdf"}
installfiles       = {"*.cls","*.def","*.pdf"}

docfiledir         = "doc"

typesetexe         = "xelatex"
typesetfiles       = {"sample-*.tex","sjtutex.dtx"}
typesetsuppfiles   = {"ctxdoc.cls","common-*.tex","ref.bib"}

bibtexexe          = "bibtex"

unpackexe          = "luatex"
unpackfiles        = {"sjtutex.dtx"}
unpacksuppfiles    = {"sjtutex.id"}
gitverfiles        = {"sjtutex.dtx"}

checkengines       = {"xetex"}
recordstatus       = true
lvtext             = ".tex"

packtdszip         = true

tdslocations = {
  "tex/latex/sjtutex/fd/sjtu-*-font-*.def",
  "tex/latex/sjtutex/lang/sjtu-lang-*.def",
  "tex/latex/sjtutex/name/sjtu-name-*.def",
  "tex/latex/sjtutex/scheme/sjtu-scheme-*.def",
  "tex/latex/sjtutex/vi/sjtu-vi-*.pdf"
}

shellescape = os.type == "windows"
  and function (s) return s end
  or  function (s)
        s = s:gsub([[\]], [[\\]])
        s = s:gsub([[%$]], [[\$]])
        return s
      end

git_id_info = { }

function extract_git_version()
  mkdir(supportdir)
  for _,i in ipairs(gitverfiles) do
    for _,j in ipairs({sourcefiledir}) do
      for _,k in ipairs(filelist(j, i)) do
                local idfile = normalize_path(supportdir .. "/" .. jobname(k) .. ".id")
        local file = normalize_path(j .. "/" .. k)
                local cmdline = shellescape([[git log -1 --pretty=format:"$Id: ]]
                                        .. k .. [[ %h %ai %an <%ae> $" ]] .. file)
        local  f = assert(io.popen(cmdline, "r"))
        local id = f:read("*all")
        f:close()
        git_id_info[k] = id
        f = assert(io.open(idfile, "wb"))
        f:write(id, "\n")
        f:close()
      end
    end
  end
end

function expand_git_version()
  local sourcedir = tdsdir .. "/source/" .. moduledir
  for _,i in ipairs(gitverfiles) do
    for _,j in ipairs({sourcedir}) do
      for _,k in ipairs(filelist(j, i)) do
        replace_git_id(j, k)
      end
    end
  end
end

function replace_git_id (path, file)
  local f = assert(io.open(path .. "/" .. file, "rb"))
  local s = f:read("*all")
  f:close()
  local id = assert(git_id_info[file])
  local s, n = s:gsub([[(\GetIdInfo)%b$$]], "%1" .. id)
  if n > 0 then
    f = assert(io.open(path .. "/" .. file, "wb"))
    f:write(s)
    f:close()
    cp(file, path, ctandir .. "/" .. ctanpkg)
  end
end

function update_tag(file, content, tagname, tagdate)
  local content, date = content, tagdate:gsub("%-", "/")
  if file:match("%.dtx$") then
    content = content:gsub("({\\ExplFileDate})%b{}", "%1{" .. tagname .. "}")
    content = content:gsub("{%d%d%d%d/%d%d/%d%d v%S+", "{" .. date .. " v" .. tagname)
    content = content:gsub("(\\changes){unreleased}", "%1{v" .. tagname .. "}")
  end
  return content
end

function tag_hook(tagname)
  os.execute("git commit -a -m \"Bump version to " .. tagname .. "\"")
  os.execute("git tag v" .. tagname)
end

null_function = function() return 0 end

unpack_prehook  = unpack_prehook  or null_function
unpack_posthook = unpack_posthook or null_function
unhooked_bundleunpack = bundleunpack
bundleunpack = function (...)
  extract_git_version()
  unpack_prehook()
  local retval = unhooked_bundleunpack(...)
  is_unpacked = true
  unpack_posthook()
  return retval
end
target_list.bundleunpack.func = bundleunpack

copyctan_prehook  = copyctan_prehook  or null_function
copyctan_posthook = copyctan_posthook or null_function
unhooked_copyctan = copyctan
copyctan = function (...)
  copyctan_prehook()
  local retval = unhooked_copyctan(...)
  expand_git_version()
  copyctan_posthook()
  return retval
end

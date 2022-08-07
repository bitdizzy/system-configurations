# DO NOT HAND-EDIT THIS FILE
let fetch = {url, rev, branch ? null, sha256 ? null, fetchSubmodules ? false, private ? false, ...}:
  let realUrl = let firstChar = builtins.substring 0 1 url; in
    if firstChar == "/" then /. + url
    else if firstChar == "." then ./. + url
    else url;
  in if !fetchSubmodules && private then builtins.fetchGit {
    url = realUrl; inherit rev;
    ${if branch == null then null else "ref"} = branch;
  } else (import "/nix/store/qjg458n31xk1l6lj26c3b871d4i4is98-source" {}).fetchgit {
    url = realUrl; inherit rev sha256;
  };
  json = builtins.fromJSON (builtins.readFile ./git.json);
in fetch json
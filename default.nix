{ writeShellScriptBin, example_project, tmux, tmux-xpanes }: rec {
  # This is used as the default app so when you run `nix run` you get a nice split terminal with the Django server, the
  # frontend server, and a spare blank window
  dev = writeShellScriptBin "dev" ''
    TMUX_XPANES_EXEC=${tmux}/bin/tmux ${tmux-xpanes}/bin/xpanes -d -e "${server-back}/bin/server-back" "${server-front}/bin/server-front" ""
  '';

  server-front = writeShellScriptBin "server-front" ''
    rm -rf ./node_modules
    ln -s ${example_project.frontend.nodeDependencies}/lib/node_modules ./node_modules
    export PATH="${example_project.frontend.nodeDependencies}/bin:$PATH"
    cd frontend && npm run dev
  '';

  server-back = writeShellScriptBin "server-back" ''
    python -m django runserver $@
  '';
}

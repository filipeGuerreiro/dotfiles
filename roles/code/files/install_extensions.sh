#!/bin/bash

CODIUM=""
if command -v code >/dev/null 2>&1; then
  CODIUM="code"
elif command -v codium >/dev/null 2>&1; then
  CODIUM="codium"
fi

# code --list-extensions | xargs -L 1 echo code --install-extension --force
$CODIUM --install-extension aaron-bond.better-comments --force
$CODIUM --install-extension alexcvzz.vscode-sqlite --force
$CODIUM --install-extension alygin.vscode-tlaplus --force
$CODIUM --install-extension bbenoist.Nix --force
$CODIUM --install-extension ModoNoob.vscode-hipster-theme --force
$CODIUM --install-extension betterthantomorrow.calva --force
$CODIUM --install-extension borkdude.clj-kondo --force
$CODIUM --install-extension codezombiech.gitignore --force
$CODIUM --install-extension eamodio.gitlens --force
$CODIUM --install-extension EditorConfig.EditorConfig --force
$CODIUM --install-extension esbenp.prettier-vscode --force
$CODIUM --install-extension formulahendry.code-runner --force
$CODIUM --install-extension GitHub.vscode-pull-request-github --force
$CODIUM --install-extension hollowtree.vue-snippets --force
$CODIUM --install-extension ms-azuretools.vscode-docker --force
$CODIUM --install-extension ms-kubernetes-tools.vscode-kubernetes-tools --force
$CODIUM --install-extension ms-python.python --force
$CODIUM --install-extension octref.vetur --force
$CODIUM --install-extension rebornix.ruby --force
$CODIUM --install-extension redhat.java --force
$CODIUM --install-extension redhat.vscode-yaml --force
$CODIUM --install-extension rust-lang.rust --force
$CODIUM --install-extension scala-lang.scala --force
$CODIUM --install-extension scalameta.metals --force
$CODIUM --install-extension sdras.vue-vscode-snippets --force
$CODIUM --install-extension serayuzgur.crates --force
$CODIUM --install-extension vadimcn.vscode-lldb --force
$CODIUM --install-extension VisualStudioExptTeam.vscodeintellicode --force
$CODIUM --install-extension vscjava.vscode-java-debug --force
$CODIUM --install-extension vscjava.vscode-java-dependency --force
$CODIUM --install-extension vscjava.vscode-java-pack --force
$CODIUM --install-extension vscjava.vscode-java-test --force
$CODIUM --install-extension vscjava.vscode-maven --force
$CODIUM --install-extension vscode-icons-team.vscode-icons --force
$CODIUM --install-extension vscoss.vscode-ansible --force
$CODIUM --install-extension wingrunr21.vscode-ruby --force
$CODIUM --install-extension zxh404.vscode-proto3 --force
$CODIUM --install-extension tabnine.tabnine-vscode --force
$CODIUM --install-extension wakatime.vscode-wakatime --force
$CODIUM --install-extension foam.foam-vscode --force

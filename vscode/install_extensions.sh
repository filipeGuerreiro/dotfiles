#!/bin/bash

codium=""
if command -v code >/dev/null 2>&1; then
  codium="code"
elif command -v codium >/dev/null 2>&1; then
  codium="codium"
fi

# code --list-extensions | xargs -L 1 echo code --install-extension --force
$codium --install-extension aaron-bond.better-comments --force
$codium --install-extension alexcvzz.vscode-sqlite --force
$codium --install-extension alygin.vscode-tlaplus --force
$codium --install-extension bbenoist.Nix --force
$codium --install-extension ModoNoob.vscode-hipster-theme --force
$codium --install-extension betterthantomorrow.calva --force
$codium --install-extension borkdude.clj-kondo --force
$codium --install-extension codezombiech.gitignore --force
$codium --install-extension eamodio.gitlens --force
$codium --install-extension EditorConfig.EditorConfig --force
$codium --install-extension esbenp.prettier-vscode --force
$codium --install-extension formulahendry.code-runner --force
$codium --install-extension GitHub.vscode-pull-request-github --force
$codium --install-extension hollowtree.vue-snippets --force
$codium --install-extension ms-azuretools.vscode-docker --force
$codium --install-extension ms-kubernetes-tools.vscode-kubernetes-tools --force
$codium --install-extension ms-python.python --force
$codium --install-extension octref.vetur --force
$codium --install-extension rebornix.ruby --force
$codium --install-extension redhat.java --force
$codium --install-extension redhat.vscode-yaml --force
$codium --install-extension rust-lang.rust --force
$codium --install-extension scala-lang.scala --force
$codium --install-extension scalameta.metals --force
$codium --install-extension sdras.vue-vscode-snippets --force
$codium --install-extension serayuzgur.crates --force
$codium --install-extension vadimcn.vscode-lldb --force
$codium --install-extension VisualStudioExptTeam.vscodeintellicode --force
$codium --install-extension vscjava.vscode-java-debug --force
$codium --install-extension vscjava.vscode-java-dependency --force
$codium --install-extension vscjava.vscode-java-pack --force
$codium --install-extension vscjava.vscode-java-test --force
$codium --install-extension vscjava.vscode-maven --force
$codium --install-extension vscode-icons-team.vscode-icons --force
$codium --install-extension vscoss.vscode-ansible --force
$codium --install-extension wingrunr21.vscode-ruby --force
$codium --install-extension zxh404.vscode-proto3 --force
$codium --install-extension tabnine.tabnine-vscode --force
$codium --install-extension wakatime.vscode-wakatime --force
$codium --install-extension foam.foam-vscode --force

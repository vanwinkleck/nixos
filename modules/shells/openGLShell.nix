{pkgs ? import <nixpkgs> {} }:

pkgs.mkShell
{
  nativeBuildInputs = with pkgs; [
    cmake
    glfw
    lua
    glm
  ];

}

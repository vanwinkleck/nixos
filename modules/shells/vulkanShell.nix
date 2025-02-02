with import <nixpkgs> {};

mkShell {
  name = "vulkan";
  buildInputs = with pkgs; [
    cmake
    mesa
    gdb
    vulkan-headers
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
    shaderc
    renderdoc
    vulkan-tools-lunarg
    glfw
    wayland
    libxkbcommon
    #shaderc dirextx-shader-compiler
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xorg.libXxf86vm
    glfw
    glm

  ];

    LD_LIBRARY_PATH="${glfw}/lib:${freetype}/lib:${vulkan-loader}/lib:${vulkan-validation-layers}/lib";
    VULKAN_SDK = "${vulkan-headers}";
    VK_LAYER_PATH = "${vulkan-validation-layers}/share/vulkan/explicit_layer.d";
}

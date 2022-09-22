{
  description = "My NVIM config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    packer-nvim = { url = "github:wbthomason/packer.nvim"; flake = false; };
    nvim-config = {
      url = ".";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, nvim-config, packer-nvim }: flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in rec {
      packages = rec {
        nvimConfig = pkgs.stdenv.mkDerivation { 
          name = "nvim-config";
          src = nvim-config;
          PACKER_SRC = packer-nvim;
          buildPhase = ''
            mkdir -p $out/config
            mkdir -p $out/.local/share/nvim/site/pack/packer/start
            mkdir -p $out/config/nvim/plugin 

            cp -r $PACKER_SRC $out/.local/share/nvim/site/pack/packer/start/packer.nvim 
            cp -r $src $out/config/nvim
            
            # HOME="$out" XDG_CONFIG_HOME="$out/config" nvim --headless -S $out/config/nvim/init.lua +"autocmd User PackerComplete quitall" +"PackerInstall" 2>$out/err
          '';
          buildInputs = [ pkgs.git pkgs.neovim ]; 
          NEOVIM_PAK = pkgs.neovim;
          installPhase = ''
            cp -r $src $out
            mkdir -p $out/bin
            echo "#!/bin/sh" >> $out/bin/nvim
            echo "HOME=\"$out\" XDG_CONFIG_HOME=\"$out/config\" $NEOVIM_PAK/bin/nvim $@" >> $out/bin/nvim
            chmod +x $out/bin/nvim
          '';
        };
        default = nvimConfig;
      };
      devShell = pkgs.mkShell {
        buildInputs = [ packages.nvimConfig pkgs.neovim ];
      };
    }
  );
}

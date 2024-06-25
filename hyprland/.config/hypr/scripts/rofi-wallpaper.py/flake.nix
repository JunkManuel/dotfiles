{
    inputs = {
        nixpkgs = {
            url = "github:nixos/nixpkgs/nixos-unstable";
        };
        flake-utils = {
            url = "github:numtide/flake-utils";
        };
    };
    outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs {
            inherit system;
            };
        in rec {
            devShell = pkgs.mkShell rec {
                name = "wallpaper-script";
                buildInputs = with pkgs; 
                # let 
                #     dev-python = pkgs.python3.withPackages
                #         ( p: with p; [ virtualenv pip wheel setuptools ] );
                # in [
                #     dev-python
                # ];
                [
                    python3 python3Packages.pip
                ];
                shellHook = ''
                    export PIP_PREFIX=$(pwd)/.build/pip_packages #Dir where built packages are stored
                    export PYTHONPATH="$PIP_PREFIX/${pkgs.python3.sitePackages}:$PYTHONPATH"
                    export PATH="$PIP_PREFIX/bin:$PATH"

                    unset SOURCE_DATE_EPOCH
                '';
            };
        }
    );
}

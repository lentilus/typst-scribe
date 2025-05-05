{
  description = "scribe - Write math in ascii notation.";

  inputs = {
    nixpkgs.url    = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        scribe = pkgs.buildTypstPackage {
          pname   = "scribe";
          version = "0.2.0";
          src     = ./.;
        };
        quick-maths = pkgs.typstPackages.quick-maths_0_2_1;
      in
      {
        packages.default = scribe;

        devShells.default = pkgs.mkShellNoCC {
          shellHook = ''
          tmpdir=$(mktemp -d)
          mkdir -p $tmpdir/preview
          cp -r ${scribe}/lib/typst-packages/* $tmpdir/preview/
          cp -r ${quick-maths}/lib/typst-packages/* $tmpdir/preview/

          export TYPST_PACKAGE_CACHE_PATH=$tmpdir
          '';
          buildInputs = [
            pkgs.typst
            pkgs.tinymist
            scribe
            quick-maths
          ];
        };

        checks.default = pkgs.runCommand "check-scribe" {
          buildInputs = [
            pkgs.typst
            quick-maths
            scribe
          ];
        } ''
            mkdir -p $out/packages/preview

            cp -r ${scribe}/lib/typst-packages/* $out/packages/preview/
            cp -r ${quick-maths}/lib/typst-packages/* $out/packages/preview/

            cd $out

            # 3) compile the Typst file, using our package path
            typst compile ${./tests/minimal.typ} \
              --package-cache-path $out/packages minimal.pdf

            typst compile ${./tests/full.typ} \
              --package-cache-path $out/packages full.pdf
          '';
      }
    );
}

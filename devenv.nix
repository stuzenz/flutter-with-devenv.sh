{ pkgs, lib, config, inputs, ... }:

{

  android = {
    enable = true;
    flutter.enable = true;
  };

  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.chromium];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";

enterShell = ''
  hello
  git --version
  export CHROME_EXECUTABLE=$(which chromium)
  export ANDROID_HOME=$(which android | sed -E 's/(.*libexec\/android-sdk).*/\1/')
  export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

  # Create a symbolic link to the '8.0' directory named 'latest' if it doesn't exist
  # I added this link in to stop `flutter doctor` complaining - not that it matters really
  # It doesn't seem to be required currently - so I commented it out
  #  if [ ! -d "$ANDROID_HOME/cmdline-tools/latest" ]; then
  #    ln -s $ANDROID_HOME/cmdline-tools/8.0 $ANDROID_HOME/cmdline-tools/latest
  #  fi
'';


  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep "2.42.0"
  '';

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}

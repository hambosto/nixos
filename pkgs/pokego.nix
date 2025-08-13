{
  lib,
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule {
  pname = "pokego";
  version = "git";
  src = fetchFromGitHub {
    owner = "rubiin";
    repo = "pokego";
    rev = "6b6f67f8b9bfcc86c5d0c1b2b7346ae4816926f7";
    hash = "sha256-cFpEi8wBdCzAl9dputoCwy8LeGyK3UF2vyylft7/1wY=";
  };

  vendorHash = "sha256-7SoKHH+tDJKhUQDoVwAzVZXoPuKNJEHDEyQ77BPEDQ0=";
  env.CGO_ENABLED = 0;
  flags = [ "-trimpath" ];
  ldflags = [
    "-s"
    "-w"
    "-extldflags -static"
  ];

  meta = with lib; {
    description = "Command-line tool that lets you display Pokémon sprites in color directly in your terminal.";
    homepage = "https://github.com/rubiin/pokego";
    mainProgram = "pokego";
    license = licenses.gpl3;
    maintainers = with maintainers; [ rubiin ];
  };
}

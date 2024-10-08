(******************************************************************************
                            ___  ___
                           / __|| _ \ __ _  ___™
                          | (__ |  _// _` |(_-<
                           \___||_|  \__,_|/__/

                       Static C Libraries for Delphi

                 Copyright © 2024-present tinyBigGAMES™ LLC
                          All Rights Reserved.

                    Website: https://tinybiggames.com
                    Email  : support@tinybiggames.com

                 See LICENSE file for license information
******************************************************************************)

program Testbed;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UTestbed in 'UTestbed.pas',
  CPas.CRtl in '..\..\lib\CPas.CRtl.pas',
  CPas.RGFW in '..\..\lib\CPas.RGFW.pas',
  CPas.GLFW in '..\..\lib\CPas.GLFW.pas',
  CPas.miniaudio in '..\..\lib\CPas.miniaudio.pas',
  CPas.pl_mpeg in '..\..\lib\CPas.pl_mpeg.pas',
  CPas.stb_image in '..\..\lib\CPas.stb_image.pas',
  CPas.stb_image_write in '..\..\lib\CPas.stb_image_write.pas',
  CPas.stb_truetype in '..\..\lib\CPas.stb_truetype.pas';

begin
  try
    RunTests();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

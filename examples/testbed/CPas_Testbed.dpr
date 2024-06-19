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

program CPas_Testbed;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UCPas_Testbed in 'UCPas_Testbed.pas',
  CPas.CRuntime in '..\..\lib\CPas.CRuntime.pas',
  CPas.Print in '..\..\lib\Print\CPas.Print.pas',
  CPas.SQLite in '..\..\lib\SQLite\CPas.SQLite.pas';

begin
  try
    RunTests();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

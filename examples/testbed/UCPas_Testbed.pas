﻿(******************************************************************************
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

unit UCPas_Testbed;

interface

uses
  CPas.Print,
  CPas.SQLite,
  CPas.Miniaudio;

procedure RunTests();

implementation

procedure Pause();
begin
  WriteLn;
  Write('Press ENTER to continue...');
  ReadLn;
  WriteLn;
end;

procedure Test_Print();
begin
  PrintLn('Welcome to CPas - Static C Libraries for Delphi!', FG_DARKGREEN);
  PrintLn('Russian text: %s'+CRLF, FG_CYAN, 'Привет как дела?');
end;

procedure Test_SQLite();

var
  LDb: Psqlite3;
  LStmt: Psqlite3_stmt;
  LRes: Integer;

  procedure CheckError(rc: Integer; db: PSQLite3);
  begin
    if rc = SQLITE_OK then exit;
    if rc = SQLITE_DONE then exit;
    Writeln('SQLite error: ', sqlite3_errmsg(db));

    if Assigned(LStmt) then
      sqlite3_finalize(LStmt);

    if Assigned(LDb) then
      sqlite3_close(LDb);

    Halt(1);
  end;


begin
  PrintLn('sqlite version: %ls'+CRLF, FG_CYAN, string(sqlite3_libversion()));

  // Open database
  LRes := sqlite3_open('example.db', @LDb);
  CheckError(LRes, LDb);

  // Create table
  LRes := sqlite3_exec(LDb, 'CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY, value TEXT);', nil, nil, nil);
  CheckError(LRes, LDb);

  // Insert data
  LRes := sqlite3_prepare_v2(LDb, 'INSERT INTO test (value) VALUES (?);', -1, @LStmt, nil);
  CheckError(LRes, LDb);
  LRes := sqlite3_bind_text(LStmt, 1, 'Hello, world!', -1, sqlite3_destructor_type(SQLITE_TRANSIENT));
  CheckError(LRes, LDb);
  LRes := sqlite3_step(LStmt);
  CheckError(LRes, LDb);
  sqlite3_finalize(LStmt);

  // Select data
  LRes := sqlite3_prepare_v2(LDb, 'SELECT id, value FROM test;', -1, @LStmt, nil);
  CheckError(LRes, LDb);
  while sqlite3_step(LStmt) = SQLITE_ROW do
  begin
    Writeln('id: ', sqlite3_column_int(LStmt, 0), ', value: ', PAnsiChar(sqlite3_column_text(LStmt, 1)));
  end;
  sqlite3_finalize(LStmt);

  // Close database
  sqlite3_close(LDb);

  Writeln('Done.');
end;

procedure Test_MiniAudio();
var
  LResult: ma_result;
  LEngine: ma_engine;
begin
  PrintLn('miniaudio version: %ls'+CRLF, FG_CYAN, string(ma_version_string()));

  LResult := ma_engine_init(nil, @LEngine);
  if LResult <> MA_SUCCESS then
  begin
    PrintLn('Failed to initialize audio engine.', FG_RED);
    Exit;
  end;

  ma_engine_play_sound(@LEngine, 'res\audio\song01.ogg', nil);

  Print('Press ENTER to quit...', FG_WHITE);
  ReadLn;

  ma_engine_uninit(@LEngine);
end;

procedure RunTests();
begin
  //Test_Print();
  //Test_SQLite();
  Test_MiniAudio();
  Pause();
end;

end.

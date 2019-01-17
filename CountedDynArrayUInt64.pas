{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  Counted dynamic arrays

    Counted dynamic array of UInt64 values

  ©František Milt 2019-01-17

  Version 1.0.2

  Dependencies:
    AuxTypes    - github.com/ncs-sniper/Lib.AuxTypes
    ListSorters - github.com/ncs-sniper/Lib.ListSorters

===============================================================================}
unit CountedDynArrayUInt64;

{$INCLUDE '.\CountedDynArrays_defs.inc'}

interface

uses
  AuxTypes,
  CountedDynArrays;

type
  TUInt64CountedDynArray = record
    Arr:    array of UInt64;
    SigA:   UInt32;
    Count:  Integer;
    Data:   PtrInt;
    SigB:   UInt32;
  end;
  PUInt64CountedDynArray = ^TUInt64CountedDynArray;

  TCDABaseType = UInt64;
  PCDABaseType = PUInt64;

  TCDAArrayType = TUInt64CountedDynArray;
  PCDAArrayType = PUInt64CountedDynArray;

{$DEFINE CDA_Interface}
{$INCLUDE '.\CountedDynArrays.inc'}
{$UNDEF CDA_Interface}

implementation

uses
  SysUtils,
  ListSorters;

{$IFDEF FPC_DisableWarns}
  {$DEFINE FPCDWM}
  {$DEFINE W5024:={$WARN 5024 OFF}} // Parameter "$1" not used  
  {$PUSH}{$WARN 2005 OFF} // Comment level $1 found
  {$IF Defined(FPC) and (FPC_FULLVERSION >= 30000)}
    {$DEFINE W5093:={$WARN 5093 OFF}} // Function result variable of a managed type does not seem to initialized
    {$DEFINE W5094:={$WARN 5094 OFF}} // Function result variable of a managed type does not seem to initialized
    {$DEFINE W5060:=}
  {$ELSE}
    {$DEFINE W5093:=}
    {$DEFINE W5094:=}
    {$DEFINE W5060:={$WARN 5060 OFF}} // Function result variable does not seem to be initialized
  {$IFEND}
  {$POP}
{$ENDIF}

Function CDA_CompareFunc(A,B: UInt64): Integer; {$IFDEF CanInline} inline; {$ENDIF}
begin
Result := Integer(B - A);
end;

//------------------------------------------------------------------------------

{$DEFINE CDA_Implementation}
{$INCLUDE '.\CountedDynArrays.inc'}
{$UNDEF CDA_Implementation}

end.

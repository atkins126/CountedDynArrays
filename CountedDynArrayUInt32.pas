{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
{===============================================================================

  Counted Dynamic Arrays

    Counted dynamic array of UInt32 values

  Version 1.3 (2020-08-23)

  Last changed 2020-08-23

  ©2018-2020 František Milt

  Contacts:
    František Milt: frantisek.milt@gmail.com

  Support:
    If you find this code useful, please consider supporting its author(s) by
    making a small donation using the following link(s):

      https://www.paypal.me/FMilt

  Changelog:
    For detailed changelog and history please refer to this git repository:

      github.com/TheLazyTomcat/CountedDynArrays

  Dependencies:
    AuxTypes    - github.com/TheLazyTomcat/Lib.AuxTypes
    AuxClasses  - github.com/TheLazyTomcat/Lib.AuxClasses    
    ListSorters - github.com/TheLazyTomcat/Lib.ListSorters
    StrRect     - github.com/TheLazyTomcat/Lib.StrRect

===============================================================================}
unit CountedDynArrayUInt32;

{$INCLUDE '.\CountedDynArrays_defs.inc'}

{$DEFINE CDA_FuncOverride_ItemCompare}

interface

uses
  AuxTypes,
  CountedDynArrays;

type
  TCDABaseType = UInt32;
  PCDABaseType = ^TCDABaseType;

  TCountedDynArrayUInt32 = record
  {$DEFINE CDA_Structure}
    {$INCLUDE '.\CountedDynArrays.inc'}
  {$UNDEF CDA_Structure}
  end;
  PCountedDynArrayUInt32 = ^TCountedDynArrayUInt32;

  // aliases
  TCountedDynArrayOfUInt32 = TCountedDynArrayUInt32;
  PCountedDynArrayOfUInt32 = PCountedDynArrayUInt32;

  TUInt32CountedDynArray = TCountedDynArrayUInt32;
  PUInt32CountedDynArray = PCountedDynArrayUInt32;

  TCDAArrayType = TCountedDynArrayUInt32;
  PCDAArrayType = PCountedDynArrayUInt32;

{$DEFINE CDA_Interface}
{$INCLUDE '.\CountedDynArrays.inc'}
{$UNDEF CDA_Interface}

implementation

uses
  ListSorters;

{$INCLUDE '.\CountedDynArrays_msgdis.inc'}

const
  CDA_DEFAULT_VALUE = 0;

//------------------------------------------------------------------------------

Function CDA_ItemCompare(A,B: TCDABaseType): Integer;
begin
If A < B then
  Result := -1
else If A > B then
  Result := +1
else
  Result := 0;
end;

//------------------------------------------------------------------------------

{$DEFINE CDA_Implementation}
{$INCLUDE '.\CountedDynArrays.inc'}
{$UNDEF CDA_Implementation}

end.

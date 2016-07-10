<%
'--------------------------------------------------------------------
' Microsoft aDO
'
' (c) 1996 Microsoft Corporation.  all Rights Reserved.
'
'
'
' aDO constants include file for VBScript
'
'--------------------------------------------------------------------

'---- CursorTypeEnum Values ----
Const adOpenForwardOnly = 0
Const adOpenKeyset = 1
Const adOpenDynamic = 2
Const adOpenStatic = 3

'---- CursorOptionEnum Values ----
Const adHoldRecords = &H00000100
Const adMovePrevious = &H00000200
Const adaddNew = &H01000400
Const adDelete = &H01000800
Const adUpdate = &H01008000
Const adBookmark = &H00002000
Const adapproxPosition = &H00004000
Const adUpdateBatch = &H00010000
Const adResync = &H00020000

'---- LockTypeEnum Values ----
Const adLockReadOnly = 1
Const adLockPessimistic = 2
Const adLockOptimistic = 3
Const adLockBatchOptimistic = 4

'---- CursorLocationEnum Values ----
Const adUseClient = 1
Const adUseServer = 2
Const adUseClientBatch = 3

'---- DataTypeEnum Values ----
Const adEmpty = 0
Const adTinyInt = 16
Const adSmallInt = 2
Const adInteger = 3
Const adBigInt = 20
Const adUnsignedTinyInt = 17
Const adUnsignedSmallInt = 18
Const adUnsignedInt = 19
Const adUnsignedBigInt = 21
Const adSingle = 4
Const adDouble = 5
Const adCurrency = 6
Const adDecimal = 14
Const adNumeric = 131
Const adBoolean = 11
Const adError = 10
Const adUserDefined = 132
Const adVariant = 12
Const adIDispatch = 9
Const adIUnknown = 13
Const adGUID = 72
Const adDAte = 7
Const adDBDAte = 133
Const adDBTime = 134
Const adDBTimeStamp = 135
Const adBSTR = 8
Const adChar = 129
Const adVarChar = 200
Const adLongVarChar = 201
Const adWChar = 130
Const adVarWChar = 202
Const adLongVarWChar = 203
Const adBinary = 128
Const adVarBinary = 204
Const adLongVarBinary = 205

'---- ConnectPromptEnum Values ----
Const adPromptalways = 1
Const adPromptComplete = 2
Const adPromptCompleteRequired = 3
Const adPromptNever = 4

'---- ConnectModeEnum Values ----
Const adModeUnknown = 0
Const adModeRead = 1
Const adModeWrite = 2
Const adModeReadWrite = 3
Const adModeShareDenyRead = 4
Const adModeShareDenyWrite = 8
Const adModeShareExclusive = &Hc
Const adModeShareDenyNone = &H10

'---- IsolationLevelEnum Values ----
Const adXactUnspecified = &Hffffffff
Const adXactChaos = &H00000010
Const adXactReadUncommitted = &H00000100
Const adXactBrowse = &H00000100
Const adXactCursorStability = &H00001000
Const adXactReadCommitted = &H00001000
Const adXactRepeatableRead = &H00010000
Const adXactSerializable = &H00100000
Const adXactIsolated = &H00100000

'---- XactattributeEnum Values ----
Const adXactPollasync = 2
Const adXactPollSyncPhaseOne = 4
Const adXactCommitRetaining = &H00020000
Const adXactabortRetaining = &H00040000
Const adXactabortasync = &H00080000

'---- FieldattributeEnum Values ----
Const adFldBookmark = &H00000001
Const adFldMayDefer = &H00000002
Const adFldUpdatable = &H00000004
Const adFldUnknownUpdatable = &H00000008
Const adFldFixed = &H00000010
Const adFldIsNullable = &H00000020
Const adFldMayBeNull = &H00000040
Const adFldLong = &H00000080
Const adFldRowID = &H00000100
Const adFldRowVersion = &H00000200
Const adFldCacheDeferred = &H00001000

'---- EditModeEnum Values ----
Const adEditNone = &H0000
Const adEditInProgress = &H0001
Const adEditadd = &H0002

'---- RecordStatusEnum Values ----
Const adRecOK = &H0000000
Const adRecNew = &H0000001
Const adRecModified = &H0000002
Const adRecDeleted = &H0000004
Const adRecUnmodified = &H0000008
Const adRecInvalid = &H0000010
Const adRecMultipleChanges = &H0000040
Const adRecPendingChanges = &H0000080
Const adRecCanceled = &H0000100
Const adRecCantRelease = &H0000400
Const adRecConcurrencyViolation = &H0000800
Const adRecIntegrityViolation = &H0001000
Const adRecMaxChangesExceeded = &H0002000
Const adRecObjectOpen = &H0004000
Const adRecOutOfMemory = &H0008000
Const adRecPermissionDenied = &H0010000
Const adRecSchemaViolation = &H0020000
Const adRecDBDeleted = &H0040000

'---- GetRowsOptionEnum Values ----
Const adGetRowsRest = -1

'---- PositionEnum Values ----
Const adPosUnknown = -1
Const adPosBOF = -2
Const adPosEOF = -3

'---- affectEnum Values ----
Const adaffectCurrent = 1
Const adaffectGroup = 2
Const adaffectall = 3

'---- FilterGroupEnum Values ----
Const adFilterNone = 0
Const adFilterPendingRecords = 1
Const adFilteraffectedRecords = 2
Const adFilterFetchedRecords = 3

'---- PropertyattributesEnum Values ----
Const adPropNotSupported = &H0000
Const adPropRequired = &H0001
Const adPropOptional = &H0002
Const adPropRead = &H0200
Const adPropWrite = &H0400

'---- ErrorValueEnum Values ----
Const adErrInvalidargument = &Hbb9
Const adErrNoCurrentRecord = &Hbcd
Const adErrIllegalOperation = &Hc93
Const adErrInTransaction = &Hcae
Const adErrFeatureNotavailable = &Hcb3
Const adErrItemNotFound = &Hcc1
Const adErrObjectNotSet = &Hd5c
Const adErrDataConversion = &Hd5d
Const adErrObjectClosed = &He78
Const adErrObjectOpen = &He79
Const adErrProviderNotFound = &He7a
Const adErrBoundToCommand = &He7b

'---- ParameterattributesEnum Values ----
Const adParamSigned = &H0010
Const adParamNullable = &H0040
Const adParamLong = &H0080

'---- ParameterDirectionEnum Values ----
Const adParamUnknown = &H0000
Const adParamInput = &H0001
Const adParamOutput = &H0002
Const adParamInputOutput = &H0003
Const adParamReturnValue = &H0004

'---- CommandTypeEnum Values ----
Const adCmdUnknown = 0
Const adCmdText = &H0001
Const adCmdTable = &H0002
Const adCmdStoredProc = &H0004
%>

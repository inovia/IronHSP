; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   shared types: NSTRUCT / enum constants
;   tool: tools/cswin32_bridge/gen_from_cswin32.py
;
;   This file is included automatically by every <dll>_gen2.as.
;   Do not edit by hand ? regenerate via the python script.
; ============================================================

#ifndef __win32_types_gen2_as__
#define __win32_types_gen2_as__

;--- structs ---
#defstruct D3DDDI_ALLOCATIONINFO
    #field int hAllocation
    #field var pSystemMem
    #field var pPrivateDriverData
    #field int PrivateDriverDataSize
    #field int VidPnSourceId
    #field int Flags
    #field int Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct _Flags_e__Union
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct _Anonymous_e__Struct
    #field int Version
    #field int Linkage
#endstruct

#defstruct D3DDDI_ALLOCATIONINFO2
    #field int hAllocation
    #field int Anonymous1
    #field var pPrivateDriverData
    #field int PrivateDriverDataSize
    #field int VidPnSourceId
    #field var Flags
    #field int64 GpuVirtualAddress
    #field int Anonymous2
    #field int Reserved
    #field var pSystemMem
    #field var Anonymous
    #field int Value
    #field int _bitfield
    #field int Priority
    #field int Unused
#endstruct

#defstruct _Anonymous1_e__Union
    #field int64 HistoricalContext
    #field var Anonymous
    #field int Version
    #field int Linkage
#endstruct

#defstruct _Anonymous2_e__Union
    #field int CountLost
    #field intptr KernelHandle
    #field int64 TimeStamp
#endstruct

#defstruct D3DDDI_ALLOCATIONLIST
    #field int hAllocation
    #field int Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct _Anonymous_e__Union
    #field int LockObject
    #field int ThreadObject
    #field int ObjectName
    #field int64 Timeout
    #field int Alertable
    #field int ProcessId
    #field int ThreadId
    #field int WaitTime
    #field int ContextSwitches
#endstruct

#defstruct D3DDDI_CREATECONTEXTFLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DDDI_DXGI_RGB
    #field float Red
    #field float Green
    #field float Blue
#endstruct

#defstruct D3DDDI_ESCAPEFLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DDDI_GAMMA_RAMP_DXGI_1
    #field var Scale
    #field var Offset
    #field int GammaCurve
#endstruct

#defstruct D3DDDI_GAMMA_RAMP_RGB256x3x16
    #field int Red
    #field int Green
    #field int Blue
#endstruct

#defstruct D3DDDI_HDR_METADATA_HDR10
    #field int RedPrimary
    #field int GreenPrimary
    #field int BluePrimary
    #field int WhitePoint
    #field int MaxMasteringLuminance
    #field int MinMasteringLuminance
    #field int MaxContentLightLevel
    #field int MaxFrameAverageLightLevel
#endstruct

#defstruct D3DDDI_HDR_METADATA_HDR10PLUS
    #field int Data
#endstruct

#defstruct D3DDDI_OPENALLOCATIONINFO
    #field int hAllocation
    #field var pPrivateDriverData
    #field int PrivateDriverDataSize
#endstruct

#defstruct D3DDDI_OPENALLOCATIONINFO2
    #field int hAllocation
    #field var pPrivateDriverData
    #field int PrivateDriverDataSize
    #field int64 GpuVirtualAddress
    #field int Reserved
#endstruct

#defstruct D3DDDI_PATCHLOCATIONLIST
    #field int AllocationIndex
    #field var Anonymous
    #field int DriverId
    #field int AllocationOffset
    #field int PatchOffset
    #field int SplitOffset
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DDDI_RATIONAL
    #field int Numerator
    #field int Denominator
#endstruct

#defstruct D3DDDI_SYNCHRONIZATIONOBJECTINFO
    #field int Type
    #field var Anonymous
    #field int SynchronizationMutex
    #field int Semaphore
    #field int Reserved
    #field int MaxCount
    #field int InitialCount
    #field int Reserved
#endstruct

#defstruct _Semaphore_e__Struct
    #field int MaxCount
    #field int InitialCount
#endstruct

#defstruct _Reserved_e__Struct
    #field int Reserved
#endstruct

#defstruct D3DDDI_TRIMRESIDENCYSET_FLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DDDICB_LOCKFLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DDDICB_SIGNALFLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DKMDT_DISPLAYMODE_FLAGS
    #field int _bitfield1
    #field int _bitfield2
#endstruct

#defstruct D3DKMT_BLTMODEL_PRESENTHISTORYTOKEN
    #field int64 hLogicalSurface
    #field int64 hPhysicalSurface
    #field int64 EventId
    #field int DirtyRegions
#endstruct

#defstruct D3DKMT_CLOSEADAPTER
    #field int hAdapter
#endstruct

#defstruct D3DKMT_COMPOSITION_PRESENTHISTORYTOKEN
    #field int64 hPrivateData
#endstruct

#defstruct D3DKMT_CREATEALLOCATION
    #field int hDevice
    #field int hResource
    #field int hGlobalShare
    #field var pPrivateRuntimeData
    #field int PrivateRuntimeDataSize
    #field var Anonymous1
    #field int PrivateDriverDataSize
    #field int NumAllocations
    #field var Anonymous2
    #field int Flags
    #field var pStandardAllocation
    #field var pPrivateDriverData
    #field var pAllocationInfo
    #field var pAllocationInfo2
#endstruct

#defstruct D3DKMT_CREATEALLOCATIONFLAGS
    #field int _bitfield
#endstruct

#defstruct D3DKMT_CREATECONTEXT
    #field int hDevice
    #field int NodeOrdinal
    #field int EngineAffinity
    #field var Flags
    #field var pPrivateDriverData
    #field int PrivateDriverDataSize
    #field int ClientHint
    #field int hContext
    #field var pCommandBuffer
    #field int CommandBufferSize
    #field var pAllocationList
    #field int AllocationListSize
    #field var pPatchLocationList
    #field int PatchLocationListSize
    #field int64 CommandBuffer
#endstruct

#defstruct D3DKMT_CREATEDEVICE
    #field var Anonymous
    #field int Flags
    #field int hDevice
    #field var pCommandBuffer
    #field int CommandBufferSize
    #field var pAllocationList
    #field int AllocationListSize
    #field var pPatchLocationList
    #field int PatchLocationListSize
    #field int hAdapter
    #field var pAdapter
#endstruct

#defstruct D3DKMT_CREATEDEVICEFLAGS
    #field int _bitfield
#endstruct

#defstruct D3DKMT_CREATESTANDARDALLOCATION
    #field int Type
    #field var Anonymous
    #field int Flags
    #field int ExistingHeapData
#endstruct

#defstruct D3DKMT_CREATESTANDARDALLOCATIONFLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DKMT_CREATESYNCHRONIZATIONOBJECT
    #field int hDevice
    #field var Info
    #field int hSyncObject
#endstruct

#defstruct D3DKMT_DESTROYALLOCATION
    #field int hDevice
    #field int hResource
    #field var phAllocationList
    #field int AllocationCount
#endstruct

#defstruct D3DKMT_DESTROYCONTEXT
    #field int hContext
#endstruct

#defstruct D3DKMT_DESTROYDEVICE
    #field int hDevice
#endstruct

#defstruct D3DKMT_DESTROYSYNCHRONIZATIONOBJECT
    #field int hSyncObject
#endstruct

#defstruct D3DKMT_DEVICEPAGEFAULT_STATE
    #field int64 FaultedPrimitiveAPISequenceNumber
    #field int FaultedPipelineStage
    #field int FaultedBindTableEntry
    #field int PageFaultFlags
    #field int FaultErrorCode
    #field int64 FaultedVirtualAddress
#endstruct

#defstruct D3DKMT_DEVICEPRESENT_QUEUE_STATE
    #field int VidPnSourceId
#endstruct

#defstruct D3DKMT_DEVICEPRESENT_STATE
    #field int VidPnSourceId
    #field int PresentStats
#endstruct

#defstruct D3DKMT_DEVICEPRESENT_STATE_DWM
    #field int VidPnSourceId
    #field int PresentStatsDWM
#endstruct

#defstruct D3DKMT_DEVICERESET_STATE
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DKMT_DIRTYREGIONS
    #field int NumRects
    #field int Rects
#endstruct

#defstruct D3DKMT_DISPLAYMODE
    #field int Width
    #field int Height
    #field int Format
    #field int IntegerRefreshRate
    #field var RefreshRate
    #field int ScanLineOrdering
    #field int DisplayOrientation
    #field int DisplayFixedOutput
    #field var Flags
#endstruct

#defstruct D3DKMT_ESCAPE
    #field int hAdapter
    #field int hDevice
    #field int Type
    #field var Flags
    #field var pPrivateDriverData
    #field int PrivateDriverDataSize
    #field int hContext
#endstruct

#defstruct D3DKMT_FENCE_PRESENTHISTORYTOKEN
    #field int64 Key
#endstruct

#defstruct D3DKMT_FLIPMANAGER_PRESENTHISTORYTOKEN
    #field int64 hPrivateData
    #field int64 PresentAtQpc
    #field var Flags
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DKMT_FLIPMODEL_PRESENTHISTORYTOKEN
    #field int64 FenceValue
    #field int64 hLogicalSurface
    #field int dxgContext
    #field int VidPnSourceId
    #field int SwapChainIndex
    #field int64 PresentLimitSemaphoreId
    #field int FlipInterval
    #field int Flags
    #field int64 hCompSurf
    #field int64 confirmationCookie
    #field int64 CompositionSyncKey
    #field int RemainingTokens
    #field int PresentCount
    #field int RevealColor
    #field int Rotation
    #field var Anonymous
    #field int InkCookie
    #field int DestWidth
    #field int DestHeight
    #field int Transform
    #field int CustomDuration
    #field int CustomDurationFlipInterval
    #field int PlaneIndex
    #field int ColorSpace
    #field var DirtyRegions
    #field int ScatterBlts
    #field var Anonymous
    #field int HDRMetaDataType
    #field var Anonymous
    #field var HDRMetaDataHDR10
    #field var HDRMetaDataHDR10Plus
#endstruct

#defstruct D3DKMT_FLIPMODEL_PRESENTHISTORYTOKENFLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DKMT_GDIMODEL_PRESENTHISTORYTOKEN
    #field int64 hLogicalSurface
    #field int64 hPhysicalSurface
    #field var DirtyRegions
#endstruct

#defstruct D3DKMT_GDIMODEL_SYSMEM_PRESENTHISTORYTOKEN
    #field int64 hlsurf
    #field int dwDirtyFlags
    #field int64 uiCookie
#endstruct

#defstruct D3DKMT_GETCONTEXTSCHEDULINGPRIORITY
    #field int hContext
    #field int Priority
#endstruct

#defstruct D3DKMT_GETDEVICESTATE
    #field int hDevice
    #field int StateType
    #field var Anonymous
    #field int ExecutionState
    #field var PresentState
    #field var ResetState
    #field var PresentStateDWM
    #field var PageFaultState
    #field var PresentQueueState
#endstruct

#defstruct D3DKMT_GETDISPLAYMODELIST
    #field int hAdapter
    #field int VidPnSourceId
    #field var pModeList
    #field int ModeCount
#endstruct

#defstruct D3DKMT_GETMULTISAMPLEMETHODLIST
    #field int hAdapter
    #field int VidPnSourceId
    #field int Width
    #field int Height
    #field int Format
    #field var pMethodList
    #field int MethodCount
#endstruct

#defstruct D3DKMT_GETRUNTIMEDATA
    #field int hAdapter
    #field int hGlobalShare
    #field var pRuntimeData
    #field int RuntimeDataSize
#endstruct

#defstruct D3DKMT_GETSHAREDPRIMARYHANDLE
    #field int hAdapter
    #field int VidPnSourceId
    #field int hSharedPrimary
#endstruct

#defstruct D3DKMT_LOCK
    #field int hDevice
    #field int hAllocation
    #field int PrivateDriverData
    #field int NumPages
    #field var pPages
    #field var pData
    #field var Flags
    #field int64 GpuVirtualAddress
#endstruct

#defstruct D3DKMT_MULTISAMPLEMETHOD
    #field int NumSamples
    #field int NumQualityLevels
    #field int Reserved
#endstruct

#defstruct D3DKMT_OPENADAPTERFROMGDIDISPLAYNAME
    #field int DeviceName
    #field int hAdapter
    #field int VidPnSourceId
#endstruct

#defstruct D3DKMT_OPENADAPTERFROMHDC
    #field int hAdapter
    #field int VidPnSourceId
#endstruct

#defstruct D3DKMT_OPENRESOURCE
    #field int hDevice
    #field int hGlobalShare
    #field int NumAllocations
    #field var Anonymous
    #field var pPrivateRuntimeData
    #field int PrivateRuntimeDataSize
    #field var pResourcePrivateDriverData
    #field int ResourcePrivateDriverDataSize
    #field var pTotalPrivateDriverDataBuffer
    #field int TotalPrivateDriverDataBufferSize
    #field int hResource
    #field var pOpenAllocationInfo
    #field var pOpenAllocationInfo2
#endstruct

#defstruct D3DKMT_PRESENT
    #field var Anonymous1
    #field int VidPnSourceId
    #field int hSource
    #field int hDestination
    #field int Color
    #field int SubRectCnt
    #field int PresentCount
    #field int FlipInterval
    #field int Flags
    #field int BroadcastContextCount
    #field int BroadcastContext
    #field int PresentHistoryToken
    #field var pPresentRegions
    #field var Anonymous2
    #field int Duration
    #field var BroadcastSrcAllocation
    #field var BroadcastDstAllocation
    #field int PrivateDriverDataSize
    #field var pPrivateDriverData
    #field int hDevice
    #field int hContext
    #field int hAdapter
    #field int hIndirectContext
#endstruct

#defstruct D3DKMT_PRESENT_RGNS
    #field int DirtyRectCount
    #field int MoveRectCount
    #field var pMoveRects
#endstruct

#defstruct D3DKMT_PRESENT_STATS
    #field int PresentCount
    #field int PresentRefreshCount
    #field int SyncRefreshCount
    #field int64 SyncQPCTime
    #field int64 SyncGPUTime
#endstruct

#defstruct D3DKMT_PRESENT_STATS_DWM
    #field int PresentCount
    #field int PresentRefreshCount
    #field int64 PresentQPCTime
    #field int SyncRefreshCount
    #field int64 SyncQPCTime
    #field int CustomPresentDuration
#endstruct

#defstruct D3DKMT_PRESENTFLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DKMT_PRESENTHISTORYTOKEN
    #field int Model
    #field int TokenSize
    #field int64 CompositionBindingId
    #field int Token
    #field var Flip
    #field var Blt
    #field int64 VistaBlt
    #field var Gdi
    #field var Fence
    #field var GdiSysMem
    #field var Composition
    #field var FlipManager
    #field int SurfaceComplete
#endstruct

#defstruct _Token_e__Union
    #field var Flip
    #field var Blt
    #field int64 VistaBlt
    #field var Gdi
    #field var Fence
    #field var GdiSysMem
    #field var Composition
    #field var FlipManager
    #field int SurfaceComplete
#endstruct

#defstruct D3DKMT_QUERYADAPTERINFO
    #field int hAdapter
    #field int Type
    #field var pPrivateDriverData
    #field int PrivateDriverDataSize
#endstruct

#defstruct D3DKMT_QUERYALLOCATIONRESIDENCY
    #field int hDevice
    #field int hResource
    #field var phAllocationList
    #field int AllocationCount
    #field var pResidencyStatus
#endstruct

#defstruct D3DKMT_QUERYRESOURCEINFO
    #field int hDevice
    #field int hGlobalShare
    #field var pPrivateRuntimeData
    #field int PrivateRuntimeDataSize
    #field int TotalPrivateDriverDataSize
    #field int ResourcePrivateDriverDataSize
    #field int NumAllocations
#endstruct

#defstruct D3DKMT_REGISTERTRIMNOTIFICATION
    #field int hDevice
    #field var Context
    #field var Handle
#endstruct

#defstruct D3DKMT_RENDER
    #field var Anonymous
    #field int CommandOffset
    #field int CommandLength
    #field int AllocationCount
    #field int PatchLocationCount
    #field var pNewCommandBuffer
    #field int NewCommandBufferSize
    #field var pNewAllocationList
    #field int NewAllocationListSize
    #field var pNewPatchLocationList
    #field int NewPatchLocationListSize
    #field int Flags
    #field int64 PresentHistoryToken
    #field int BroadcastContextCount
    #field int BroadcastContext
    #field int QueuedBufferCount
    #field int64 NewCommandBuffer
    #field var pPrivateDriverData
    #field int PrivateDriverDataSize
    #field int hDevice
    #field int hContext
#endstruct

#defstruct D3DKMT_RENDERFLAGS
    #field int _bitfield
#endstruct

#defstruct D3DKMT_SCATTERBLT
    #field int64 hLogicalSurfaceDestination
    #field int64 hDestinationCompSurfDWM
    #field int64 DestinationCompositionBindingId
#endstruct

#defstruct D3DKMT_SCATTERBLTS
    #field int NumBlts
    #field int Blts
#endstruct

#defstruct D3DKMT_SETALLOCATIONPRIORITY
    #field int hDevice
    #field int hResource
    #field var phAllocationList
    #field int AllocationCount
    #field var pPriorities
#endstruct

#defstruct D3DKMT_SETCONTEXTSCHEDULINGPRIORITY
    #field int hContext
    #field int Priority
#endstruct

#defstruct D3DKMT_SETDISPLAYMODE
    #field int hDevice
    #field int hPrimaryAllocation
    #field int ScanLineOrdering
    #field int DisplayOrientation
    #field int PrivateDriverFormatAttribute
    #field int Flags
#endstruct

#defstruct D3DKMT_SETDISPLAYMODE_FLAGS
    #field int _bitfield1
    #field int _bitfield2
#endstruct

#defstruct D3DKMT_SETDISPLAYPRIVATEDRIVERFORMAT
    #field int hDevice
    #field int VidPnSourceId
    #field int PrivateDriverFormatAttribute
#endstruct

#defstruct D3DKMT_SETGAMMARAMP
    #field int hDevice
    #field int VidPnSourceId
    #field int Type
    #field var Anonymous
    #field int Size
    #field var pGammaRampRgb256x3x16
    #field var pGammaRampDXGI1
#endstruct

#defstruct D3DKMT_SETVIDPNSOURCEOWNER
    #field int hDevice
    #field var pType
    #field var pVidPnSourceId
    #field int VidPnSourceCount
#endstruct

#defstruct D3DKMT_SETVIDPNSOURCEOWNER1
    #field var Version0
    #field int Flags
#endstruct

#defstruct D3DKMT_SIGNALSYNCHRONIZATIONOBJECT
    #field int hContext
    #field int ObjectCount
    #field int ObjectHandleArray
    #field var Flags
#endstruct

#defstruct D3DKMT_STANDARDALLOCATION_EXISTINGHEAP
    #field int Size
#endstruct

#defstruct D3DKMT_SURFACECOMPLETE_PRESENTHISTORYTOKEN
    #field int64 hLogicalSurface
#endstruct

#defstruct D3DKMT_TRIMNOTIFICATION
    #field var Context
    #field var Flags
    #field int64 NumBytesToTrim
#endstruct

#defstruct D3DKMT_UNLOCK
    #field int hDevice
    #field int NumAllocations
    #field var phAllocations
#endstruct

#defstruct D3DKMT_UNREGISTERTRIMNOTIFICATION
    #field var Handle
#endstruct

#defstruct D3DKMT_VIDPNSOURCEOWNER_FLAGS
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct D3DKMT_WAITFORSYNCHRONIZATIONOBJECT
    #field int hContext
    #field int ObjectCount
    #field int ObjectHandleArray
#endstruct

#defstruct D3DKMT_WAITFORVERTICALBLANKEVENT
    #field int hAdapter
    #field int hDevice
    #field int VidPnSourceId
#endstruct

#defstruct DXGK_FAULT_ERROR_CODE
    #field var Anonymous
    #field int Anonymous1
    #field int Anonymous2
    #field int _bitfield
    #field int _bitfield
#endstruct

#defstruct _Anonymous1_e__Struct
    #field int lMinimum
    #field int lMaximum
#endstruct

#defstruct _Anonymous2_e__Struct
    #field int dwMinimum
    #field int dwMaximum
#endstruct

#defstruct ABC
    #field int abcA
    #field int abcB
    #field int abcC
#endstruct

#defstruct ABCFLOAT
    #field float abcfA
    #field float abcfB
    #field float abcfC
#endstruct

#defstruct ACCEL
    #field int fVirt
    #field int key
    #field int cmd
#endstruct

#defstruct ACL
    #field int AclRevision
    #field int Sbz1
    #field int AclSize
    #field int AceCount
    #field int Sbz2
#endstruct

#defstruct ACTCTX_SECTION_KEYED_DATA
    #field int cbSize
    #field int ulDataFormatVersion
    #field var lpData
    #field int ulLength
    #field var lpSectionGlobalData
    #field int ulSectionGlobalDataLength
    #field var lpSectionBase
    #field int ulSectionTotalLength
    #field intptr hActCtx
    #field int ulAssemblyRosterIndex
    #field int ulFlags
    #field int AssemblyMetadata
#endstruct

#defstruct ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA
    #field var lpInformation
    #field var lpSectionBase
    #field int ulSectionLength
    #field var lpSectionGlobalDataBase
    #field int ulSectionGlobalDataLength
#endstruct

#defstruct ACTCTXW
    #field int cbSize
    #field int dwFlags
    #field wstr lpSource
    #field int wProcessorArchitecture
    #field int wLangId
    #field wstr lpAssemblyDirectory
    #field wstr lpResourceName
    #field wstr lpApplicationName
    #field intptr hModule
#endstruct

#defstruct ADDRESS64
    #field int64 Offset
    #field int Segment
    #field int Mode
#endstruct

#defstruct ADDRINFOEXA
    #field int ai_flags
    #field int ai_family
    #field int ai_socktype
    #field int ai_protocol
    #field int ai_addrlen
    #field str ai_canonname
    #field var ai_addr
    #field var ai_blob
    #field int ai_bloblen
    #field var ai_next
#endstruct

#defstruct ADDRINFOEXW
    #field int ai_flags
    #field int ai_family
    #field int ai_socktype
    #field int ai_protocol
    #field int ai_addrlen
    #field wstr ai_canonname
    #field var ai_addr
    #field var ai_blob
    #field int ai_bloblen
    #field var ai_next
#endstruct

#defstruct ADDRINFOW
    #field int ai_flags
    #field int ai_family
    #field int ai_socktype
    #field int ai_protocol
    #field int ai_addrlen
    #field wstr ai_canonname
    #field var ai_addr
    #field var ai_next
#endstruct

#defstruct ADMINISTRATOR_POWER_POLICY
    #field int MinSleep
    #field int MaxSleep
    #field int MinVideoTimeout
    #field int MaxVideoTimeout
    #field int MinSpindownTimeout
    #field int MaxSpindownTimeout
#endstruct

#defstruct AFPROTOCOLS
    #field int iAddressFamily
    #field int iProtocol
#endstruct

#defstruct ALTTABINFO
    #field int cbSize
    #field int cItems
    #field int cColumns
    #field int cRows
    #field int iColFocus
    #field int iRowFocus
    #field int cxItem
    #field int cyItem
#endstruct

#defstruct API_VERSION
    #field int MajorVersion
    #field int MinorVersion
    #field int Revision
    #field int Reserved
#endstruct

#defstruct APP_CACHE_DOWNLOAD_ENTRY
    #field wstr pwszUrl
    #field int dwEntryType
#endstruct

#defstruct APP_CACHE_DOWNLOAD_LIST
    #field int dwEntryCount
    #field var pEntries
#endstruct

#defstruct APP_CACHE_GROUP_INFO
    #field wstr pwszManifestUrl
    #field int64 ullSize
#endstruct

#defstruct APP_CACHE_GROUP_LIST
    #field int dwAppCacheGroupCount
    #field var pAppCacheGroups
#endstruct

#defstruct APPCATEGORYINFO
    #field int Locale
    #field wstr pszDescription
#endstruct

#defstruct APPCATEGORYINFOLIST
    #field int cCategory
    #field var pCategoryInfo
#endstruct

#defstruct ARRAYDESC
    #field int tdescElem
    #field int cDims
#endstruct

#defstruct AUDIT_POLICY_INFORMATION
    #field int AuditingInformation
#endstruct

#defstruct AUTO_SCROLL_DATA
    #field int iNextSample
    #field int dwLastScroll
    #field int bFull
    #field int pts
    #field int dwTimes
#endstruct

#defstruct AUXCAPSW
    #field int wMid
    #field int wPid
    #field int vDriverVersion
    #field int szPname
    #field int wTechnology
    #field int wReserved1
    #field int dwSupport
#endstruct

#defstruct BATTERY_REPORTING_SCALE
    #field int Granularity
    #field int Capacity
#endstruct

#defstruct BCRYPT_ALGORITHM_IDENTIFIER
    #field wstr pszName
    #field int dwClass
    #field int dwFlags
#endstruct

#defstruct BCRYPT_PROVIDER_NAME
    #field wstr pszProviderName
#endstruct

#defstruct BCryptBuffer
    #field int cbBuffer
    #field int BufferType
    #field var pvBuffer
#endstruct

#defstruct BCryptBufferDesc
    #field int ulVersion
    #field int cBuffers
    #field var pBuffers
#endstruct

#defstruct BIND_OPTS
    #field int cbStruct
    #field int grfFlags
    #field int grfMode
    #field int dwTickCountDeadline
#endstruct

#defstruct BINDINFO
    #field int cbSize
    #field wstr szExtraInfo
    #field int stgmedData
    #field int grfBindInfoF
    #field int dwBindVerb
    #field wstr szCustomVerb
    #field int cbstgmedData
    #field int dwOptions
    #field int dwOptionsFlags
    #field int dwCodePage
    #field int securityAttributes
    #field var pUnk
    #field int dwReserved
#endstruct

#defstruct BINDPTR
    #field var lpfuncdesc
    #field var lpvardesc
    #field var lptcomp
#endstruct

#defstruct BITMAP
    #field int bmType
    #field int bmWidth
    #field int bmHeight
    #field int bmWidthBytes
    #field int bmPlanes
    #field int bmBitsPixel
    #field var bmBits
#endstruct

#defstruct BitmapData
    #field int Width
    #field int Height
    #field int Stride
    #field int PixelFormat
    #field var Scan0
    #field int Reserved
#endstruct

#defstruct BITMAPINFO
    #field int bmiHeader
#endstruct

#defstruct BITMAPINFOHEADER
    #field int biSize
    #field int biWidth
    #field int biHeight
    #field int biPlanes
    #field int biBitCount
    #field int biCompression
    #field int biSizeImage
    #field int biXPelsPerMeter
    #field int biYPelsPerMeter
    #field int biClrUsed
    #field int biClrImportant
#endstruct

#defstruct BLENDFUNCTION
    #field int BlendOp
    #field int BlendFlags
    #field int SourceConstantAlpha
    #field int AlphaFormat
#endstruct

#defstruct BLENDOBJ
    #field var BlendFunction
#endstruct

#defstruct BLOB
    #field int cbSize
    #field var pBlobData
#endstruct

#defstruct BP_ANIMATIONPARAMS
    #field int cbSize
    #field int dwFlags
    #field int style
    #field int dwDuration
#endstruct

#defstruct BP_PAINTPARAMS
    #field int cbSize
    #field int dwFlags
    #field var prcExclude
    #field var pBlendFunction
#endstruct

#defstruct BROWSEINFOW
    #field intptr hwndOwner
    #field var pidlRoot
    #field wstr pszDisplayName
    #field wstr lpszTitle
    #field int ulFlags
    #field intptr lParam
    #field int iImage
#endstruct

#defstruct BRUSHOBJ
    #field int iSolidColor
    #field var pvRbrush
    #field int flColorType
#endstruct

#defstruct BSMINFO
    #field int cbSize
    #field intptr hdesk
    #field intptr hwnd
    #field int luid
#endstruct

#defstruct BSTRBLOB
    #field int cbSize
    #field var pData
#endstruct

#defstruct BY_HANDLE_FILE_INFORMATION
    #field int dwFileAttributes
    #field int dwVolumeSerialNumber
    #field int nFileSizeHigh
    #field int nFileSizeLow
    #field int nNumberOfLinks
    #field int nFileIndexHigh
    #field int nFileIndexLow
#endstruct

#defstruct CABINETSTATE
    #field int cLength
    #field int nVersion
    #field int _bitfield
    #field int fMenuEnumFilter
#endstruct

#defstruct CABOOL
    #field int cElems
    #field var pElems
#endstruct

#defstruct CABSTR
    #field int cElems
    #field var pElems
#endstruct

#defstruct CABSTRBLOB
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAC
    #field int cElems
    #field str pElems
#endstruct

#defstruct CACHE_DESCRIPTOR
    #field int Level
    #field int Associativity
    #field int LineSize
    #field int Size
    #field int Type
#endstruct

#defstruct CACLIPDATA
    #field int cElems
    #field var pElems
#endstruct

#defstruct CACLSID
    #field int cElems
#endstruct

#defstruct CACY
    #field int cElems
    #field var pElems
#endstruct

#defstruct CADATE
    #field int cElems
    #field var pElems
#endstruct

#defstruct CADBL
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAFILETIME
    #field int cElems
#endstruct

#defstruct CAFLT
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAH
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAI
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAL
    #field int cElems
    #field var pElems
#endstruct

#defstruct CALDATETIME
    #field int CalId
    #field int Era
    #field int Year
    #field int Month
    #field int Day
    #field int DayOfWeek
    #field int Hour
    #field int Minute
    #field int Second
    #field int Tick
#endstruct

#defstruct CALPSTR
    #field int cElems
    #field var pElems
#endstruct

#defstruct CALPWSTR
    #field int cElems
    #field var pElems
#endstruct

#defstruct CANDIDATEFORM
    #field int dwIndex
    #field int dwStyle
    #field int rcArea
#endstruct

#defstruct CANDIDATELIST
    #field int dwSize
    #field int dwStyle
    #field int dwCount
    #field int dwSelection
    #field int dwPageStart
    #field int dwPageSize
#endstruct

#defstruct CAPROPVARIANT
    #field int cElems
    #field var pElems
#endstruct

#defstruct CASCODE
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAUB
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAUH
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAUI
    #field int cElems
    #field var pElems
#endstruct

#defstruct CAUL
    #field int cElems
    #field var pElems
#endstruct

#defstruct CENTRAL_ACCESS_POLICY
    #field int CAPID
    #field int Name
    #field int Description
    #field int ChangeId
    #field int Flags
    #field int CAPECount
    #field var CAPEs
#endstruct

#defstruct CENTRAL_ACCESS_POLICY_ENTRY
    #field int Name
    #field int Description
    #field int ChangeId
    #field int LengthAppliesTo
    #field var AppliesTo
    #field int LengthSD
    #field int SD
    #field int LengthStagedSD
    #field int StagedSD
    #field int Flags
#endstruct

#defstruct CERT_CHAIN_CONTEXT
    #field int cbSize
    #field int TrustStatus
    #field int cChain
    #field var rgpChain
    #field int cLowerQualityChainContext
    #field var rgpLowerQualityChainContext
    #field int fHasRevocationFreshnessTime
    #field int dwRevocationFreshnessTime
    #field int dwCreateFlags
#endstruct

#defstruct CERT_CHAIN_ELEMENT
    #field int cbSize
    #field var pCertContext
    #field int TrustStatus
    #field var pRevocationInfo
    #field var pIssuanceUsage
    #field var pApplicationUsage
    #field wstr pwszExtendedErrorInfo
#endstruct

#defstruct CERT_CHAIN_ENGINE_CONFIG
    #field int cbSize
    #field int hRestrictedRoot
    #field int hRestrictedTrust
    #field int hRestrictedOther
    #field int cAdditionalStore
    #field var rghAdditionalStore
    #field int dwFlags
    #field int dwUrlRetrievalTimeout
    #field int MaximumCachedCertificates
    #field int CycleDetectionModulus
    #field int hExclusiveRoot
    #field int hExclusiveTrustedPeople
    #field int dwExclusiveFlags
#endstruct

#defstruct CERT_CHAIN_PARA
    #field int cbSize
    #field int RequestedUsage
#endstruct

#defstruct CERT_CHAIN_POLICY_PARA
    #field int cbSize
    #field int dwFlags
    #field var pvExtraPolicyPara
#endstruct

#defstruct CERT_CHAIN_POLICY_STATUS
    #field int cbSize
    #field int dwError
    #field int lChainIndex
    #field int lElementIndex
    #field var pvExtraPolicyStatus
#endstruct

#defstruct CERT_CONTEXT
    #field int dwCertEncodingType
    #field var pbCertEncoded
    #field int cbCertEncoded
    #field var pCertInfo
    #field int hCertStore
#endstruct

#defstruct CERT_CREATE_CONTEXT_PARA
    #field int cbSize
    #field var pvFree
    #field var pvSort
#endstruct

#defstruct CERT_EXTENSION
    #field str pszObjId
    #field int fCritical
    #field int Value
#endstruct

#defstruct CERT_EXTENSIONS
    #field int cExtension
    #field var rgExtension
#endstruct

#defstruct CERT_INFO
    #field int dwVersion
    #field int SerialNumber
    #field int SignatureAlgorithm
    #field int Issuer
    #field int Subject
    #field int SubjectPublicKeyInfo
    #field int IssuerUniqueId
    #field int SubjectUniqueId
    #field int cExtension
    #field var rgExtension
#endstruct

#defstruct CERT_NAME_INFO
    #field int cRDN
    #field var rgRDN
#endstruct

#defstruct CERT_PHYSICAL_STORE_INFO
    #field int cbSize
    #field str pszOpenStoreProvider
    #field int dwOpenEncodingType
    #field int dwOpenFlags
    #field int OpenParameters
    #field int dwFlags
    #field int dwPriority
#endstruct

#defstruct CERT_PUBLIC_KEY_INFO
    #field int Algorithm
    #field int PublicKey
#endstruct

#defstruct CERT_RDN
    #field int cRDNAttr
    #field var rgRDNAttr
#endstruct

#defstruct CERT_RDN_ATTR
    #field str pszObjId
    #field int Value
#endstruct

#defstruct CERT_REVOCATION_CRL_INFO
    #field int cbSize
    #field var pBaseCrlContext
    #field var pDeltaCrlContext
    #field var pCrlEntry
    #field int fDeltaCrlEntry
#endstruct

#defstruct CERT_REVOCATION_INFO
    #field int cbSize
    #field int dwRevocationResult
    #field str pszRevocationOid
    #field var pvOidSpecificInfo
    #field int fHasFreshnessTime
    #field int dwFreshnessTime
    #field var pCrlInfo
#endstruct

#defstruct CERT_REVOCATION_PARA
    #field int cbSize
    #field var pIssuerCert
    #field int cCertStore
    #field var rgCertStore
    #field int hCrlStore
#endstruct

#defstruct CERT_REVOCATION_STATUS
    #field int cbSize
    #field int dwIndex
    #field int dwError
    #field int dwReason
    #field int fHasFreshnessTime
    #field int dwFreshnessTime
#endstruct

#defstruct CERT_SELECT_CHAIN_PARA
    #field intptr hChainEngine
    #field int hAdditionalStore
    #field var pChainPara
    #field int dwFlags
#endstruct

#defstruct CERT_SELECT_CRITERIA
    #field int dwType
    #field int cPara
    #field var ppPara
#endstruct

#defstruct CERT_SERVER_OCSP_RESPONSE_CONTEXT
    #field int cbSize
    #field var pbEncodedOcspResponse
    #field int cbEncodedOcspResponse
#endstruct

#defstruct CERT_SERVER_OCSP_RESPONSE_OPEN_PARA
    #field int cbSize
    #field int dwFlags
    #field var pcbUsedSize
    #field wstr pwszOcspDirectory
    #field var pvUpdateCallbackArg
#endstruct

#defstruct CERT_SIMPLE_CHAIN
    #field int cbSize
    #field int TrustStatus
    #field int cElement
    #field var rgpElement
    #field var pTrustListInfo
    #field int fHasRevocationFreshnessTime
    #field int dwRevocationFreshnessTime
#endstruct

#defstruct CERT_STRONG_SIGN_PARA
    #field int cbSize
    #field int dwInfoChoice
    #field var Anonymous
    #field var pvInfo
    #field var pSerializedInfo
    #field str pszOID
#endstruct

#defstruct CERT_STRONG_SIGN_SERIALIZED_INFO
    #field int dwFlags
    #field wstr pwszCNGSignHashAlgids
    #field wstr pwszCNGPubKeyMinBitLengths
#endstruct

#defstruct CERT_SYSTEM_STORE_INFO
    #field int cbSize
#endstruct

#defstruct CERT_TRUST_LIST_INFO
    #field int cbSize
    #field var pCtlEntry
    #field var pCtlContext
#endstruct

#defstruct CERT_TRUST_STATUS
    #field int dwErrorStatus
    #field int dwInfoStatus
#endstruct

#defstruct CERT_USAGE_MATCH
    #field int dwType
    #field int Usage
#endstruct

#defstruct CHANGEFILTERSTRUCT
    #field int cbSize
    #field int ExtStatus
#endstruct

#defstruct CHAR_INFO
    #field int Char
    #field int Attributes
    #field int UnicodeChar
    #field int AsciiChar
#endstruct

#defstruct _Char_e__Union
    #field int UnicodeChar
    #field int AsciiChar
#endstruct

#defstruct CharacterRange
    #field int First
    #field int Length
#endstruct

#defstruct CHARSETINFO
    #field int ciCharset
    #field int ciACP
    #field int fs
#endstruct

#defstruct CIEXYZ
    #field int ciexyzX
    #field int ciexyzY
    #field int ciexyzZ
#endstruct

#defstruct CIEXYZTRIPLE
    #field var ciexyzRed
    #field var ciexyzGreen
    #field var ciexyzBlue
#endstruct

#defstruct CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE
    #field int64 Version
    #field wstr Name
#endstruct

#defstruct CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE
    #field var pValue
    #field int ValueLength
#endstruct

#defstruct CLAIM_SECURITY_ATTRIBUTE_V1
    #field wstr Name
    #field int ValueType
    #field int Reserved
    #field int Flags
    #field int ValueCount
    #field int Values
    #field var pInt64
    #field var pUint64
    #field var ppString
    #field var pFqbn
    #field var pOctetString
#endstruct

#defstruct _Values_e__Union
    #field var pInt64
    #field var pUint64
    #field var ppString
    #field var pFqbn
    #field var pOctetString
#endstruct

#defstruct CLAIM_SECURITY_ATTRIBUTES_INFORMATION
    #field int Version
    #field int Reserved
    #field int AttributeCount
    #field int Attribute
    #field var pAttributeV1
#endstruct

#defstruct _Attribute_e__Union
    #field var pAttributeV1
#endstruct

#defstruct CLIPDATA
    #field int cbSize
    #field int ulClipFmt
    #field var pClipData
#endstruct

#defstruct CLIPLINE
    #field int ptfxA
    #field int ptfxB
    #field int lStyleState
    #field int c
#endstruct

#defstruct CLIPOBJ
    #field int iUniq
    #field int rclBounds
    #field int iDComplexity
    #field int iFComplexity
    #field int iMode
    #field int fjOptions
#endstruct

#defstruct CMINVOKECOMMANDINFO
    #field int cbSize
    #field int fMask
    #field intptr hwnd
    #field str lpVerb
    #field str lpParameters
    #field str lpDirectory
    #field int nShow
    #field int dwHotKey
    #field intptr hIcon
#endstruct

#defstruct CMSG_SIGNED_ENCODE_INFO
    #field int cbSize
    #field int cSigners
    #field var rgSigners
    #field int cCertEncoded
    #field var rgCertEncoded
    #field int cCrlEncoded
    #field var rgCrlEncoded
#endstruct

#defstruct CMSG_SIGNER_ENCODE_INFO
    #field int cbSize
    #field var pCertInfo
    #field var Anonymous
    #field int dwKeySpec
    #field int HashAlgorithm
    #field var pvHashAuxInfo
    #field int cAuthAttr
    #field var rgAuthAttr
    #field int cUnauthAttr
    #field var rgUnauthAttr
    #field int hCryptProv
    #field int hNCryptKey
#endstruct

#defstruct CMSG_STREAM_INFO
    #field int cbContent
    #field var pvArg
#endstruct

#defstruct Color
    #field int Argb
#endstruct

#defstruct COLORADJUSTMENT
    #field int caSize
    #field int caFlags
    #field int caIlluminantIndex
    #field int caRedGamma
    #field int caGreenGamma
    #field int caBlueGamma
    #field int caReferenceBlack
    #field int caReferenceWhite
    #field int caContrast
    #field int caBrightness
    #field int caColorfulness
    #field int caRedGreenTint
#endstruct

#defstruct COLORMAP
    #field int from
    #field int to
#endstruct

#defstruct ColorMap
    #field var oldColor
    #field var newColor
#endstruct

#defstruct ColorMatrix
    #field int m
#endstruct

#defstruct ColorPalette
    #field int Flags
    #field int Count
#endstruct

#defstruct COMBOBOXINFO
    #field int cbSize
    #field int rcItem
    #field int rcButton
    #field int stateButton
    #field intptr hwndCombo
    #field intptr hwndItem
    #field intptr hwndList
#endstruct

#defstruct COMMCONFIG
    #field int dwSize
    #field int wVersion
    #field int wReserved
    #field int dcb
    #field int dwProviderSubType
    #field int dwProviderOffset
    #field int dwProviderSize
#endstruct

#defstruct COMMPROP
    #field int wPacketLength
    #field int wPacketVersion
    #field int dwServiceMask
    #field int dwReserved1
    #field int dwMaxTxQueue
    #field int dwMaxRxQueue
    #field int dwMaxBaud
    #field int dwProvSubType
    #field int dwProvCapabilities
    #field int dwSettableParams
    #field int dwSettableBaud
    #field int wSettableData
    #field int wSettableStopParity
    #field int dwCurrentTxQueue
    #field int dwCurrentRxQueue
    #field int dwProvSpec1
    #field int dwProvSpec2
#endstruct

#defstruct COMMTIMEOUTS
    #field int ReadIntervalTimeout
    #field int ReadTotalTimeoutMultiplier
    #field int ReadTotalTimeoutConstant
    #field int WriteTotalTimeoutMultiplier
    #field int WriteTotalTimeoutConstant
#endstruct

#defstruct COMPOSITIONFORM
    #field int dwStyle
    #field int rcArea
#endstruct

#defstruct COMSTAT
    #field int _bitfield
    #field int cbInQue
    #field int cbOutQue
#endstruct

#defstruct CONSOLE_CURSOR_INFO
    #field int dwSize
    #field int bVisible
#endstruct

#defstruct CONSOLE_FONT_INFO
    #field int nFont
    #field int dwFontSize
#endstruct

#defstruct CONSOLE_FONT_INFOEX
    #field int cbSize
    #field int nFont
    #field int dwFontSize
    #field int FontFamily
    #field int FontWeight
    #field int FaceName
#endstruct

#defstruct CONSOLE_HISTORY_INFO
    #field int cbSize
    #field int HistoryBufferSize
    #field int NumberOfHistoryBuffers
    #field int dwFlags
#endstruct

#defstruct CONSOLE_READCONSOLE_CONTROL
    #field int nLength
    #field int nInitialChars
    #field int dwCtrlWakeupMask
    #field int dwControlKeyState
#endstruct

#defstruct CONSOLE_SCREEN_BUFFER_INFO
    #field int dwSize
    #field int dwCursorPosition
    #field int wAttributes
    #field int srWindow
    #field int dwMaximumWindowSize
#endstruct

#defstruct CONSOLE_SCREEN_BUFFER_INFOEX
    #field int cbSize
    #field int dwSize
    #field int dwCursorPosition
    #field int wAttributes
    #field int srWindow
    #field int dwMaximumWindowSize
    #field int wPopupAttributes
    #field int bFullscreenSupported
    #field int ColorTable
#endstruct

#defstruct CONSOLE_SELECTION_INFO
    #field int dwFlags
    #field int dwSelectionAnchor
    #field int srSelection
#endstruct

#defstruct CONVCONTEXT
    #field int cb
    #field int wFlags
    #field int wCountryID
    #field int iCodePage
    #field int dwLangID
    #field int dwSecurity
    #field int qos
#endstruct

#defstruct CONVINFO
    #field int cb
    #field int hUser
    #field intptr hConvPartner
    #field intptr hszSvcPartner
    #field intptr hszServiceReq
    #field intptr hszTopic
    #field intptr hszItem
    #field int wFmt
    #field int wType
    #field int wStatus
    #field int wConvst
    #field int wLastError
    #field intptr hConvList
    #field var ConvCtxt
    #field intptr hwnd
    #field intptr hwndPartner
#endstruct

#defstruct COORD
    #field int X
    #field int Y
#endstruct

#defstruct COPYFILE2_EXTENDED_PARAMETERS
    #field int dwSize
    #field int dwCopyFlags
    #field var pfCancel
    #field var pvCallbackContext
#endstruct

#defstruct COPYFILE2_MESSAGE
    #field int Type
    #field int dwPadding
    #field int Info
    #field int ChunkStarted
    #field int ChunkFinished
    #field int StreamStarted
    #field int StreamFinished
    #field int PollContinue
    #field int Error
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliChunkNumber
    #field int64 uliChunkSize
    #field int64 uliStreamSize
    #field int64 uliTotalFileSize
    #field int dwStreamNumber
    #field int dwFlags
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliChunkNumber
    #field int64 uliChunkSize
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliStreamSize
    #field int64 uliTotalFileSize
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
    #field int dwReserved
    #field int CopyPhase
    #field int dwStreamNumber
    #field intptr hrFailure
    #field int dwReserved
    #field int64 uliChunkNumber
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
#endstruct

#defstruct _Info_e__Union
    #field int ChunkStarted
    #field int ChunkFinished
    #field int StreamStarted
    #field int StreamFinished
    #field int PollContinue
    #field int Error
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliChunkNumber
    #field int64 uliChunkSize
    #field int64 uliStreamSize
    #field int64 uliTotalFileSize
    #field int dwStreamNumber
    #field int dwFlags
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliChunkNumber
    #field int64 uliChunkSize
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliStreamSize
    #field int64 uliTotalFileSize
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
    #field int dwReserved
    #field int CopyPhase
    #field int dwStreamNumber
    #field intptr hrFailure
    #field int dwReserved
    #field int64 uliChunkNumber
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
#endstruct

#defstruct _ChunkStarted_e__Struct
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliChunkNumber
    #field int64 uliChunkSize
    #field int64 uliStreamSize
    #field int64 uliTotalFileSize
#endstruct

#defstruct _ChunkFinished_e__Struct
    #field int dwStreamNumber
    #field int dwFlags
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliChunkNumber
    #field int64 uliChunkSize
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
#endstruct

#defstruct _StreamStarted_e__Struct
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliStreamSize
    #field int64 uliTotalFileSize
#endstruct

#defstruct _StreamFinished_e__Struct
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
#endstruct

#defstruct _PollContinue_e__Struct
    #field int dwReserved
#endstruct

#defstruct _Error_e__Struct
    #field int CopyPhase
    #field int dwStreamNumber
    #field intptr hrFailure
    #field int dwReserved
    #field int64 uliChunkNumber
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
#endstruct

#defstruct CPINFO
    #field int MaxCharSize
    #field int DefaultChar
    #field int LeadByte
#endstruct

#defstruct CPINFOEXW
    #field int MaxCharSize
    #field int DefaultChar
    #field int LeadByte
    #field int UnicodeDefaultChar
    #field int CodePage
    #field int CodePageName
#endstruct

#defstruct CREATE_PROCESS_DEBUG_INFO
    #field intptr hFile
    #field intptr hProcess
    #field intptr hThread
    #field var lpBaseOfImage
    #field int dwDebugInfoFileOffset
    #field int nDebugInfoSize
    #field var lpThreadLocalBase
    #field var lpImageName
    #field int fUnicode
#endstruct

#defstruct CREATE_THREAD_DEBUG_INFO
    #field intptr hThread
    #field var lpThreadLocalBase
#endstruct

#defstruct CREATEFILE2_EXTENDED_PARAMETERS
    #field int dwSize
    #field int dwFileAttributes
    #field int dwFileFlags
    #field int dwSecurityQosFlags
    #field var lpSecurityAttributes
    #field intptr hTemplateFile
#endstruct

#defstruct CREDENTIAL_ATTRIBUTEW
    #field wstr Keyword
    #field int Flags
    #field int ValueSize
    #field var Value
#endstruct

#defstruct CREDENTIAL_TARGET_INFORMATIONW
    #field wstr TargetName
    #field wstr NetbiosServerName
    #field wstr DnsServerName
    #field wstr NetbiosDomainName
    #field wstr DnsDomainName
    #field wstr DnsTreeName
    #field wstr PackageName
    #field int Flags
    #field int CredTypeCount
    #field var CredTypes
#endstruct

#defstruct CREDENTIALW
    #field int Flags
    #field int Type
    #field wstr TargetName
    #field wstr Comment
    #field int CredentialBlobSize
    #field var CredentialBlob
    #field int Persist
    #field int AttributeCount
    #field var Attributes
    #field wstr TargetAlias
    #field wstr UserName
#endstruct

#defstruct CRITICAL_SECTION
    #field var DebugInfo
    #field int LockCount
    #field int RecursionCount
    #field intptr OwningThread
    #field intptr LockSemaphore
    #field int SpinCount
#endstruct

#defstruct CRITICAL_SECTION_DEBUG
    #field int Type
    #field int CreatorBackTraceIndex
    #field var CriticalSection
    #field int ProcessLocksList
    #field int EntryCount
    #field int ContentionCount
    #field int Flags
    #field int CreatorBackTraceIndexHigh
    #field int Identifier
#endstruct

#defstruct CRL_CONTEXT
    #field int dwCertEncodingType
    #field var pbCrlEncoded
    #field int cbCrlEncoded
    #field var pCrlInfo
    #field int hCertStore
#endstruct

#defstruct CRL_ENTRY
    #field int SerialNumber
    #field int cExtension
    #field var rgExtension
#endstruct

#defstruct CRL_INFO
    #field int dwVersion
    #field int SignatureAlgorithm
    #field int Issuer
    #field int cCRLEntry
    #field var rgCRLEntry
    #field int cExtension
    #field var rgExtension
#endstruct

#defstruct CRYPT_ALGORITHM_IDENTIFIER
    #field str pszObjId
    #field int Parameters
#endstruct

#defstruct CRYPT_ATTRIBUTE
    #field str pszObjId
    #field int cValue
    #field var rgValue
#endstruct

#defstruct CRYPT_ATTRIBUTE_TYPE_VALUE
    #field str pszObjId
    #field int Value
#endstruct

#defstruct CRYPT_ATTRIBUTES
    #field int cAttr
    #field var rgAttr
#endstruct

#defstruct CRYPT_BIT_BLOB
    #field int cbData
    #field var pbData
    #field int cUnusedBits
#endstruct

#defstruct CRYPT_CONTEXT_CONFIG
    #field int dwFlags
    #field int dwReserved
#endstruct

#defstruct CRYPT_CONTEXT_FUNCTION_CONFIG
    #field int dwFlags
    #field int dwReserved
#endstruct

#defstruct CRYPT_CONTEXT_FUNCTION_PROVIDERS
    #field int cProviders
    #field var rgpszProviders
#endstruct

#defstruct CRYPT_CONTEXT_FUNCTIONS
    #field int cFunctions
    #field var rgpszFunctions
#endstruct

#defstruct CRYPT_CONTEXTS
    #field int cContexts
    #field var rgpszContexts
#endstruct

#defstruct CRYPT_DECODE_PARA
    #field int cbSize
#endstruct

#defstruct CRYPT_DECRYPT_MESSAGE_PARA
    #field int cbSize
    #field int dwMsgAndCertEncodingType
    #field int cCertStore
    #field var rghCertStore
#endstruct

#defstruct CRYPT_ENCODE_PARA
    #field int cbSize
#endstruct

#defstruct CRYPT_ENCRYPT_MESSAGE_PARA
    #field int cbSize
    #field int dwMsgEncodingType
    #field int hCryptProv
    #field var ContentEncryptionAlgorithm
    #field var pvEncryptionAuxInfo
    #field int dwFlags
    #field int dwInnerContentType
#endstruct

#defstruct CRYPT_HASH_MESSAGE_PARA
    #field int cbSize
    #field int dwMsgEncodingType
    #field int hCryptProv
    #field var HashAlgorithm
    #field var pvHashAuxInfo
#endstruct

#defstruct CRYPT_IMAGE_REF
    #field wstr pszImage
    #field int dwFlags
#endstruct

#defstruct CRYPT_IMAGE_REG
    #field wstr pszImage
    #field int cInterfaces
    #field var rgpInterfaces
#endstruct

#defstruct CRYPT_INTEGER_BLOB
    #field int cbData
    #field var pbData
#endstruct

#defstruct CRYPT_INTERFACE_REG
    #field int dwInterface
    #field int dwFlags
    #field int cFunctions
    #field var rgpszFunctions
#endstruct

#defstruct CRYPT_KEY_PROV_INFO
    #field wstr pwszContainerName
    #field wstr pwszProvName
    #field int dwProvType
    #field int dwFlags
    #field int cProvParam
    #field var rgProvParam
    #field int dwKeySpec
#endstruct

#defstruct CRYPT_KEY_PROV_PARAM
    #field int dwParam
    #field var pbData
    #field int cbData
    #field int dwFlags
#endstruct

#defstruct CRYPT_KEY_SIGN_MESSAGE_PARA
    #field int cbSize
    #field int dwMsgAndCertEncodingType
    #field var Anonymous
    #field int dwKeySpec
    #field var HashAlgorithm
    #field var pvHashAuxInfo
    #field var PubKeyAlgorithm
    #field int hCryptProv
    #field int hNCryptKey
#endstruct

#defstruct CRYPT_KEY_VERIFY_MESSAGE_PARA
    #field int cbSize
    #field int dwMsgEncodingType
    #field int hCryptProv
#endstruct

#defstruct CRYPT_OID_FUNC_ENTRY
    #field str pszOID
    #field var pvFuncAddr
#endstruct

#defstruct CRYPT_OID_INFO
    #field int cbSize
    #field str pszOID
    #field wstr pwszName
    #field int dwGroupId
    #field var Anonymous
    #field var ExtraInfo
    #field int dwValue
    #field int Algid
    #field int dwLength
#endstruct

#defstruct CRYPT_PKCS8_IMPORT_PARAMS
    #field var PrivateKey
    #field var pVoidResolveFunc
    #field var pVoidDecryptFunc
#endstruct

#defstruct CRYPT_PRIVATE_KEY_INFO
    #field int Version
    #field var Algorithm
    #field var PrivateKey
    #field var pAttributes
#endstruct

#defstruct CRYPT_PROPERTY_REF
    #field wstr pszProperty
    #field int cbValue
    #field var pbValue
#endstruct

#defstruct CRYPT_PROVIDER_REF
    #field int dwInterface
    #field wstr pszFunction
    #field wstr pszProvider
    #field int cProperties
    #field var rgpProperties
    #field var pUM
    #field var pKM
#endstruct

#defstruct CRYPT_PROVIDER_REFS
    #field int cProviders
    #field var rgpProviders
#endstruct

#defstruct CRYPT_PROVIDER_REG
    #field int cAliases
    #field var rgpszAliases
    #field var pUM
    #field var pKM
#endstruct

#defstruct CRYPT_PROVIDERS
    #field int cProviders
    #field var rgpszProviders
#endstruct

#defstruct CRYPT_SIGN_MESSAGE_PARA
    #field int cbSize
    #field int dwMsgEncodingType
    #field var pSigningCert
    #field var HashAlgorithm
    #field var pvHashAuxInfo
    #field int cMsgCert
    #field var rgpMsgCert
    #field int cMsgCrl
    #field var rgpMsgCrl
    #field int cAuthAttr
    #field var rgAuthAttr
    #field int cUnauthAttr
    #field var rgUnauthAttr
    #field int dwFlags
    #field int dwInnerContentType
#endstruct

#defstruct CRYPT_TIMESTAMP_ACCURACY
    #field int dwSeconds
    #field int dwMillis
    #field int dwMicros
#endstruct

#defstruct CRYPT_TIMESTAMP_CONTEXT
    #field int cbEncoded
    #field var pbEncoded
    #field var pTimeStamp
#endstruct

#defstruct CRYPT_TIMESTAMP_INFO
    #field int dwVersion
    #field str pszTSAPolicyId
    #field var HashAlgorithm
    #field var HashedMessage
    #field var SerialNumber
    #field var pvAccuracy
    #field int fOrdering
    #field var Nonce
    #field var Tsa
    #field int cExtension
    #field var rgExtension
#endstruct

#defstruct CRYPT_TIMESTAMP_PARA
    #field str pszTSAPolicyId
    #field int fRequestCerts
    #field var Nonce
    #field int cExtension
    #field var rgExtension
#endstruct

#defstruct CRYPT_VERIFY_MESSAGE_PARA
    #field int cbSize
    #field int dwMsgAndCertEncodingType
    #field int hCryptProv
    #field var pvGetArg
#endstruct

#defstruct CRYPTCATMEMBER
    #field int cbStruct
    #field wstr pwszReferenceTag
    #field wstr pwszFileName
    #field int fdwMemberFlags
    #field var pIndirectData
    #field int dwCertVersion
    #field int dwReserved
    #field intptr hReserved
    #field var sEncodedIndirectData
    #field var sEncodedMemberInfo
#endstruct

#defstruct CRYPTCATSTORE
    #field int cbStruct
    #field int dwPublicVersion
    #field wstr pwszP7File
    #field int hProv
    #field int dwEncodingType
    #field int fdwStoreFlags
    #field intptr hReserved
    #field intptr hAttrs
    #field var hCryptMsg
    #field intptr hSorted
#endstruct

#defstruct CRYPTPROTECT_PROMPTSTRUCT
    #field int cbSize
    #field int dwPromptFlags
    #field intptr hwndApp
    #field wstr szPrompt
#endstruct

#defstruct CSADDR_INFO
    #field int LocalAddr
    #field int RemoteAddr
    #field int iSocketType
    #field int iProtocol
#endstruct

#defstruct CSPLATFORM
    #field int dwPlatformId
    #field int dwVersionHi
    #field int dwVersionLo
    #field int dwProcessorArch
#endstruct

#defstruct CTL_CONTEXT
    #field int dwMsgAndCertEncodingType
    #field var pbCtlEncoded
    #field int cbCtlEncoded
    #field var pCtlInfo
    #field int hCertStore
    #field var hCryptMsg
    #field var pbCtlContent
    #field int cbCtlContent
#endstruct

#defstruct CTL_ENTRY
    #field var SubjectIdentifier
    #field int cAttribute
    #field var rgAttribute
#endstruct

#defstruct CTL_INFO
    #field int dwVersion
    #field int SubjectUsage
    #field var ListIdentifier
    #field var SequenceNumber
    #field var SubjectAlgorithm
    #field int cCTLEntry
    #field var rgCTLEntry
    #field int cExtension
    #field var rgExtension
#endstruct

#defstruct CTL_USAGE
    #field int cUsageIdentifier
    #field var rgpszUsageIdentifier
#endstruct

#defstruct CTL_VERIFY_USAGE_PARA
    #field int cbSize
    #field var ListIdentifier
    #field int cCtlStore
    #field var rghCtlStore
    #field int cSignerStore
    #field var rghSignerStore
#endstruct

#defstruct CTL_VERIFY_USAGE_STATUS
    #field int cbSize
    #field int dwError
    #field int dwFlags
    #field var ppCtl
    #field int dwCtlEntryIndex
    #field var ppSigner
    #field int dwSignerIndex
#endstruct

#defstruct CURRENCYFMTW
    #field int NumDigits
    #field int LeadingZero
    #field int Grouping
    #field wstr lpDecimalSep
    #field wstr lpThousandSep
    #field int NegativeOrder
    #field int PositiveOrder
    #field wstr lpCurrencySymbol
#endstruct

#defstruct CURSORINFO
    #field int cbSize
    #field int flags
    #field intptr hCursor
#endstruct

#defstruct CUSTDATA
    #field int cCustData
    #field var prgCustData
#endstruct

#defstruct CUSTDATAITEM
    #field int varValue
#endstruct

#defstruct CY
    #field var Anonymous
    #field int64 int64
    #field int Lo
    #field int Hi
#endstruct

#defstruct CYPHER_BLOCK
    #field int data
#endstruct

#defstruct D2D1_ARC_SEGMENT
    #field int point
    #field int size
    #field float rotationAngle
    #field int sweepDirection
    #field int arcSize
#endstruct

#defstruct D2D1_BEZIER_SEGMENT
    #field int point1
    #field int point2
    #field int point3
#endstruct

#defstruct D2D1_BITMAP_BRUSH_PROPERTIES
    #field int extendModeX
    #field int extendModeY
    #field int interpolationMode
#endstruct

#defstruct D2D1_BITMAP_BRUSH_PROPERTIES1
    #field int extendModeX
    #field int extendModeY
    #field int interpolationMode
#endstruct

#defstruct D2D1_BITMAP_PROPERTIES
    #field int pixelFormat
    #field float dpiX
    #field float dpiY
#endstruct

#defstruct D2D1_BITMAP_PROPERTIES1
    #field int pixelFormat
    #field float dpiX
    #field float dpiY
    #field int bitmapOptions
    #field var colorContext
#endstruct

#defstruct D2D1_BRUSH_PROPERTIES
    #field float opacity
    #field int transform
#endstruct

#defstruct D2D1_COLOR_F
    #field float r
    #field float g
    #field float b
    #field float a
#endstruct

#defstruct D2D1_CREATION_PROPERTIES
    #field int threadingMode
    #field int debugLevel
    #field int options
#endstruct

#defstruct D2D1_DRAWING_STATE_DESCRIPTION
    #field int antialiasMode
    #field int textAntialiasMode
    #field int64 tag1
    #field int64 tag2
    #field int transform
#endstruct

#defstruct D2D1_EFFECT_INPUT_DESCRIPTION
    #field var effect
    #field int inputIndex
    #field int inputRectangle
#endstruct

#defstruct D2D1_ELLIPSE
    #field int point
    #field float radiusX
    #field float radiusY
#endstruct

#defstruct D2D1_FACTORY_OPTIONS
    #field int debugLevel
#endstruct

#defstruct D2D1_GRADIENT_STOP
    #field float position
    #field var color
#endstruct

#defstruct D2D1_HWND_RENDER_TARGET_PROPERTIES
    #field intptr hwnd
    #field int pixelSize
    #field int presentOptions
#endstruct

#defstruct D2D1_IMAGE_BRUSH_PROPERTIES
    #field int sourceRectangle
    #field int extendModeX
    #field int extendModeY
    #field int interpolationMode
#endstruct

#defstruct D2D1_LAYER_PARAMETERS
    #field int contentBounds
    #field var geometricMask
    #field int maskAntialiasMode
    #field int maskTransform
    #field float opacity
    #field var opacityBrush
    #field int layerOptions
#endstruct

#defstruct D2D1_LAYER_PARAMETERS1
    #field int contentBounds
    #field var geometricMask
    #field int maskAntialiasMode
    #field int maskTransform
    #field float opacity
    #field var opacityBrush
    #field int layerOptions
#endstruct

#defstruct D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES
    #field int startPoint
    #field int endPoint
#endstruct

#defstruct D2D1_MAPPED_RECT
    #field int pitch
    #field var bits
#endstruct

#defstruct D2D1_PIXEL_FORMAT
    #field int format
    #field int alphaMode
#endstruct

#defstruct D2D1_PRINT_CONTROL_PROPERTIES
    #field int fontSubset
    #field float rasterDPI
    #field int colorSpace
#endstruct

#defstruct D2D1_QUADRATIC_BEZIER_SEGMENT
    #field int point1
    #field int point2
#endstruct

#defstruct D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES
    #field int center
    #field int gradientOriginOffset
    #field float radiusX
    #field float radiusY
#endstruct

#defstruct D2D1_RENDER_TARGET_PROPERTIES
    #field int type
    #field var pixelFormat
    #field float dpiX
    #field float dpiY
    #field int usage
    #field int minLevel
#endstruct

#defstruct D2D1_RENDERING_CONTROLS
    #field int bufferPrecision
    #field int tileSize
#endstruct

#defstruct D2D1_ROUNDED_RECT
    #field int rect
    #field float radiusX
    #field float radiusY
#endstruct

#defstruct D2D1_STROKE_STYLE_PROPERTIES
    #field int startCap
    #field int endCap
    #field int dashCap
    #field int lineJoin
    #field float miterLimit
    #field int dashStyle
    #field float dashOffset
#endstruct

#defstruct D2D1_TRIANGLE
    #field int point1
    #field int point2
    #field int point3
#endstruct

#defstruct D2D_MATRIX_3X2_F
    #field var Anonymous
    #field var Anonymous1
    #field var Anonymous2
    #field int m
    #field float m11
    #field float m12
    #field float m21
    #field float m22
    #field float dx
    #field float dy
    #field float _11
    #field float _12
    #field float _21
    #field float _22
    #field float _31
    #field float _32
#endstruct

#defstruct D2D_MATRIX_4X4_F
    #field var Anonymous
    #field var Anonymous
    #field int m
    #field float _11
    #field float _12
    #field float _13
    #field float _14
    #field float _21
    #field float _22
    #field float _23
    #field float _24
    #field float _31
    #field float _32
    #field float _33
    #field float _34
    #field float _41
    #field float _42
    #field float _43
    #field float _44
#endstruct

#defstruct D2D_POINT_2F
    #field float x
    #field float y
#endstruct

#defstruct D2D_POINT_2U
    #field int x
    #field int y
#endstruct

#defstruct D2D_RECT_F
    #field float left
    #field float top
    #field float right
    #field float bottom
#endstruct

#defstruct D2D_RECT_U
    #field int left
    #field int top
    #field int right
    #field int bottom
#endstruct

#defstruct D2D_SIZE_F
    #field float width
    #field float height
#endstruct

#defstruct D2D_SIZE_U
    #field int width
    #field int height
#endstruct

#defstruct D3D11_BLEND_DESC
    #field int AlphaToCoverageEnable
    #field int IndependentBlendEnable
    #field int RenderTarget
#endstruct

#defstruct D3D11_BOX
    #field int left
    #field int top
    #field int front
    #field int right
    #field int bottom
    #field int back
#endstruct

#defstruct D3D11_BUFFER_DESC
    #field int ByteWidth
    #field int Usage
    #field int StructureByteStride
#endstruct

#defstruct D3D11_BUFFER_RTV
    #field var Anonymous1
    #field var Anonymous2
    #field int FirstElement
    #field int ElementOffset
    #field int NumElements
    #field int ElementWidth
#endstruct

#defstruct D3D11_BUFFER_SRV
    #field var Anonymous1
    #field var Anonymous2
    #field int FirstElement
    #field int ElementOffset
    #field int NumElements
    #field int ElementWidth
#endstruct

#defstruct D3D11_BUFFER_UAV
    #field int FirstElement
    #field int NumElements
    #field int Flags
#endstruct

#defstruct D3D11_BUFFEREX_SRV
    #field int FirstElement
    #field int NumElements
    #field int Flags
#endstruct

#defstruct D3D11_CLASS_INSTANCE_DESC
    #field int InstanceId
    #field int InstanceIndex
    #field int TypeId
    #field int ConstantBuffer
    #field int BaseConstantBufferOffset
    #field int BaseTexture
    #field int BaseSampler
    #field int Created
#endstruct

#defstruct D3D11_COUNTER_DESC
    #field int Counter
    #field int MiscFlags
#endstruct

#defstruct D3D11_COUNTER_INFO
    #field int LastDeviceDependentCounter
    #field int NumSimultaneousCounters
    #field int NumDetectableParallelUnits
#endstruct

#defstruct D3D11_DEPTH_STENCIL_DESC
    #field int DepthEnable
    #field int DepthWriteMask
    #field int DepthFunc
    #field int StencilEnable
    #field int StencilReadMask
    #field int StencilWriteMask
    #field int FrontFace
    #field int BackFace
#endstruct

#defstruct D3D11_DEPTH_STENCIL_VIEW_DESC
    #field int Format
    #field int ViewDimension
    #field int Flags
    #field var Anonymous
    #field int Texture1D
    #field int Texture1DArray
    #field int Texture2D
    #field int Texture2DArray
    #field int Texture2DMS
    #field int Texture2DMSArray
#endstruct

#defstruct D3D11_DEPTH_STENCILOP_DESC
    #field int StencilFailOp
    #field int StencilDepthFailOp
    #field int StencilPassOp
    #field int StencilFunc
#endstruct

#defstruct D3D11_INPUT_ELEMENT_DESC
    #field str SemanticName
    #field int SemanticIndex
    #field int Format
    #field int InputSlot
    #field int AlignedByteOffset
    #field int InputSlotClass
    #field int InstanceDataStepRate
#endstruct

#defstruct D3D11_MAPPED_SUBRESOURCE
    #field var pData
    #field int RowPitch
    #field int DepthPitch
#endstruct

#defstruct D3D11_QUERY_DESC
    #field int Query
    #field int MiscFlags
#endstruct

#defstruct D3D11_RASTERIZER_DESC
    #field int FillMode
    #field int CullMode
    #field int FrontCounterClockwise
    #field int DepthBias
    #field float DepthBiasClamp
    #field float SlopeScaledDepthBias
    #field int DepthClipEnable
    #field int ScissorEnable
    #field int MultisampleEnable
    #field int AntialiasedLineEnable
#endstruct

#defstruct D3D11_RENDER_TARGET_BLEND_DESC
    #field int BlendEnable
    #field int SrcBlend
    #field int DestBlend
    #field int BlendOp
    #field int SrcBlendAlpha
    #field int DestBlendAlpha
    #field int BlendOpAlpha
    #field int RenderTargetWriteMask
#endstruct

#defstruct D3D11_RENDER_TARGET_VIEW_DESC
    #field int Format
    #field int ViewDimension
    #field var Anonymous
    #field var Buffer
    #field int Texture1D
    #field int Texture1DArray
    #field int Texture2D
    #field int Texture2DArray
    #field int Texture2DMS
    #field int Texture2DMSArray
    #field int Texture3D
#endstruct

#defstruct D3D11_SAMPLER_DESC
    #field int Filter
    #field int AddressU
    #field int AddressV
    #field int AddressW
    #field float MipLODBias
    #field int MaxAnisotropy
    #field int ComparisonFunc
    #field int BorderColor
    #field float MinLOD
    #field float MaxLOD
#endstruct

#defstruct D3D11_SHADER_RESOURCE_VIEW_DESC
    #field int Format
    #field int ViewDimension
    #field var Anonymous
    #field var Buffer
    #field int Texture1D
    #field int Texture1DArray
    #field int Texture2D
    #field int Texture2DArray
    #field int Texture2DMS
    #field int Texture2DMSArray
    #field int Texture3D
    #field int TextureCube
    #field int TextureCubeArray
    #field var BufferEx
#endstruct

#defstruct D3D11_SO_DECLARATION_ENTRY
    #field int Stream
    #field str SemanticName
    #field int SemanticIndex
    #field int StartComponent
    #field int ComponentCount
    #field int OutputSlot
#endstruct

#defstruct D3D11_SUBRESOURCE_DATA
    #field var pSysMem
    #field int SysMemPitch
    #field int SysMemSlicePitch
#endstruct

#defstruct D3D11_TEX1D_ARRAY_DSV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX1D_ARRAY_RTV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX1D_ARRAY_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX1D_ARRAY_UAV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX1D_DSV
    #field int MipSlice
#endstruct

#defstruct D3D11_TEX1D_RTV
    #field int MipSlice
#endstruct

#defstruct D3D11_TEX1D_SRV
    #field int MostDetailedMip
    #field int MipLevels
#endstruct

#defstruct D3D11_TEX1D_UAV
    #field int MipSlice
#endstruct

#defstruct D3D11_TEX2D_ARRAY_DSV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX2D_ARRAY_RTV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX2D_ARRAY_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX2D_ARRAY_UAV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX2D_DSV
    #field int MipSlice
#endstruct

#defstruct D3D11_TEX2D_RTV
    #field int MipSlice
#endstruct

#defstruct D3D11_TEX2D_SRV
    #field int MostDetailedMip
    #field int MipLevels
#endstruct

#defstruct D3D11_TEX2D_UAV
    #field int MipSlice
#endstruct

#defstruct D3D11_TEX2DMS_ARRAY_DSV
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX2DMS_ARRAY_RTV
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX2DMS_ARRAY_SRV
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D11_TEX2DMS_DSV
    #field int UnusedField_NothingToDefine
#endstruct

#defstruct D3D11_TEX2DMS_RTV
    #field int UnusedField_NothingToDefine
#endstruct

#defstruct D3D11_TEX2DMS_SRV
    #field int UnusedField_NothingToDefine
#endstruct

#defstruct D3D11_TEX3D_RTV
    #field int MipSlice
    #field int FirstWSlice
    #field int WSize
#endstruct

#defstruct D3D11_TEX3D_SRV
    #field int MostDetailedMip
    #field int MipLevels
#endstruct

#defstruct D3D11_TEX3D_UAV
    #field int MipSlice
    #field int FirstWSlice
    #field int WSize
#endstruct

#defstruct D3D11_TEXCUBE_ARRAY_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field int First2DArrayFace
    #field int NumCubes
#endstruct

#defstruct D3D11_TEXCUBE_SRV
    #field int MostDetailedMip
    #field int MipLevels
#endstruct

#defstruct D3D11_TEXTURE1D_DESC
    #field int Width
    #field int MipLevels
    #field int ArraySize
    #field int Format
    #field int Usage
#endstruct

#defstruct D3D11_TEXTURE2D_DESC
    #field int Width
    #field int Height
    #field int MipLevels
    #field int ArraySize
    #field int Format
    #field int SampleDesc
    #field int Usage
#endstruct

#defstruct D3D11_TEXTURE3D_DESC
    #field int Width
    #field int Height
    #field int Depth
    #field int MipLevels
    #field int Format
    #field int Usage
#endstruct

#defstruct D3D11_UNORDERED_ACCESS_VIEW_DESC
    #field int Format
    #field int ViewDimension
    #field var Anonymous
    #field var Buffer
    #field var Texture1D
    #field var Texture1DArray
    #field var Texture2D
    #field var Texture2DArray
    #field var Texture3D
#endstruct

#defstruct D3D11_VIEWPORT
    #field float TopLeftX
    #field float TopLeftY
    #field float Width
    #field float Height
    #field float MinDepth
    #field float MaxDepth
#endstruct

#defstruct DATETIME
    #field int year
    #field int month
    #field int day
    #field int hour
    #field int min
    #field int sec
#endstruct

#defstruct DBGHELP_DATA_REPORT_STRUCT
    #field wstr pBinPathNonExist
    #field wstr pSymbolPathNonExist
#endstruct

#defstruct DCB
    #field int DCBlength
    #field int BaudRate
    #field int _bitfield
    #field int wReserved
    #field int XonLim
    #field int XoffLim
    #field int ByteSize
    #field int Parity
    #field int StopBits
    #field int XonChar
    #field int XoffChar
    #field int ErrorChar
    #field int EofChar
    #field int EvtChar
    #field int wReserved1
#endstruct

#defstruct DDBLTBATCH
    #field var lprDest
    #field var lpDDSSrc
    #field var lprSrc
    #field int dwFlags
    #field var lpDDBltFx
#endstruct

#defstruct DDBLTFX
    #field int dwSize
    #field int dwDDFX
    #field int dwROP
    #field int dwDDROP
    #field int dwRotationAngle
    #field int dwZBufferOpCode
    #field int dwZBufferLow
    #field int dwZBufferHigh
    #field int dwZBufferBaseDest
    #field int dwZDestConstBitDepth
    #field var Anonymous1
    #field int dwZSrcConstBitDepth
    #field var Anonymous2
    #field int dwAlphaEdgeBlendBitDepth
    #field int dwAlphaEdgeBlend
    #field int dwReserved
    #field int dwAlphaDestConstBitDepth
    #field int Anonymous3
    #field int dwAlphaSrcConstBitDepth
    #field int Anonymous4
    #field int Anonymous5
    #field int ddckDestColorkey
    #field int ddckSrcColorkey
    #field int dwZDestConst
    #field var lpDDSZBufferDest
    #field int dwZSrcConst
    #field var lpDDSZBufferSrc
    #field int dwAlphaDestConst
    #field var lpDDSAlphaDest
    #field int dwAlphaSrcConst
    #field var lpDDSAlphaSrc
    #field int dwFillColor
    #field int dwFillDepth
    #field int dwFillPixel
    #field var lpDDSPattern
#endstruct

#defstruct _Anonymous3_e__Union
    #field intptr hbmHeader
    #field wstr pszbmHeader
#endstruct

#defstruct _Anonymous4_e__Union
    #field intptr hbmWatermark
    #field wstr pszbmWatermark
#endstruct

#defstruct _Anonymous5_e__Union
    #field intptr hbmHeader
    #field wstr pszbmHeader
#endstruct

#defstruct DDCAPS_DX7
    #field int dwSize
    #field int dwCaps
    #field int dwCaps2
    #field int dwCKeyCaps
    #field int dwFXCaps
    #field int dwFXAlphaCaps
    #field int dwPalCaps
    #field int dwSVCaps
    #field int dwAlphaBltConstBitDepths
    #field int dwAlphaBltPixelBitDepths
    #field int dwAlphaBltSurfaceBitDepths
    #field int dwAlphaOverlayConstBitDepths
    #field int dwAlphaOverlayPixelBitDepths
    #field int dwAlphaOverlaySurfaceBitDepths
    #field int dwZBufferBitDepths
    #field int dwVidMemTotal
    #field int dwVidMemFree
    #field int dwMaxVisibleOverlays
    #field int dwCurrVisibleOverlays
    #field int dwNumFourCCCodes
    #field int dwAlignBoundarySrc
    #field int dwAlignSizeSrc
    #field int dwAlignBoundaryDest
    #field int dwAlignSizeDest
    #field int dwAlignStrideAlign
    #field int dwRops
    #field int ddsOldCaps
    #field int dwMinOverlayStretch
    #field int dwMaxOverlayStretch
    #field int dwMinLiveVideoStretch
    #field int dwMaxLiveVideoStretch
    #field int dwMinHwCodecStretch
    #field int dwMaxHwCodecStretch
    #field int dwReserved1
    #field int dwReserved2
    #field int dwReserved3
    #field int dwSVBCaps
    #field int dwSVBCKeyCaps
    #field int dwSVBFXCaps
    #field int dwSVBRops
    #field int dwVSBCaps
    #field int dwVSBCKeyCaps
    #field int dwVSBFXCaps
    #field int dwVSBRops
    #field int dwSSBCaps
    #field int dwSSBCKeyCaps
    #field int dwSSBFXCaps
    #field int dwSSBRops
    #field int dwMaxVideoPorts
    #field int dwCurrVideoPorts
    #field int dwSVBCaps2
    #field int dwNLVBCaps
    #field int dwNLVBCaps2
    #field int dwNLVBCKeyCaps
    #field int dwNLVBFXCaps
    #field int dwNLVBRops
    #field int ddsCaps
#endstruct

#defstruct DDCOLORKEY
    #field int dwColorSpaceLowValue
    #field int dwColorSpaceHighValue
#endstruct

#defstruct DDOVERLAYFX
    #field int dwSize
    #field int dwAlphaEdgeBlendBitDepth
    #field int dwAlphaEdgeBlend
    #field int dwReserved
    #field int dwAlphaDestConstBitDepth
    #field var Anonymous1
    #field int dwAlphaSrcConstBitDepth
    #field var Anonymous2
    #field var dckDestColorkey
    #field var dckSrcColorkey
    #field int dwDDFX
    #field int dwFlags
    #field int dwAlphaDestConst
    #field var lpDDSAlphaDest
    #field int dwAlphaSrcConst
    #field var lpDDSAlphaSrc
#endstruct

#defstruct DDPIXELFORMAT
    #field int dwSize
    #field int dwFlags
    #field int dwFourCC
    #field var Anonymous1
    #field var Anonymous2
    #field var Anonymous3
    #field var Anonymous4
    #field var Anonymous5
    #field int dwRGBBitCount
    #field int dwYUVBitCount
    #field int dwZBufferBitDepth
    #field int dwAlphaBitDepth
    #field int dwLuminanceBitCount
    #field int dwBumpBitCount
    #field int dwPrivateFormatBitCount
    #field int dwRBitMask
    #field int dwYBitMask
    #field int dwStencilBitDepth
    #field int dwLuminanceBitMask
    #field int dwBumpDuBitMask
    #field int dwOperations
    #field int dwGBitMask
    #field int dwUBitMask
    #field int dwZBitMask
    #field int dwBumpDvBitMask
    #field int MultiSampleCaps
    #field int wFlipMSTypes
    #field int wBltMSTypes
    #field int dwBBitMask
    #field int dwVBitMask
    #field int dwStencilBitMask
    #field int dwBumpLuminanceBitMask
    #field int dwRGBAlphaBitMask
    #field int dwYUVAlphaBitMask
    #field int dwLuminanceAlphaBitMask
    #field int dwRGBZBitMask
    #field int dwYUVZBitMask
#endstruct

#defstruct _MultiSampleCaps_e__Struct
    #field int wFlipMSTypes
    #field int wBltMSTypes
#endstruct

#defstruct DDSCAPS
    #field int dwCaps
#endstruct

#defstruct DDSCAPS2
    #field int dwCaps
    #field int dwCaps2
    #field int dwCaps3
    #field var Anonymous
    #field int dwCaps4
    #field int dwVolumeDepth
#endstruct

#defstruct DDSURFACEDESC
    #field int dwSize
    #field int dwFlags
    #field int dwHeight
    #field int dwWidth
    #field var Anonymous1
    #field int dwBackBufferCount
    #field var Anonymous2
    #field int dwAlphaBitDepth
    #field int dwReserved
    #field var lpSurface
    #field var ddckCKDestOverlay
    #field var ddckCKDestBlt
    #field var ddckCKSrcOverlay
    #field var ddckCKSrcBlt
    #field var ddpfPixelFormat
    #field var ddsCaps
    #field int lPitch
    #field int dwLinearSize
    #field int dwMipMapCount
    #field int dwZBufferBitDepth
    #field int dwRefreshRate
#endstruct

#defstruct DDSURFACEDESC2
    #field int dwSize
    #field int dwFlags
    #field int dwHeight
    #field int dwWidth
    #field var Anonymous1
    #field var Anonymous2
    #field var Anonymous3
    #field int dwAlphaBitDepth
    #field int dwReserved
    #field var lpSurface
    #field var Anonymous4
    #field var ddckCKDestBlt
    #field var ddckCKSrcOverlay
    #field var ddckCKSrcBlt
    #field var Anonymous5
    #field var ddsCaps
    #field int dwTextureStage
    #field int lPitch
    #field int dwLinearSize
    #field int dwBackBufferCount
    #field int dwDepth
    #field int dwMipMapCount
    #field int dwRefreshRate
    #field int dwSrcVBHandle
    #field var ddckCKDestOverlay
    #field int dwEmptyFaceColor
    #field var ddpfPixelFormat
    #field int dwFVF
#endstruct

#defstruct DEBUG_EVENT
    #field int dwDebugEventCode
    #field int dwProcessId
    #field int dwThreadId
    #field int u
    #field int Exception
    #field var CreateThread
    #field var CreateProcessInfo
    #field int ExitThread
    #field int ExitProcess
    #field int LoadDll
    #field int UnloadDll
    #field int DebugString
    #field int RipInfo
#endstruct

#defstruct _u_e__Union
    #field int Flags
    #field int s
    #field int _bitfield
#endstruct

#defstruct DECIMAL
    #field int wReserved
    #field var Anonymous1
    #field int Hi32
    #field var Anonymous2
    #field var Anonymous
    #field int signscale
    #field int scale
    #field int sign
    #field var Anonymous
    #field int64 Lo64
    #field int Lo32
    #field int Mid32
#endstruct

#defstruct DEFCONTEXTMENU
    #field intptr hwnd
    #field var pcmcb
    #field var pidlFolder
    #field var psf
    #field int cidl
    #field var apidl
    #field var punkAssociationInfo
    #field int cKeys
    #field var aKeys
#endstruct

#defstruct DESIGNVECTOR
    #field int dvReserved
    #field int dvNumAxes
    #field int dvValues
#endstruct

#defstruct DEVMODEA
    #field int dmDeviceName
    #field int dmSpecVersion
    #field int dmDriverVersion
    #field int dmSize
    #field int dmDriverExtra
    #field int dmFields
    #field var Anonymous1
    #field int dmColor
    #field int dmDuplex
    #field int dmYResolution
    #field int dmTTOption
    #field int dmCollate
    #field int dmFormName
    #field int dmLogPixels
    #field int dmBitsPerPel
    #field int dmPelsWidth
    #field int dmPelsHeight
    #field var Anonymous2
    #field int dmDisplayFrequency
    #field int dmICMMethod
    #field int dmICMIntent
    #field int dmMediaType
    #field int dmDitherType
    #field int dmReserved1
    #field int dmReserved2
    #field int dmPanningWidth
    #field int dmPanningHeight
    #field var Anonymous1
    #field var Anonymous2
    #field int dmOrientation
    #field int dmPaperSize
    #field int dmPaperLength
    #field int dmPaperWidth
    #field int dmScale
    #field int dmCopies
    #field int dmDefaultSource
    #field int dmPrintQuality
    #field int dmPosition
    #field int dmDisplayOrientation
    #field int dmDisplayFixedOutput
    #field int dmDisplayFlags
    #field int dmNup
#endstruct

#defstruct DEVMODEW
    #field int dmDeviceName
    #field int dmSpecVersion
    #field int dmDriverVersion
    #field int dmSize
    #field int dmDriverExtra
    #field int dmFields
    #field var Anonymous1
    #field int dmColor
    #field int dmDuplex
    #field int dmYResolution
    #field int dmTTOption
    #field int dmCollate
    #field int dmFormName
    #field int dmLogPixels
    #field int dmBitsPerPel
    #field int dmPelsWidth
    #field int dmPelsHeight
    #field var Anonymous2
    #field int dmDisplayFrequency
    #field int dmICMMethod
    #field int dmICMIntent
    #field int dmMediaType
    #field int dmDitherType
    #field int dmReserved1
    #field int dmReserved2
    #field int dmPanningWidth
    #field int dmPanningHeight
    #field var Anonymous1
    #field var Anonymous2
    #field int dmOrientation
    #field int dmPaperSize
    #field int dmPaperLength
    #field int dmPaperWidth
    #field int dmScale
    #field int dmCopies
    #field int dmDefaultSource
    #field int dmPrintQuality
    #field int dmPosition
    #field int dmDisplayOrientation
    #field int dmDisplayFixedOutput
    #field int dmDisplayFlags
    #field int dmNup
#endstruct

#defstruct DISPLAY_DEVICEW
    #field int cb
    #field int DeviceName
    #field int DeviceString
    #field int StateFlags
    #field int DeviceID
    #field int DeviceKey
#endstruct

#defstruct DISPLAYCONFIG_2DREGION
    #field int cx
    #field int cy
#endstruct

#defstruct DISPLAYCONFIG_DESKTOP_IMAGE_INFO
    #field int PathSourceSize
    #field int DesktopImageRegion
    #field int DesktopImageClip
#endstruct

#defstruct DISPLAYCONFIG_DEVICE_INFO_HEADER
    #field int type
    #field int size
    #field int adapterId
    #field int id
#endstruct

#defstruct DISPLAYCONFIG_MODE_INFO
    #field int infoType
    #field int id
    #field int adapterId
    #field var Anonymous
    #field int targetMode
    #field int sourceMode
    #field var desktopImageInfo
#endstruct

#defstruct DISPLAYCONFIG_PATH_INFO
    #field int sourceInfo
    #field int targetInfo
    #field int flags
#endstruct

#defstruct DISPLAYCONFIG_PATH_SOURCE_INFO
    #field int adapterId
    #field int id
    #field var Anonymous
    #field int statusFlags
    #field int modeInfoIdx
    #field var Anonymous
    #field int _bitfield
#endstruct

#defstruct DISPLAYCONFIG_PATH_TARGET_INFO
    #field int adapterId
    #field int id
    #field var Anonymous
    #field int outputTechnology
    #field int rotation
    #field int scaling
    #field int refreshRate
    #field int scanLineOrdering
    #field int targetAvailable
    #field int statusFlags
    #field int modeInfoIdx
    #field var Anonymous
    #field int _bitfield
#endstruct

#defstruct DISPLAYCONFIG_RATIONAL
    #field int Numerator
    #field int Denominator
#endstruct

#defstruct DISPLAYCONFIG_SOURCE_MODE
    #field int width
    #field int height
    #field int pixelFormat
    #field int position
#endstruct

#defstruct DISPLAYCONFIG_TARGET_MODE
    #field int targetVideoSignalInfo
#endstruct

#defstruct DISPLAYCONFIG_VIDEO_SIGNAL_INFO
    #field int64 pixelRate
    #field var hSyncFreq
    #field var vSyncFreq
    #field var activeSize
    #field var totalSize
    #field var Anonymous
    #field int scanLineOrdering
    #field int AdditionalSignalInfo
    #field int videoStandard
    #field int _bitfield
#endstruct

#defstruct _AdditionalSignalInfo_e__Struct
    #field int _bitfield
#endstruct

#defstruct DISPPARAMS
    #field var rgvarg
    #field var rgdispidNamedArgs
    #field int cArgs
    #field int cNamedArgs
#endstruct

#defstruct DLGTEMPLATE
    #field int style
    #field int dwExtendedStyle
    #field int cdit
    #field int x
    #field int y
    #field int cx
    #field int cy
#endstruct

#defstruct DNS_INTERFACE_SETTINGS
    #field int Version
    #field int64 Flags
    #field wstr Domain
    #field wstr NameServer
    #field wstr SearchList
    #field int RegistrationEnabled
    #field int RegisterAdapterName
    #field int EnableLLMNR
    #field int QueryAdapterName
    #field wstr ProfileNameServer
#endstruct

#defstruct DNS_SETTINGS
    #field int Version
    #field int64 Flags
    #field wstr Hostname
    #field wstr Domain
    #field wstr SearchList
#endstruct

#defstruct DOCINFOW
    #field int cbSize
    #field wstr lpszDocName
    #field wstr lpszOutput
    #field wstr lpszDatatype
    #field int fwType
#endstruct

#defstruct DOT11_ACCESSNETWORKOPTIONS
    #field int AccessNetworkType
    #field int Internet
    #field int ASRA
    #field int ESR
    #field int UESA
#endstruct

#defstruct DOT11_BSSID_LIST
    #field int Header
    #field int uNumOfEntries
    #field int uTotalNumOfEntries
#endstruct

#defstruct DOT11_NETWORK
    #field int dot11Ssid
    #field int dot11BssType
#endstruct

#defstruct DOT11_NETWORK_LIST
    #field int dwNumberOfItems
    #field int dwIndex
#endstruct

#defstruct DOT11_SSID
    #field int uSSIDLength
    #field int ucSSID
#endstruct

#defstruct DOT11_VENUEINFO
    #field int VenueGroup
    #field int VenueType
#endstruct

#defstruct DPASTREAMINFO
    #field int iPos
    #field var pvItem
#endstruct

#defstruct DRAWTEXTPARAMS
    #field int cbSize
    #field int iTabLength
    #field int iLeftMargin
    #field int iRightMargin
    #field int uiLengthDrawn
#endstruct

#defstruct DTBGOPTS
    #field int dwSize
    #field int dwFlags
    #field int rcClip
#endstruct

#defstruct DTTOPTS
    #field int dwSize
    #field int dwFlags
    #field int crText
    #field int crBorder
    #field int crShadow
    #field int iTextShadowType
    #field int iBorderSize
    #field int iFontPropId
    #field int iColorPropId
    #field int iStateId
    #field int fApplyOverlay
    #field int iGlowSize
    #field intptr lParam
#endstruct

#defstruct DVTARGETDEVICE
    #field int tdSize
    #field int tdDriverNameOffset
    #field int tdDeviceNameOffset
    #field int tdPortNameOffset
    #field int tdExtDevmodeOffset
#endstruct

#defstruct DWM_BLURBEHIND
    #field int dwFlags
    #field int fEnable
    #field intptr hRgnBlur
    #field int fTransitionOnMaximized
#endstruct

#defstruct DWM_PRESENT_PARAMETERS
    #field int cbSize
    #field int fQueue
    #field int64 cRefreshStart
    #field int cBuffer
    #field int fUseSourceRate
    #field int rateSource
    #field int cRefreshesPerFrame
    #field int eSampling
#endstruct

#defstruct DWM_THUMBNAIL_PROPERTIES
    #field int dwFlags
    #field int rcDestination
    #field int rcSource
    #field int opacity
    #field int fVisible
    #field int fSourceClientAreaOnly
#endstruct

#defstruct DWM_TIMING_INFO
    #field int cbSize
    #field int rateRefresh
    #field int64 qpcRefreshPeriod
    #field int rateCompose
    #field int64 qpcVBlank
    #field int64 cRefresh
    #field int cDXRefresh
    #field int64 qpcCompose
    #field int64 cFrame
    #field int cDXPresent
    #field int64 cRefreshFrame
    #field int64 cFrameSubmitted
    #field int cDXPresentSubmitted
    #field int64 cFrameConfirmed
    #field int cDXPresentConfirmed
    #field int64 cRefreshConfirmed
    #field int cDXRefreshConfirmed
    #field int64 cFramesLate
    #field int cFramesOutstanding
    #field int64 cFrameDisplayed
    #field int64 qpcFrameDisplayed
    #field int64 cRefreshFrameDisplayed
    #field int64 cFrameComplete
    #field int64 qpcFrameComplete
    #field int64 cFramePending
    #field int64 qpcFramePending
    #field int64 cFramesDisplayed
    #field int64 cFramesComplete
    #field int64 cFramesPending
    #field int64 cFramesAvailable
    #field int64 cFramesDropped
    #field int64 cFramesMissed
    #field int64 cRefreshNextDisplayed
    #field int64 cRefreshNextPresented
    #field int64 cRefreshesDisplayed
    #field int64 cRefreshesPresented
    #field int64 cRefreshStarted
    #field int64 cPixelsReceived
    #field int64 cPixelsDrawn
    #field int64 cBuffersEmpty
#endstruct

#defstruct DWRITE_CLUSTER_METRICS
    #field float width
    #field int length
    #field int _bitfield
#endstruct

#defstruct DWRITE_FONT_FEATURE
    #field int nameTag
    #field int parameter
#endstruct

#defstruct DWRITE_FONT_METRICS
    #field int designUnitsPerEm
    #field int ascent
    #field int descent
    #field int lineGap
    #field int capHeight
    #field int xHeight
    #field int underlinePosition
    #field int underlineThickness
    #field int strikethroughPosition
    #field int strikethroughThickness
#endstruct

#defstruct DWRITE_GLYPH_METRICS
    #field int leftSideBearing
    #field int advanceWidth
    #field int rightSideBearing
    #field int topSideBearing
    #field int advanceHeight
    #field int bottomSideBearing
    #field int verticalOriginY
#endstruct

#defstruct DWRITE_GLYPH_OFFSET
    #field float advanceOffset
    #field float ascenderOffset
#endstruct

#defstruct DWRITE_GLYPH_RUN
    #field var fontFace
    #field float fontEmSize
    #field int glyphCount
    #field var glyphIndices
    #field var glyphAdvances
    #field var glyphOffsets
    #field int isSideways
    #field int bidiLevel
#endstruct

#defstruct DWRITE_GLYPH_RUN_DESCRIPTION
    #field wstr localeName
    #field int stringLength
    #field var clusterMap
    #field int textPosition
#endstruct

#defstruct DWRITE_HIT_TEST_METRICS
    #field int textPosition
    #field int length
    #field float left
    #field float top
    #field float width
    #field float height
    #field int bidiLevel
    #field int isText
    #field int isTrimmed
#endstruct

#defstruct DWRITE_INLINE_OBJECT_METRICS
    #field float width
    #field float height
    #field float baseline
    #field int supportsSideways
#endstruct

#defstruct DWRITE_LINE_METRICS
    #field int length
    #field int trailingWhitespaceLength
    #field int newlineLength
    #field float height
    #field float baseline
    #field int isTrimmed
#endstruct

#defstruct DWRITE_MATRIX
    #field float m11
    #field float m12
    #field float m21
    #field float m22
    #field float dx
    #field float dy
#endstruct

#defstruct DWRITE_OVERHANG_METRICS
    #field float left
    #field float top
    #field float right
    #field float bottom
#endstruct

#defstruct DWRITE_STRIKETHROUGH
    #field float width
    #field float thickness
    #field float offset
    #field int readingDirection
    #field int flowDirection
    #field wstr localeName
    #field int measuringMode
#endstruct

#defstruct DWRITE_TEXT_METRICS
    #field float left
    #field float top
    #field float width
    #field float widthIncludingTrailingWhitespace
    #field float height
    #field float layoutWidth
    #field float layoutHeight
    #field int maxBidiReorderingDepth
    #field int lineCount
#endstruct

#defstruct DWRITE_TEXT_RANGE
    #field int startPosition
    #field int length
#endstruct

#defstruct DWRITE_TRIMMING
    #field int granularity
    #field int delimiter
    #field int delimiterCount
#endstruct

#defstruct DWRITE_UNDERLINE
    #field float width
    #field float thickness
    #field float offset
    #field float runHeight
    #field int readingDirection
    #field int flowDirection
    #field wstr localeName
    #field int measuringMode
#endstruct

#defstruct DXGI_ADAPTER_DESC
    #field int Description
    #field int VendorId
    #field int DeviceId
    #field int SubSysId
    #field int Revision
    #field int DedicatedVideoMemory
    #field int DedicatedSystemMemory
    #field int SharedSystemMemory
    #field int AdapterLuid
#endstruct

#defstruct DXGI_FRAME_STATISTICS
    #field int PresentCount
    #field int PresentRefreshCount
    #field int SyncRefreshCount
    #field int64 SyncQPCTime
    #field int64 SyncGPUTime
#endstruct

#defstruct DXGI_GAMMA_CONTROL
    #field int Scale
    #field int Offset
    #field int GammaCurve
#endstruct

#defstruct DXGI_GAMMA_CONTROL_CAPABILITIES
    #field int ScaleAndOffsetSupported
    #field float MaxConvertedValue
    #field float MinConvertedValue
    #field int NumGammaControlPoints
    #field int ControlPointPositions
#endstruct

#defstruct DXGI_MAPPED_RECT
    #field int Pitch
    #field var pBits
#endstruct

#defstruct DXGI_MODE_DESC
    #field int Width
    #field int Height
    #field int RefreshRate
    #field int Format
    #field int ScanlineOrdering
    #field int Scaling
#endstruct

#defstruct DXGI_OUTPUT_DESC
    #field int DeviceName
    #field int DesktopCoordinates
    #field int AttachedToDesktop
    #field int Rotation
    #field intptr Monitor
#endstruct

#defstruct DXGI_RATIONAL
    #field int Numerator
    #field int Denominator
#endstruct

#defstruct DXGI_RGB
    #field float Red
    #field float Green
    #field float Blue
#endstruct

#defstruct DXGI_SAMPLE_DESC
    #field int Count
    #field int Quality
#endstruct

#defstruct DXGI_SHARED_RESOURCE
    #field intptr Handle
#endstruct

#defstruct DXGI_SURFACE_DESC
    #field int Width
    #field int Height
    #field int Format
    #field var SampleDesc
#endstruct

#defstruct DXGI_SWAP_CHAIN_DESC
    #field var BufferDesc
    #field var SampleDesc
    #field int BufferUsage
    #field int BufferCount
    #field intptr OutputWindow
    #field int Windowed
    #field int SwapEffect
#endstruct

#defstruct DYNAMIC_TIME_ZONE_INFORMATION
    #field int Bias
    #field int StandardName
    #field int StandardDate
    #field int StandardBias
    #field int DaylightName
    #field int DaylightDate
    #field int DaylightBias
    #field int TimeZoneKeyName
    #field int DynamicDaylightTimeDisabled
#endstruct

#defstruct EAP_METHOD_TYPE
    #field int eapType
    #field int dwAuthorId
#endstruct

#defstruct EAP_TYPE
    #field int type
    #field int dwVendorId
    #field int dwVendorType
#endstruct

#defstruct EFS_CERTIFICATE_BLOB
    #field int dwCertEncodingType
    #field int cbData
    #field var pbData
#endstruct

#defstruct EFS_HASH_BLOB
    #field int cbData
    #field var pbData
#endstruct

#defstruct ELEMDESC
    #field int tdesc
    #field var Anonymous
    #field int idldesc
    #field int paramdesc
#endstruct

#defstruct EMFINFO
    #field int nSize
    #field intptr hdc
    #field var pvEMF
    #field var pvCurrentRecord
#endstruct

#defstruct ENABLE_TRACE_PARAMETERS
    #field int Version
    #field int EnableProperty
    #field int ControlFlags
    #field var EnableFilterDesc
    #field int FilterDescCount
#endstruct

#defstruct EncoderParameter
    #field int NumberOfValues
    #field int Type
    #field var Value
#endstruct

#defstruct EncoderParameters
    #field int Count
#endstruct

#defstruct ENCRYPTED_LM_OWF_PASSWORD
    #field int data
#endstruct

#defstruct ENCRYPTION_CERTIFICATE
    #field int cbTotalLength
    #field var pUserSid
    #field var pCertBlob
#endstruct

#defstruct ENCRYPTION_CERTIFICATE_HASH
    #field int cbTotalLength
    #field var pUserSid
    #field var pHash
    #field wstr lpDisplayInformation
#endstruct

#defstruct ENCRYPTION_CERTIFICATE_HASH_LIST
    #field int nCert_Hash
    #field var pUsers
#endstruct

#defstruct ENCRYPTION_CERTIFICATE_LIST
    #field int nUsers
    #field var pUsers
#endstruct

#defstruct ENG_TIME_FIELDS
    #field int usYear
    #field int usMonth
    #field int usDay
    #field int usHour
    #field int usMinute
    #field int usSecond
    #field int usMilliseconds
    #field int usWeekday
#endstruct

#defstruct ENHMETAHEADER
    #field int iType
    #field int nSize
    #field int rclBounds
    #field int rclFrame
    #field int dSignature
    #field int nVersion
    #field int nBytes
    #field int nRecords
    #field int nHandles
    #field int sReserved
    #field int nDescription
    #field int offDescription
    #field int nPalEntries
    #field int szlDevice
    #field int szlMillimeters
    #field int cbPixelFormat
    #field int offPixelFormat
    #field int bOpenGL
    #field int szlMicrometers
#endstruct

#defstruct ENHMETAHEADER3
    #field int iType
    #field int nSize
    #field int rclBounds
    #field int rclFrame
    #field int dSignature
    #field int nVersion
    #field int nBytes
    #field int nRecords
    #field int nHandles
    #field int sReserved
    #field int nDescription
    #field int offDescription
    #field int nPalEntries
    #field int szlDevice
    #field int szlMillimeters
#endstruct

#defstruct ENHMETARECORD
    #field int iType
    #field int nSize
#endstruct

#defstruct ENUM_PAGE_FILE_INFORMATION
    #field int cb
    #field int Reserved
    #field int TotalSize
    #field int TotalInUse
    #field int PeakUsage
#endstruct

#defstruct ENUM_SERVICE_STATUSW
    #field wstr lpServiceName
    #field wstr lpDisplayName
    #field int ServiceStatus
#endstruct

#defstruct ENUMLOGFONTEXDVW
    #field int elfEnumLogfontEx
    #field var elfDesignVector
#endstruct

#defstruct ENUMLOGFONTEXW
    #field int elfLogFont
    #field int elfFullName
    #field int elfStyle
    #field int elfScript
#endstruct

#defstruct ETW_BUFFER_CONTEXT
    #field var Anonymous
    #field int LoggerId
    #field var Anonymous
    #field int ProcessorIndex
    #field int ProcessorNumber
    #field int Alignment
#endstruct

#defstruct EVENT_DESCRIPTOR
    #field int Id
    #field int Version
    #field int Channel
    #field int Level
    #field int Opcode
    #field int Task
    #field int64 Keyword
#endstruct

#defstruct EVENT_FILTER_DESCRIPTOR
    #field int64 Ptr
    #field int Size
    #field int Type
#endstruct

#defstruct EVENT_HEADER
    #field int Size
    #field int HeaderType
    #field int Flags
    #field int EventProperty
    #field int ThreadId
    #field int ProcessId
    #field int64 TimeStamp
    #field var EventDescriptor
    #field var Anonymous
    #field var Anonymous
    #field int64 ProcessorTime
    #field int KernelTime
    #field int UserTime
#endstruct

#defstruct EVENT_HEADER_EXTENDED_DATA_ITEM
    #field int Reserved1
    #field int ExtType
    #field var Anonymous
    #field int DataSize
    #field int64 DataPtr
    #field int _bitfield
#endstruct

#defstruct EVENT_RECORD
    #field var EventHeader
    #field var BufferContext
    #field int ExtendedDataCount
    #field int UserDataLength
    #field var ExtendedData
    #field var UserData
    #field var UserContext
#endstruct

#defstruct EVENT_TRACE
    #field int Header
    #field int InstanceId
    #field int ParentInstanceId
    #field var MofData
    #field int MofLength
    #field var Anonymous
    #field int ClientContext
    #field var BufferContext
#endstruct

#defstruct EVENT_TRACE_HEADER
    #field int Size
    #field var Anonymous1
    #field var Anonymous2
    #field int ThreadId
    #field int ProcessId
    #field int64 TimeStamp
    #field var Anonymous3
    #field var Anonymous4
    #field int FieldTypeFlags
    #field var Anonymous
    #field int HeaderType
    #field int MarkerFlags
    #field int Version
    #field int Class
    #field int Type
    #field int Level
    #field int Version
    #field int64 GuidPtr
    #field var Anonymous1
    #field int64 ProcessorTime
    #field var Anonymous2
    #field int KernelTime
    #field int UserTime
    #field int ClientContext
    #field int Flags
#endstruct

#defstruct _Class_e__Struct
    #field int Type
    #field int Level
    #field int Version
#endstruct

#defstruct EVENT_TRACE_LOGFILEW
    #field wstr LogFileName
    #field wstr LoggerName
    #field int64 CurrentTime
    #field int BuffersRead
    #field var Anonymous1
    #field var CurrentEvent
    #field int LogfileHeader
    #field int BufferSize
    #field int Filled
    #field int EventsLost
    #field var Anonymous2
    #field int IsKernelTrace
    #field var Context
    #field int LogFileMode
    #field int ProcessTraceMode
#endstruct

#defstruct EVENT_TRACE_PROPERTIES
    #field int Wnode
    #field int BufferSize
    #field int MinimumBuffers
    #field int MaximumBuffers
    #field int MaximumFileSize
    #field int LogFileMode
    #field int FlushTimer
    #field int EnableFlags
    #field var Anonymous
    #field int NumberOfBuffers
    #field int FreeBuffers
    #field int EventsLost
    #field int BuffersWritten
    #field int LogBuffersLost
    #field int RealTimeBuffersLost
    #field intptr LoggerThreadId
    #field int LogFileNameOffset
    #field int LoggerNameOffset
    #field int AgeLimit
    #field int FlushThreshold
#endstruct

#defstruct EXCEPINFO
    #field int wCode
    #field int wReserved
    #field int bstrSource
    #field int bstrDescription
    #field int bstrHelpFile
    #field int dwHelpContext
    #field var pvReserved
    #field int scode
#endstruct

#defstruct EXCEPTION_DEBUG_INFO
    #field int ExceptionRecord
    #field int dwFirstChance
#endstruct

#defstruct EXCEPTION_RECORD
    #field intptr ExceptionCode
    #field int ExceptionFlags
    #field var ExceptionRecord
    #field var ExceptionAddress
    #field int NumberParameters
    #field int ExceptionInformation
#endstruct

#defstruct EXIT_PROCESS_DEBUG_INFO
    #field int dwExitCode
#endstruct

#defstruct EXIT_THREAD_DEBUG_INFO
    #field int dwExitCode
#endstruct

#defstruct EXPLICIT_ACCESS_W
    #field int grfAccessPermissions
    #field int grfAccessMode
    #field int grfInheritance
    #field int Trustee
#endstruct

#defstruct FARPROC
    #field int Value
#endstruct

#defstruct FD_GLYPHATTR
    #field int cjThis
    #field int cGlyphs
    #field int iMode
#endstruct

#defstruct FD_GLYPHSET
    #field int cjThis
    #field int flAccel
    #field int cGlyphsSupported
    #field int cRuns
#endstruct

#defstruct FILE_ID_128
    #field int Identifier
#endstruct

#defstruct FILE_ID_DESCRIPTOR
    #field int dwSize
    #field int Type
    #field var Anonymous
    #field int64 FileId
    #field var ExtendedFileId
#endstruct

#defstruct FILE_SEGMENT_ELEMENT
    #field var Buffer
    #field int64 Alignment
#endstruct

#defstruct FILEMUIINFO
    #field int dwSize
    #field int dwVersion
    #field int dwFileType
    #field int pChecksum
    #field int pServiceChecksum
    #field int dwLanguageNameOffset
    #field int dwTypeIDMainSize
    #field int dwTypeIDMainOffset
    #field int dwTypeNameMainOffset
    #field int dwTypeIDMUISize
    #field int dwTypeIDMUIOffset
    #field int dwTypeNameMUIOffset
    #field int abBuffer
#endstruct

#defstruct FIXED
    #field int fract
    #field int value
#endstruct

#defstruct FIXED_INFO_W2KSP1
    #field int HostName
    #field int DomainName
    #field var CurrentDnsServer
    #field int DnsServerList
    #field int NodeType
    #field int ScopeId
    #field int EnableRouting
    #field int EnableProxy
    #field int EnableDns
#endstruct

#defstruct FLASHWINFO
    #field int cbSize
    #field intptr hwnd
    #field int dwFlags
    #field int uCount
    #field int dwTimeout
#endstruct

#defstruct FLOWSPEC
    #field int TokenRate
    #field int TokenBucketSize
    #field int PeakBandwidth
    #field int Latency
    #field int DelayVariation
    #field int ServiceType
    #field int MaxSduSize
    #field int MinimumPolicedSize
#endstruct

#defstruct FN_OBJECT_MGR_FUNCTS
    #field int Placeholder
#endstruct

#defstruct FOCUS_EVENT_RECORD
    #field int bSetFocus
#endstruct

#defstruct FONTDESC
    #field int cbSizeofstruct
    #field wstr lpstrName
    #field var cySize
    #field int sWeight
    #field int sCharset
    #field int fItalic
    #field int fUnderline
    #field int fStrikethrough
#endstruct

#defstruct FONTINFO
    #field int cjThis
    #field int flCaps
    #field int cGlyphsSupported
    #field int cjMaxGlyph1
    #field int cjMaxGlyph4
    #field int cjMaxGlyph8
    #field int cjMaxGlyph32
#endstruct

#defstruct FONTOBJ
    #field int iUniq
    #field int iFace
    #field int cxMax
    #field int flFontType
    #field int iTTUniq
    #field int iFile
    #field int sizLogResPpi
    #field int ulStyleSize
    #field var pvConsumer
    #field var pvProducer
#endstruct

#defstruct FONTSIGNATURE
    #field int fsUsb
    #field int fsCsb
#endstruct

#defstruct FORMATETC
    #field int cfFormat
    #field var ptd
    #field int dwAspect
    #field int lindex
    #field int tymed
#endstruct

#defstruct FUNCDESC
    #field int memid
    #field var lprgscode
    #field var lprgelemdescParam
    #field int funckind
    #field int invkind
    #field int callconv
    #field int cParams
    #field int cParamsOpt
    #field int oVft
    #field int cScodes
    #field var elemdescFunc
    #field int wFuncFlags
#endstruct

#defstruct GCP_RESULTSW
    #field int lStructSize
    #field wstr lpOutString
    #field var lpOrder
    #field var lpDx
    #field var lpCaretPos
    #field str lpClass
    #field wstr lpGlyphs
    #field int nGlyphs
    #field int nMaxFit
#endstruct

#defstruct GdiplusStartupInput
    #field int GdiplusVersion
    #field int DebugEventCallback
    #field int SuppressBackgroundThread
    #field int SuppressExternalCodecs
#endstruct

#defstruct GdiplusStartupOutput
    #field int NotificationHook
    #field int NotificationUnhook
#endstruct

#defstruct GENERIC_MAPPING
    #field int GenericRead
    #field int GenericWrite
    #field int GenericExecute
    #field int GenericAll
#endstruct

#defstruct GESTURECONFIG
    #field int dwID
    #field int dwWant
    #field int dwBlock
#endstruct

#defstruct GESTUREINFO
    #field int cbSize
    #field int dwFlags
    #field int dwID
    #field intptr hwndTarget
    #field int ptsLocation
    #field int dwInstanceID
    #field int dwSequenceID
    #field int64 ullArguments
    #field int cbExtraArgs
#endstruct

#defstruct GLOBAL_MACHINE_POWER_POLICY
    #field int Revision
    #field int LidOpenWakeAc
    #field int LidOpenWakeDc
    #field int BroadcastCapacityResolution
#endstruct

#defstruct GLOBAL_POWER_POLICY
    #field int user
    #field var mach
#endstruct

#defstruct GLOBAL_USER_POWER_POLICY
    #field int Revision
    #field int PowerButtonAc
    #field int PowerButtonDc
    #field int SleepButtonAc
    #field int SleepButtonDc
    #field int LidCloseAc
    #field int LidCloseDc
    #field int DischargePolicy
    #field int GlobalFlags
#endstruct

#defstruct GLYPHBITS
    #field int ptlOrigin
    #field int sizlBitmap
#endstruct

#defstruct GLYPHDEF
    #field var pgb
    #field var ppo
#endstruct

#defstruct GLYPHMETRICS
    #field int gmBlackBoxX
    #field int gmBlackBoxY
    #field int gmCellIncX
    #field int gmCellIncY
#endstruct

#defstruct GLYPHMETRICSFLOAT
    #field float gmfBlackBoxX
    #field float gmfBlackBoxY
    #field int gmfptGlyphOrigin
    #field float gmfCellIncX
    #field float gmfCellIncY
#endstruct

#defstruct GLYPHPOS
    #field int hg
    #field var pgdf
    #field int ptl
#endstruct

#defstruct GLYPHSET
    #field int cbThis
    #field int flAccel
    #field int cGlyphsSupported
    #field int cRanges
#endstruct

#defstruct GOPHER_ABSTRACT_ATTRIBUTE_TYPE
    #field var ShortAbstract
    #field var AbstractFile
#endstruct

#defstruct GOPHER_ADMIN_ATTRIBUTE_TYPE
    #field var Comment
    #field var EmailAddress
#endstruct

#defstruct GOPHER_ASK_ATTRIBUTE_TYPE
    #field var QuestionType
    #field var QuestionText
#endstruct

#defstruct GOPHER_ATTRIBUTE_TYPE
    #field int CategoryId
    #field int AttributeId
    #field int AttributeType
    #field var Admin
    #field int ModDate
    #field int Ttl
    #field int Score
    #field int ScoreRange
    #field int Site
    #field int Organization
    #field int Location
    #field int GeographicalLocation
    #field int TimeZone
    #field int Provider
    #field int Version
    #field var Abstract
    #field int View
    #field int Veronica
    #field var Ask
    #field int Unknown
#endstruct

#defstruct _AttributeType_e__Union
    #field var Admin
    #field int ModDate
    #field int Ttl
    #field int Score
    #field int ScoreRange
    #field int Site
    #field int Organization
    #field int Location
    #field int GeographicalLocation
    #field int TimeZone
    #field int Provider
    #field int Version
    #field var Abstract
    #field int View
    #field int Veronica
    #field var Ask
    #field int Unknown
#endstruct

#defstruct GOPHER_FIND_DATAW
    #field int DisplayString
    #field int GopherType
    #field int SizeLow
    #field int SizeHigh
    #field int Locator
#endstruct

#defstruct GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE
    #field int DegreesNorth
    #field int MinutesNorth
    #field int SecondsNorth
    #field int DegreesEast
    #field int MinutesEast
    #field int SecondsEast
#endstruct

#defstruct GOPHER_LOCATION_ATTRIBUTE_TYPE
    #field var Location
#endstruct

#defstruct GOPHER_ORGANIZATION_ATTRIBUTE_TYPE
    #field var Organization
#endstruct

#defstruct GOPHER_PROVIDER_ATTRIBUTE_TYPE
    #field var Provider
#endstruct

#defstruct GOPHER_SCORE_ATTRIBUTE_TYPE
    #field int Score
#endstruct

#defstruct GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE
    #field int LowerBound
    #field int UpperBound
#endstruct

#defstruct GOPHER_SITE_ATTRIBUTE_TYPE
    #field var Site
#endstruct

#defstruct GOPHER_TIMEZONE_ATTRIBUTE_TYPE
    #field int Zone
#endstruct

#defstruct GOPHER_TTL_ATTRIBUTE_TYPE
    #field int Ttl
#endstruct

#defstruct GOPHER_UNKNOWN_ATTRIBUTE_TYPE
    #field var Text
#endstruct

#defstruct GOPHER_VERONICA_ATTRIBUTE_TYPE
    #field int TreeWalk
#endstruct

#defstruct GOPHER_VERSION_ATTRIBUTE_TYPE
    #field var Version
#endstruct

#defstruct GOPHER_VIEW_ATTRIBUTE_TYPE
    #field var ContentType
    #field var Language
    #field int Size
#endstruct

#defstruct GROUP_AFFINITY
    #field int Mask
    #field int Group
    #field int Reserved
#endstruct

#defstruct GROUP_POLICY_OBJECTW
    #field int dwOptions
    #field int dwVersion
    #field wstr lpDSPath
    #field wstr lpFileSysPath
    #field wstr lpDisplayName
    #field int szGPOName
    #field int GPOLink
    #field intptr lParam
    #field var pNext
    #field var pPrev
    #field wstr lpExtensions
    #field intptr lParam2
    #field wstr lpLink
#endstruct

#defstruct GUITHREADINFO
    #field int cbSize
    #field int flags
    #field intptr hwndActive
    #field intptr hwndFocus
    #field intptr hwndCapture
    #field intptr hwndMenuOwner
    #field intptr hwndMoveSize
    #field intptr hwndCaret
    #field int rcCaret
#endstruct

#defstruct HARDWARE_COUNTER_DATA
    #field int Type
    #field int Reserved
    #field int64 Value
#endstruct

#defstruct HARDWAREINPUT
    #field int uMsg
    #field int wParamL
    #field int wParamH
#endstruct

#defstruct HEAP_SUMMARY
    #field int cb
    #field int cbAllocated
    #field int cbCommitted
    #field int cbReserved
    #field int cbMaxReserve
#endstruct

#defstruct HEAPENTRY32
    #field int dwSize
    #field intptr hHandle
    #field int dwAddress
    #field int dwBlockSize
    #field int dwFlags
    #field int dwLockCount
    #field int dwResvd
    #field int th32ProcessID
    #field int th32HeapID
#endstruct

#defstruct HEAPLIST32
    #field int dwSize
    #field int th32ProcessID
    #field int th32HeapID
    #field int dwFlags
#endstruct

#defstruct HELPINFO
    #field int cbSize
    #field int iContextType
    #field int iCtrlId
    #field intptr hItemHandle
    #field int dwContextId
#endstruct

#defstruct HIT_LOGGING_INFO
    #field int dwStructSize
    #field str lpszLoggedUrlName
    #field int StartTime
    #field int EndTime
    #field str lpszExtendedInfo
#endstruct

#defstruct HLOG
    #field int time
    #field int last_flags
    #field int offset
    #field int rec_offset
#endstruct

#defstruct HTTP_BYTE_RANGE
    #field int64 StartingOffset
    #field int64 Length
#endstruct

#defstruct HTTP_CACHE_POLICY
    #field int Policy
    #field int SecondsToLive
#endstruct

#defstruct HTTP_COOKED_URL
    #field int FullUrlLength
    #field int HostLength
    #field int AbsPathLength
    #field int QueryStringLength
    #field wstr pFullUrl
    #field wstr pHost
    #field wstr pAbsPath
    #field wstr pQueryString
#endstruct

#defstruct HTTP_DATA_CHUNK
    #field int DataChunkType
    #field var Anonymous
    #field int FromMemory
    #field int FromFileHandle
    #field int FromFragmentCache
    #field int FromFragmentCacheEx
    #field int Trailers
    #field var pBuffer
    #field int BufferLength
    #field var ByteRange
    #field intptr FileHandle
    #field int FragmentNameLength
    #field wstr pFragmentName
    #field var ByteRange
    #field wstr pFragmentName
    #field int TrailerCount
    #field var pTrailers
#endstruct

#defstruct _FromMemory_e__Struct
    #field var pBuffer
    #field int BufferLength
#endstruct

#defstruct _FromFileHandle_e__Struct
    #field var ByteRange
    #field intptr FileHandle
#endstruct

#defstruct _FromFragmentCache_e__Struct
    #field int FragmentNameLength
    #field wstr pFragmentName
#endstruct

#defstruct _FromFragmentCacheEx_e__Struct
    #field var ByteRange
    #field wstr pFragmentName
#endstruct

#defstruct _Trailers_e__Struct
    #field int TrailerCount
    #field var pTrailers
#endstruct

#defstruct HTTP_DELEGATE_REQUEST_PROPERTY_INFO
    #field int PropertyId
    #field int PropertyInfoLength
    #field var PropertyInfo
#endstruct

#defstruct HTTP_KNOWN_HEADER
    #field int RawValueLength
    #field str pRawValue
#endstruct

#defstruct HTTP_LOG_DATA
    #field int Type
#endstruct

#defstruct HTTP_PUSH_NOTIFICATION_STATUS
    #field int ChannelStatusValid
    #field int ChannelStatus
#endstruct

#defstruct HTTP_REQUEST_HEADERS
    #field int UnknownHeaderCount
    #field var pUnknownHeaders
    #field int TrailerCount
    #field var pTrailers
    #field int KnownHeaders
#endstruct

#defstruct HTTP_REQUEST_INFO
    #field int InfoType
    #field int InfoLength
    #field var pInfo
#endstruct

#defstruct HTTP_REQUEST_V1
    #field int Flags
    #field int64 ConnectionId
    #field int64 RequestId
    #field int64 UrlContext
    #field int Version
    #field int Verb
    #field int UnknownVerbLength
    #field int RawUrlLength
    #field str pUnknownVerb
    #field str pRawUrl
    #field var CookedUrl
    #field int Address
    #field var Headers
    #field int64 BytesReceived
    #field int EntityChunkCount
    #field var pEntityChunks
    #field int64 RawConnectionId
    #field var pSslInfo
#endstruct

#defstruct HTTP_REQUEST_V2
    #field var Base
    #field int RequestInfoCount
    #field var pRequestInfo
#endstruct

#defstruct HTTP_RESPONSE_HEADERS
    #field int UnknownHeaderCount
    #field var pUnknownHeaders
    #field int TrailerCount
    #field var pTrailers
    #field int KnownHeaders
#endstruct

#defstruct HTTP_RESPONSE_INFO
    #field int Type
    #field int Length
    #field var pInfo
#endstruct

#defstruct HTTP_RESPONSE_V1
    #field int Flags
    #field int Version
    #field int StatusCode
    #field int ReasonLength
    #field str pReason
    #field var Headers
    #field int EntityChunkCount
    #field var pEntityChunks
#endstruct

#defstruct HTTP_RESPONSE_V2
    #field var Base
    #field int ResponseInfoCount
    #field var pResponseInfo
#endstruct

#defstruct HTTP_SSL_CLIENT_CERT_INFO
    #field int CertFlags
    #field int CertEncodedSize
    #field var pCertEncoded
    #field intptr Token
    #field int CertDeniedByMapper
#endstruct

#defstruct HTTP_SSL_INFO
    #field int ServerCertKeySize
    #field int ConnectionKeySize
    #field int ServerCertIssuerSize
    #field int ServerCertSubjectSize
    #field str pServerCertIssuer
    #field str pServerCertSubject
    #field var pClientCertInfo
    #field int SslClientCertNegotiated
#endstruct

#defstruct HTTP_TRANSPORT_ADDRESS
    #field var pRemoteAddress
    #field var pLocalAddress
#endstruct

#defstruct HTTP_UNKNOWN_HEADER
    #field int NameLength
    #field int RawValueLength
    #field str pName
    #field str pRawValue
#endstruct

#defstruct HTTP_VERSION
    #field int MajorVersion
    #field int MinorVersion
#endstruct

#defstruct HTTPAPI_VERSION
    #field int HttpApiMajorVersion
    #field int HttpApiMinorVersion
#endstruct

#defstruct HW_PROFILE_INFOW
    #field int dwDockInfo
    #field int szHwProfileGuid
    #field int szHwProfileName
#endstruct

#defstruct ICONINFO
    #field int fIcon
    #field int xHotspot
    #field int yHotspot
    #field intptr hbmMask
    #field intptr hbmColor
#endstruct

#defstruct ICONINFOEXW
    #field int cbSize
    #field int fIcon
    #field int xHotspot
    #field int yHotspot
    #field intptr hbmMask
    #field intptr hbmColor
    #field int wResID
    #field int szModName
    #field int szResName
#endstruct

#defstruct IDLDESC
    #field int dwReserved
    #field int wIDLFlags
#endstruct

#defstruct IMAGE_SECTION_HEADER
    #field int Name
    #field int Misc
    #field int VirtualAddress
    #field int SizeOfRawData
    #field int PointerToRawData
    #field int PointerToRelocations
    #field int PointerToLinenumbers
    #field int NumberOfRelocations
    #field int NumberOfLinenumbers
    #field int Characteristics
    #field int PhysicalAddress
    #field int VirtualSize
#endstruct

#defstruct _Misc_e__Union
    #field int PhysicalAddress
    #field int VirtualSize
#endstruct

#defstruct ImageCodecInfo
    #field wstr CodecName
    #field wstr DllName
    #field wstr FormatDescription
    #field wstr FilenameExtension
    #field wstr MimeType
    #field int Flags
    #field int Version
    #field int SigCount
    #field int SigSize
    #field var SigPattern
    #field var SigMask
#endstruct

#defstruct IMAGEHLP_GET_TYPE_INFO_PARAMS
    #field int SizeOfStruct
    #field int Flags
    #field int NumIds
    #field var TypeIds
    #field int64 TagFilter
    #field int NumReqs
    #field var ReqKinds
    #field var ReqOffsets
    #field var ReqSizes
    #field int ReqStride
    #field int BufferSize
    #field var Buffer
    #field int EntriesMatched
    #field int EntriesFilled
    #field int64 TagsFound
    #field int64 AllReqsValid
    #field int NumReqsValid
    #field var ReqsValid
#endstruct

#defstruct IMAGEHLP_LINE64
    #field int SizeOfStruct
    #field var Key
    #field int LineNumber
    #field str FileName
    #field int64 Address
#endstruct

#defstruct IMAGEHLP_LINEW64
    #field int SizeOfStruct
    #field var Key
    #field int LineNumber
    #field wstr FileName
    #field int64 Address
#endstruct

#defstruct IMAGEHLP_MODULE64
    #field int SizeOfStruct
    #field int64 BaseOfImage
    #field int ImageSize
    #field int TimeDateStamp
    #field int CheckSum
    #field int NumSyms
    #field int SymType
    #field int ModuleName
    #field int ImageName
    #field int LoadedImageName
    #field int LoadedPdbName
    #field int CVSig
    #field int CVData
    #field int PdbSig
    #field int PdbAge
    #field int PdbUnmatched
    #field int DbgUnmatched
    #field int LineNumbers
    #field int GlobalSymbols
    #field int TypeInfo
    #field int SourceIndexed
    #field int Publics
    #field int MachineType
    #field int Reserved
#endstruct

#defstruct IMAGEHLP_MODULEW64
    #field int SizeOfStruct
    #field int64 BaseOfImage
    #field int ImageSize
    #field int TimeDateStamp
    #field int CheckSum
    #field int NumSyms
    #field int SymType
    #field int ModuleName
    #field int ImageName
    #field int LoadedImageName
    #field int LoadedPdbName
    #field int CVSig
    #field int CVData
    #field int PdbSig
    #field int PdbAge
    #field int PdbUnmatched
    #field int DbgUnmatched
    #field int LineNumbers
    #field int GlobalSymbols
    #field int TypeInfo
    #field int SourceIndexed
    #field int Publics
    #field int MachineType
    #field int Reserved
#endstruct

#defstruct IMAGEHLP_STACK_FRAME
    #field int64 InstructionOffset
    #field int64 ReturnOffset
    #field int64 FrameOffset
    #field int64 StackOffset
    #field int64 BackingStoreOffset
    #field int64 FuncTableEntry
    #field int Params
    #field int Reserved
    #field int Virtual
    #field int Reserved2
#endstruct

#defstruct IMAGEHLP_SYMBOL64
    #field int SizeOfStruct
    #field int64 Address
    #field int Size
    #field int Flags
    #field int MaxNameLength
#endstruct

#defstruct IMAGEINFO
    #field intptr hbmImage
    #field intptr hbmMask
    #field int Unused1
    #field int Unused2
    #field int rcImage
#endstruct

#defstruct ImageItemData
    #field int Size
    #field int Position
    #field var Desc
    #field int DescSize
    #field var Data
    #field int DataSize
    #field int Cookie
#endstruct

#defstruct IMAGELISTDRAWPARAMS
    #field int cbSize
    #field intptr himl
    #field int i
    #field intptr hdcDst
    #field int x
    #field int y
    #field int cx
    #field int cy
    #field int xBitmap
    #field int yBitmap
    #field int rgbBk
    #field int rgbFg
    #field int fStyle
    #field int dwRop
    #field int fState
    #field int Frame
    #field int crEffect
#endstruct

#defstruct IMEMENUITEMINFOW
    #field int cbSize
    #field int fType
    #field int fState
    #field int wID
    #field intptr hbmpChecked
    #field intptr hbmpUnchecked
    #field int dwItemData
    #field int szString
    #field intptr hbmpItem
#endstruct

#defstruct IMEPROA
    #field intptr hWnd
    #field var InstDate
    #field int wVersion
    #field int szDescription
    #field int szName
    #field int szOptions
#endstruct

#defstruct IMEPROW
    #field intptr hWnd
    #field var InstDate
    #field int wVersion
    #field int szDescription
    #field int szName
    #field int szOptions
#endstruct

#defstruct IN6_ADDR
    #field var u
    #field int Byte
    #field int Word
#endstruct

#defstruct IN_ADDR
    #field int S_un
    #field int S_un_b
    #field int S_un_w
    #field int S_addr
    #field int s_b1
    #field int s_b2
    #field int s_b3
    #field int s_b4
    #field int s_w1
    #field int s_w2
#endstruct

#defstruct _S_un_e__Union
    #field int S_un_b
    #field int S_un_w
    #field int S_addr
    #field int s_b1
    #field int s_b2
    #field int s_b3
    #field int s_b4
    #field int s_w1
    #field int s_w2
#endstruct

#defstruct _S_un_b_e__Struct
    #field int s_b1
    #field int s_b2
    #field int s_b3
    #field int s_b4
#endstruct

#defstruct _S_un_w_e__Struct
    #field int s_w1
    #field int s_w2
#endstruct

#defstruct INHERITED_FROMW
    #field int GenerationGap
    #field wstr AncestorName
#endstruct

#defstruct INITCOMMONCONTROLSEX
    #field int dwSize
    #field int dwICC
#endstruct

#defstruct INPUT
    #field int type
    #field var Anonymous
    #field int mi
    #field int ki
    #field var hi
#endstruct

#defstruct INPUT_MESSAGE_SOURCE
    #field int deviceType
    #field int originId
#endstruct

#defstruct INPUT_RECORD
    #field int EventType
    #field int Event
    #field int KeyEvent
    #field int MouseEvent
    #field int WindowBufferSizeEvent
    #field int MenuEvent
    #field var FocusEvent
#endstruct

#defstruct _Event_e__Union
    #field int KeyEvent
    #field int MouseEvent
    #field int WindowBufferSizeEvent
    #field int MenuEvent
    #field var FocusEvent
#endstruct

#defstruct INPUT_TRANSFORM
    #field var Anonymous
    #field var Anonymous
    #field int m
    #field float _11
    #field float _12
    #field float _13
    #field float _14
    #field float _21
    #field float _22
    #field float _23
    #field float _24
    #field float _31
    #field float _32
    #field float _33
    #field float _34
    #field float _41
    #field float _42
    #field float _43
    #field float _44
#endstruct

#defstruct INPUTCONTEXT
    #field intptr hWnd
    #field int fOpen
    #field int fdwConversion
    #field int fdwSentence
    #field int lfFont
    #field var cfCompForm
    #field int cfCandForm
    #field intptr hCompStr
    #field intptr hCandInfo
    #field intptr hGuideLine
    #field intptr hPrivate
    #field int dwNumMsgBuf
    #field intptr hMsgBuf
    #field int fdwInit
    #field int dwReserve
    #field int A
    #field int W
#endstruct

#defstruct _lfFont_e__Union
    #field int A
    #field int W
#endstruct

#defstruct INSTALLDATA
    #field int Type
    #field int Spec
#endstruct

#defstruct INSTALLSPEC
    #field int AppName
    #field wstr FileExt
    #field wstr ProgId
    #field int COMClass
    #field wstr Name
    #field int ClsCtx
#endstruct

#defstruct _AppName_e__Struct
    #field wstr Name
#endstruct

#defstruct _COMClass_e__Struct
    #field int ClsCtx
#endstruct

#defstruct INTERFACE_HARDWARE_CROSSTIMESTAMP
    #field int64 SystemTimestamp1
    #field int64 HardwareClockTimestamp
    #field int64 SystemTimestamp2
#endstruct

#defstruct INTERFACE_HARDWARE_TIMESTAMP_CAPABILITIES
    #field int PtpV2OverUdpIPv4EventMessageReceive
    #field int PtpV2OverUdpIPv4AllMessageReceive
    #field int PtpV2OverUdpIPv4EventMessageTransmit
    #field int PtpV2OverUdpIPv4AllMessageTransmit
    #field int PtpV2OverUdpIPv6EventMessageReceive
    #field int PtpV2OverUdpIPv6AllMessageReceive
    #field int PtpV2OverUdpIPv6EventMessageTransmit
    #field int PtpV2OverUdpIPv6AllMessageTransmit
    #field int AllReceive
    #field int AllTransmit
    #field int TaggedTransmit
#endstruct

#defstruct INTERFACE_SOFTWARE_TIMESTAMP_CAPABILITIES
    #field int AllReceive
    #field int AllTransmit
    #field int TaggedTransmit
#endstruct

#defstruct INTERFACE_TIMESTAMP_CAPABILITIES
    #field int64 HardwareClockFrequencyHz
    #field int SupportsCrossTimestamp
    #field var HardwareCapabilities
    #field var SoftwareCapabilities
#endstruct

#defstruct INTERFACEDATA
    #field var pmethdata
    #field int cMembers
#endstruct

#defstruct INTERFACEINFO
    #field var pUnk
    #field int wMethod
#endstruct

#defstruct INTERNET_BUFFERSW
    #field int dwStructSize
    #field var Next
    #field wstr lpcszHeader
    #field int dwHeadersLength
    #field int dwHeadersTotal
    #field var lpvBuffer
    #field int dwBufferLength
    #field int dwBufferTotal
    #field int dwOffsetLow
    #field int dwOffsetHigh
#endstruct

#defstruct INTERNET_CACHE_CONFIG_INFOW
    #field int dwStructSize
    #field int dwContainer
    #field int dwQuota
    #field int dwReserved4
    #field int fPerUser
    #field int dwSyncMode
    #field int dwNumCachePaths
    #field var Anonymous
    #field int dwNormalUsage
    #field int dwExemptUsage
    #field var Anonymous
    #field int CachePath
    #field int dwCacheSize
#endstruct

#defstruct INTERNET_CACHE_CONFIG_PATH_ENTRYW
    #field int CachePath
    #field int dwCacheSize
#endstruct

#defstruct INTERNET_CACHE_CONTAINER_INFOW
    #field int dwCacheVersion
    #field wstr lpszName
    #field wstr lpszCachePrefix
    #field wstr lpszVolumeLabel
    #field wstr lpszVolumeTitle
#endstruct

#defstruct INTERNET_CACHE_ENTRY_INFOW
    #field int dwStructSize
    #field wstr lpszSourceUrlName
    #field wstr lpszLocalFileName
    #field int CacheEntryType
    #field int dwUseCount
    #field int dwHitRate
    #field int dwSizeLow
    #field int dwSizeHigh
    #field wstr lpHeaderInfo
    #field int dwHeaderInfoSize
    #field wstr lpszFileExtension
    #field var Anonymous
    #field int dwReserved
    #field int dwExemptDelta
#endstruct

#defstruct INTERNET_CACHE_GROUP_INFOW
    #field int dwGroupSize
    #field int dwGroupFlags
    #field int dwGroupType
    #field int dwDiskUsage
    #field int dwDiskQuota
    #field int dwOwnerStorage
    #field int szGroupName
#endstruct

#defstruct INTERNET_COOKIE2
    #field wstr pwszName
    #field wstr pwszValue
    #field wstr pwszDomain
    #field wstr pwszPath
    #field int dwFlags
    #field int fExpiresSet
#endstruct

#defstruct INTERNET_SECURITY_INFO
    #field int dwSize
    #field var pCertificate
    #field var pcCertChain
    #field int connectionInfo
    #field int cipherInfo
    #field var pcUnverifiedCertChain
    #field int channelBindingToken
#endstruct

#defstruct INTLIST
    #field int iValueCount
    #field int iValues
#endstruct

#defstruct IO_COUNTERS
    #field int64 ReadOperationCount
    #field int64 WriteOperationCount
    #field int64 OtherOperationCount
    #field int64 ReadTransferCount
    #field int64 WriteTransferCount
    #field int64 OtherTransferCount
#endstruct

#defstruct IO_STATUS_BLOCK
    #field var Anonymous
    #field int Information
    #field intptr Status
    #field var Pointer
#endstruct

#defstruct IP_ADAPTER_ADDRESSES_LH
    #field var Anonymous1
    #field var Next
    #field str AdapterName
    #field var FirstUnicastAddress
    #field var FirstAnycastAddress
    #field var FirstMulticastAddress
    #field var FirstDnsServerAddress
    #field wstr DnsSuffix
    #field wstr Description
    #field wstr FriendlyName
    #field int PhysicalAddress
    #field int PhysicalAddressLength
    #field var Anonymous2
    #field int Mtu
    #field int IfType
    #field int OperStatus
    #field int Ipv6IfIndex
    #field int ZoneIndices
    #field var FirstPrefix
    #field int64 TransmitLinkSpeed
    #field int64 ReceiveLinkSpeed
    #field var FirstWinsServerAddress
    #field var FirstGatewayAddress
    #field int Ipv4Metric
    #field int Ipv6Metric
    #field int Luid
    #field int Dhcpv4Server
    #field int CompartmentId
    #field int ConnectionType
    #field int TunnelType
    #field int Dhcpv6Server
    #field int Dhcpv6ClientDuid
    #field int Dhcpv6ClientDuidLength
    #field int Dhcpv6Iaid
    #field var FirstDnsSuffix
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int IfIndex
    #field int Flags
    #field var Anonymous
    #field int _bitfield
#endstruct

#defstruct IP_ADAPTER_ANYCAST_ADDRESS_XP
    #field var Anonymous
    #field var Next
    #field int Address
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Flags
#endstruct

#defstruct IP_ADAPTER_DNS_SERVER_ADDRESS_XP
    #field var Anonymous
    #field var Next
    #field int Address
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Reserved
#endstruct

#defstruct IP_ADAPTER_DNS_SUFFIX
    #field var Next
    #field int String
#endstruct

#defstruct IP_ADAPTER_GATEWAY_ADDRESS_LH
    #field var Anonymous
    #field var Next
    #field int Address
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Reserved
#endstruct

#defstruct IP_ADAPTER_INDEX_MAP
    #field int Index
    #field int Name
#endstruct

#defstruct IP_ADAPTER_INFO
    #field var Next
    #field int ComboIndex
    #field int AdapterName
    #field int Description
    #field int AddressLength
    #field int Address
    #field int Index
    #field int Type
    #field int DhcpEnabled
    #field var CurrentIpAddress
    #field int IpAddressList
    #field int GatewayList
    #field int DhcpServer
    #field int HaveWins
    #field int PrimaryWinsServer
    #field int SecondaryWinsServer
    #field int64 LeaseObtained
    #field int64 LeaseExpires
#endstruct

#defstruct IP_ADAPTER_MULTICAST_ADDRESS_XP
    #field var Anonymous
    #field var Next
    #field int Address
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Flags
#endstruct

#defstruct IP_ADAPTER_ORDER_MAP
    #field int NumAdapters
#endstruct

#defstruct IP_ADAPTER_PREFIX_XP
    #field var Anonymous
    #field var Next
    #field int Address
    #field int PrefixLength
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Flags
#endstruct

#defstruct IP_ADAPTER_UNICAST_ADDRESS_LH
    #field var Anonymous
    #field var Next
    #field int Address
    #field int PrefixOrigin
    #field int SuffixOrigin
    #field int DadState
    #field int ValidLifetime
    #field int PreferredLifetime
    #field int LeaseLifetime
    #field int OnLinkPrefixLength
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Flags
#endstruct

#defstruct IP_ADAPTER_WINS_SERVER_ADDRESS_LH
    #field var Anonymous
    #field var Next
    #field int Address
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Reserved
#endstruct

#defstruct IP_ADDR_STRING
    #field var Next
    #field int IpAddress
    #field int IpMask
    #field int Context
#endstruct

#defstruct IP_ADDRESS_PREFIX
    #field int Prefix
    #field int PrefixLength
#endstruct

#defstruct IP_ADDRESS_STRING
    #field int String
#endstruct

#defstruct IP_INTERFACE_INFO
    #field int NumAdapters
#endstruct

#defstruct IP_INTERFACE_NAME_INFO_W2KSP1
    #field int Index
    #field int MediaType
    #field int ConnectionType
    #field int AccessType
#endstruct

#defstruct IP_OPTION_INFORMATION
    #field int Ttl
    #field int Tos
    #field int Flags
    #field int OptionsSize
    #field var OptionsData
#endstruct

#defstruct IP_PER_ADAPTER_INFO_W2KSP1
    #field int AutoconfigEnabled
    #field int AutoconfigActive
    #field var CurrentDnsServer
    #field var DnsServerList
#endstruct

#defstruct IP_UNIDIRECTIONAL_ADAPTER_ADDRESS
    #field int NumAdapters
#endstruct

#defstruct ITEMIDLIST
    #field int mkid
#endstruct

#defstruct JOB_SET_ARRAY
    #field intptr JobHandle
    #field int MemberLevel
    #field int Flags
#endstruct

#defstruct JOBOBJECT_IO_RATE_CONTROL_INFORMATION
    #field int64 MaxIops
    #field int64 MaxBandwidth
    #field int64 ReservationIops
    #field wstr VolumeName
    #field int BaseIoSize
#endstruct

#defstruct JOYCAPSW
    #field int wMid
    #field int wPid
    #field int szPname
    #field int wXmin
    #field int wXmax
    #field int wYmin
    #field int wYmax
    #field int wZmin
    #field int wZmax
    #field int wNumButtons
    #field int wPeriodMin
    #field int wPeriodMax
    #field int wRmin
    #field int wRmax
    #field int wUmin
    #field int wUmax
    #field int wVmin
    #field int wVmax
    #field int wCaps
    #field int wMaxAxes
    #field int wNumAxes
    #field int wMaxButtons
    #field int szRegKey
    #field int szOEMVxD
#endstruct

#defstruct JOYINFO
    #field int wXpos
    #field int wYpos
    #field int wZpos
    #field int wButtons
#endstruct

#defstruct JOYINFOEX
    #field int dwSize
    #field int dwFlags
    #field int dwXpos
    #field int dwYpos
    #field int dwZpos
    #field int dwRpos
    #field int dwUpos
    #field int dwVpos
    #field int dwButtons
    #field int dwButtonNumber
    #field int dwPOV
    #field int dwReserved1
    #field int dwReserved2
#endstruct

#defstruct KDHELP64
    #field int64 Thread
    #field int ThCallbackStack
    #field int ThCallbackBStore
    #field int NextCallback
    #field int FramePointer
    #field int64 KiCallUserMode
    #field int64 KeUserCallbackDispatcher
    #field int64 SystemRangeStart
    #field int64 KiUserExceptionDispatcher
    #field int64 StackBase
    #field int64 StackLimit
    #field int BuildVersion
    #field int RetpolineStubFunctionTableSize
    #field int64 RetpolineStubFunctionTable
    #field int RetpolineStubOffset
    #field int RetpolineStubSize
    #field int Reserved0
#endstruct

#defstruct KERNINGPAIR
    #field int wFirst
    #field int wSecond
    #field int iKernAmount
#endstruct

#defstruct KEY_EVENT_RECORD
    #field int bKeyDown
    #field int wRepeatCount
    #field int wVirtualKeyCode
    #field int wVirtualScanCode
    #field int uChar
    #field int dwControlKeyState
    #field int UnicodeChar
    #field int AsciiChar
#endstruct

#defstruct _uChar_e__Union
    #field int UnicodeChar
    #field int AsciiChar
#endstruct

#defstruct KEYBDINPUT
    #field int wVk
    #field int wScan
    #field int dwFlags
    #field int time
    #field int dwExtraInfo
#endstruct

#defstruct L2_NOTIFICATION_DATA
    #field int NotificationSource
    #field int NotificationCode
    #field int dwDataSize
    #field var pData
#endstruct

#defstruct LASTINPUTINFO
    #field int cbSize
    #field int dwTime
#endstruct

#defstruct LAYERPLANEDESCRIPTOR
    #field int nSize
    #field int nVersion
    #field int dwFlags
    #field int iPixelType
    #field int cColorBits
    #field int cRedBits
    #field int cRedShift
    #field int cGreenBits
    #field int cGreenShift
    #field int cBlueBits
    #field int cBlueShift
    #field int cAlphaBits
    #field int cAlphaShift
    #field int cAccumBits
    #field int cAccumRedBits
    #field int cAccumGreenBits
    #field int cAccumBlueBits
    #field int cAccumAlphaBits
    #field int cDepthBits
    #field int cStencilBits
    #field int cAuxBuffers
    #field int iLayerPlane
    #field int bReserved
    #field int crTransparent
#endstruct

#defstruct LDT_ENTRY
    #field int LimitLow
    #field int BaseLow
    #field int HighWord
    #field int Bytes
    #field int Bits
    #field int BaseMid
    #field int Flags1
    #field int Flags2
    #field int BaseHi
    #field int _bitfield
#endstruct

#defstruct _HighWord_e__Union
    #field int Bytes
    #field int Bits
    #field int BaseMid
    #field int Flags1
    #field int Flags2
    #field int BaseHi
    #field int _bitfield
#endstruct

#defstruct _Bytes_e__Struct
    #field int BaseMid
    #field int Flags1
    #field int Flags2
    #field int BaseHi
#endstruct

#defstruct _Bits_e__Struct
    #field int _bitfield
#endstruct

#defstruct LIST_ENTRY
    #field var Flink
    #field var Blink
#endstruct

#defstruct LM_OWF_PASSWORD
    #field int data
#endstruct

#defstruct LOAD_DLL_DEBUG_INFO
    #field intptr hFile
    #field var lpBaseOfDll
    #field int dwDebugInfoFileOffset
    #field int nDebugInfoSize
    #field var lpImageName
    #field int fUnicode
#endstruct

#defstruct LOCALMANAGEDAPPLICATION
    #field wstr pszDeploymentName
    #field wstr pszPolicyName
    #field wstr pszProductId
    #field int dwState
#endstruct

#defstruct LOGBRUSH
    #field int lbStyle
    #field int lbColor
    #field int lbHatch
#endstruct

#defstruct LOGCOLORSPACEW
    #field int lcsSignature
    #field int lcsVersion
    #field int lcsSize
    #field int lcsCSType
    #field int lcsIntent
    #field var lcsEndpoints
    #field int lcsGammaRed
    #field int lcsGammaGreen
    #field int lcsGammaBlue
    #field int lcsFilename
#endstruct

#defstruct LOGFONTA
    #field int lfHeight
    #field int lfWidth
    #field int lfEscapement
    #field int lfOrientation
    #field int lfWeight
    #field int lfItalic
    #field int lfUnderline
    #field int lfStrikeOut
    #field int lfCharSet
    #field int lfOutPrecision
    #field int lfClipPrecision
    #field int lfQuality
    #field int lfPitchAndFamily
    #field int lfFaceName
#endstruct

#defstruct LOGFONTW
    #field int lfHeight
    #field int lfWidth
    #field int lfEscapement
    #field int lfOrientation
    #field int lfWeight
    #field int lfItalic
    #field int lfUnderline
    #field int lfStrikeOut
    #field int lfCharSet
    #field int lfOutPrecision
    #field int lfClipPrecision
    #field int lfQuality
    #field int lfPitchAndFamily
    #field int lfFaceName
#endstruct

#defstruct LOGPALETTE
    #field int palVersion
    #field int palNumEntries
#endstruct

#defstruct LOGPEN
    #field int lopnColor
#endstruct

#defstruct LSA_AUTH_INFORMATION
    #field int64 LastUpdateTime
    #field int AuthType
    #field int AuthInfoLength
    #field var AuthInfo
#endstruct

#defstruct LSA_FOREST_TRUST_BINARY_DATA
    #field int Length
    #field var Buffer
#endstruct

#defstruct LSA_FOREST_TRUST_COLLISION_INFORMATION
    #field int RecordCount
    #field var Entries
#endstruct

#defstruct LSA_FOREST_TRUST_COLLISION_RECORD
    #field int Index
    #field int Type
    #field int Flags
    #field int Name
#endstruct

#defstruct LSA_FOREST_TRUST_DOMAIN_INFO
    #field int Sid
    #field int DnsName
    #field int NetbiosName
#endstruct

#defstruct LSA_FOREST_TRUST_INFORMATION
    #field int RecordCount
    #field var Entries
#endstruct

#defstruct LSA_FOREST_TRUST_INFORMATION2
    #field int RecordCount
    #field var Entries
#endstruct

#defstruct LSA_FOREST_TRUST_RECORD
    #field int Flags
    #field int ForestTrustType
    #field int64 Time
    #field int ForestTrustData
    #field int TopLevelName
    #field var DomainInfo
    #field var Data
#endstruct

#defstruct _ForestTrustData_e__Union
    #field int TopLevelName
    #field var DomainInfo
    #field var BinaryData
    #field int ScannerInfo
#endstruct

#defstruct LSA_FOREST_TRUST_RECORD2
    #field int Flags
    #field int ForestTrustType
    #field int64 Time
    #field var ForestTrustData
    #field int TopLevelName
    #field var DomainInfo
    #field var BinaryData
    #field int ScannerInfo
#endstruct

#defstruct LSA_FOREST_TRUST_SCANNER_INFO
    #field int DomainSid
    #field int DnsName
    #field int NetbiosName
#endstruct

#defstruct LSA_OBJECT_ATTRIBUTES
    #field int Length
    #field intptr RootDirectory
    #field var ObjectName
    #field int Attributes
    #field var SecurityDescriptor
    #field var SecurityQualityOfService
#endstruct

#defstruct LSA_REFERENCED_DOMAIN_LIST
    #field int Entries
    #field var Domains
#endstruct

#defstruct LSA_TRANSLATED_NAME
    #field int Use
    #field int Name
    #field int DomainIndex
#endstruct

#defstruct LSA_TRANSLATED_SID
    #field int Use
    #field int RelativeId
    #field int DomainIndex
#endstruct

#defstruct LSA_TRANSLATED_SID2
    #field int Use
    #field int Sid
    #field int DomainIndex
    #field int Flags
#endstruct

#defstruct LSA_TRUST_INFORMATION
    #field int Name
    #field int Sid
#endstruct

#defstruct LSA_UNICODE_STRING
    #field int Length
    #field int MaximumLength
    #field wstr Buffer
#endstruct

#defstruct LUID
    #field int LowPart
    #field int HighPart
#endstruct

#defstruct LUID_AND_ATTRIBUTES
    #field var Luid
    #field int Attributes
#endstruct

#defstruct MACHINE_POWER_POLICY
    #field int Revision
    #field int MinSleepAc
    #field int MinSleepDc
    #field int ReducedLatencySleepAc
    #field int ReducedLatencySleepDc
    #field int DozeTimeoutAc
    #field int DozeTimeoutDc
    #field int DozeS4TimeoutAc
    #field int DozeS4TimeoutDc
    #field int MinThrottleAc
    #field int MinThrottleDc
    #field int pad1
    #field int OverThrottledAc
    #field int OverThrottledDc
#endstruct

#defstruct MACHINE_PROCESSOR_POWER_POLICY
    #field int Revision
    #field int ProcessorPolicyAc
    #field int ProcessorPolicyDc
#endstruct

#defstruct MANAGEDAPPLICATION
    #field wstr pszPackageName
    #field wstr pszPublisher
    #field int dwVersionHi
    #field int dwVersionLo
    #field int dwRevision
    #field wstr pszPolicyName
    #field int Language
    #field wstr pszOwner
    #field wstr pszCompany
    #field wstr pszComments
    #field wstr pszContact
    #field wstr pszSupportUrl
    #field int dwPathType
    #field int bInstalled
#endstruct

#defstruct MARGINS
    #field int cxLeftWidth
    #field int cxRightWidth
    #field int cyTopHeight
    #field int cyBottomHeight
#endstruct

#defstruct MAT2
    #field var eM11
    #field var eM12
    #field var eM21
    #field var eM22
#endstruct

#defstruct MEMORYSTATUS
    #field int dwLength
    #field int dwMemoryLoad
    #field int dwTotalPhys
    #field int dwAvailPhys
    #field int dwTotalPageFile
    #field int dwAvailPageFile
    #field int dwTotalVirtual
    #field int dwAvailVirtual
#endstruct

#defstruct MEMORYSTATUSEX
    #field int dwLength
    #field int dwMemoryLoad
    #field int64 ullTotalPhys
    #field int64 ullAvailPhys
    #field int64 ullTotalPageFile
    #field int64 ullAvailPageFile
    #field int64 ullTotalVirtual
    #field int64 ullAvailVirtual
    #field int64 ullAvailExtendedVirtual
#endstruct

#defstruct MENU_EVENT_RECORD
    #field int dwCommandId
#endstruct

#defstruct MENUBARINFO
    #field int cbSize
    #field int rcBar
    #field intptr hMenu
    #field intptr hwndMenu
    #field int _bitfield
#endstruct

#defstruct MENUINFO
    #field int cbSize
    #field int fMask
    #field int dwStyle
    #field int cyMax
    #field intptr hbrBack
    #field int dwContextHelpID
    #field int dwMenuData
#endstruct

#defstruct MENUITEMINFOW
    #field int cbSize
    #field int fMask
    #field int fType
    #field int fState
    #field int wID
    #field intptr hSubMenu
    #field intptr hbmpChecked
    #field intptr hbmpUnchecked
    #field int dwItemData
    #field wstr dwTypeData
    #field int cch
    #field intptr hbmpItem
#endstruct

#defstruct MetafileHeader
    #field int Type
    #field int Size
    #field int Version
    #field int EmfPlusFlags
    #field float DpiX
    #field float DpiY
    #field int X
    #field int Y
    #field int Width
    #field int Height
    #field var Anonymous
    #field int EmfPlusHeaderSize
    #field int LogicalDpiX
    #field int LogicalDpiY
    #field int WmfHeader
    #field var EmfHeader
#endstruct

#defstruct METAFILEPICT
    #field int mm
    #field int xExt
    #field int yExt
    #field intptr hMF
#endstruct

#defstruct METAHEADER
    #field int mtType
    #field int mtHeaderSize
    #field int mtVersion
    #field int mtSize
    #field int mtNoObjects
    #field int mtMaxRecord
    #field int mtNoParameters
#endstruct

#defstruct METARECORD
    #field int rdSize
    #field int rdFunction
#endstruct

#defstruct METHODDATA
    #field wstr szName
    #field var ppdata
    #field int dispid
    #field int iMeth
    #field int cc
    #field int cArgs
    #field int wFlags
    #field int vtReturn
#endstruct

#defstruct MIB_ANYCASTIPADDRESS_ROW
    #field int Address
    #field int InterfaceLuid
    #field int InterfaceIndex
    #field int ScopeId
#endstruct

#defstruct MIB_ANYCASTIPADDRESS_TABLE
    #field int NumEntries
#endstruct

#defstruct MIB_ICMP
    #field int stats
#endstruct

#defstruct MIB_ICMP_EX_XPSP1
    #field int icmpInStats
    #field int icmpOutStats
#endstruct

#defstruct MIB_IF_ROW2
    #field int InterfaceLuid
    #field int InterfaceIndex
    #field int Alias
    #field int Description
    #field int PhysicalAddressLength
    #field int PhysicalAddress
    #field int PermanentPhysicalAddress
    #field int Mtu
    #field int Type
    #field int TunnelType
    #field int MediaType
    #field int PhysicalMediumType
    #field int AccessType
    #field int DirectionType
    #field int InterfaceAndOperStatusFlags
    #field int OperStatus
    #field int AdminStatus
    #field int MediaConnectState
    #field int ConnectionType
    #field int64 TransmitLinkSpeed
    #field int64 ReceiveLinkSpeed
    #field int64 InOctets
    #field int64 InUcastPkts
    #field int64 InNUcastPkts
    #field int64 InDiscards
    #field int64 InErrors
    #field int64 InUnknownProtos
    #field int64 InUcastOctets
    #field int64 InMulticastOctets
    #field int64 InBroadcastOctets
    #field int64 OutOctets
    #field int64 OutUcastPkts
    #field int64 OutNUcastPkts
    #field int64 OutDiscards
    #field int64 OutErrors
    #field int64 OutUcastOctets
    #field int64 OutMulticastOctets
    #field int64 OutBroadcastOctets
    #field int64 OutQLen
    #field int _bitfield
#endstruct

#defstruct _InterfaceAndOperStatusFlags_e__Struct
    #field int _bitfield
#endstruct

#defstruct MIB_IF_TABLE2
    #field int NumEntries
#endstruct

#defstruct MIB_IFROW
    #field int wszName
    #field int dwIndex
    #field int dwType
    #field int dwMtu
    #field int dwSpeed
    #field int dwPhysAddrLen
    #field int bPhysAddr
    #field int dwAdminStatus
    #field int dwOperStatus
    #field int dwLastChange
    #field int dwInOctets
    #field int dwInUcastPkts
    #field int dwInNUcastPkts
    #field int dwInDiscards
    #field int dwInErrors
    #field int dwInUnknownProtos
    #field int dwOutOctets
    #field int dwOutUcastPkts
    #field int dwOutNUcastPkts
    #field int dwOutDiscards
    #field int dwOutErrors
    #field int dwOutQLen
    #field int dwDescrLen
    #field int bDescr
#endstruct

#defstruct MIB_IFSTACK_ROW
    #field int HigherLayerInterfaceIndex
    #field int LowerLayerInterfaceIndex
#endstruct

#defstruct MIB_IFSTACK_TABLE
    #field int NumEntries
#endstruct

#defstruct MIB_IFTABLE
    #field int dwNumEntries
#endstruct

#defstruct MIB_INVERTEDIFSTACK_ROW
    #field int LowerLayerInterfaceIndex
    #field int HigherLayerInterfaceIndex
#endstruct

#defstruct MIB_INVERTEDIFSTACK_TABLE
    #field int NumEntries
#endstruct

#defstruct MIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES
    #field int InboundBandwidthInformation
    #field int OutboundBandwidthInformation
#endstruct

#defstruct MIB_IPADDRROW_XP
    #field int dwAddr
    #field int dwIndex
    #field int dwMask
    #field int dwBCastAddr
    #field int dwReasmSize
    #field int unused1
    #field int wType
#endstruct

#defstruct MIB_IPADDRTABLE
    #field int dwNumEntries
#endstruct

#defstruct MIB_IPFORWARD_ROW2
    #field int InterfaceLuid
    #field int InterfaceIndex
    #field var DestinationPrefix
    #field int NextHop
    #field int SitePrefixLength
    #field int ValidLifetime
    #field int PreferredLifetime
    #field int Metric
    #field int Protocol
    #field int Loopback
    #field int AutoconfigureAddress
    #field int Publish
    #field int Immortal
    #field int Age
    #field int Origin
#endstruct

#defstruct MIB_IPFORWARD_TABLE2
    #field int NumEntries
#endstruct

#defstruct MIB_IPFORWARDROW
    #field int dwForwardDest
    #field int dwForwardMask
    #field int dwForwardPolicy
    #field int dwForwardNextHop
    #field int dwForwardIfIndex
    #field var Anonymous1
    #field var Anonymous2
    #field int dwForwardAge
    #field int dwForwardNextHopAS
    #field int dwForwardMetric1
    #field int dwForwardMetric2
    #field int dwForwardMetric3
    #field int dwForwardMetric4
    #field int dwForwardMetric5
    #field int dwForwardType
    #field int ForwardType
    #field int dwForwardProto
    #field int ForwardProto
#endstruct

#defstruct MIB_IPFORWARDTABLE
    #field int dwNumEntries
#endstruct

#defstruct MIB_IPINTERFACE_ROW
    #field int Family
    #field int InterfaceLuid
    #field int InterfaceIndex
    #field int MaxReassemblySize
    #field int64 InterfaceIdentifier
    #field int MinRouterAdvertisementInterval
    #field int MaxRouterAdvertisementInterval
    #field int AdvertisingEnabled
    #field int ForwardingEnabled
    #field int WeakHostSend
    #field int WeakHostReceive
    #field int UseAutomaticMetric
    #field int UseNeighborUnreachabilityDetection
    #field int ManagedAddressConfigurationSupported
    #field int OtherStatefulConfigurationSupported
    #field int AdvertiseDefaultRoute
    #field int RouterDiscoveryBehavior
    #field int DadTransmits
    #field int BaseReachableTime
    #field int RetransmitTime
    #field int PathMtuDiscoveryTimeout
    #field int LinkLocalAddressBehavior
    #field int LinkLocalAddressTimeout
    #field int ZoneIndices
    #field int SitePrefixLength
    #field int Metric
    #field int NlMtu
    #field int Connected
    #field int SupportsWakeUpPatterns
    #field int SupportsNeighborDiscovery
    #field int SupportsRouterDiscovery
    #field int ReachableTime
    #field int TransmitOffload
    #field int ReceiveOffload
    #field int DisableDefaultRoutes
#endstruct

#defstruct MIB_IPINTERFACE_TABLE
    #field int NumEntries
#endstruct

#defstruct MIB_IPNET_ROW2
    #field int Address
    #field int InterfaceIndex
    #field int InterfaceLuid
    #field int PhysicalAddress
    #field int PhysicalAddressLength
    #field int State
    #field var Anonymous
    #field int ReachabilityTime
    #field var Anonymous
    #field int Flags
    #field int _bitfield
    #field int LastReachable
    #field int LastUnreachable
#endstruct

#defstruct _ReachabilityTime_e__Union
    #field int LastReachable
    #field int LastUnreachable
#endstruct

#defstruct MIB_IPNET_TABLE2
    #field int NumEntries
#endstruct

#defstruct MIB_IPNETROW_LH
    #field int dwIndex
    #field int dwPhysAddrLen
    #field int bPhysAddr
    #field int dwAddr
    #field var Anonymous
    #field int dwType
    #field int Type
#endstruct

#defstruct MIB_IPNETTABLE
    #field int dwNumEntries
#endstruct

#defstruct MIB_IPPATH_ROW
    #field int Source
    #field int Destination
    #field int InterfaceLuid
    #field int InterfaceIndex
    #field int CurrentNextHop
    #field int PathMtu
    #field int RttMean
    #field int RttDeviation
    #field var Anonymous
    #field int IsReachable
    #field int64 LinkTransmitSpeed
    #field int64 LinkReceiveSpeed
    #field int LastReachable
    #field int LastUnreachable
#endstruct

#defstruct MIB_IPPATH_TABLE
    #field int NumEntries
#endstruct

#defstruct MIB_IPSTATS_LH
    #field var Anonymous
    #field int dwDefaultTTL
    #field int dwInReceives
    #field int dwInHdrErrors
    #field int dwInAddrErrors
    #field int dwForwDatagrams
    #field int dwInUnknownProtos
    #field int dwInDiscards
    #field int dwInDelivers
    #field int dwOutRequests
    #field int dwRoutingDiscards
    #field int dwOutDiscards
    #field int dwOutNoRoutes
    #field int dwReasmTimeout
    #field int dwReasmReqds
    #field int dwReasmOks
    #field int dwReasmFails
    #field int dwFragOks
    #field int dwFragFails
    #field int dwFragCreates
    #field int dwNumIf
    #field int dwNumAddr
    #field int dwNumRoutes
    #field int dwForwarding
    #field int Forwarding
#endstruct

#defstruct MIB_MULTICASTIPADDRESS_ROW
    #field int Address
    #field int InterfaceIndex
    #field int InterfaceLuid
    #field int ScopeId
#endstruct

#defstruct MIB_MULTICASTIPADDRESS_TABLE
    #field int NumEntries
#endstruct

#defstruct MIB_TCP6ROW
    #field int State
    #field var LocalAddr
    #field int dwLocalScopeId
    #field int dwLocalPort
    #field var RemoteAddr
    #field int dwRemoteScopeId
    #field int dwRemotePort
#endstruct

#defstruct MIB_TCP6ROW2
    #field var LocalAddr
    #field int dwLocalScopeId
    #field int dwLocalPort
    #field var RemoteAddr
    #field int dwRemoteScopeId
    #field int dwRemotePort
    #field int State
    #field int dwOwningPid
    #field int dwOffloadState
#endstruct

#defstruct MIB_TCP6ROW_OWNER_MODULE
    #field int ucLocalAddr
    #field int dwLocalScopeId
    #field int dwLocalPort
    #field int ucRemoteAddr
    #field int dwRemoteScopeId
    #field int dwRemotePort
    #field int dwOwningPid
    #field int64 liCreateTimestamp
    #field int OwningModuleInfo
#endstruct

#defstruct MIB_TCP6TABLE
    #field int dwNumEntries
#endstruct

#defstruct MIB_TCP6TABLE2
    #field int dwNumEntries
#endstruct

#defstruct MIB_TCPROW2
    #field int dwState
    #field int dwLocalAddr
    #field int dwLocalPort
    #field int dwRemoteAddr
    #field int dwRemotePort
    #field int dwOwningPid
    #field int dwOffloadState
#endstruct

#defstruct MIB_TCPROW_LH
    #field var Anonymous
    #field int dwLocalAddr
    #field int dwLocalPort
    #field int dwRemoteAddr
    #field int dwRemotePort
    #field int State
#endstruct

#defstruct MIB_TCPROW_OWNER_MODULE
    #field int dwLocalAddr
    #field int dwLocalPort
    #field int dwRemoteAddr
    #field int dwRemotePort
    #field int dwOwningPid
    #field int64 liCreateTimestamp
    #field int OwningModuleInfo
#endstruct

#defstruct MIB_TCPSTATS2
    #field int RtoAlgorithm
    #field int dwRtoMin
    #field int dwRtoMax
    #field int dwMaxConn
    #field int dwActiveOpens
    #field int dwPassiveOpens
    #field int dwAttemptFails
    #field int dwEstabResets
    #field int dwCurrEstab
    #field int64 dw64InSegs
    #field int64 dw64OutSegs
    #field int dwRetransSegs
    #field int dwInErrs
    #field int dwOutRsts
    #field int dwNumConns
#endstruct

#defstruct MIB_TCPSTATS_LH
    #field var Anonymous
    #field int dwRtoMin
    #field int dwRtoMax
    #field int dwMaxConn
    #field int dwActiveOpens
    #field int dwPassiveOpens
    #field int dwAttemptFails
    #field int dwEstabResets
    #field int dwCurrEstab
    #field int dwInSegs
    #field int dwOutSegs
    #field int dwRetransSegs
    #field int dwInErrs
    #field int dwOutRsts
    #field int dwNumConns
    #field int dwRtoAlgorithm
    #field int RtoAlgorithm
#endstruct

#defstruct MIB_TCPTABLE
    #field int dwNumEntries
#endstruct

#defstruct MIB_TCPTABLE2
    #field int dwNumEntries
#endstruct

#defstruct MIB_UDP6ROW
    #field var dwLocalAddr
    #field int dwLocalScopeId
    #field int dwLocalPort
#endstruct

#defstruct MIB_UDP6ROW_OWNER_MODULE
    #field int ucLocalAddr
    #field int dwLocalScopeId
    #field int dwLocalPort
    #field int dwOwningPid
    #field int64 liCreateTimestamp
    #field var Anonymous
    #field int OwningModuleInfo
    #field var Anonymous
    #field int dwFlags
    #field int _bitfield
#endstruct

#defstruct MIB_UDP6TABLE
    #field int dwNumEntries
#endstruct

#defstruct MIB_UDPROW
    #field int dwLocalAddr
    #field int dwLocalPort
#endstruct

#defstruct MIB_UDPROW_OWNER_MODULE
    #field int dwLocalAddr
    #field int dwLocalPort
    #field int dwOwningPid
    #field int64 liCreateTimestamp
    #field var Anonymous
    #field int OwningModuleInfo
    #field var Anonymous
    #field int dwFlags
    #field int _bitfield
#endstruct

#defstruct MIB_UDPSTATS
    #field int dwInDatagrams
    #field int dwNoPorts
    #field int dwInErrors
    #field int dwOutDatagrams
    #field int dwNumAddrs
#endstruct

#defstruct MIB_UDPSTATS2
    #field int64 dw64InDatagrams
    #field int dwNoPorts
    #field int dwInErrors
    #field int64 dw64OutDatagrams
    #field int dwNumAddrs
#endstruct

#defstruct MIB_UDPTABLE
    #field int dwNumEntries
#endstruct

#defstruct MIB_UNICASTIPADDRESS_ROW
    #field int Address
    #field int InterfaceLuid
    #field int InterfaceIndex
    #field int PrefixOrigin
    #field int SuffixOrigin
    #field int ValidLifetime
    #field int PreferredLifetime
    #field int OnLinkPrefixLength
    #field int SkipAsSource
    #field int DadState
    #field int ScopeId
    #field int64 CreationTimeStamp
#endstruct

#defstruct MIB_UNICASTIPADDRESS_TABLE
    #field int NumEntries
#endstruct

#defstruct MIBICMPINFO
    #field int icmpInStats
    #field int icmpOutStats
#endstruct

#defstruct MIBICMPSTATS
    #field int dwMsgs
    #field int dwErrors
    #field int dwDestUnreachs
    #field int dwTimeExcds
    #field int dwParmProbs
    #field int dwSrcQuenchs
    #field int dwRedirects
    #field int dwEchos
    #field int dwEchoReps
    #field int dwTimestamps
    #field int dwTimestampReps
    #field int dwAddrMasks
    #field int dwAddrMaskReps
#endstruct

#defstruct MIBICMPSTATS_EX_XPSP1
    #field int dwMsgs
    #field int dwErrors
    #field int rgdwTypeCount
#endstruct

#defstruct MIDIHDR
    #field str lpData
    #field int dwBufferLength
    #field int dwBytesRecorded
    #field int dwUser
    #field int dwFlags
    #field var lpNext
    #field int reserved
    #field int dwOffset
    #field int dwReserved
#endstruct

#defstruct MIDIINCAPSW
    #field int wMid
    #field int wPid
    #field int vDriverVersion
    #field int szPname
    #field int dwSupport
#endstruct

#defstruct MIDIOUTCAPSW
    #field int wMid
    #field int wPid
    #field int vDriverVersion
    #field int szPname
    #field int wTechnology
    #field int wVoices
    #field int wNotes
    #field int wChannelMask
    #field int dwSupport
#endstruct

#defstruct MilMatrix3x2D
    #field double S_11
    #field double S_12
    #field double S_21
    #field double S_22
    #field double DX
    #field double DY
#endstruct

#defstruct MIXERCAPSW
    #field int wMid
    #field int wPid
    #field int vDriverVersion
    #field int szPname
    #field int fdwSupport
    #field int cDestinations
#endstruct

#defstruct MIXERCONTROLDETAILS
    #field int cbStruct
    #field int dwControlID
    #field int cChannels
    #field var Anonymous
    #field int cbDetails
    #field var paDetails
    #field intptr hwndOwner
    #field int cMultipleItems
#endstruct

#defstruct MIXERCONTROLW
    #field int cbStruct
    #field int dwControlID
    #field int dwControlType
    #field int fdwControl
    #field int cMultipleItems
    #field int szShortName
    #field int szName
    #field int Bounds
    #field int Metrics
    #field var Anonymous1
    #field var Anonymous2
    #field int dwReserved
    #field int lMinimum
    #field int lMaximum
    #field int dwMinimum
    #field int dwMaximum
    #field int cSteps
    #field int cbCustomData
    #field int dwReserved
#endstruct

#defstruct _Bounds_e__Union
    #field var Anonymous1
    #field var Anonymous2
    #field int dwReserved
    #field int lMinimum
    #field int lMaximum
    #field int dwMinimum
    #field int dwMaximum
#endstruct

#defstruct _Metrics_e__Union
    #field int cSteps
    #field int cbCustomData
    #field int dwReserved
#endstruct

#defstruct MIXERLINECONTROLSW
    #field int cbStruct
    #field int dwLineID
    #field var Anonymous
    #field int cControls
    #field int cbmxctrl
    #field var pamxctrl
    #field int dwControlID
    #field int dwControlType
#endstruct

#defstruct MIXERLINEW
    #field int cbStruct
    #field int dwDestination
    #field int dwSource
    #field int dwLineID
    #field int fdwLine
    #field int dwUser
    #field int dwComponentType
    #field int cChannels
    #field int cConnections
    #field int cControls
    #field int szShortName
    #field int szName
    #field int Target
    #field int dwType
    #field int dwDeviceID
    #field int wMid
    #field int wPid
    #field int vDriverVersion
    #field int szPname
#endstruct

#defstruct _Target_e__Struct
    #field int dwType
    #field int dwDeviceID
    #field int wMid
    #field int wPid
    #field int vDriverVersion
    #field int szPname
#endstruct

#defstruct MMCKINFO
    #field int ckid
    #field int cksize
    #field int fccType
    #field int dwDataOffset
    #field int dwFlags
#endstruct

#defstruct MMIOINFO
    #field int dwFlags
    #field int fccIOProc
    #field int wErrorRet
    #field intptr htask
    #field int cchBuffer
    #field var pchBuffer
    #field var pchNext
    #field var pchEndRead
    #field var pchEndWrite
    #field int lBufOffset
    #field int lDiskOffset
    #field int adwInfo
    #field int dwReserved1
    #field int dwReserved2
    #field intptr hmmio
#endstruct

#defstruct MMTIME
    #field int wType
    #field var u
    #field int ms
    #field int sample
    #field int cb
    #field int ticks
    #field int smpte
    #field int midi
    #field int hour
    #field int min
    #field int sec
    #field int frame
    #field int fps
    #field int dummy
    #field int pad
    #field int songptrpos
#endstruct

#defstruct _smpte_e__Struct
    #field int hour
    #field int min
    #field int sec
    #field int frame
    #field int fps
    #field int dummy
    #field int pad
#endstruct

#defstruct _midi_e__Struct
    #field int songptrpos
#endstruct

#defstruct MODLOAD_DATA
    #field int ssize
    #field int ssig
    #field var data
    #field int size
    #field int flags
#endstruct

#defstruct MODULEENTRY32
    #field int dwSize
    #field int th32ModuleID
    #field int th32ProcessID
    #field int GlblcntUsage
    #field int ProccntUsage
    #field var modBaseAddr
    #field int modBaseSize
    #field intptr hModule
    #field int szModule
    #field int szExePath
#endstruct

#defstruct MODULEINFO
    #field var lpBaseOfDll
    #field int SizeOfImage
    #field var EntryPoint
#endstruct

#defstruct MONITORINFO
    #field int cbSize
    #field int rcMonitor
    #field int rcWork
    #field int dwFlags
#endstruct

#defstruct MOUSE_EVENT_RECORD
    #field var dwMousePosition
    #field int dwButtonState
    #field int dwControlKeyState
    #field int dwEventFlags
#endstruct

#defstruct MOUSEINPUT
    #field int dx
    #field int dy
    #field int mouseData
    #field int dwFlags
    #field int time
    #field int dwExtraInfo
#endstruct

#defstruct MOUSEMOVEPOINT
    #field int x
    #field int y
    #field int time
    #field int dwExtraInfo
#endstruct

#defstruct MS_ADDINFO_BLOB
    #field int cbStruct
    #field int cbMemObject
    #field var pbMemObject
    #field int cbMemSignedMsg
    #field var pbMemSignedMsg
#endstruct

#defstruct MS_ADDINFO_CATALOGMEMBER
    #field int cbStruct
    #field var pStore
    #field var pMember
#endstruct

#defstruct MS_ADDINFO_FLAT
    #field int cbStruct
    #field var pIndirectData
#endstruct

#defstruct MSG
    #field intptr hwnd
    #field int message
    #field intptr wParam
    #field intptr lParam
    #field int time
#endstruct

#defstruct MSGBOXPARAMSW
    #field int cbSize
    #field intptr hwndOwner
    #field intptr hInstance
    #field wstr lpszText
    #field wstr lpszCaption
    #field int dwStyle
    #field wstr lpszIcon
    #field int dwContextHelpId
    #field int dwLanguageId
#endstruct

#defstruct NDIS_OBJECT_HEADER
    #field int Type
    #field int Revision
    #field int Size
#endstruct

#defstruct NET_ADDRESS_INFO
    #field int Format
    #field var Anonymous
    #field int NamedAddress
    #field int Ipv4Address
    #field int Ipv6Address
    #field int IpAddress
    #field int Address
    #field int Port
#endstruct

#defstruct _NamedAddress_e__Struct
    #field int Address
    #field int Port
#endstruct

#defstruct NET_LUID_LH
    #field int64 Value
    #field int Info
    #field int64 _bitfield
#endstruct

#defstruct _Info_e__Struct
    #field int64 _bitfield
#endstruct

#defstruct NL_BANDWIDTH_INFORMATION
    #field int64 Bandwidth
    #field int64 Instability
    #field int BandwidthPeaked
#endstruct

#defstruct NL_INTERFACE_OFFLOAD_ROD
    #field int _bitfield
#endstruct

#defstruct NL_NETWORK_CONNECTIVITY_HINT
    #field int ConnectivityLevel
    #field int ConnectivityCost
    #field int ApproachingDataLimit
    #field int OverDataLimit
    #field int Roaming
#endstruct

#defstruct NLSVERSIONINFO
    #field int dwNLSVersionInfoSize
    #field int dwNLSVersion
    #field int dwDefinedVersion
    #field int dwEffectiveId
#endstruct

#defstruct NLSVERSIONINFOEX
    #field int dwNLSVersionInfoSize
    #field int dwNLSVersion
    #field int dwDefinedVersion
    #field int dwEffectiveId
#endstruct

#defstruct NSPV2_ROUTINE
    #field int cbSize
    #field int dwMajorVersion
    #field int dwMinorVersion
#endstruct

#defstruct NUMBERFMTW
    #field int NumDigits
    #field int LeadingZero
    #field int Grouping
    #field wstr lpDecimalSep
    #field wstr lpThousandSep
    #field int NegativeOrder
#endstruct

#defstruct NUMPARSE
    #field int cDig
    #field int dwInFlags
    #field int dwOutFlags
    #field int cchUsed
    #field int nBaseShift
    #field int nPwr10
#endstruct

#defstruct OBJECT_TYPE_LIST
    #field int Level
    #field int Sbz
#endstruct

#defstruct OBJECTS_AND_NAME_W
    #field int ObjectsPresent
    #field int ObjectType
    #field wstr ObjectTypeName
    #field wstr InheritedObjectTypeName
    #field wstr ptstrName
#endstruct

#defstruct OBJECTS_AND_SID
    #field int ObjectsPresent
    #field var pSid
#endstruct

#defstruct OCPFIPARAMS
    #field int cbStructSize
    #field intptr hWndOwner
    #field int x
    #field int y
    #field wstr lpszCaption
    #field int cObjects
    #field var lplpUnk
    #field int cPages
    #field int lcid
    #field int dispidInitialProperty
#endstruct

#defstruct OFSTRUCT
    #field int cBytes
    #field int fFixedDisk
    #field int nErrCode
    #field int Reserved1
    #field int Reserved2
    #field int szPathName
#endstruct

#defstruct OLEINPLACEFRAMEINFO
    #field int cb
    #field int fMDIApp
    #field intptr hwndFrame
    #field intptr haccel
    #field int cAccelEntries
#endstruct

#defstruct OLEMENUGROUPWIDTHS
    #field int width
#endstruct

#defstruct OLESTREAM
    #field var lpstbl
#endstruct

#defstruct OLESTREAMVTBL
    #field int Get
    #field int Put
#endstruct

#defstruct OLEVERB
    #field int lVerb
    #field wstr lpszVerbName
    #field int fuFlags
#endstruct

#defstruct OMAP
    #field int rva
    #field int rvaTo
#endstruct

#defstruct OPENASINFO
    #field wstr pcszFile
    #field wstr pcszClass
    #field int oaifInFlags
#endstruct

#defstruct OPERATION_END_PARAMETERS
    #field int Version
    #field int OperationId
    #field int Flags
#endstruct

#defstruct OPERATION_START_PARAMETERS
    #field int Version
    #field int OperationId
    #field int Flags
#endstruct

#defstruct OSVERSIONINFOEXW
    #field int dwOSVersionInfoSize
    #field int dwMajorVersion
    #field int dwMinorVersion
    #field int dwBuildNumber
    #field int dwPlatformId
    #field int szCSDVersion
    #field int wServicePackMajor
    #field int wServicePackMinor
    #field int wSuiteMask
    #field int wProductType
    #field int wReserved
#endstruct

#defstruct OSVERSIONINFOW
    #field int dwOSVersionInfoSize
    #field int dwMajorVersion
    #field int dwMinorVersion
    #field int dwBuildNumber
    #field int dwPlatformId
    #field int szCSDVersion
#endstruct

#defstruct OUTLINETEXTMETRICW
    #field int otmSize
    #field int otmTextMetrics
    #field int otmFiller
    #field int otmPanoseNumber
    #field int otmfsSelection
    #field int otmfsType
    #field int otmsCharSlopeRise
    #field int otmsCharSlopeRun
    #field int otmItalicAngle
    #field int otmEMSquare
    #field int otmAscent
    #field int otmDescent
    #field int otmLineGap
    #field int otmsCapEmHeight
    #field int otmsXHeight
    #field int otmrcFontBox
    #field int otmMacAscent
    #field int otmMacDescent
    #field int otmMacLineGap
    #field int otmusMinimumPPEM
    #field int otmsStrikeoutSize
    #field int otmsStrikeoutPosition
    #field int otmsUnderscoreSize
    #field int otmsUnderscorePosition
    #field str otmpFamilyName
    #field str otmpFaceName
    #field str otmpStyleName
    #field str otmpFullName
#endstruct

#defstruct OUTPUT_DEBUG_STRING_INFO
    #field str lpDebugStringData
    #field int fUnicode
    #field int nDebugStringLength
#endstruct

#defstruct OVERLAPPED_ENTRY
    #field int lpCompletionKey
    #field int Internal
    #field int dwNumberOfBytesTransferred
#endstruct

#defstruct PAINTSTRUCT
    #field intptr hdc
    #field int fErase
    #field int rcPaint
    #field int fRestore
    #field int fIncUpdate
    #field int rgbReserved
#endstruct

#defstruct PALETTEENTRY
    #field int peRed
    #field int peGreen
    #field int peBlue
    #field int peFlags
#endstruct

#defstruct PANOSE
    #field int bFamilyType
    #field int bSerifStyle
    #field int bWeight
    #field int bProportion
    #field int bContrast
    #field int bStrokeVariation
    #field int bArmStyle
    #field int bLetterform
    #field int bMidline
    #field int bXHeight
#endstruct

#defstruct PARAMDATA
    #field wstr szName
    #field int vt
#endstruct

#defstruct PARAMDESC
    #field var pparamdescex
    #field int wParamFlags
#endstruct

#defstruct PARAMDESCEX
    #field int cBytes
    #field int varDefaultValue
#endstruct

#defstruct PATHDATA
    #field int flags
    #field int count
    #field var pptfx
#endstruct

#defstruct PATHOBJ
    #field int fl
    #field int cCurves
#endstruct

#defstruct PERF_COUNTER_IDENTIFIER
    #field int Status
    #field int Size
    #field int CounterId
    #field int InstanceId
    #field int Index
    #field int Reserved
#endstruct

#defstruct PERF_DATA_HEADER
    #field int dwTotalSize
    #field int dwNumCounters
    #field int64 PerfTimeStamp
    #field int64 PerfTime100NSec
    #field int64 PerfFreq
    #field int SystemTime
#endstruct

#defstruct PERF_INSTANCE_HEADER
    #field int Size
    #field int InstanceId
#endstruct

#defstruct PERFORMANCE_DATA
    #field int Size
    #field int Version
    #field int HwCountersCount
    #field int ContextSwitchCount
    #field int64 WaitReasonBitMap
    #field int64 CycleTime
    #field int RetryCount
    #field int Reserved
    #field int HwCounters
#endstruct

#defstruct PERFORMANCE_INFORMATION
    #field int cb
    #field int CommitTotal
    #field int CommitLimit
    #field int CommitPeak
    #field int PhysicalTotal
    #field int PhysicalAvailable
    #field int SystemCache
    #field int KernelTotal
    #field int KernelPaged
    #field int KernelNonpaged
    #field int PageSize
    #field int HandleCount
    #field int ProcessCount
    #field int ThreadCount
#endstruct

#defstruct PF_FILTER_DESCRIPTOR
    #field int dwFilterFlags
    #field int dwRule
    #field int pfatType
    #field var SrcAddr
    #field var SrcMask
    #field var DstAddr
    #field var DstMask
    #field int dwProtocol
    #field int fLateBound
    #field int wSrcPort
    #field int wDstPort
    #field int wSrcPortHighRange
    #field int wDstPortHighRange
#endstruct

#defstruct PF_FILTER_STATS
    #field int dwNumPacketsFiltered
    #field var info
#endstruct

#defstruct PF_INTERFACE_STATS
    #field var pvDriverContext
    #field int dwFlags
    #field int dwInDrops
    #field int dwOutDrops
    #field int eaInAction
    #field int eaOutAction
    #field int dwNumInFilters
    #field int dwNumOutFilters
    #field int dwFrag
    #field int dwSpoof
    #field int dwReserved1
    #field int dwReserved2
    #field int64 liSYN
    #field int64 liTotalLogged
    #field int dwLostLogEntries
#endstruct

#defstruct PF_LATEBIND_INFO
    #field var SrcAddr
    #field var DstAddr
    #field var Mask
#endstruct

#defstruct PICTDESC
    #field int cbSizeofstruct
    #field var Anonymous
    #field int bmp
    #field int wmf
    #field int icon
    #field int emf
    #field intptr hbitmap
    #field intptr hpal
    #field intptr hmeta
    #field int xExt
    #field int yExt
    #field intptr hicon
    #field intptr hemf
#endstruct

#defstruct _bmp_e__Struct
    #field intptr hbitmap
    #field intptr hpal
#endstruct

#defstruct _wmf_e__Struct
    #field intptr hmeta
    #field int xExt
    #field int yExt
#endstruct

#defstruct _icon_e__Struct
    #field intptr hicon
#endstruct

#defstruct _emf_e__Struct
    #field intptr hemf
#endstruct

#defstruct PIXELFORMATDESCRIPTOR
    #field int nSize
    #field int nVersion
    #field int dwFlags
    #field int iPixelType
    #field int cColorBits
    #field int cRedBits
    #field int cRedShift
    #field int cGreenBits
    #field int cGreenShift
    #field int cBlueBits
    #field int cBlueShift
    #field int cAlphaBits
    #field int cAlphaShift
    #field int cAccumBits
    #field int cAccumRedBits
    #field int cAccumGreenBits
    #field int cAccumBlueBits
    #field int cAccumAlphaBits
    #field int cDepthBits
    #field int cStencilBits
    #field int cAuxBuffers
    #field int bReserved
    #field int dwLayerMask
    #field int dwVisibleMask
    #field int dwDamageMask
#endstruct

#defstruct Point
    #field int X
    #field int Y
#endstruct

#defstruct POINTER_DEVICE_CURSOR_INFO
    #field int cursorId
    #field int cursor
#endstruct

#defstruct POINTER_DEVICE_INFO
    #field int displayOrientation
    #field intptr device
    #field int pointerDeviceType
    #field intptr monitor
    #field int startingCursorId
    #field int maxActiveContacts
    #field int productString
#endstruct

#defstruct POINTER_DEVICE_PROPERTY
    #field int logicalMin
    #field int logicalMax
    #field int physicalMin
    #field int physicalMax
    #field int unit
    #field int unitExponent
    #field int usagePageId
    #field int usageId
#endstruct

#defstruct POINTER_INFO
    #field int pointerType
    #field int pointerId
    #field int frameId
    #field int pointerFlags
    #field intptr sourceDevice
    #field intptr hwndTarget
    #field int dwTime
    #field int historyCount
    #field int InputData
    #field int dwKeyStates
    #field int64 PerformanceCount
    #field int ButtonChangeType
#endstruct

#defstruct POINTER_PEN_INFO
    #field var pointerInfo
    #field int penFlags
    #field int penMask
    #field int pressure
    #field int rotation
    #field int tiltX
    #field int tiltY
#endstruct

#defstruct POINTER_TOUCH_INFO
    #field var pointerInfo
    #field int touchFlags
    #field int touchMask
    #field int rcContact
    #field int rcContactRaw
    #field int orientation
    #field int pressure
#endstruct

#defstruct POINTER_TYPE_INFO
    #field int type
    #field var Anonymous
    #field var touchInfo
    #field var penInfo
#endstruct

#defstruct PointF
    #field float X
    #field float Y
#endstruct

#defstruct POINTFIX
    #field int x
    #field int y
#endstruct

#defstruct POINTFLOAT
    #field float x
    #field float y
#endstruct

#defstruct POINTL
    #field int x
    #field int y
#endstruct

#defstruct POINTQF
    #field int64 x
    #field int64 y
#endstruct

#defstruct POINTS
    #field int x
    #field int y
#endstruct

#defstruct POLICY_AUDIT_SID_ARRAY
    #field int UsersCount
    #field var UserSidArray
#endstruct

#defstruct POLICYSETTINGSTATUSINFO
    #field wstr szKey
    #field wstr szEventSource
    #field wstr szEventLogName
    #field int dwEventID
    #field int dwErrorCode
    #field int status
    #field int timeLogged
#endstruct

#defstruct POLYTEXTW
    #field int x
    #field int y
    #field int n
    #field wstr lpstr
    #field int uiFlags
    #field int rcl
    #field var pdx
#endstruct

#defstruct POWER_ACTION_POLICY
    #field int Action
    #field int Flags
    #field int EventCode
#endstruct

#defstruct POWER_POLICY
    #field int user
    #field var mach
#endstruct

#defstruct PRIVILEGE_SET
    #field int PrivilegeCount
    #field int Control
#endstruct

#defstruct PROC
    #field int Value
#endstruct

#defstruct PROCESS_HEAP_ENTRY
    #field var lpData
    #field int cbData
    #field int cbOverhead
    #field int iRegionIndex
    #field int wFlags
    #field var Anonymous
    #field int Block
    #field int Region
    #field intptr hMem
    #field int dwReserved
    #field int dwCommittedSize
    #field int dwUnCommittedSize
    #field var lpFirstBlock
    #field var lpLastBlock
#endstruct

#defstruct _Block_e__Struct
    #field intptr hMem
    #field int dwReserved
#endstruct

#defstruct _Region_e__Struct
    #field int dwCommittedSize
    #field int dwUnCommittedSize
    #field var lpFirstBlock
    #field var lpLastBlock
#endstruct

#defstruct PROCESS_INFORMATION
    #field intptr hProcess
    #field intptr hThread
    #field int dwProcessId
    #field int dwThreadId
#endstruct

#defstruct PROCESS_MEMORY_COUNTERS
    #field int cb
    #field int PageFaultCount
    #field int PeakWorkingSetSize
    #field int WorkingSetSize
    #field int QuotaPeakPagedPoolUsage
    #field int QuotaPagedPoolUsage
    #field int QuotaPeakNonPagedPoolUsage
    #field int QuotaNonPagedPoolUsage
    #field int PagefileUsage
    #field int PeakPagefileUsage
#endstruct

#defstruct PROCESSENTRY32
    #field int dwSize
    #field int cntUsage
    #field int th32ProcessID
    #field int th32DefaultHeapID
    #field int th32ModuleID
    #field int cntThreads
    #field int th32ParentProcessID
    #field int pcPriClassBase
    #field int dwFlags
    #field int szExeFile
#endstruct

#defstruct PROCESSOR_NUMBER
    #field int Group
    #field int Number
    #field int Reserved
#endstruct

#defstruct PROCESSOR_POWER_POLICY
    #field int Revision
    #field int DynamicThrottle
    #field int Spare
    #field int _bitfield
    #field int PolicyCount
    #field int Policy
#endstruct

#defstruct PROCESSOR_POWER_POLICY_INFO
    #field int TimeCheck
    #field int DemoteLimit
    #field int PromoteLimit
    #field int DemotePercent
    #field int PromotePercent
    #field int Spare
    #field int _bitfield
#endstruct

#defstruct PROFILEINFOW
    #field int dwSize
    #field int dwFlags
    #field wstr lpUserName
    #field wstr lpProfilePath
    #field wstr lpDefaultPath
    #field wstr lpServerName
    #field wstr lpPolicyPath
    #field intptr hProfile
#endstruct

#defstruct PROPBAG2
    #field int dwType
    #field int vt
    #field int cfType
    #field int dwHint
    #field wstr pstrName
#endstruct

#defstruct PropertyItem
    #field int id
    #field int length
    #field int type
    #field var value
#endstruct

#defstruct PROPERTYKEY
    #field int pid
#endstruct

#defstruct PROPSHEETHEADERW_V2
    #field int dwSize
    #field int dwFlags
    #field intptr hwndParent
    #field intptr hInstance
    #field var Anonymous1
    #field wstr pszCaption
    #field int nPages
    #field var Anonymous2
    #field var Anonymous3
    #field var Anonymous4
    #field intptr hplWatermark
    #field var Anonymous5
    #field intptr hIcon
    #field wstr pszIcon
    #field int nStartPage
    #field wstr pStartPage
    #field var ppsp
    #field var phpage
    #field intptr hbmWatermark
    #field wstr pszbmWatermark
    #field intptr hbmHeader
    #field wstr pszbmHeader
#endstruct

#defstruct PROPSHEETPAGEW
    #field int dwSize
    #field int dwFlags
    #field intptr hInstance
    #field var Anonymous1
    #field var Anonymous2
    #field wstr pszTitle
    #field intptr lParam
    #field var pcRefParent
    #field wstr pszHeaderTitle
    #field wstr pszHeaderSubTitle
    #field intptr hActCtx
    #field var Anonymous3
    #field wstr pszTemplate
    #field var pResource
    #field intptr hIcon
    #field wstr pszIcon
    #field intptr hbmHeader
    #field wstr pszbmHeader
#endstruct

#defstruct PROPSPEC
    #field int ulKind
    #field var Anonymous
    #field int propid
    #field wstr lpwstr
#endstruct

#defstruct PROPVARIANT
    #field var Anonymous
    #field var Anonymous
    #field var decVal
    #field int vt
    #field int wReserved1
    #field int wReserved2
    #field int wReserved3
    #field var Anonymous
    #field int cVal
    #field int bVal
    #field int iVal
    #field int uiVal
    #field int lVal
    #field int ulVal
    #field int intVal
    #field int uintVal
    #field int64 hVal
    #field int64 uhVal
    #field float fltVal
    #field double dblVal
    #field int boolVal
    #field int __OBSOLETE__VARIANT_BOOL
    #field int scode
    #field var cyVal
    #field double date
    #field var pclipdata
    #field int bstrVal
    #field var bstrblobVal
    #field var blob
    #field str pszVal
    #field wstr pwszVal
    #field var punkVal
    #field var pdispVal
    #field var pStream
    #field var pStorage
    #field var pVersionedStream
    #field var parray
    #field var cac
    #field var caub
    #field var cai
    #field var caui
    #field var cal
    #field var caul
    #field var cah
    #field var cauh
    #field var caflt
    #field var cadbl
    #field var cabool
    #field var cascode
    #field var cacy
    #field var cadate
    #field var cafiletime
    #field var cauuid
    #field var caclipdata
    #field var cabstr
    #field var cabstrblob
    #field var calpstr
    #field var calpwstr
    #field var capropvar
    #field str pcVal
    #field var pbVal
    #field var piVal
    #field var puiVal
    #field var plVal
    #field var pulVal
    #field var pintVal
    #field var puintVal
    #field var pfltVal
    #field var pdblVal
    #field var pboolVal
    #field var pdecVal
    #field var pscode
    #field var pcyVal
    #field var pdate
    #field var pbstrVal
    #field var ppunkVal
    #field var ppdispVal
    #field var pparray
    #field var pvarVal
#endstruct

#defstruct PROTOCOLDATA
    #field int grfFlags
    #field int dwState
    #field var pData
    #field int cbData
#endstruct

#defstruct PSAPI_WS_WATCH_INFORMATION
    #field var FaultingPc
    #field var FaultingVa
#endstruct

#defstruct PSAPI_WS_WATCH_INFORMATION_EX
    #field var BasicInfo
    #field int FaultingThreadId
    #field int Flags
#endstruct

#defstruct PUBLICKEYSTRUC
    #field int bType
    #field int bVersion
    #field int reserved
    #field int aiKeyAlg
#endstruct

#defstruct PWMFRect16
    #field int Left
    #field int Top
    #field int Right
    #field int Bottom
#endstruct

#defstruct QOS
    #field var SendingFlowspec
    #field var ReceivingFlowspec
    #field int ProviderSpecific
#endstruct

#defstruct QUERY_SERVICE_CONFIGW
    #field int dwServiceType
    #field int dwStartType
    #field int dwErrorControl
    #field wstr lpBinaryPathName
    #field wstr lpLoadOrderGroup
    #field int dwTagId
    #field wstr lpDependencies
    #field wstr lpServiceStartName
    #field wstr lpDisplayName
#endstruct

#defstruct QUERY_SERVICE_LOCK_STATUSW
    #field int fIsLocked
    #field wstr lpLockOwner
    #field int dwLockDuration
#endstruct

#defstruct QUERYCONTEXT
    #field int dwContext
    #field var Platform
    #field int Locale
    #field int dwVersionHi
    #field int dwVersionLo
#endstruct

#defstruct QUOTA_LIMITS
    #field int PagedPoolLimit
    #field int NonPagedPoolLimit
    #field int MinimumWorkingSetSize
    #field int MaximumWorkingSetSize
    #field int PagefileLimit
    #field int64 TimeLimit
#endstruct

#defstruct RASTERIZER_STATUS
    #field int nSize
    #field int wFlags
    #field int nLanguageID
#endstruct

#defstruct RAWHID
    #field int dwSizeHid
    #field int dwCount
#endstruct

#defstruct RAWINPUT
    #field int header
    #field int data
    #field int mouse
    #field int keyboard
    #field var hid
#endstruct

#defstruct _data_e__Union
    #field int mouse
    #field int keyboard
    #field var hid
#endstruct

#defstruct RAWINPUTDEVICE
    #field int usUsagePage
    #field int usUsage
    #field int dwFlags
    #field intptr hwndTarget
#endstruct

#defstruct RAWINPUTDEVICELIST
    #field intptr hDevice
    #field int dwType
#endstruct

#defstruct RAWINPUTHEADER
    #field int dwType
    #field int dwSize
    #field intptr hDevice
    #field intptr wParam
#endstruct

#defstruct RAWKEYBOARD
    #field int MakeCode
    #field int Flags
    #field int Reserved
    #field int VKey
    #field int Message
    #field int ExtraInformation
#endstruct

#defstruct RAWMOUSE
    #field int usFlags
    #field var Anonymous
    #field int ulRawButtons
    #field int lLastX
    #field int lLastY
    #field int ulExtraInformation
    #field int ulButtons
    #field var Anonymous
    #field int usButtonFlags
    #field int usButtonData
#endstruct

#defstruct REASON_CONTEXT
    #field int Version
    #field int Flags
    #field int Reason
    #field int Detailed
    #field wstr SimpleReasonString
    #field intptr LocalizedReasonModule
    #field int LocalizedReasonId
    #field int ReasonStringCount
    #field var ReasonStrings
#endstruct

#defstruct _Reason_e__Union
    #field int Detailed
    #field wstr SimpleReasonString
    #field intptr LocalizedReasonModule
    #field int LocalizedReasonId
    #field int ReasonStringCount
    #field var ReasonStrings
#endstruct

#defstruct _Detailed_e__Struct
    #field intptr LocalizedReasonModule
    #field int LocalizedReasonId
    #field int ReasonStringCount
    #field var ReasonStrings
#endstruct

#defstruct RECT
    #field int left
    #field int top
    #field int right
    #field int bottom
#endstruct

#defstruct Rect
    #field int X
    #field int Y
    #field int Width
    #field int Height
#endstruct

#defstruct RectF
    #field float X
    #field float Y
    #field float Width
    #field float Height
#endstruct

#defstruct RECTFX
    #field int xLeft
    #field int yTop
    #field int xRight
    #field int yBottom
#endstruct

#defstruct RECTL
    #field int left
    #field int top
    #field int right
    #field int bottom
#endstruct

#defstruct RGBQUAD
    #field int rgbBlue
    #field int rgbGreen
    #field int rgbRed
    #field int rgbReserved
#endstruct

#defstruct RGBTRIPLE
    #field int rgbtBlue
    #field int rgbtGreen
    #field int rgbtRed
#endstruct

#defstruct RGNDATA
    #field int rdh
#endstruct

#defstruct RGNDATAHEADER
    #field int dwSize
    #field int iType
    #field int nCount
    #field int nRgnSize
    #field var rcBound
#endstruct

#defstruct RIP_INFO
    #field int dwError
    #field int dwType
#endstruct

#defstruct RUN
    #field int iStart
    #field int iStop
#endstruct

#defstruct SAFEARRAY
    #field int cDims
    #field int fFeatures
    #field int cbElements
    #field int cLocks
    #field var pvData
#endstruct

#defstruct SAFEARRAYBOUND
    #field int cElements
    #field int lLbound
#endstruct

#defstruct SAFER_CODE_PROPERTIES_V2
    #field int cbSize
    #field int dwCheckFlags
    #field wstr ImagePath
    #field intptr hImageFileHandle
    #field int UrlZoneId
    #field int ImageHash
    #field int dwImageHashSize
    #field int64 ImageSize
    #field int HashAlgorithm
    #field var pByteBlock
    #field intptr hWndParent
    #field int dwWVTUIChoice
    #field wstr PackageMoniker
    #field wstr PackagePublisher
    #field wstr PackageName
    #field int64 PackageVersion
    #field int PackageIsFramework
#endstruct

#defstruct SAMPR_ENCRYPTED_USER_PASSWORD
    #field int Buffer
#endstruct

#defstruct SCOPE_ID
    #field var Anonymous
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct SCROLLBARINFO
    #field int cbSize
    #field var rcScrollBar
    #field int dxyLineButton
    #field int xyThumbTop
    #field int xyThumbBottom
    #field int reserved
    #field int rgstate
#endstruct

#defstruct SCROLLINFO
    #field int cbSize
    #field int fMask
    #field int nMin
    #field int nMax
    #field int nPage
    #field int nPos
    #field int nTrackPos
#endstruct

#defstruct SEC_CHANNEL_BINDINGS
    #field int dwInitiatorAddrType
    #field int cbInitiatorLength
    #field int dwInitiatorOffset
    #field int dwAcceptorAddrType
    #field int cbAcceptorLength
    #field int dwAcceptorOffset
    #field int cbApplicationDataLength
    #field int dwApplicationDataOffset
#endstruct

#defstruct SecPkgContext_Bindings
    #field int BindingsLength
    #field var Bindings
#endstruct

#defstruct SecPkgContext_CipherInfo
    #field int dwVersion
    #field int dwProtocol
    #field int dwCipherSuite
    #field int dwBaseCipherSuite
    #field int szCipherSuite
    #field int szCipher
    #field int dwCipherLen
    #field int dwCipherBlockLen
    #field int szHash
    #field int dwHashLen
    #field int szExchange
    #field int dwMinExchangeLen
    #field int dwMaxExchangeLen
    #field int szCertificate
    #field int dwKeyType
#endstruct

#defstruct SecPkgContext_ConnectionInfo
    #field int dwProtocol
    #field int aiCipher
    #field int dwCipherStrength
    #field int aiHash
    #field int dwHashStrength
    #field int aiExch
    #field int dwExchStrength
#endstruct

#defstruct SECURITY_ATTRIBUTES
    #field int nLength
    #field var lpSecurityDescriptor
    #field int bInheritHandle
#endstruct

#defstruct SECURITY_QUALITY_OF_SERVICE
    #field int Length
    #field int ImpersonationLevel
    #field int ContextTrackingMode
    #field int EffectiveOnly
#endstruct

#defstruct SERIALIZEDPROPERTYVALUE
    #field int dwType
#endstruct

#defstruct SERVICE_NOTIFY_2W
    #field int dwVersion
    #field var pContext
    #field int dwNotificationStatus
    #field int ServiceStatus
    #field int dwNotificationTriggered
    #field wstr pszServiceNames
#endstruct

#defstruct SERVICE_STATUS
    #field int dwServiceType
    #field int dwCurrentState
    #field int dwControlsAccepted
    #field int dwWin32ExitCode
    #field int dwServiceSpecificExitCode
    #field int dwCheckPoint
    #field int dwWaitHint
#endstruct

#defstruct SERVICE_STATUS_PROCESS
    #field int dwServiceType
    #field int dwCurrentState
    #field int dwControlsAccepted
    #field int dwWin32ExitCode
    #field int dwServiceSpecificExitCode
    #field int dwCheckPoint
    #field int dwWaitHint
    #field int dwProcessId
    #field int dwServiceFlags
#endstruct

#defstruct SERVICE_TABLE_ENTRYW
    #field wstr lpServiceName
#endstruct

#defstruct SHChangeNotifyEntry
    #field var pidl
    #field int fRecursive
#endstruct

#defstruct SHELLFLAGSTATE
    #field int _bitfield
#endstruct

#defstruct SHELLSTATEA
    #field int _bitfield1
    #field int dwWin95Unused
    #field int uWin95Unused
    #field int lParamSort
    #field int iSortDirection
    #field int version
    #field int uNotUsed
    #field int _bitfield2
#endstruct

#defstruct SHFOLDERCUSTOMSETTINGS
    #field int dwSize
    #field int dwMask
    #field wstr pszWebViewTemplate
    #field int cchWebViewTemplate
    #field wstr pszWebViewTemplateVersion
    #field wstr pszInfoTip
    #field int cchInfoTip
    #field int dwFlags
    #field wstr pszIconFile
    #field int cchIconFile
    #field int iIconIndex
    #field wstr pszLogo
    #field int cchLogo
#endstruct

#defstruct SHITEMID
    #field int cb
#endstruct

#defstruct SID
    #field int Revision
    #field int SubAuthorityCount
    #field int IdentifierAuthority
#endstruct

#defstruct SID_AND_ATTRIBUTES
    #field int Sid
    #field int Attributes
#endstruct

#defstruct SID_IDENTIFIER_AUTHORITY
    #field int Value
#endstruct

#defstruct SIP_ADD_NEWPROVIDER
    #field int cbStruct
    #field wstr pwszDLLFileName
    #field wstr pwszMagicNumber
    #field wstr pwszIsFunctionName
    #field wstr pwszGetFuncName
    #field wstr pwszPutFuncName
    #field wstr pwszCreateFuncName
    #field wstr pwszVerifyFuncName
    #field wstr pwszRemoveFuncName
    #field wstr pwszIsFunctionNameFmt2
    #field wstr pwszGetCapFuncName
#endstruct

#defstruct SIP_CAP_SET_V3
    #field int cbSize
    #field int dwVersion
    #field int isMultiSign
    #field var Anonymous
    #field int dwFlags
    #field int dwReserved
#endstruct

#defstruct SIP_DISPATCH_INFO
    #field int cbSize
    #field intptr hSIP
#endstruct

#defstruct SIP_INDIRECT_DATA
    #field var Data
    #field var DigestAlgorithm
    #field var Digest
#endstruct

#defstruct SIP_SUBJECTINFO
    #field int cbSize
    #field intptr hFile
    #field wstr pwsFileName
    #field wstr pwsDisplayName
    #field int dwReserved1
    #field int dwIntVersion
    #field int hProv
    #field var DigestAlgorithm
    #field int dwFlags
    #field int dwEncodingType
    #field int dwReserved2
    #field int fdwCAPISettings
    #field int fdwSecuritySettings
    #field int dwIndex
    #field int dwUnionChoice
    #field var Anonymous
    #field var pClientData
    #field var psFlat
    #field var psCatMember
    #field var psBlob
#endstruct

#defstruct SIZE
    #field int cx
    #field int cy
#endstruct

#defstruct SMALL_RECT
    #field int Left
    #field int Top
    #field int Right
    #field int Bottom
#endstruct

#defstruct SOCKADDR
    #field int sa_family
    #field int sa_data
#endstruct

#defstruct SOCKADDR_IN
    #field int sin_family
    #field int sin_port
    #field var sin_addr
    #field int sin_zero
#endstruct

#defstruct SOCKADDR_IN6
    #field int sin6_family
    #field int sin6_port
    #field int sin6_flowinfo
    #field var sin6_addr
    #field var Anonymous
    #field int sin6_scope_id
    #field var sin6_scope_struct
#endstruct

#defstruct SOCKADDR_IN6_PAIR
    #field var SourceAddress
    #field var DestinationAddress
#endstruct

#defstruct SOCKADDR_INET
    #field var Ipv4
    #field var Ipv6
    #field int si_family
#endstruct

#defstruct SOCKET_ADDRESS
    #field var lpSockaddr
    #field int iSockaddrLength
#endstruct

#defstruct SOCKET_ADDRESS_LIST
    #field int iAddressCount
#endstruct

#defstruct SOFTDISTINFO
    #field int cbSize
    #field int dwFlags
    #field int dwAdState
    #field wstr szTitle
    #field wstr szAbstract
    #field wstr szHREF
    #field int dwInstalledVersionMS
    #field int dwInstalledVersionLS
    #field int dwUpdateVersionMS
    #field int dwUpdateVersionLS
    #field int dwAdvertisedVersionMS
    #field int dwAdvertisedVersionLS
    #field int dwReserved
#endstruct

#defstruct SOURCEFILE
    #field int64 ModBase
    #field str FileName
#endstruct

#defstruct SRCCODEINFO
    #field int SizeOfStruct
    #field var Key
    #field int64 ModBase
    #field int Obj
    #field int FileName
    #field int LineNumber
    #field int64 Address
#endstruct

#defstruct STACKFRAME64
    #field var AddrPC
    #field var AddrReturn
    #field var AddrFrame
    #field var AddrStack
    #field var AddrBStore
    #field var FuncTableEntry
    #field int Params
    #field int Far
    #field int Virtual
    #field int Reserved
    #field var KdHelp
#endstruct

#defstruct STACKFRAME_EX
    #field var AddrPC
    #field var AddrReturn
    #field var AddrFrame
    #field var AddrStack
    #field var AddrBStore
    #field var FuncTableEntry
    #field int Params
    #field int Far
    #field int Virtual
    #field int Reserved
    #field var KdHelp
    #field int StackFrameSize
    #field int InlineFrameContext
#endstruct

#defstruct STARTUPINFOW
    #field int cb
    #field wstr lpReserved
    #field wstr lpDesktop
    #field wstr lpTitle
    #field int dwX
    #field int dwY
    #field int dwXSize
    #field int dwYSize
    #field int dwXCountChars
    #field int dwYCountChars
    #field int dwFillAttribute
    #field int dwFlags
    #field int wShowWindow
    #field int cbReserved2
    #field var lpReserved2
    #field intptr hStdInput
    #field intptr hStdOutput
    #field intptr hStdError
#endstruct

#defstruct STATDATA
    #field var formatetc
    #field int advf
    #field var pAdvSink
    #field int dwConnection
#endstruct

#defstruct STATPROPSETSTG
    #field int grfFlags
    #field int dwOSVersion
#endstruct

#defstruct STATPROPSTG
    #field wstr lpwstrName
    #field int propid
    #field int vt
#endstruct

#defstruct STATSTG
    #field wstr pwcsName
    #field int type
    #field int64 cbSize
    #field int grfMode
    #field int grfStateBits
    #field int reserved
#endstruct

#defstruct STGMEDIUM
    #field var u
    #field var pUnkForRelease
    #field intptr hBitmap
    #field var hMetaFilePict
    #field intptr hEnhMetaFile
    #field int hGlobal
    #field wstr lpszFileName
    #field var pstm
    #field var pstg
#endstruct

#defstruct STGOPTIONS
    #field int usVersion
    #field int reserved
    #field int ulSectorSize
    #field wstr pwcsTemplateFile
#endstruct

#defstruct STROBJ
    #field int cGlyphs
    #field int flAccel
    #field int ulCharInc
    #field var rclBkGround
    #field var pgp
    #field wstr pwszOrg
#endstruct

#defstruct STRRET
    #field int uType
    #field var Anonymous
    #field wstr pOleStr
    #field int uOffset
    #field int cStr
#endstruct

#defstruct STYLEBUFW
    #field int dwStyle
    #field int szDescription
#endstruct

#defstruct SURFOBJ
    #field intptr dhsurf
    #field intptr hsurf
    #field intptr dhpdev
    #field intptr hdev
    #field var sizlBitmap
    #field int cjBits
    #field var pvBits
    #field var pvScan0
    #field int lDelta
    #field int iUniq
    #field int iBitmapFormat
    #field int iType
    #field int fjBitmap
#endstruct

#defstruct SYMBOL_INFO
    #field int SizeOfStruct
    #field int TypeIndex
    #field int Reserved
    #field int Index
    #field int Size
    #field int64 ModBase
    #field int Flags
    #field int64 Value
    #field int64 Address
    #field int Register
    #field int Scope
    #field int Tag
    #field int NameLen
    #field int MaxNameLen
#endstruct

#defstruct SYMSRV_INDEX_INFO
    #field int sizeofstruct
    #field int file
    #field int stripped
    #field int timestamp
    #field int size
    #field int dbgfile
    #field int pdbfile
    #field int sig
    #field int age
#endstruct

#defstruct SYNCHRONIZATION_BARRIER
    #field int Reserved1
    #field int Reserved2
    #field int Reserved3
    #field int Reserved4
    #field int Reserved5
#endstruct

#defstruct SYSTEM_INFO
    #field var Anonymous
    #field int dwPageSize
    #field var lpMinimumApplicationAddress
    #field var lpMaximumApplicationAddress
    #field int dwActiveProcessorMask
    #field int dwNumberOfProcessors
    #field int dwProcessorType
    #field int dwAllocationGranularity
    #field int wProcessorLevel
    #field int wProcessorRevision
    #field int dwOemId
    #field var Anonymous
    #field int wProcessorArchitecture
    #field int wReserved
#endstruct

#defstruct SYSTEM_LOGICAL_PROCESSOR_INFORMATION
    #field int ProcessorMask
    #field int Relationship
    #field var Anonymous
    #field int ProcessorCore
    #field int NumaNode
    #field var Cache
    #field int Reserved
    #field int Flags
    #field int NodeNumber
#endstruct

#defstruct _ProcessorCore_e__Struct
    #field int Flags
#endstruct

#defstruct _NumaNode_e__Struct
    #field int NodeNumber
#endstruct

#defstruct SYSTEM_POWER_CAPABILITIES
    #field int PowerButtonPresent
    #field int SleepButtonPresent
    #field int LidPresent
    #field int SystemS1
    #field int SystemS2
    #field int SystemS3
    #field int SystemS4
    #field int SystemS5
    #field int HiberFilePresent
    #field int FullWake
    #field int VideoDimPresent
    #field int ApmPresent
    #field int UpsPresent
    #field int ThermalControl
    #field int ProcessorThrottle
    #field int ProcessorMinThrottle
    #field int ProcessorMaxThrottle
    #field int FastSystemS4
    #field int Hiberboot
    #field int WakeAlarmPresent
    #field int AoAc
    #field int DiskSpinDown
    #field int HiberFileType
    #field int AoAcConnectivitySupported
    #field int spare3
    #field int SystemBatteriesPresent
    #field int BatteriesAreShortTerm
    #field int BatteryScale
    #field int AcOnLineWake
    #field int SoftLidWake
    #field int RtcWake
    #field int MinDeviceWakeState
    #field int DefaultLowLatencyWake
#endstruct

#defstruct SYSTEM_POWER_LEVEL
    #field int Enable
    #field int Spare
    #field int BatteryLevel
    #field var PowerPolicy
    #field int MinSystemState
#endstruct

#defstruct SYSTEM_POWER_STATUS
    #field int ACLineStatus
    #field int BatteryFlag
    #field int BatteryLifePercent
    #field int SystemStatusFlag
    #field int BatteryLifeTime
    #field int BatteryFullLifeTime
#endstruct

#defstruct SYSTEMTIME
    #field int wYear
    #field int wMonth
    #field int wDayOfWeek
    #field int wDay
    #field int wHour
    #field int wMinute
    #field int wSecond
    #field int wMilliseconds
#endstruct

#defstruct TA_TIMINGFUNCTION
    #field int eTimingFunctionType
#endstruct

#defstruct TA_TRANSFORM
    #field int eTransformType
    #field int dwTimingFunctionId
    #field int dwStartTime
    #field int dwDurationTime
    #field int eFlags
#endstruct

#defstruct TEXTMETRICW
    #field int tmHeight
    #field int tmAscent
    #field int tmDescent
    #field int tmInternalLeading
    #field int tmExternalLeading
    #field int tmAveCharWidth
    #field int tmMaxCharWidth
    #field int tmWeight
    #field int tmOverhang
    #field int tmDigitizedAspectX
    #field int tmDigitizedAspectY
    #field int tmFirstChar
    #field int tmLastChar
    #field int tmDefaultChar
    #field int tmBreakChar
    #field int tmItalic
    #field int tmUnderlined
    #field int tmStruckOut
    #field int tmPitchAndFamily
    #field int tmCharSet
#endstruct

#defstruct THERMAL_EVENT
    #field int Version
    #field int Size
    #field int Type
    #field int Temperature
    #field int TripPointTemperature
    #field wstr Initiator
#endstruct

#defstruct THREADENTRY32
    #field int dwSize
    #field int cntUsage
    #field int th32ThreadID
    #field int th32OwnerProcessID
    #field int tpBasePri
    #field int tpDeltaPri
    #field int dwFlags
#endstruct

#defstruct TIME_ZONE_INFORMATION
    #field int Bias
    #field int StandardName
    #field var StandardDate
    #field int StandardBias
    #field int DaylightName
    #field var DaylightDate
    #field int DaylightBias
#endstruct

#defstruct TIMECAPS
    #field int wPeriodMin
    #field int wPeriodMax
#endstruct

#defstruct TIMEVAL
    #field int tv_sec
    #field int tv_usec
#endstruct

#defstruct TITLEBARINFO
    #field int cbSize
    #field var rcTitleBar
    #field int rgstate
#endstruct

#defstruct TLIBATTR
    #field int lcid
    #field int syskind
    #field int wMajorVerNum
    #field int wMinorVerNum
    #field int wLibFlags
#endstruct

#defstruct TOKEN_GROUPS
    #field int GroupCount
#endstruct

#defstruct TOKEN_PRIVILEGES
    #field int PrivilegeCount
#endstruct

#defstruct TOUCH_HIT_TESTING_INPUT
    #field int pointerId
    #field var boundingBox
    #field var nonOccludedBoundingBox
    #field int orientation
#endstruct

#defstruct TOUCH_HIT_TESTING_PROXIMITY_EVALUATION
    #field int score
#endstruct

#defstruct TOUCHINPUT
    #field int x
    #field int y
    #field intptr hSource
    #field int dwID
    #field int dwFlags
    #field int dwMask
    #field int dwTime
    #field int dwExtraInfo
    #field int cxContact
    #field int cyContact
#endstruct

#defstruct TP_CALLBACK_ENVIRON_V3
    #field int Version
    #field intptr Pool
    #field intptr CleanupGroup
    #field var RaceDll
    #field int ActivationContext
    #field var u
    #field int CallbackPriority
    #field int Size
    #field int Flags
    #field int s
    #field int _bitfield
#endstruct

#defstruct _s_e__Struct
    #field int _bitfield
#endstruct

#defstruct TP_POOL_STACK_INFORMATION
    #field int StackReserve
    #field int StackCommit
#endstruct

#defstruct TPMPARAMS
    #field int cbSize
    #field var rcExclude
#endstruct

#defstruct TRACE_GUID_PROPERTIES
    #field int GuidType
    #field int LoggerId
    #field int EnableLevel
    #field int EnableFlags
    #field int IsEnable
#endstruct

#defstruct TRACE_LOGFILE_HEADER
    #field int BufferSize
    #field var Anonymous1
    #field int ProviderVersion
    #field int NumberOfProcessors
    #field int64 EndTime
    #field int TimerResolution
    #field int MaximumFileSize
    #field int LogFileMode
    #field int BuffersWritten
    #field var Anonymous2
    #field wstr LoggerName
    #field wstr LogFileName
    #field var TimeZone
    #field int64 BootTime
    #field int64 PerfFreq
    #field int64 StartTime
    #field int ReservedFlags
    #field int BuffersLost
    #field int Version
    #field int VersionDetail
    #field int MajorVersion
    #field int MinorVersion
    #field int SubVersion
    #field int SubMinorVersion
    #field var Anonymous
    #field int StartBuffers
    #field int PointerSize
    #field int EventsLost
    #field int CpuSpeedInMHz
#endstruct

#defstruct _VersionDetail_e__Struct
    #field int MajorVersion
    #field int MinorVersion
    #field int SubVersion
    #field int SubMinorVersion
#endstruct

#defstruct TRACKMOUSEEVENT
    #field int cbSize
    #field int dwFlags
    #field intptr hwndTrack
    #field int dwHoverTime
#endstruct

#defstruct TRIVERTEX
    #field int x
    #field int y
    #field int Red
    #field int Green
    #field int Blue
    #field int Alpha
#endstruct

#defstruct TRUSTED_DOMAIN_AUTH_INFORMATION
    #field int IncomingAuthInfos
    #field var IncomingAuthenticationInformation
    #field var IncomingPreviousAuthenticationInformation
    #field int OutgoingAuthInfos
    #field var OutgoingAuthenticationInformation
    #field var OutgoingPreviousAuthenticationInformation
#endstruct

#defstruct TRUSTED_DOMAIN_INFORMATION_EX
    #field var Name
    #field var FlatName
    #field int Sid
    #field int TrustDirection
    #field int TrustType
    #field int TrustAttributes
#endstruct

#defstruct TRUSTEE_W
    #field var pMultipleTrustee
    #field int MultipleTrusteeOperation
    #field int TrusteeForm
    #field int TrusteeType
    #field wstr ptstrName
#endstruct

#defstruct TYPEATTR
    #field int lcid
    #field int dwReserved
    #field int memidConstructor
    #field int memidDestructor
    #field wstr lpstrSchema
    #field int cbSizeInstance
    #field int typekind
    #field int cFuncs
    #field int cVars
    #field int cImplTypes
    #field int cbSizeVft
    #field int cbAlignment
    #field int wTypeFlags
    #field int wMajorVerNum
    #field int wMinorVerNum
    #field int tdescAlias
    #field var idldescType
#endstruct

#defstruct TYPEDESC
    #field var Anonymous
    #field int vt
    #field var lptdesc
    #field var lpadesc
    #field int hreftype
#endstruct

#defstruct uCLSSPEC
    #field int tyspec
    #field int tagged_union
    #field wstr pFileExt
    #field wstr pMimeType
    #field wstr pProgId
    #field wstr pFileName
    #field int ByName
    #field int ByObjectId
    #field wstr pPackageName
#endstruct

#defstruct _tagged_union_e__Struct
    #field wstr pFileExt
    #field wstr pMimeType
    #field wstr pProgId
    #field wstr pFileName
    #field int ByName
    #field int ByObjectId
    #field wstr pPackageName
#endstruct

#defstruct _ByName_e__Struct
    #field wstr pPackageName
#endstruct

#defstruct UDATE
    #field var st
    #field int wDayOfYear
#endstruct

#defstruct UMS_SCHEDULER_STARTUP_INFO
    #field int UmsVersion
    #field var CompletionList
    #field var SchedulerParam
#endstruct

#defstruct UMS_SYSTEM_THREAD_INFORMATION
    #field int UmsVersion
    #field var Anonymous
    #field var Anonymous
    #field int ThreadUmsFlags
    #field int _bitfield
#endstruct

#defstruct UNLOAD_DLL_DEBUG_INFO
    #field var lpBaseOfDll
#endstruct

#defstruct UNSIGNED_RATIO
    #field int uiNumerator
    #field int uiDenominator
#endstruct

#defstruct UPDATELAYEREDWINDOWINFO
    #field int cbSize
    #field intptr hdcDst
    #field var psize
    #field intptr hdcSrc
    #field int crKey
    #field var pblend
    #field int dwFlags
    #field var prcDirty
#endstruct

#defstruct URL_COMPONENTS
    #field int dwStructSize
    #field wstr lpszScheme
    #field int dwSchemeLength
    #field int nScheme
    #field wstr lpszHostName
    #field int dwHostNameLength
    #field int nPort
    #field wstr lpszUserName
    #field int dwUserNameLength
    #field wstr lpszPassword
    #field int dwPasswordLength
    #field wstr lpszUrlPath
    #field int dwUrlPathLength
    #field wstr lpszExtraInfo
    #field int dwExtraInfoLength
#endstruct

#defstruct URL_COMPONENTSW
    #field int dwStructSize
    #field wstr lpszScheme
    #field int dwSchemeLength
    #field int nScheme
    #field wstr lpszHostName
    #field int dwHostNameLength
    #field int nPort
    #field wstr lpszUserName
    #field int dwUserNameLength
    #field wstr lpszPassword
    #field int dwPasswordLength
    #field wstr lpszUrlPath
    #field int dwUrlPathLength
    #field wstr lpszExtraInfo
    #field int dwExtraInfoLength
#endstruct

#defstruct URLCACHE_ENTRY_INFO
    #field wstr pwszSourceUrlName
    #field wstr pwszLocalFileName
    #field int dwCacheEntryType
    #field int dwUseCount
    #field int dwHitRate
    #field int dwSizeLow
    #field int dwSizeHigh
    #field var pbHeaderInfo
    #field int cbHeaderInfoSize
    #field var pbExtraData
    #field int cbExtraDataSize
#endstruct

#defstruct USER_POWER_POLICY
    #field int Revision
    #field var IdleAc
    #field var IdleDc
    #field int IdleTimeoutAc
    #field int IdleTimeoutDc
    #field int IdleSensitivityAc
    #field int IdleSensitivityDc
    #field int ThrottlePolicyAc
    #field int ThrottlePolicyDc
    #field int MaxSleepAc
    #field int MaxSleepDc
    #field int Reserved
    #field int VideoTimeoutAc
    #field int VideoTimeoutDc
    #field int SpindownTimeoutAc
    #field int SpindownTimeoutDc
    #field int OptimizeForPowerAc
    #field int OptimizeForPowerDc
    #field int FanThrottleToleranceAc
    #field int FanThrottleToleranceDc
    #field int ForcedThrottleAc
    #field int ForcedThrottleDc
#endstruct

#defstruct VALENTW
    #field wstr ve_valuename
    #field int ve_valuelen
    #field int ve_valueptr
    #field int ve_type
#endstruct

#defstruct VARDESC
    #field int memid
    #field wstr lpstrSchema
    #field var Anonymous
    #field var elemdescVar
    #field int wVarFlags
    #field int varkind
    #field int oInst
    #field var lpvarValue
#endstruct

#defstruct VARIANT
    #field var Anonymous
    #field var Anonymous
    #field var decVal
    #field int vt
    #field int wReserved1
    #field int wReserved2
    #field int wReserved3
    #field var Anonymous
    #field int64 llVal
    #field int lVal
    #field int bVal
    #field int iVal
    #field float fltVal
    #field double dblVal
    #field int boolVal
    #field int __OBSOLETE__VARIANT_BOOL
    #field int scode
    #field var cyVal
    #field double date
    #field int bstrVal
    #field var punkVal
    #field var pdispVal
    #field var parray
    #field var pbVal
    #field var piVal
    #field var plVal
    #field var pllVal
    #field var pfltVal
    #field var pdblVal
    #field var pboolVal
    #field var __OBSOLETE__VARIANT_PBOOL
    #field var pscode
    #field var pcyVal
    #field var pdate
    #field var pbstrVal
    #field var ppunkVal
    #field var ppdispVal
    #field var pparray
    #field var pvarVal
    #field var byref
    #field int cVal
    #field int uiVal
    #field int ulVal
    #field int64 ullVal
    #field int intVal
    #field int uintVal
    #field var pdecVal
    #field str pcVal
    #field var puiVal
    #field var pulVal
    #field var pullVal
    #field var pintVal
    #field var puintVal
    #field var Anonymous
    #field var pvRecord
    #field var pRecInfo
#endstruct

#defstruct VERSIONEDSTREAM
    #field var pStream
#endstruct

#defstruct WAITCHAIN_NODE_INFO
    #field int ObjectType
    #field int ObjectStatus
    #field var Anonymous
    #field int LockObject
    #field int ThreadObject
    #field int ObjectName
    #field int64 Timeout
    #field int Alertable
    #field int ProcessId
    #field int ThreadId
    #field int WaitTime
    #field int ContextSwitches
#endstruct

#defstruct _LockObject_e__Struct
    #field int ObjectName
    #field int64 Timeout
    #field int Alertable
#endstruct

#defstruct _ThreadObject_e__Struct
    #field int ProcessId
    #field int ThreadId
    #field int WaitTime
    #field int ContextSwitches
#endstruct

#defstruct WAVEFORMATEX
    #field int wFormatTag
    #field int nChannels
    #field int nSamplesPerSec
    #field int nAvgBytesPerSec
    #field int nBlockAlign
    #field int wBitsPerSample
    #field int cbSize
#endstruct

#defstruct WAVEHDR
    #field str lpData
    #field int dwBufferLength
    #field int dwBytesRecorded
    #field int dwUser
    #field int dwFlags
    #field int dwLoops
    #field var lpNext
    #field int reserved
#endstruct

#defstruct WAVEINCAPSW
    #field int wMid
    #field int wPid
    #field int vDriverVersion
    #field int szPname
    #field int dwFormats
    #field int wChannels
    #field int wReserved1
#endstruct

#defstruct WAVEOUTCAPSW
    #field int wMid
    #field int wPid
    #field int vDriverVersion
    #field int szPname
    #field int dwFormats
    #field int wChannels
    #field int wReserved1
    #field int dwSupport
#endstruct

#defstruct WCRANGE
    #field int wcLow
    #field int cGlyphs
#endstruct

#defstruct WCRUN
    #field int wcLow
    #field int cGlyphs
    #field var phg
#endstruct

#defstruct WER_REPORT_INFORMATION
    #field int dwSize
    #field intptr hProcess
    #field int wzConsentKey
    #field int wzFriendlyEventName
    #field int wzApplicationName
    #field int wzApplicationPath
    #field int wzDescription
    #field intptr hwndParent
#endstruct

#defstruct WER_REPORT_METADATA_V1
    #field int Signature
    #field int64 SizeInBytes
#endstruct

#defstruct WER_REPORT_METADATA_V2
    #field int Signature
    #field int64 SizeInBytes
    #field int CabId
    #field int ReportStatus
    #field int NumberOfFiles
    #field int SizeOfFileNames
    #field wstr FileNames
#endstruct

#defstruct WER_REPORT_METADATA_V3
    #field int Signature
    #field int64 SizeInBytes
    #field int CabId
    #field int ReportStatus
    #field int NumberOfFiles
    #field int SizeOfFileNames
    #field wstr FileNames
    #field int FriendlyEventName
    #field int ApplicationName
    #field int ApplicationPath
    #field int Description
    #field int BucketIdString
    #field int64 LegacyBucketId
#endstruct

#defstruct WER_REPORT_PARAMETER
    #field int Name
    #field int Value
#endstruct

#defstruct WER_REPORT_SIGNATURE
    #field int EventName
    #field int Parameters
#endstruct

#defstruct WGLSWAP
    #field intptr hdc
    #field int uiFlags
#endstruct

#defstruct WICBitmapPattern
    #field int64 Position
    #field int Length
    #field var Pattern
    #field var Mask
    #field int EndOfStream
#endstruct

#defstruct WICRect
    #field int X
    #field int Y
    #field int Width
    #field int Height
#endstruct

#defstruct WIN32_FIND_DATAW
    #field int dwFileAttributes
    #field int nFileSizeHigh
    #field int nFileSizeLow
    #field int dwReserved0
    #field int dwReserved1
    #field int cFileName
    #field int cAlternateFileName
#endstruct

#defstruct WINDOW_BUFFER_SIZE_RECORD
    #field var dwSize
#endstruct

#defstruct WINDOWINFO
    #field int cbSize
    #field var rcWindow
    #field var rcClient
    #field int dwStyle
    #field int dwExStyle
    #field int dwWindowStatus
    #field int cxWindowBorders
    #field int cyWindowBorders
    #field int atomWindowType
    #field int wCreatorVersion
#endstruct

#defstruct WINDOWPLACEMENT
    #field int length
    #field int flags
    #field var rcNormalPosition
#endstruct

#defstruct WINHTTP_AUTOPROXY_OPTIONS
    #field int dwFlags
    #field int dwAutoDetectFlags
    #field wstr lpszAutoConfigUrl
    #field var lpvReserved
    #field int dwReserved
    #field int fAutoLogonIfChallenged
#endstruct

#defstruct WINHTTP_CURRENT_USER_IE_PROXY_CONFIG
    #field int fAutoDetect
    #field wstr lpszAutoConfigUrl
    #field wstr lpszProxy
    #field wstr lpszProxyBypass
#endstruct

#defstruct WINHTTP_EXTENDED_HEADER
    #field var Anonymous1
    #field var Anonymous2
    #field wstr pwszName
    #field str pszName
    #field wstr pwszValue
    #field str pszValue
#endstruct

#defstruct WINHTTP_PROXY_INFO
    #field int dwAccessType
    #field wstr lpszProxy
    #field wstr lpszProxyBypass
#endstruct

#defstruct WINHTTP_PROXY_NETWORKING_KEY
    #field int pbBuffer
#endstruct

#defstruct WINHTTP_PROXY_RESULT
    #field int cEntries
    #field var pEntries
#endstruct

#defstruct WINHTTP_PROXY_RESULT_ENTRY
    #field int fProxy
    #field int fBypass
    #field int ProxyScheme
    #field wstr pwszProxy
    #field int ProxyPort
#endstruct

#defstruct WINHTTP_PROXY_RESULT_EX
    #field int cEntries
    #field var pEntries
    #field intptr hProxyDetectionHandle
    #field int dwProxyInterfaceAffinity
#endstruct

#defstruct WINHTTP_PROXY_SETTINGS
    #field int dwStructSize
    #field int dwFlags
    #field int dwCurrentSettingsVersion
    #field wstr pwszConnectionName
    #field wstr pwszProxy
    #field wstr pwszProxyBypass
    #field wstr pwszAutoconfigUrl
    #field wstr pwszAutoconfigSecondaryUrl
    #field int dwAutoDiscoveryFlags
    #field wstr pwszLastKnownGoodAutoConfigUrl
    #field int dwAutoconfigReloadDelayMins
    #field int dwDetectedInterfaceIpCount
    #field var pdwDetectedInterfaceIp
    #field int cNetworkKeys
    #field var pNetworkKeys
#endstruct

#defstruct WININET_PROXY_INFO
    #field int fProxy
    #field int fBypass
    #field int ProxyScheme
    #field wstr pwszProxy
    #field int ProxyPort
#endstruct

#defstruct WININET_PROXY_INFO_LIST
    #field int dwProxyInfoCount
    #field var pProxyInfo
#endstruct

#defstruct WLAN_AVAILABLE_NETWORK
    #field int strProfileName
    #field var dot11Ssid
    #field int dot11BssType
    #field int uNumberOfBssids
    #field int bNetworkConnectable
    #field int wlanNotConnectableReason
    #field int uNumberOfPhyTypes
    #field int dot11PhyTypes
    #field int bMorePhyTypes
    #field int wlanSignalQuality
    #field int bSecurityEnabled
    #field int dot11DefaultAuthAlgorithm
    #field int dot11DefaultCipherAlgorithm
    #field int dwFlags
    #field int dwReserved
#endstruct

#defstruct WLAN_AVAILABLE_NETWORK_LIST
    #field int dwNumberOfItems
    #field int dwIndex
#endstruct

#defstruct WLAN_AVAILABLE_NETWORK_LIST_V2
    #field int dwNumberOfItems
    #field int dwIndex
#endstruct

#defstruct WLAN_AVAILABLE_NETWORK_V2
    #field int strProfileName
    #field var dot11Ssid
    #field int dot11BssType
    #field int uNumberOfBssids
    #field int bNetworkConnectable
    #field int wlanNotConnectableReason
    #field int uNumberOfPhyTypes
    #field int dot11PhyTypes
    #field int bMorePhyTypes
    #field int wlanSignalQuality
    #field int bSecurityEnabled
    #field int dot11DefaultAuthAlgorithm
    #field int dot11DefaultCipherAlgorithm
    #field int dwFlags
    #field var AccessNetworkOptions
    #field int dot11HESSID
    #field var VenueInfo
    #field int dwReserved
#endstruct

#defstruct WLAN_BSS_ENTRY
    #field var dot11Ssid
    #field int uPhyId
    #field int dot11Bssid
    #field int dot11BssType
    #field int dot11BssPhyType
    #field int lRssi
    #field int uLinkQuality
    #field int bInRegDomain
    #field int usBeaconPeriod
    #field int64 ullTimestamp
    #field int64 ullHostTimestamp
    #field int usCapabilityInformation
    #field int ulChCenterFrequency
    #field int wlanRateSet
    #field int ulIeOffset
    #field int ulIeSize
#endstruct

#defstruct WLAN_BSS_LIST
    #field int dwTotalSize
    #field int dwNumberOfItems
#endstruct

#defstruct WLAN_CONNECTION_PARAMETERS
    #field int wlanConnectionMode
    #field wstr strProfile
    #field var pDot11Ssid
    #field var pDesiredBssidList
    #field int dot11BssType
    #field int dwFlags
#endstruct

#defstruct WLAN_DEVICE_SERVICE_GUID_LIST
    #field int dwNumberOfItems
    #field int dwIndex
#endstruct

#defstruct WLAN_HOSTED_NETWORK_PEER_STATE
    #field int PeerMacAddress
    #field int PeerAuthState
#endstruct

#defstruct WLAN_HOSTED_NETWORK_STATUS
    #field int HostedNetworkState
    #field int wlanHostedNetworkBSSID
    #field int dot11PhyType
    #field int ulChannelFrequency
    #field int dwNumberOfPeers
#endstruct

#defstruct WLAN_INTERFACE_CAPABILITY
    #field int interfaceType
    #field int bDot11DSupported
    #field int dwMaxDesiredSsidListSize
    #field int dwMaxDesiredBssidListSize
    #field int dwNumberOfSupportedPhys
    #field int dot11PhyTypes
#endstruct

#defstruct WLAN_INTERFACE_INFO
    #field int strInterfaceDescription
    #field int isState
#endstruct

#defstruct WLAN_INTERFACE_INFO_LIST
    #field int dwNumberOfItems
    #field int dwIndex
#endstruct

#defstruct WLAN_PROFILE_INFO
    #field int strProfileName
    #field int dwFlags
#endstruct

#defstruct WLAN_PROFILE_INFO_LIST
    #field int dwNumberOfItems
    #field int dwIndex
#endstruct

#defstruct WLAN_RATE_SET
    #field int uRateSetLength
    #field int usRateSet
#endstruct

#defstruct WLAN_RAW_DATA
    #field int dwDataSize
#endstruct

#defstruct WLAN_RAW_DATA_LIST
    #field int dwTotalSize
    #field int dwNumberOfItems
    #field int dwDataOffset
    #field int dwDataSize
#endstruct

#defstruct WmfPlaceableFileHeader
    #field int Key
    #field int Hmf
    #field var BoundingBox
    #field int Inch
    #field int Reserved
    #field int Checksum
#endstruct

#defstruct WNDCLASSEXW
    #field int cbSize
    #field int style
    #field int cbClsExtra
    #field int cbWndExtra
    #field intptr hInstance
    #field intptr hIcon
    #field intptr hCursor
    #field intptr hbrBackground
    #field wstr lpszMenuName
    #field wstr lpszClassName
    #field intptr hIconSm
#endstruct

#defstruct WNDCLASSW
    #field int style
    #field int cbClsExtra
    #field int cbWndExtra
    #field intptr hInstance
    #field intptr hIcon
    #field intptr hCursor
    #field intptr hbrBackground
    #field wstr lpszMenuName
    #field wstr lpszClassName
#endstruct

#defstruct WNODE_HEADER
    #field int BufferSize
    #field int ProviderId
    #field var Anonymous1
    #field var Anonymous2
    #field int ClientContext
    #field int Flags
    #field int64 HistoricalContext
    #field var Anonymous
    #field int Version
    #field int Linkage
    #field int CountLost
    #field intptr KernelHandle
    #field int64 TimeStamp
#endstruct

#defstruct WSABUF
    #field int len
    #field str buf
#endstruct

#defstruct WSACOMPLETION
    #field int Type
    #field int Parameters
    #field int WindowMessage
    #field int Event
    #field int Apc
    #field int Port
    #field intptr hWnd
    #field int uMsg
    #field intptr context
    #field intptr hPort
    #field int Key
#endstruct

#defstruct _Parameters_e__Union
    #field int WindowMessage
    #field int Event
    #field int Apc
    #field int Port
    #field intptr hWnd
    #field int uMsg
    #field intptr context
    #field intptr hPort
    #field int Key
#endstruct

#defstruct _WindowMessage_e__Struct
    #field intptr hWnd
    #field int uMsg
    #field intptr context
#endstruct

#defstruct _Port_e__Struct
    #field intptr hPort
    #field int Key
#endstruct

#defstruct WSAMSG
    #field var name
    #field int namelen
    #field var lpBuffers
    #field int dwBufferCount
    #field var Control
    #field int dwFlags
#endstruct

#defstruct WSANAMESPACE_INFOEXW
    #field int dwNameSpace
    #field int fActive
    #field int dwVersion
    #field wstr lpszIdentifier
    #field var ProviderSpecific
#endstruct

#defstruct WSANAMESPACE_INFOW
    #field int dwNameSpace
    #field int fActive
    #field int dwVersion
    #field wstr lpszIdentifier
#endstruct

#defstruct WSANETWORKEVENTS
    #field int lNetworkEvents
    #field int iErrorCode
#endstruct

#defstruct WSANSCLASSINFOW
    #field wstr lpszName
    #field int dwNameSpace
    #field int dwValueType
    #field int dwValueSize
    #field var lpValue
#endstruct

#defstruct WSAPOLLFD
    #field int fd
    #field int events
    #field int revents
#endstruct

#defstruct WSAPROTOCOL_INFOW
    #field int dwServiceFlags1
    #field int dwServiceFlags2
    #field int dwServiceFlags3
    #field int dwServiceFlags4
    #field int dwProviderFlags
    #field int dwCatalogEntryId
    #field int ProtocolChain
    #field int iVersion
    #field int iAddressFamily
    #field int iMaxSockAddr
    #field int iMinSockAddr
    #field int iSocketType
    #field int iProtocol
    #field int iProtocolMaxOffset
    #field int iNetworkByteOrder
    #field int iSecurityScheme
    #field int dwMessageSize
    #field int dwProviderReserved
    #field int szProtocol
#endstruct

#defstruct WSAPROTOCOLCHAIN
    #field int ChainLen
    #field int ChainEntries
#endstruct

#defstruct WSAQUERYSET2W
    #field int dwSize
    #field wstr lpszServiceInstanceName
    #field var lpVersion
    #field wstr lpszComment
    #field int dwNameSpace
    #field wstr lpszContext
    #field int dwNumberOfProtocols
    #field var lpafpProtocols
    #field wstr lpszQueryString
    #field int dwNumberOfCsAddrs
    #field var lpcsaBuffer
    #field int dwOutputFlags
    #field var lpBlob
#endstruct

#defstruct WSAQUERYSETW
    #field int dwSize
    #field wstr lpszServiceInstanceName
    #field var lpVersion
    #field wstr lpszComment
    #field int dwNameSpace
    #field wstr lpszContext
    #field int dwNumberOfProtocols
    #field var lpafpProtocols
    #field wstr lpszQueryString
    #field int dwNumberOfCsAddrs
    #field var lpcsaBuffer
    #field int dwOutputFlags
    #field var lpBlob
#endstruct

#defstruct WSASERVICECLASSINFOW
    #field wstr lpszServiceClassName
    #field int dwCount
    #field var lpClassInfos
#endstruct

#defstruct WSAVERSION
    #field int dwVersion
    #field int ecHow
#endstruct

#defstruct WTS_PROCESS_INFOW
    #field int SessionId
    #field int ProcessId
    #field wstr pProcessName
    #field int pUserSid
#endstruct

#defstruct WTS_SERVER_INFOW
    #field wstr pServerName
#endstruct

#defstruct WTS_SESSION_INFO_1W
    #field int ExecEnvId
    #field int State
    #field int SessionId
    #field wstr pSessionName
    #field wstr pHostName
    #field wstr pUserName
    #field wstr pDomainName
    #field wstr pFarmName
#endstruct

#defstruct WTS_SESSION_INFOW
    #field int SessionId
    #field wstr pWinStationName
    #field int State
#endstruct

#defstruct WTSLISTENERCONFIGW
    #field int version
    #field int fEnableListener
    #field int MaxConnectionCount
    #field int fPromptForPassword
    #field int fInheritColorDepth
    #field int ColorDepth
    #field int fInheritBrokenTimeoutSettings
    #field int BrokenTimeoutSettings
    #field int fDisablePrinterRedirection
    #field int fDisableDriveRedirection
    #field int fDisableComPortRedirection
    #field int fDisableLPTPortRedirection
    #field int fDisableClipboardRedirection
    #field int fDisableAudioRedirection
    #field int fDisablePNPRedirection
    #field int fDisableDefaultMainClientPrinter
    #field int LanAdapter
    #field int PortNumber
    #field int fInheritShadowSettings
    #field int ShadowSettings
    #field int TimeoutSettingsConnection
    #field int TimeoutSettingsDisconnection
    #field int TimeoutSettingsIdle
    #field int SecurityLayer
    #field int MinEncryptionLevel
    #field int UserAuthentication
    #field int Comment
    #field int LogonUserName
    #field int LogonDomain
    #field int WorkDirectory
    #field int InitialProgram
#endstruct

#defstruct XAUDIO2_BUFFER
    #field int Flags
    #field int AudioBytes
    #field var pAudioData
    #field int PlayBegin
    #field int PlayLength
    #field int LoopBegin
    #field int LoopLength
    #field int LoopCount
    #field var pContext
#endstruct

#defstruct XAUDIO2_BUFFER_WMA
    #field var pDecodedPacketCumulativeBytes
    #field int PacketCount
#endstruct

#defstruct XAUDIO2_DEBUG_CONFIGURATION
    #field int TraceMask
    #field int BreakMask
    #field int LogThreadID
    #field int LogFileline
    #field int LogFunctionName
    #field int LogTiming
#endstruct

#defstruct XAUDIO2_EFFECT_CHAIN
    #field int EffectCount
    #field var pEffectDescriptors
#endstruct

#defstruct XAUDIO2_EFFECT_DESCRIPTOR
    #field var pEffect
    #field int InitialState
    #field int OutputChannels
#endstruct

#defstruct XAUDIO2_FILTER_PARAMETERS
    #field int Type
    #field float Frequency
    #field float OneOverQ
#endstruct

#defstruct XAUDIO2_PERFORMANCE_DATA
    #field int64 AudioCyclesSinceLastQuery
    #field int64 TotalCyclesSinceLastQuery
    #field int MinimumCyclesPerQuantum
    #field int MaximumCyclesPerQuantum
    #field int MemoryUsageInBytes
    #field int CurrentLatencyInSamples
    #field int GlitchesSinceEngineStarted
    #field int ActiveSourceVoiceCount
    #field int TotalSourceVoiceCount
    #field int ActiveSubmixVoiceCount
    #field int ActiveResamplerCount
    #field int ActiveMatrixMixCount
    #field int ActiveXmaSourceVoices
    #field int ActiveXmaStreams
#endstruct

#defstruct XAUDIO2_SEND_DESCRIPTOR
    #field int Flags
    #field var pOutputVoice
#endstruct

#defstruct XAUDIO2_VOICE_DETAILS
    #field int CreationFlags
    #field int ActiveFlags
    #field int InputChannels
    #field int InputSampleRate
#endstruct

#defstruct XAUDIO2_VOICE_SENDS
    #field int SendCount
    #field var pSends
#endstruct

#defstruct XAUDIO2_VOICE_STATE
    #field var pCurrentBufferContext
    #field int BuffersQueued
    #field int64 SamplesPlayed
#endstruct

#defstruct XFORM
    #field float eM11
    #field float eM12
    #field float eM21
    #field float eM22
    #field float eDx
    #field float eDy
#endstruct

#defstruct XFORMOBJ
    #field int ulReserved
#endstruct

#defstruct XLATEOBJ
    #field int iUniq
    #field int flXlate
    #field int iSrcType
    #field int iDstType
    #field int cEntries
    #field var pulXlate
#endstruct

#defstruct ZONEATTRIBUTES
    #field int cbSize
    #field int szDisplayName
    #field int szDescription
    #field int szIconPath
    #field int dwTemplateMinLevel
    #field int dwTemplateRecommended
    #field int dwTemplateCurrentLevel
    #field int dwFlags
#endstruct

;--- enums / constants ---
; D3DDDI_COLOR_SPACE_TYPE
#define D3DDDI_COLOR_SPACE_RGB_FULL_G22_NONE_P709  0x0
#define D3DDDI_COLOR_SPACE_RGB_FULL_G10_NONE_P709  0x1
#define D3DDDI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709  0x2
#define D3DDDI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020  0x3
#define D3DDDI_COLOR_SPACE_RESERVED  0x4
#define D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601  0x5
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601  0x6
#define D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601  0x7
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709  0x8
#define D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709  0x9
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020  0xa
#define D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020  0xb
#define D3DDDI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020  0xc
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G2084_LEFT_P2020  0xd
#define D3DDDI_COLOR_SPACE_RGB_STUDIO_G2084_NONE_P2020  0xe
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_TOPLEFT_P2020  0xf
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G2084_TOPLEFT_P2020  0x10
#define D3DDDI_COLOR_SPACE_RGB_FULL_G22_NONE_P2020  0x11
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020  0x12
#define D3DDDI_COLOR_SPACE_YCBCR_FULL_GHLG_TOPLEFT_P2020  0x13
#define D3DDDI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P709  0x14
#define D3DDDI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P2020  0x15
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P709  0x16
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P2020  0x17
#define D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_TOPLEFT_P2020  0x18
#define D3DDDI_COLOR_SPACE_CUSTOM  -1

; D3DDDI_FLIPINTERVAL_TYPE
#define D3DDDI_FLIPINTERVAL_IMMEDIATE  0x0
#define D3DDDI_FLIPINTERVAL_ONE  0x1
#define D3DDDI_FLIPINTERVAL_TWO  0x2
#define D3DDDI_FLIPINTERVAL_THREE  0x3
#define D3DDDI_FLIPINTERVAL_FOUR  0x4
#define D3DDDI_FLIPINTERVAL_IMMEDIATE_ALLOW_TEARING  0x5

; D3DDDI_GAMMARAMP_TYPE
#define D3DDDI_GAMMARAMP_UNINITIALIZED  0x0
#define D3DDDI_GAMMARAMP_DEFAULT  0x1
#define D3DDDI_GAMMARAMP_RGB256x3x16  0x2
#define D3DDDI_GAMMARAMP_DXGI_1  0x3
#define D3DDDI_GAMMARAMP_MATRIX_3x4  0x4
#define D3DDDI_GAMMARAMP_MATRIX_V2  0x5

; D3DDDI_HDR_METADATA_TYPE
#define D3DDDI_HDR_METADATA_TYPE_NONE  0x0
#define D3DDDI_HDR_METADATA_TYPE_HDR10  0x1
#define D3DDDI_HDR_METADATA_TYPE_HDR10PLUS  0x2

; D3DDDI_ROTATION
#define D3DDDI_ROTATION_IDENTITY  0x1
#define D3DDDI_ROTATION_90  0x2
#define D3DDDI_ROTATION_180  0x3
#define D3DDDI_ROTATION_270  0x4

; D3DDDI_SYNCHRONIZATIONOBJECT_TYPE
#define D3DDDI_SYNCHRONIZATION_MUTEX  0x1
#define D3DDDI_SEMAPHORE  0x2
#define D3DDDI_FENCE  0x3
#define D3DDDI_CPU_NOTIFICATION  0x4
#define D3DDDI_MONITORED_FENCE  0x5
#define D3DDDI_PERIODIC_MONITORED_FENCE  0x6
#define D3DDDI_SYNCHRONIZATION_TYPE_LIMIT  0x7

; D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING
#define D3DDDI_VSSLO_UNINITIALIZED  0x0
#define D3DDDI_VSSLO_PROGRESSIVE  0x1
#define D3DDDI_VSSLO_INTERLACED_UPPERFIELDFIRST  0x2
#define D3DDDI_VSSLO_INTERLACED_LOWERFIELDFIRST  0x3
#define D3DDDI_VSSLO_OTHER  0xff

; D3DDDIFORMAT
#define D3DDDIFMT_UNKNOWN  0x0
#define D3DDDIFMT_R8G8B8  0x14
#define D3DDDIFMT_A8R8G8B8  0x15
#define D3DDDIFMT_X8R8G8B8  0x16
#define D3DDDIFMT_R5G6B5  0x17
#define D3DDDIFMT_X1R5G5B5  0x18
#define D3DDDIFMT_A1R5G5B5  0x19
#define D3DDDIFMT_A4R4G4B4  0x1a
#define D3DDDIFMT_R3G3B2  0x1b
#define D3DDDIFMT_A8  0x1c
#define D3DDDIFMT_A8R3G3B2  0x1d
#define D3DDDIFMT_X4R4G4B4  0x1e
#define D3DDDIFMT_A2B10G10R10  0x1f
#define D3DDDIFMT_A8B8G8R8  0x20
#define D3DDDIFMT_X8B8G8R8  0x21
#define D3DDDIFMT_G16R16  0x22
#define D3DDDIFMT_A2R10G10B10  0x23
#define D3DDDIFMT_A16B16G16R16  0x24
#define D3DDDIFMT_A8P8  0x28
#define D3DDDIFMT_P8  0x29
#define D3DDDIFMT_L8  0x32
#define D3DDDIFMT_A8L8  0x33
#define D3DDDIFMT_A4L4  0x34
#define D3DDDIFMT_V8U8  0x3c
#define D3DDDIFMT_L6V5U5  0x3d
#define D3DDDIFMT_X8L8V8U8  0x3e
#define D3DDDIFMT_Q8W8V8U8  0x3f
#define D3DDDIFMT_V16U16  0x40
#define D3DDDIFMT_W11V11U10  0x41
#define D3DDDIFMT_A2W10V10U10  0x43
#define D3DDDIFMT_UYVY  0x59565955
#define D3DDDIFMT_R8G8_B8G8  0x47424752
#define D3DDDIFMT_YUY2  0x32595559
#define D3DDDIFMT_G8R8_G8B8  0x42475247
#define D3DDDIFMT_DXT1  0x31545844
#define D3DDDIFMT_DXT2  0x32545844
#define D3DDDIFMT_DXT3  0x33545844
#define D3DDDIFMT_DXT4  0x34545844
#define D3DDDIFMT_DXT5  0x35545844
#define D3DDDIFMT_D16_LOCKABLE  0x46
#define D3DDDIFMT_D32  0x47
#define D3DDDIFMT_D15S1  0x49
#define D3DDDIFMT_D24S8  0x4b
#define D3DDDIFMT_D24X8  0x4d
#define D3DDDIFMT_D24X4S4  0x4f
#define D3DDDIFMT_D16  0x50
#define D3DDDIFMT_D32F_LOCKABLE  0x52
#define D3DDDIFMT_D24FS8  0x53
#define D3DDDIFMT_D32_LOCKABLE  0x54
#define D3DDDIFMT_S8_LOCKABLE  0x55
#define D3DDDIFMT_S1D15  0x48
#define D3DDDIFMT_S8D24  0x4a
#define D3DDDIFMT_X8D24  0x4c
#define D3DDDIFMT_X4S4D24  0x4e
#define D3DDDIFMT_L16  0x51
#define D3DDDIFMT_G8R8  0x5b
#define D3DDDIFMT_R8  0x5c
#define D3DDDIFMT_VERTEXDATA  0x64
#define D3DDDIFMT_INDEX16  0x65
#define D3DDDIFMT_INDEX32  0x66
#define D3DDDIFMT_Q16W16V16U16  0x6e
#define D3DDDIFMT_MULTI2_ARGB8  0x3154454d
#define D3DDDIFMT_R16F  0x6f
#define D3DDDIFMT_G16R16F  0x70
#define D3DDDIFMT_A16B16G16R16F  0x71
#define D3DDDIFMT_R32F  0x72
#define D3DDDIFMT_G32R32F  0x73
#define D3DDDIFMT_A32B32G32R32F  0x74
#define D3DDDIFMT_CxV8U8  0x75
#define D3DDDIFMT_A1  0x76
#define D3DDDIFMT_A2B10G10R10_XR_BIAS  0x77
#define D3DDDIFMT_DXVACOMPBUFFER_BASE  0x96
#define D3DDDIFMT_PICTUREPARAMSDATA  0x96
#define D3DDDIFMT_MACROBLOCKDATA  0x97
#define D3DDDIFMT_RESIDUALDIFFERENCEDATA  0x98
#define D3DDDIFMT_DEBLOCKINGDATA  0x99
#define D3DDDIFMT_INVERSEQUANTIZATIONDATA  0x9a
#define D3DDDIFMT_SLICECONTROLDATA  0x9b
#define D3DDDIFMT_BITSTREAMDATA  0x9c
#define D3DDDIFMT_MOTIONVECTORBUFFER  0x9d
#define D3DDDIFMT_FILMGRAINBUFFER  0x9e
#define D3DDDIFMT_DXVA_RESERVED9  0x9f
#define D3DDDIFMT_DXVA_RESERVED10  0xa0
#define D3DDDIFMT_DXVA_RESERVED11  0xa1
#define D3DDDIFMT_DXVA_RESERVED12  0xa2
#define D3DDDIFMT_DXVA_RESERVED13  0xa3
#define D3DDDIFMT_DXVA_RESERVED14  0xa4
#define D3DDDIFMT_DXVA_RESERVED15  0xa5
#define D3DDDIFMT_DXVA_RESERVED16  0xa6
#define D3DDDIFMT_DXVA_RESERVED17  0xa7
#define D3DDDIFMT_DXVA_RESERVED18  0xa8
#define D3DDDIFMT_DXVA_RESERVED19  0xa9
#define D3DDDIFMT_DXVA_RESERVED20  0xaa
#define D3DDDIFMT_DXVA_RESERVED21  0xab
#define D3DDDIFMT_DXVA_RESERVED22  0xac
#define D3DDDIFMT_DXVA_RESERVED23  0xad
#define D3DDDIFMT_DXVA_RESERVED24  0xae
#define D3DDDIFMT_DXVA_RESERVED25  0xaf
#define D3DDDIFMT_DXVA_RESERVED26  0xb0
#define D3DDDIFMT_DXVA_RESERVED27  0xb1
#define D3DDDIFMT_DXVA_RESERVED28  0xb2
#define D3DDDIFMT_DXVA_RESERVED29  0xb3
#define D3DDDIFMT_DXVA_RESERVED30  0xb4
#define D3DDDIFMT_DXVA_RESERVED31  0xb5
#define D3DDDIFMT_DXVACOMPBUFFER_MAX  0xb5
#define D3DDDIFMT_BINARYBUFFER  0xc7

; D3DKMT_ALLOCATIONRESIDENCYSTATUS
#define D3DKMT_ALLOCATIONRESIDENCYSTATUS_RESIDENTINGPUMEMORY  0x1
#define D3DKMT_ALLOCATIONRESIDENCYSTATUS_RESIDENTINSHAREDMEMORY  0x2
#define D3DKMT_ALLOCATIONRESIDENCYSTATUS_NOTRESIDENT  0x3

; D3DKMT_CLIENTHINT
#define D3DKMT_CLIENTHINT_UNKNOWN  0x0
#define D3DKMT_CLIENTHINT_OPENGL  0x1
#define D3DKMT_CLIENTHINT_CDD  0x2
#define D3DKMT_CLIENTHINT_OPENCL  0x3
#define D3DKMT_CLIENTHINT_VULKAN  0x4
#define D3DKMT_CLIENTHINT_CUDA  0x5
#define D3DKMT_CLIENTHINT_RESERVED  0x6
#define D3DKMT_CLIENTHINT_DX7  0x7
#define D3DKMT_CLIENTHINT_DX8  0x8
#define D3DKMT_CLIENTHINT_DX9  0x9
#define D3DKMT_CLIENTHINT_DX10  0xa
#define D3DKMT_CLIENTHINT_DX11  0xb
#define D3DKMT_CLIENTHINT_DX12  0xc
#define D3DKMT_CLIENTHINT_9ON12  0xd
#define D3DKMT_CLIENTHINT_11ON12  0xe
#define D3DKMT_CLIENTHINT_MFT_ENCODE  0xf
#define D3DKMT_CLIENTHINT_GLON12  0x10
#define D3DKMT_CLIENTHINT_CLON12  0x11
#define D3DKMT_CLIENTHINT_DML_TENSORFLOW  0x12
#define D3DKMT_CLIENTHINT_ONEAPI_LEVEL0  0x13
#define D3DKMT_CLIENTHINT_DML_PYTORCH  0x14
#define D3DKMT_CLIENTHINT_MAX  0x15

; D3DKMT_DEVICEEXECUTION_STATE
#define D3DKMT_DEVICEEXECUTION_ACTIVE  0x1
#define D3DKMT_DEVICEEXECUTION_RESET  0x2
#define D3DKMT_DEVICEEXECUTION_HUNG  0x3
#define D3DKMT_DEVICEEXECUTION_STOPPED  0x4
#define D3DKMT_DEVICEEXECUTION_ERROR_OUTOFMEMORY  0x5
#define D3DKMT_DEVICEEXECUTION_ERROR_DMAFAULT  0x6
#define D3DKMT_DEVICEEXECUTION_ERROR_DMAPAGEFAULT  0x7

; D3DKMT_DEVICESTATE_TYPE
#define D3DKMT_DEVICESTATE_EXECUTION  0x1
#define D3DKMT_DEVICESTATE_PRESENT  0x2
#define D3DKMT_DEVICESTATE_RESET  0x3
#define D3DKMT_DEVICESTATE_PRESENT_DWM  0x4
#define D3DKMT_DEVICESTATE_PAGE_FAULT  0x5
#define D3DKMT_DEVICESTATE_PRESENT_QUEUE  0x6

; D3DKMT_ESCAPETYPE
#define D3DKMT_ESCAPE_DRIVERPRIVATE  0x0
#define D3DKMT_ESCAPE_VIDMM  0x1
#define D3DKMT_ESCAPE_TDRDBGCTRL  0x2
#define D3DKMT_ESCAPE_VIDSCH  0x3
#define D3DKMT_ESCAPE_DEVICE  0x4
#define D3DKMT_ESCAPE_DMM  0x5
#define D3DKMT_ESCAPE_DEBUG_SNAPSHOT  0x6
#define D3DKMT_ESCAPE_DRT_TEST  0x8
#define D3DKMT_ESCAPE_DIAGNOSTICS  0x9
#define D3DKMT_ESCAPE_OUTPUTDUPL_SNAPSHOT  0xa
#define D3DKMT_ESCAPE_OUTPUTDUPL_DIAGNOSTICS  0xb
#define D3DKMT_ESCAPE_BDD_PNP  0xc
#define D3DKMT_ESCAPE_BDD_FALLBACK  0xd
#define D3DKMT_ESCAPE_ACTIVATE_SPECIFIC_DIAG  0xe
#define D3DKMT_ESCAPE_MODES_PRUNED_OUT  0xf
#define D3DKMT_ESCAPE_WHQL_INFO  0x10
#define D3DKMT_ESCAPE_BRIGHTNESS  0x11
#define D3DKMT_ESCAPE_EDID_CACHE  0x12
#define D3DKMT_ESCAPE_MIRACAST_DISPLAY_REQUEST  0x14
#define D3DKMT_ESCAPE_HISTORY_BUFFER_STATUS  0x15
#define D3DKMT_ESCAPE_MIRACAST_ADAPTER_DIAG_INFO  0x17
#define D3DKMT_ESCAPE_FORCE_BDDFALLBACK_HEADLESS  0x18
#define D3DKMT_ESCAPE_REQUEST_MACHINE_CRASH  0x19
#define D3DKMT_ESCAPE_SOFTGPU_ENABLE_DISABLE_HMD  0x1b
#define D3DKMT_ESCAPE_PROCESS_VERIFIER_OPTION  0x1c
#define D3DKMT_ESCAPE_ADAPTER_VERIFIER_OPTION  0x1d
#define D3DKMT_ESCAPE_IDD_REQUEST  0x1e
#define D3DKMT_ESCAPE_DOD_SET_DIRTYRECT_MODE  0x1f
#define D3DKMT_ESCAPE_LOG_CODEPOINT_PACKET  0x20
#define D3DKMT_ESCAPE_LOG_USERMODE_DAIG_PACKET  0x21
#define D3DKMT_ESCAPE_GET_EXTERNAL_DIAGNOSTICS  0x22
#define D3DKMT_ESCAPE_GET_DISPLAY_CONFIGURATIONS  0x24
#define D3DKMT_ESCAPE_QUERY_IOMMU_STATUS  0x25
#define D3DKMT_ESCAPE_CCD_DATABASE  0x26
#define D3DKMT_ESCAPE_QUERY_DMA_REMAPPING_STATUS  0x27
#define D3DKMT_ESCAPE_WIN32K_START  0x400
#define D3DKMT_ESCAPE_WIN32K_HIP_DEVICE_INFO  0x400
#define D3DKMT_ESCAPE_WIN32K_QUERY_CD_ROTATION_BLOCK  0x401
#define D3DKMT_ESCAPE_WIN32K_DPI_INFO  0x402
#define D3DKMT_ESCAPE_WIN32K_PRESENTER_VIEW_INFO  0x403
#define D3DKMT_ESCAPE_WIN32K_SYSTEM_DPI  0x404
#define D3DKMT_ESCAPE_WIN32K_BDD_FALLBACK  0x405
#define D3DKMT_ESCAPE_WIN32K_DDA_TEST_CTL  0x406
#define D3DKMT_ESCAPE_WIN32K_USER_DETECTED_BLACK_SCREEN  0x407
#define D3DKMT_ESCAPE_WIN32K_DISPBROKER_TEST  0x40b
#define D3DKMT_ESCAPE_WIN32K_COLOR_PROFILE_INFO  0x40c
#define D3DKMT_ESCAPE_WIN32K_SET_DIMMED_STATE  0x40d
#define D3DKMT_ESCAPE_WIN32K_SPECIALIZED_DISPLAY_TEST  0x40e

; D3DKMT_PRESENT_MODEL
#define D3DKMT_PM_UNINITIALIZED  0x0
#define D3DKMT_PM_REDIRECTED_GDI  0x1
#define D3DKMT_PM_REDIRECTED_FLIP  0x2
#define D3DKMT_PM_REDIRECTED_BLT  0x3
#define D3DKMT_PM_REDIRECTED_VISTABLT  0x4
#define D3DKMT_PM_SCREENCAPTUREFENCE  0x5
#define D3DKMT_PM_REDIRECTED_GDI_SYSMEM  0x6
#define D3DKMT_PM_REDIRECTED_COMPOSITION  0x7
#define D3DKMT_PM_SURFACECOMPLETE  0x8
#define D3DKMT_PM_FLIPMANAGER  0x9

; D3DKMT_STANDARDALLOCATIONTYPE
#define D3DKMT_STANDARDALLOCATIONTYPE_EXISTINGHEAP  0x1
#define D3DKMT_STANDARDALLOCATIONTYPE_INTERNALBACKINGSTORE  0x2
#define D3DKMT_STANDARDALLOCATIONTYPE_MAX  0x3

; D3DKMT_VIDPNSOURCEOWNER_TYPE
#define D3DKMT_VIDPNSOURCEOWNER_UNOWNED  0x0
#define D3DKMT_VIDPNSOURCEOWNER_SHARED  0x1
#define D3DKMT_VIDPNSOURCEOWNER_EXCLUSIVE  0x2
#define D3DKMT_VIDPNSOURCEOWNER_EXCLUSIVEGDI  0x3
#define D3DKMT_VIDPNSOURCEOWNER_EMULATED  0x4

; DXGK_PAGE_FAULT_FLAGS
#define DXGK_PAGE_FAULT_WRITE  0x1
#define DXGK_PAGE_FAULT_FENCE_INVALID  0x2
#define DXGK_PAGE_FAULT_ADAPTER_RESET_REQUIRED  0x4
#define DXGK_PAGE_FAULT_ENGINE_RESET_REQUIRED  0x8
#define DXGK_PAGE_FAULT_FATAL_HARDWARE_ERROR  0x10
#define DXGK_PAGE_FAULT_IOMMU  0x20
#define DXGK_PAGE_FAULT_HW_CONTEXT_VALID  0x40
#define DXGK_PAGE_FAULT_PROCESS_HANDLE_VALID  0x80

; DXGK_RENDER_PIPELINE_STAGE
#define DXGK_RENDER_PIPELINE_STAGE_UNKNOWN  0x0
#define DXGK_RENDER_PIPELINE_STAGE_INPUT_ASSEMBLER  0x1
#define DXGK_RENDER_PIPELINE_STAGE_VERTEX_SHADER  0x2
#define DXGK_RENDER_PIPELINE_STAGE_GEOMETRY_SHADER  0x3
#define DXGK_RENDER_PIPELINE_STAGE_STREAM_OUTPUT  0x4
#define DXGK_RENDER_PIPELINE_STAGE_RASTERIZER  0x5
#define DXGK_RENDER_PIPELINE_STAGE_PIXEL_SHADER  0x6
#define DXGK_RENDER_PIPELINE_STAGE_OUTPUT_MERGER  0x7

; KMTQUERYADAPTERINFOTYPE
#define KMTQAITYPE_UMDRIVERPRIVATE  0x0
#define KMTQAITYPE_UMDRIVERNAME  0x1
#define KMTQAITYPE_UMOPENGLINFO  0x2
#define KMTQAITYPE_GETSEGMENTSIZE  0x3
#define KMTQAITYPE_ADAPTERGUID  0x4
#define KMTQAITYPE_FLIPQUEUEINFO  0x5
#define KMTQAITYPE_ADAPTERADDRESS  0x6
#define KMTQAITYPE_SETWORKINGSETINFO  0x7
#define KMTQAITYPE_ADAPTERREGISTRYINFO  0x8
#define KMTQAITYPE_CURRENTDISPLAYMODE  0x9
#define KMTQAITYPE_MODELIST  0xa
#define KMTQAITYPE_CHECKDRIVERUPDATESTATUS  0xb
#define KMTQAITYPE_VIRTUALADDRESSINFO  0xc
#define KMTQAITYPE_DRIVERVERSION  0xd
#define KMTQAITYPE_ADAPTERTYPE  0xf
#define KMTQAITYPE_OUTPUTDUPLCONTEXTSCOUNT  0x10
#define KMTQAITYPE_WDDM_1_2_CAPS  0x11
#define KMTQAITYPE_UMD_DRIVER_VERSION  0x12
#define KMTQAITYPE_DIRECTFLIP_SUPPORT  0x13
#define KMTQAITYPE_MULTIPLANEOVERLAY_SUPPORT  0x14
#define KMTQAITYPE_DLIST_DRIVER_NAME  0x15
#define KMTQAITYPE_WDDM_1_3_CAPS  0x16
#define KMTQAITYPE_MULTIPLANEOVERLAY_HUD_SUPPORT  0x17
#define KMTQAITYPE_WDDM_2_0_CAPS  0x18
#define KMTQAITYPE_NODEMETADATA  0x19
#define KMTQAITYPE_CPDRIVERNAME  0x1a
#define KMTQAITYPE_XBOX  0x1b
#define KMTQAITYPE_INDEPENDENTFLIP_SUPPORT  0x1c
#define KMTQAITYPE_MIRACASTCOMPANIONDRIVERNAME  0x1d
#define KMTQAITYPE_PHYSICALADAPTERCOUNT  0x1e
#define KMTQAITYPE_PHYSICALADAPTERDEVICEIDS  0x1f
#define KMTQAITYPE_DRIVERCAPS_EXT  0x20
#define KMTQAITYPE_QUERY_MIRACAST_DRIVER_TYPE  0x21
#define KMTQAITYPE_QUERY_GPUMMU_CAPS  0x22
#define KMTQAITYPE_QUERY_MULTIPLANEOVERLAY_DECODE_SUPPORT  0x23
#define KMTQAITYPE_QUERY_HW_PROTECTION_TEARDOWN_COUNT  0x24
#define KMTQAITYPE_QUERY_ISBADDRIVERFORHWPROTECTIONDISABLED  0x25
#define KMTQAITYPE_MULTIPLANEOVERLAY_SECONDARY_SUPPORT  0x26
#define KMTQAITYPE_INDEPENDENTFLIP_SECONDARY_SUPPORT  0x27
#define KMTQAITYPE_PANELFITTER_SUPPORT  0x28
#define KMTQAITYPE_PHYSICALADAPTERPNPKEY  0x29
#define KMTQAITYPE_GETSEGMENTGROUPSIZE  0x2a
#define KMTQAITYPE_MPO3DDI_SUPPORT  0x2b
#define KMTQAITYPE_HWDRM_SUPPORT  0x2c
#define KMTQAITYPE_MPOKERNELCAPS_SUPPORT  0x2d
#define KMTQAITYPE_MULTIPLANEOVERLAY_STRETCH_SUPPORT  0x2e
#define KMTQAITYPE_GET_DEVICE_VIDPN_OWNERSHIP_INFO  0x2f
#define KMTQAITYPE_QUERYREGISTRY  0x30
#define KMTQAITYPE_KMD_DRIVER_VERSION  0x31
#define KMTQAITYPE_BLOCKLIST_KERNEL  0x32
#define KMTQAITYPE_BLOCKLIST_RUNTIME  0x33
#define KMTQAITYPE_ADAPTERGUID_RENDER  0x34
#define KMTQAITYPE_ADAPTERADDRESS_RENDER  0x35
#define KMTQAITYPE_ADAPTERREGISTRYINFO_RENDER  0x36
#define KMTQAITYPE_CHECKDRIVERUPDATESTATUS_RENDER  0x37
#define KMTQAITYPE_DRIVERVERSION_RENDER  0x38
#define KMTQAITYPE_ADAPTERTYPE_RENDER  0x39
#define KMTQAITYPE_WDDM_1_2_CAPS_RENDER  0x3a
#define KMTQAITYPE_WDDM_1_3_CAPS_RENDER  0x3b
#define KMTQAITYPE_QUERY_ADAPTER_UNIQUE_GUID  0x3c
#define KMTQAITYPE_NODEPERFDATA  0x3d
#define KMTQAITYPE_ADAPTERPERFDATA  0x3e
#define KMTQAITYPE_ADAPTERPERFDATA_CAPS  0x3f
#define KMTQUITYPE_GPUVERSION  0x40
#define KMTQAITYPE_DRIVER_DESCRIPTION  0x41
#define KMTQAITYPE_DRIVER_DESCRIPTION_RENDER  0x42
#define KMTQAITYPE_SCANOUT_CAPS  0x43
#define KMTQAITYPE_DISPLAY_UMDRIVERNAME  0x47
#define KMTQAITYPE_PARAVIRTUALIZATION_RENDER  0x44
#define KMTQAITYPE_SERVICENAME  0x45
#define KMTQAITYPE_WDDM_2_7_CAPS  0x46
#define KMTQAITYPE_TRACKEDWORKLOAD_SUPPORT  0x48
#define KMTQAITYPE_HYBRID_DLIST_DLL_SUPPORT  0x49
#define KMTQAITYPE_DISPLAY_CAPS  0x4a
#define KMTQAITYPE_WDDM_2_9_CAPS  0x4b
#define KMTQAITYPE_CROSSADAPTERRESOURCE_SUPPORT  0x4c
#define KMTQAITYPE_WDDM_3_0_CAPS  0x4d
#define KMTQAITYPE_WSAUMDIMAGENAME  0x4e
#define KMTQAITYPE_VGPUINTERFACEID  0x4f
#define KMTQAITYPE_WDDM_3_1_CAPS  0x50

; ACCEL_VIRT_FLAGS
#define FVIRTKEY  0x1
#define FNOINVERT  0x2
#define FSHIFT  0x4
#define FCONTROL  0x8
#define FALT  0x10

; ACCESS_MODE
#define NOT_USED_ACCESS  0x0
#define GRANT_ACCESS  0x1
#define SET_ACCESS  0x2
#define DENY_ACCESS  0x3
#define REVOKE_ACCESS  0x4
#define SET_AUDIT_SUCCESS  0x5
#define SET_AUDIT_FAILURE  0x6

; ACE_FLAGS
#define CONTAINER_INHERIT_ACE  0x2
#define FAILED_ACCESS_ACE_FLAG  0x80
#define INHERIT_ONLY_ACE  0x8
#define INHERITED_ACE  0x10
#define NO_PROPAGATE_INHERIT_ACE  0x4
#define OBJECT_INHERIT_ACE  0x1
#define SUCCESSFUL_ACCESS_ACE_FLAG  0x40
#define SUB_CONTAINERS_AND_OBJECTS_INHERIT  0x3
#define SUB_CONTAINERS_ONLY_INHERIT  0x2
#define SUB_OBJECTS_ONLY_INHERIT  0x1
#define INHERIT_NO_PROPAGATE  0x4
#define INHERIT_ONLY  0x8
#define NO_INHERITANCE  0x0

; ACE_REVISION
#define ACL_REVISION  0x2
#define ACL_REVISION_DS  0x4

; ACL_INFORMATION_CLASS
#define AclRevisionInformation  0x1
#define AclSizeInformation  0x2

; ACTIVATE_KEYBOARD_LAYOUT_FLAGS
#define KLF_REORDER  0x8
#define KLF_RESET  0x40000000
#define KLF_SETFORPROCESS  0x100
#define KLF_SHIFTLOCK  0x10000
#define KLF_ACTIVATE  0x1
#define KLF_NOTELLSHELL  0x80
#define KLF_REPLACELANG  0x10
#define KLF_SUBSTITUTE_OK  0x2

; ACTIVEOBJECT_FLAGS
#define ACTIVEOBJECT_STRONG  0x0
#define ACTIVEOBJECT_WEAK  0x1

; ADDRESS_FAMILY
#define AF_INET  0x2
#define AF_INET6  0x17
#define AF_UNSPEC  0x0

; ADDRESS_MODE
#define AddrMode1616  0x0
#define AddrMode1632  0x1
#define AddrModeReal  0x2
#define AddrModeFlat  0x3

; ADVANCED_FEATURE_FLAGS
#define FADF_AUTO  0x1
#define FADF_STATIC  0x2
#define FADF_EMBEDDED  0x4
#define FADF_FIXEDSIZE  0x10
#define FADF_RECORD  0x20
#define FADF_HAVEIID  0x40
#define FADF_HAVEVARTYPE  0x80
#define FADF_BSTR  0x100
#define FADF_UNKNOWN  0x200
#define FADF_DISPATCH  0x400
#define FADF_VARIANT  0x800
#define FADF_RESERVED  0xf008

; ALG_ID
#define CALG_MD2  0x8001
#define CALG_MD4  0x8002
#define CALG_MD5  0x8003
#define CALG_SHA  0x8004
#define CALG_SHA1  0x8004
#define CALG_MAC  0x8005
#define CALG_RSA_SIGN  0x2400
#define CALG_DSS_SIGN  0x2200
#define CALG_NO_SIGN  0x2000
#define CALG_RSA_KEYX  0xa400
#define CALG_DES  0x6601
#define CALG_3DES_112  0x6609
#define CALG_3DES  0x6603
#define CALG_DESX  0x6604
#define CALG_RC2  0x6602
#define CALG_RC4  0x6801
#define CALG_SEAL  0x6802
#define CALG_DH_SF  0xaa01
#define CALG_DH_EPHEM  0xaa02
#define CALG_AGREEDKEY_ANY  0xaa03
#define CALG_KEA_KEYX  0xaa04
#define CALG_HUGHES_MD5  0xa003
#define CALG_SKIPJACK  0x660a
#define CALG_TEK  0x660b
#define CALG_CYLINK_MEK  0x660c
#define CALG_SSL3_SHAMD5  0x8008
#define CALG_SSL3_MASTER  0x4c01
#define CALG_SCHANNEL_MASTER_HASH  0x4c02
#define CALG_SCHANNEL_MAC_KEY  0x4c03
#define CALG_SCHANNEL_ENC_KEY  0x4c07
#define CALG_PCT1_MASTER  0x4c04
#define CALG_SSL2_MASTER  0x4c05
#define CALG_TLS1_MASTER  0x4c06
#define CALG_RC5  0x660d
#define CALG_HMAC  0x8009
#define CALG_TLS1PRF  0x800a
#define CALG_HASH_REPLACE_OWF  0x800b
#define CALG_AES_128  0x660e
#define CALG_AES_192  0x660f
#define CALG_AES_256  0x6610
#define CALG_AES  0x6611
#define CALG_SHA_256  0x800c
#define CALG_SHA_384  0x800d
#define CALG_SHA_512  0x800e
#define CALG_ECDH  0xaa05
#define CALG_ECDH_EPHEM  0xae06
#define CALG_ECMQV  0xa001
#define CALG_ECDSA  0x2203
#define CALG_NULLCIPHER  0x6000
#define CALG_THIRDPARTY_KEY_EXCHANGE  0xb000
#define CALG_THIRDPARTY_SIGNATURE  0x3000
#define CALG_THIRDPARTY_CIPHER  0x7000
#define CALG_THIRDPARTY_HASH  0x9000

; ANIMATE_WINDOW_FLAGS
#define AW_ACTIVATE  0x20000
#define AW_BLEND  0x80000
#define AW_CENTER  0x10
#define AW_HIDE  0x10000
#define AW_HOR_POSITIVE  0x1
#define AW_HOR_NEGATIVE  0x2
#define AW_SLIDE  0x40000
#define AW_VER_POSITIVE  0x4
#define AW_VER_NEGATIVE  0x8

; APP_CACHE_FINALIZE_STATE
#define AppCacheFinalizeStateIncomplete  0x0
#define AppCacheFinalizeStateManifestChange  0x1
#define AppCacheFinalizeStateComplete  0x2

; APP_CACHE_STATE
#define AppCacheStateNoUpdateNeeded  0x0
#define AppCacheStateUpdateNeeded  0x1
#define AppCacheStateUpdateNeededNew  0x2
#define AppCacheStateUpdateNeededMasterOnly  0x3

; AR_STATE
#define AR_ENABLED  0x0
#define AR_DISABLED  0x1
#define AR_SUPPRESSED  0x2
#define AR_REMOTESESSION  0x4
#define AR_MULTIMON  0x8
#define AR_NOSENSOR  0x10
#define AR_NOT_SUPPORTED  0x20
#define AR_DOCKED  0x40
#define AR_LAPTOP  0x80

; ARC_DIRECTION
#define AD_COUNTERCLOCKWISE  0x1
#define AD_CLOCKWISE  0x2

; ASSOC_FILTER
#define ASSOC_FILTER_NONE  0x0
#define ASSOC_FILTER_RECOMMENDED  0x1

; AUDIO_STREAM_CATEGORY
#define AudioCategory_Other  0x0
#define AudioCategory_ForegroundOnlyMedia  0x1
#define AudioCategory_Communications  0x3
#define AudioCategory_Alerts  0x4
#define AudioCategory_SoundEffects  0x5
#define AudioCategory_GameEffects  0x6
#define AudioCategory_GameMedia  0x7
#define AudioCategory_GameChat  0x8
#define AudioCategory_Speech  0x9
#define AudioCategory_Movie  0xa
#define AudioCategory_Media  0xb
#define AudioCategory_FarFieldSpeech  0xc
#define AudioCategory_UniformSpeech  0xd
#define AudioCategory_VoiceTyping  0xe

; AUDIT_EVENT_TYPE
#define AuditEventObjectAccess  0x0
#define AuditEventDirectoryServiceAccess  0x1

; BACKGROUND_MODE
#define OPAQUE  0x2
#define TRANSPARENT  0x1

; BCRYPT_FLAGS
#define BCRYPT_BLOCK_PADDING  0x1
#define BCRYPT_PAD_NONE  0x1
#define BCRYPT_PAD_OAEP  0x4
#define BCRYPT_PAD_PKCS1  0x2
#define BCRYPT_PAD_PSS  0x8

; BCRYPT_INTERFACE
#define BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE  0x3
#define BCRYPT_CIPHER_INTERFACE  0x1
#define BCRYPT_HASH_INTERFACE  0x2
#define BCRYPT_RNG_INTERFACE  0x6
#define BCRYPT_SECRET_AGREEMENT_INTERFACE  0x4
#define BCRYPT_SIGNATURE_INTERFACE  0x5
#define NCRYPT_KEY_STORAGE_INTERFACE  0x10001
#define NCRYPT_SCHANNEL_INTERFACE  0x10002
#define NCRYPT_SCHANNEL_SIGNATURE_INTERFACE  0x10003

; BCRYPT_MULTI_OPERATION_TYPE
#define BCRYPT_OPERATION_TYPE_HASH  0x1

; BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS
#define BCRYPT_ALG_HANDLE_HMAC_FLAG  0x8
#define BCRYPT_PROV_DISPATCH  0x1
#define BCRYPT_HASH_REUSABLE_FLAG  0x20

; BCRYPT_OPERATION
#define BCRYPT_CIPHER_OPERATION  0x1
#define BCRYPT_HASH_OPERATION  0x2
#define BCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION  0x4
#define BCRYPT_SECRET_AGREEMENT_OPERATION  0x8
#define BCRYPT_SIGNATURE_OPERATION  0x10
#define BCRYPT_RNG_OPERATION  0x20

; BCRYPT_QUERY_PROVIDER_MODE
#define CRYPT_ANY  0x4
#define CRYPT_UM  0x1
#define CRYPT_KM  0x2
#define CRYPT_MM  0x3

; BCRYPT_RESOLVE_PROVIDERS_FLAGS
#define CRYPT_ALL_FUNCTIONS  0x1
#define CRYPT_ALL_PROVIDERS  0x2

; BCRYPT_TABLE
#define CRYPT_LOCAL  0x1
#define CRYPT_DOMAIN  0x2

; BCRYPTGENRANDOM_FLAGS
#define BCRYPT_RNG_USE_ENTROPY_IN_BUFFER  0x1
#define BCRYPT_USE_SYSTEM_PREFERRED_RNG  0x2

; BP_ANIMATIONSTYLE
#define BPAS_NONE  0x0
#define BPAS_LINEAR  0x1
#define BPAS_CUBIC  0x2
#define BPAS_SINE  0x3

; BP_BUFFERFORMAT
#define BPBF_COMPATIBLEBITMAP  0x0
#define BPBF_DIB  0x1
#define BPBF_TOPDOWNDIB  0x2
#define BPBF_TOPDOWNMONODIB  0x3

; BP_PAINTPARAMS_FLAGS
#define BPPF_ERASE  0x1
#define BPPF_NOCLIP  0x2
#define BPPF_NONCLIENT  0x4

; BROADCAST_SYSTEM_MESSAGE_FLAGS
#define BSF_ALLOWSFW  0x80
#define BSF_FLUSHDISK  0x4
#define BSF_FORCEIFHUNG  0x20
#define BSF_IGNORECURRENTTASK  0x2
#define BSF_NOHANG  0x8
#define BSF_NOTIMEOUTIFNOTHUNG  0x40
#define BSF_POSTMESSAGE  0x10
#define BSF_QUERY  0x1
#define BSF_SENDNOTIFYMESSAGE  0x100
#define BSF_LUID  0x400
#define BSF_RETURNHDESK  0x200

; BROADCAST_SYSTEM_MESSAGE_INFO
#define BSM_ALLCOMPONENTS  0x0
#define BSM_ALLDESKTOPS  0x10
#define BSM_APPLICATIONS  0x8

; BRUSH_STYLE
#define BS_SOLID  0x0
#define BS_NULL  0x1
#define BS_HOLLOW  0x1
#define BS_HATCHED  0x2
#define BS_PATTERN  0x3
#define BS_INDEXED  0x4
#define BS_DIBPATTERN  0x5
#define BS_DIBPATTERNPT  0x6
#define BS_PATTERN8X8  0x7
#define BS_DIBPATTERN8X8  0x8
#define BS_MONOPATTERN  0x9

; BrushType
#define BrushTypeSolidColor  0x0
#define BrushTypeHatchFill  0x1
#define BrushTypeTextureFill  0x2
#define BrushTypePathGradient  0x3
#define BrushTypeLinearGradient  0x4

; CACHE_CONFIG
#define CACHE_CONFIG_FORCE_CLEANUP_FC  0x20
#define CACHE_CONFIG_DISK_CACHE_PATHS_FC  0x40
#define CACHE_CONFIG_SYNC_MODE_FC  0x80
#define CACHE_CONFIG_CONTENT_PATHS_FC  0x100
#define CACHE_CONFIG_HISTORY_PATHS_FC  0x400
#define CACHE_CONFIG_COOKIES_PATHS_FC  0x200
#define CACHE_CONFIG_QUOTA_FC  0x800
#define CACHE_CONFIG_USER_MODE_FC  0x1000
#define CACHE_CONFIG_CONTENT_USAGE_FC  0x2000
#define CACHE_CONFIG_STICKY_CONTENT_USAGE_FC  0x4000

; CALDATETIME_DATEUNIT
#define EraUnit  0x0
#define YearUnit  0x1
#define MonthUnit  0x2
#define WeekUnit  0x3
#define DayUnit  0x4
#define HourUnit  0x5
#define MinuteUnit  0x6
#define SecondUnit  0x7
#define TickUnit  0x8

; CALLCONV
#define CC_FASTCALL  0x0
#define CC_CDECL  0x1
#define CC_MSCPASCAL  0x2
#define CC_PASCAL  0x2
#define CC_MACPASCAL  0x3
#define CC_STDCALL  0x4
#define CC_FPFASTCALL  0x5
#define CC_SYSCALL  0x6
#define CC_MPWCDECL  0x7
#define CC_MPWPASCAL  0x8
#define CC_MAX  0x9

; CASCADE_WINDOWS_HOW
#define MDITILE_SKIPDISABLED  0x2
#define MDITILE_ZORDER  0x4

; CDS_TYPE
#define CDS_FULLSCREEN  0x4
#define CDS_GLOBAL  0x8
#define CDS_NORESET  0x10000000
#define CDS_RESET  0x40000000
#define CDS_SET_PRIMARY  0x10
#define CDS_TEST  0x2
#define CDS_UPDATEREGISTRY  0x1
#define CDS_VIDEOPARAMETERS  0x20
#define CDS_ENABLE_UNSAFE_MODES  0x100
#define CDS_DISABLE_UNSAFE_MODES  0x200
#define CDS_RESET_EX  0x20000000

; CERT_CHAIN_POLICY_FLAGS
#define CERT_CHAIN_POLICY_IGNORE_NOT_TIME_VALID_FLAG  0x1
#define CERT_CHAIN_POLICY_IGNORE_CTL_NOT_TIME_VALID_FLAG  0x2
#define CERT_CHAIN_POLICY_IGNORE_NOT_TIME_NESTED_FLAG  0x4
#define CERT_CHAIN_POLICY_IGNORE_ALL_NOT_TIME_VALID_FLAGS  0x7
#define CERT_CHAIN_POLICY_IGNORE_INVALID_BASIC_CONSTRAINTS_FLAG  0x8
#define CERT_CHAIN_POLICY_ALLOW_UNKNOWN_CA_FLAG  0x10
#define CERT_CHAIN_POLICY_IGNORE_WRONG_USAGE_FLAG  0x20
#define CERT_CHAIN_POLICY_IGNORE_INVALID_NAME_FLAG  0x40
#define CERT_CHAIN_POLICY_IGNORE_INVALID_POLICY_FLAG  0x80
#define CERT_CHAIN_POLICY_IGNORE_END_REV_UNKNOWN_FLAG  0x100
#define CERT_CHAIN_POLICY_IGNORE_CTL_SIGNER_REV_UNKNOWN_FLAG  0x200
#define CERT_CHAIN_POLICY_IGNORE_CA_REV_UNKNOWN_FLAG  0x400
#define CERT_CHAIN_POLICY_IGNORE_ROOT_REV_UNKNOWN_FLAG  0x800
#define CERT_CHAIN_POLICY_IGNORE_ALL_REV_UNKNOWN_FLAGS  0xf00
#define CERT_CHAIN_POLICY_ALLOW_TESTROOT_FLAG  0x8000
#define CERT_CHAIN_POLICY_TRUST_TESTROOT_FLAG  0x4000
#define CERT_CHAIN_POLICY_IGNORE_NOT_SUPPORTED_CRITICAL_EXT_FLAG  0x2000
#define CERT_CHAIN_POLICY_IGNORE_PEER_TRUST_FLAG  0x1000

; CERT_CONTROL_STORE_FLAGS
#define CERT_STORE_CTRL_COMMIT_FORCE_FLAG  0x1
#define CERT_STORE_CTRL_COMMIT_CLEAR_FLAG  0x2
#define CERT_STORE_CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG  0x1

; CERT_CREATE_SELFSIGN_FLAGS
#define CERT_CREATE_SELFSIGN_NO_KEY_INFO  0x2
#define CERT_CREATE_SELFSIGN_NO_SIGN  0x1

; CERT_FIND_CHAIN_IN_STORE_FLAGS
#define CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG  0x1
#define CERT_CHAIN_FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG  0x2
#define CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_FLAG  0x8000
#define CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG  0x4
#define CERT_CHAIN_FIND_BY_ISSUER_LOCAL_MACHINE_FLAG  0x8
#define CERT_CHAIN_FIND_BY_ISSUER_NO_KEY_FLAG  0x4000

; CERT_FIND_FLAGS
#define CERT_FIND_ANY  0x0
#define CERT_FIND_CERT_ID  0x100000
#define CERT_FIND_CTL_USAGE  0xa0000
#define CERT_FIND_ENHKEY_USAGE  0xa0000
#define CERT_FIND_EXISTING  0xd0000
#define CERT_FIND_HASH  0x10000
#define CERT_FIND_HAS_PRIVATE_KEY  0x150000
#define CERT_FIND_ISSUER_ATTR  0x30004
#define CERT_FIND_ISSUER_NAME  0x20004
#define CERT_FIND_ISSUER_OF  0xc0000
#define CERT_FIND_ISSUER_STR  0x80004
#define CERT_FIND_KEY_IDENTIFIER  0xf0000
#define CERT_FIND_KEY_SPEC  0x90000
#define CERT_FIND_MD5_HASH  0x40000
#define CERT_FIND_PROPERTY  0x50000
#define CERT_FIND_PUBLIC_KEY  0x60000
#define CERT_FIND_SHA1_HASH  0x10000
#define CERT_FIND_SIGNATURE_HASH  0xe0000
#define CERT_FIND_SUBJECT_ATTR  0x30007
#define CERT_FIND_SUBJECT_CERT  0xb0000
#define CERT_FIND_SUBJECT_NAME  0x20007
#define CERT_FIND_SUBJECT_STR  0x80007
#define CERT_FIND_CROSS_CERT_DIST_POINTS  0x110000
#define CERT_FIND_PUBKEY_MD5_HASH  0x120000
#define CERT_FIND_SUBJECT_STR_A  0x70007
#define CERT_FIND_SUBJECT_STR_W  0x80007
#define CERT_FIND_ISSUER_STR_A  0x70004
#define CERT_FIND_ISSUER_STR_W  0x80004
#define CERT_FIND_SUBJECT_INFO_ACCESS  0x130000
#define CERT_FIND_HASH_STR  0x140000
#define CERT_FIND_OPTIONAL_ENHKEY_USAGE_FLAG  0x1
#define CERT_FIND_EXT_ONLY_ENHKEY_USAGE_FLAG  0x2
#define CERT_FIND_PROP_ONLY_ENHKEY_USAGE_FLAG  0x4
#define CERT_FIND_NO_ENHKEY_USAGE_FLAG  0x8
#define CERT_FIND_OR_ENHKEY_USAGE_FLAG  0x10
#define CERT_FIND_VALID_ENHKEY_USAGE_FLAG  0x20
#define CERT_FIND_OPTIONAL_CTL_USAGE_FLAG  0x1
#define CERT_FIND_EXT_ONLY_CTL_USAGE_FLAG  0x2
#define CERT_FIND_PROP_ONLY_CTL_USAGE_FLAG  0x4
#define CERT_FIND_NO_CTL_USAGE_FLAG  0x8
#define CERT_FIND_OR_CTL_USAGE_FLAG  0x10
#define CERT_FIND_VALID_CTL_USAGE_FLAG  0x20

; CERT_FIND_TYPE
#define CTL_FIND_ANY  0x0
#define CTL_FIND_SHA1_HASH  0x1
#define CTL_FIND_MD5_HASH  0x2
#define CTL_FIND_USAGE  0x3
#define CTL_FIND_SAME_USAGE_FLAG  0x1
#define CTL_FIND_EXISTING  0x5
#define CTL_FIND_SUBJECT  0x4

; CERT_KEY_SPEC
#define AT_KEYEXCHANGE  0x1
#define AT_SIGNATURE  0x2
#define CERT_NCRYPT_KEY_SPEC  0xffffffff

; CERT_OPEN_STORE_FLAGS
#define CERT_STORE_BACKUP_RESTORE_FLAG  0x800
#define CERT_STORE_CREATE_NEW_FLAG  0x2000
#define CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG  0x4
#define CERT_STORE_DELETE_FLAG  0x10
#define CERT_STORE_ENUM_ARCHIVED_FLAG  0x200
#define CERT_STORE_MAXIMUM_ALLOWED_FLAG  0x1000
#define CERT_STORE_NO_CRYPT_RELEASE_FLAG  0x1
#define CERT_STORE_OPEN_EXISTING_FLAG  0x4000
#define CERT_STORE_READONLY_FLAG  0x8000
#define CERT_STORE_SET_LOCALIZED_NAME_FLAG  0x2
#define CERT_STORE_SHARE_CONTEXT_FLAG  0x80
#define CERT_STORE_UPDATE_KEYID_FLAG  0x400

; CERT_QUERY_CONTENT_TYPE
#define CERT_QUERY_CONTENT_CERT  0x1
#define CERT_QUERY_CONTENT_CTL  0x2
#define CERT_QUERY_CONTENT_CRL  0x3
#define CERT_QUERY_CONTENT_SERIALIZED_STORE  0x4
#define CERT_QUERY_CONTENT_SERIALIZED_CERT  0x5
#define CERT_QUERY_CONTENT_SERIALIZED_CTL  0x6
#define CERT_QUERY_CONTENT_SERIALIZED_CRL  0x7
#define CERT_QUERY_CONTENT_PKCS7_SIGNED  0x8
#define CERT_QUERY_CONTENT_PKCS7_UNSIGNED  0x9
#define CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED  0xa
#define CERT_QUERY_CONTENT_PKCS10  0xb
#define CERT_QUERY_CONTENT_PFX  0xc
#define CERT_QUERY_CONTENT_CERT_PAIR  0xd
#define CERT_QUERY_CONTENT_PFX_AND_LOAD  0xe

; CERT_QUERY_CONTENT_TYPE_FLAGS
#define CERT_QUERY_CONTENT_FLAG_CERT  0x2
#define CERT_QUERY_CONTENT_FLAG_CTL  0x4
#define CERT_QUERY_CONTENT_FLAG_CRL  0x8
#define CERT_QUERY_CONTENT_FLAG_SERIALIZED_STORE  0x10
#define CERT_QUERY_CONTENT_FLAG_SERIALIZED_CERT  0x20
#define CERT_QUERY_CONTENT_FLAG_SERIALIZED_CTL  0x40
#define CERT_QUERY_CONTENT_FLAG_SERIALIZED_CRL  0x80
#define CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED  0x100
#define CERT_QUERY_CONTENT_FLAG_PKCS7_UNSIGNED  0x200
#define CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED  0x400
#define CERT_QUERY_CONTENT_FLAG_PKCS10  0x800
#define CERT_QUERY_CONTENT_FLAG_PFX  0x1000
#define CERT_QUERY_CONTENT_FLAG_CERT_PAIR  0x2000
#define CERT_QUERY_CONTENT_FLAG_PFX_AND_LOAD  0x4000
#define CERT_QUERY_CONTENT_FLAG_ALL  0x3ffe
#define CERT_QUERY_CONTENT_FLAG_ALL_ISSUER_CERT  0x332

; CERT_QUERY_ENCODING_TYPE
#define X509_ASN_ENCODING  0x1
#define PKCS_7_ASN_ENCODING  0x10000

; CERT_QUERY_FORMAT_TYPE
#define CERT_QUERY_FORMAT_BINARY  0x1
#define CERT_QUERY_FORMAT_BASE64_ENCODED  0x2
#define CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED  0x3

; CERT_QUERY_FORMAT_TYPE_FLAGS
#define CERT_QUERY_FORMAT_FLAG_BINARY  0x2
#define CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED  0x4
#define CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED  0x8
#define CERT_QUERY_FORMAT_FLAG_ALL  0xe

; CERT_QUERY_OBJECT_TYPE
#define CERT_QUERY_OBJECT_FILE  0x1
#define CERT_QUERY_OBJECT_BLOB  0x2

; CERT_RDN_ATTR_VALUE_TYPE
#define CERT_RDN_ANY_TYPE  0x0
#define CERT_RDN_NUMERIC_STRING  0x3
#define CERT_RDN_PRINTABLE_STRING  0x4
#define CERT_RDN_T61_STRING  0x5
#define CERT_RDN_VIDEOTEX_STRING  0x6
#define CERT_RDN_IA5_STRING  0x7
#define CERT_RDN_GRAPHIC_STRING  0x8
#define CERT_RDN_ISO646_STRING  0x9
#define CERT_RDN_GENERAL_STRING  0xa
#define CERT_RDN_INT4_STRING  0xb
#define CERT_RDN_UNICODE_STRING  0xc
#define CERT_RDN_BMP_STRING  0xc
#define CERT_RDN_ENCODED_BLOB  0x1
#define CERT_RDN_OCTET_STRING  0x2
#define CERT_RDN_TELETEX_STRING  0x5
#define CERT_RDN_UNIVERSAL_STRING  0xb
#define CERT_RDN_UTF8_STRING  0xd
#define CERT_RDN_VISIBLE_STRING  0x9

; CERT_REVOCATION_STATUS_REASON
#define CRL_REASON_UNSPECIFIED  0x0
#define CRL_REASON_KEY_COMPROMISE  0x1
#define CRL_REASON_CA_COMPROMISE  0x2
#define CRL_REASON_AFFILIATION_CHANGED  0x3
#define CRL_REASON_SUPERSEDED  0x4
#define CRL_REASON_CESSATION_OF_OPERATION  0x5
#define CRL_REASON_CERTIFICATE_HOLD  0x6
#define CRL_REASON_REMOVE_FROM_CRL  0x8

; CERT_SELECT_CRITERIA_TYPE
#define CERT_SELECT_BY_ENHKEY_USAGE  0x1
#define CERT_SELECT_BY_KEY_USAGE  0x2
#define CERT_SELECT_BY_POLICY_OID  0x3
#define CERT_SELECT_BY_PROV_NAME  0x4
#define CERT_SELECT_BY_EXTENSION  0x5
#define CERT_SELECT_BY_SUBJECT_HOST_NAME  0x6
#define CERT_SELECT_BY_ISSUER_ATTR  0x7
#define CERT_SELECT_BY_SUBJECT_ATTR  0x8
#define CERT_SELECT_BY_ISSUER_NAME  0x9
#define CERT_SELECT_BY_PUBLIC_KEY  0xa
#define CERT_SELECT_BY_TLS_SIGNATURES  0xb

; CERT_STORE_SAVE_AS
#define CERT_STORE_SAVE_AS_PKCS7  0x2
#define CERT_STORE_SAVE_AS_STORE  0x1

; CERT_STORE_SAVE_TO
#define CERT_STORE_SAVE_TO_FILE  0x1
#define CERT_STORE_SAVE_TO_FILENAME  0x4
#define CERT_STORE_SAVE_TO_FILENAME_A  0x3
#define CERT_STORE_SAVE_TO_FILENAME_W  0x4
#define CERT_STORE_SAVE_TO_MEMORY  0x2

; CERT_STRING_TYPE
#define CERT_SIMPLE_NAME_STR  0x1
#define CERT_OID_NAME_STR  0x2
#define CERT_X500_NAME_STR  0x3

; CERT_STRONG_SIGN_FLAGS
#define CERT_STRONG_SIGN_ENABLE_CRL_CHECK  0x1
#define CERT_STRONG_SIGN_ENABLE_OCSP_CHECK  0x2

; CERT_SYSTEM_STORE_FLAGS
#define CERT_SYSTEM_STORE_LOCATION_MASK  0xff0000
#define CERT_SYSTEM_STORE_RELOCATE_FLAG  0x80000000

; CHANGE_WINDOW_MESSAGE_FILTER_FLAGS
#define MSGFLT_ADD  0x1
#define MSGFLT_REMOVE  0x2

; CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64  0x1
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64  0x2
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING  0x3
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING  0x10
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN  0x4
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_SID  0x5
#define CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN  0x6

; CLEAR_COMM_ERROR_FLAGS
#define CE_BREAK  0x10
#define CE_FRAME  0x8
#define CE_OVERRUN  0x2
#define CE_RXOVER  0x1
#define CE_RXPARITY  0x4

; CLIPBOARD_FORMAT
#define CF_TEXT  0x1
#define CF_BITMAP  0x2
#define CF_METAFILEPICT  0x3
#define CF_SYLK  0x4
#define CF_DIF  0x5
#define CF_TIFF  0x6
#define CF_OEMTEXT  0x7
#define CF_DIB  0x8
#define CF_PALETTE  0x9
#define CF_PENDATA  0xa
#define CF_RIFF  0xb
#define CF_WAVE  0xc
#define CF_UNICODETEXT  0xd
#define CF_ENHMETAFILE  0xe
#define CF_HDROP  0xf
#define CF_LOCALE  0x10
#define CF_DIBV5  0x11
#define CF_MAX  0x12
#define CF_OWNERDISPLAY  0x80
#define CF_DSPTEXT  0x81
#define CF_DSPBITMAP  0x82
#define CF_DSPMETAFILEPICT  0x83
#define CF_DSPENHMETAFILE  0x8e
#define CF_PRIVATEFIRST  0x200
#define CF_PRIVATELAST  0x2ff
#define CF_GDIOBJFIRST  0x300
#define CF_GDIOBJLAST  0x3ff

; CLSCTX
#define CLSCTX_INPROC_SERVER  0x1
#define CLSCTX_INPROC_HANDLER  0x2
#define CLSCTX_LOCAL_SERVER  0x4
#define CLSCTX_INPROC_SERVER16  0x8
#define CLSCTX_REMOTE_SERVER  0x10
#define CLSCTX_INPROC_HANDLER16  0x20
#define CLSCTX_RESERVED1  0x40
#define CLSCTX_RESERVED2  0x80
#define CLSCTX_RESERVED3  0x100
#define CLSCTX_RESERVED4  0x200
#define CLSCTX_NO_CODE_DOWNLOAD  0x400
#define CLSCTX_RESERVED5  0x800
#define CLSCTX_NO_CUSTOM_MARSHAL  0x1000
#define CLSCTX_ENABLE_CODE_DOWNLOAD  0x2000
#define CLSCTX_NO_FAILURE_LOG  0x4000
#define CLSCTX_DISABLE_AAA  0x8000
#define CLSCTX_ENABLE_AAA  0x10000
#define CLSCTX_FROM_DEFAULT_CONTEXT  0x20000
#define CLSCTX_ACTIVATE_X86_SERVER  0x40000
#define CLSCTX_ACTIVATE_32_BIT_SERVER  0x40000
#define CLSCTX_ACTIVATE_64_BIT_SERVER  0x80000
#define CLSCTX_ENABLE_CLOAKING  0x100000
#define CLSCTX_APPCONTAINER  0x400000
#define CLSCTX_ACTIVATE_AAA_AS_IU  0x800000
#define CLSCTX_RESERVED6  0x1000000
#define CLSCTX_ACTIVATE_ARM32_SERVER  0x2000000
#define CLSCTX_ALLOW_LOWER_TRUST_REGISTRATION  0x4000000
#define CLSCTX_PS_DLL  0x80000000
#define CLSCTX_ALL  0x17
#define CLSCTX_SERVER  0x15

; COLOR_MATCH_TO_TARGET_ACTION
#define CS_ENABLE  0x1
#define CS_DISABLE  0x2
#define CS_DELETE_TRANSFORM  0x3

; ColorAdjustType
#define ColorAdjustTypeDefault  0x0
#define ColorAdjustTypeBitmap  0x1
#define ColorAdjustTypeBrush  0x2
#define ColorAdjustTypePen  0x3
#define ColorAdjustTypeText  0x4
#define ColorAdjustTypeCount  0x5
#define ColorAdjustTypeAny  0x6

; ColorChannelFlags
#define ColorChannelFlagsC  0x0
#define ColorChannelFlagsM  0x1
#define ColorChannelFlagsY  0x2
#define ColorChannelFlagsK  0x3
#define ColorChannelFlagsLast  0x4

; ColorMatrixFlags
#define ColorMatrixFlagsDefault  0x0
#define ColorMatrixFlagsSkipGrays  0x1
#define ColorMatrixFlagsAltGray  0x2

; CombineMode
#define CombineModeReplace  0x0
#define CombineModeIntersect  0x1
#define CombineModeUnion  0x2
#define CombineModeXor  0x3
#define CombineModeExclude  0x4
#define CombineModeComplement  0x5

; COMBOBOXINFO_BUTTON_STATE
#define STATE_SYSTEM_INVISIBLE  0x8000
#define STATE_SYSTEM_PRESSED  0x8
#define STATE_SYSTEM_FOCUSABLE  0x100000
#define STATE_SYSTEM_OFFSCREEN  0x10000
#define STATE_SYSTEM_UNAVAILABLE  0x1

; COMM_EVENT_MASK
#define EV_BREAK  0x40
#define EV_CTS  0x8
#define EV_DSR  0x10
#define EV_ERR  0x80
#define EV_EVENT1  0x800
#define EV_EVENT2  0x1000
#define EV_PERR  0x200
#define EV_RING  0x100
#define EV_RLSD  0x20
#define EV_RX80FULL  0x400
#define EV_RXCHAR  0x1
#define EV_RXFLAG  0x2
#define EV_TXEMPTY  0x4

; COMMON_DLG_ERRORS
#define CDERR_DIALOGFAILURE  0xffff
#define CDERR_GENERALCODES  0x0
#define CDERR_STRUCTSIZE  0x1
#define CDERR_INITIALIZATION  0x2
#define CDERR_NOTEMPLATE  0x3
#define CDERR_NOHINSTANCE  0x4
#define CDERR_LOADSTRFAILURE  0x5
#define CDERR_FINDRESFAILURE  0x6
#define CDERR_LOADRESFAILURE  0x7
#define CDERR_LOCKRESFAILURE  0x8
#define CDERR_MEMALLOCFAILURE  0x9
#define CDERR_MEMLOCKFAILURE  0xa
#define CDERR_NOHOOK  0xb
#define CDERR_REGISTERMSGFAIL  0xc
#define PDERR_PRINTERCODES  0x1000
#define PDERR_SETUPFAILURE  0x1001
#define PDERR_PARSEFAILURE  0x1002
#define PDERR_RETDEFFAILURE  0x1003
#define PDERR_LOADDRVFAILURE  0x1004
#define PDERR_GETDEVMODEFAIL  0x1005
#define PDERR_INITFAILURE  0x1006
#define PDERR_NODEVICES  0x1007
#define PDERR_NODEFAULTPRN  0x1008
#define PDERR_DNDMMISMATCH  0x1009
#define PDERR_CREATEICFAILURE  0x100a
#define PDERR_PRINTERNOTFOUND  0x100b
#define PDERR_DEFAULTDIFFERENT  0x100c
#define CFERR_CHOOSEFONTCODES  0x2000
#define CFERR_NOFONTS  0x2001
#define CFERR_MAXLESSTHANMIN  0x2002
#define FNERR_FILENAMECODES  0x3000
#define FNERR_SUBCLASSFAILURE  0x3001
#define FNERR_INVALIDFILENAME  0x3002
#define FNERR_BUFFERTOOSMALL  0x3003
#define FRERR_FINDREPLACECODES  0x4000
#define FRERR_BUFFERLENGTHZERO  0x4001
#define CCERR_CHOOSECOLORCODES  0x5000

; COMMPROP_STOP_PARITY
#define STOPBITS_10  0x1
#define STOPBITS_15  0x2
#define STOPBITS_20  0x4
#define PARITY_NONE  0x100
#define PARITY_ODD  0x200
#define PARITY_EVEN  0x400
#define PARITY_MARK  0x800
#define PARITY_SPACE  0x1000

; COMPARE_STRING_FLAGS
#define LINGUISTIC_IGNORECASE  0x10
#define LINGUISTIC_IGNOREDIACRITIC  0x20
#define NORM_IGNORECASE  0x1
#define NORM_IGNOREKANATYPE  0x10000
#define NORM_IGNORENONSPACE  0x2
#define NORM_IGNORESYMBOLS  0x4
#define NORM_IGNOREWIDTH  0x20000
#define NORM_LINGUISTIC_CASING  0x8000000
#define SORT_DIGITSASNUMBERS  0x8
#define SORT_STRINGSORT  0x1000

; COMPARESTRING_RESULT
#define CSTR_LESS_THAN  0x1
#define CSTR_EQUAL  0x2
#define CSTR_GREATER_THAN  0x3

; CompositingMode
#define CompositingModeSourceOver  0x0
#define CompositingModeSourceCopy  0x1

; CompositingQuality
#define CompositingQualityInvalid  -1
#define CompositingQualityDefault  0x0
#define CompositingQualityHighSpeed  0x1
#define CompositingQualityHighQuality  0x2
#define CompositingQualityGammaCorrected  0x3
#define CompositingQualityAssumeLinear  0x4

; COMPUTER_NAME_FORMAT
#define ComputerNameNetBIOS  0x0
#define ComputerNameDnsHostname  0x1
#define ComputerNameDnsDomain  0x2
#define ComputerNameDnsFullyQualified  0x3
#define ComputerNamePhysicalNetBIOS  0x4
#define ComputerNamePhysicalDnsHostname  0x5
#define ComputerNamePhysicalDnsDomain  0x6
#define ComputerNamePhysicalDnsFullyQualified  0x7
#define ComputerNameMax  0x8

; CONSOLE_CHARACTER_ATTRIBUTES
#define FOREGROUND_BLUE  0x1
#define FOREGROUND_GREEN  0x2
#define FOREGROUND_RED  0x4
#define FOREGROUND_INTENSITY  0x8
#define BACKGROUND_BLUE  0x10
#define BACKGROUND_GREEN  0x20
#define BACKGROUND_RED  0x40
#define BACKGROUND_INTENSITY  0x80
#define COMMON_LVB_LEADING_BYTE  0x100
#define COMMON_LVB_TRAILING_BYTE  0x200
#define COMMON_LVB_GRID_HORIZONTAL  0x400
#define COMMON_LVB_GRID_LVERTICAL  0x800
#define COMMON_LVB_GRID_RVERTICAL  0x1000
#define COMMON_LVB_REVERSE_VIDEO  0x4000
#define COMMON_LVB_UNDERSCORE  0x8000
#define COMMON_LVB_SBCSDBCS  0x300

; CONSOLE_MODE
#define ENABLE_PROCESSED_INPUT  0x1
#define ENABLE_LINE_INPUT  0x2
#define ENABLE_ECHO_INPUT  0x4
#define ENABLE_WINDOW_INPUT  0x8
#define ENABLE_MOUSE_INPUT  0x10
#define ENABLE_INSERT_MODE  0x20
#define ENABLE_QUICK_EDIT_MODE  0x40
#define ENABLE_EXTENDED_FLAGS  0x80
#define ENABLE_AUTO_POSITION  0x100
#define ENABLE_VIRTUAL_TERMINAL_INPUT  0x200
#define ENABLE_PROCESSED_OUTPUT  0x1
#define ENABLE_WRAP_AT_EOL_OUTPUT  0x2
#define ENABLE_VIRTUAL_TERMINAL_PROCESSING  0x4
#define DISABLE_NEWLINE_AUTO_RETURN  0x8
#define ENABLE_LVB_GRID_WORLDWIDE  0x10

; CONSOLECONTROL
#define Reserved1  0x0
#define ConsoleNotifyConsoleApplication  0x1
#define Reserved2  0x2
#define ConsoleSetCaretInfo  0x3
#define Reserved3  0x4
#define ConsoleSetForeground  0x5
#define ConsoleSetWindowOwner  0x6
#define ConsoleEndTask  0x7

; CONVINFO_CONVERSATION_STATE
#define XST_ADVACKRCVD  0xd
#define XST_ADVDATAACKRCVD  0x10
#define XST_ADVDATASENT  0xf
#define XST_ADVSENT  0xb
#define XST_CONNECTED  0x2
#define XST_DATARCVD  0x6
#define XST_EXECACKRCVD  0xa
#define XST_EXECSENT  0x9
#define XST_INCOMPLETE  0x1
#define XST_INIT1  0x3
#define XST_INIT2  0x4
#define XST_NULL  0x0
#define XST_POKEACKRCVD  0x8
#define XST_POKESENT  0x7
#define XST_REQSENT  0x5
#define XST_UNADVACKRCVD  0xe
#define XST_UNADVSENT  0xc

; CONVINFO_STATUS
#define ST_ADVISE  0x2
#define ST_BLOCKED  0x8
#define ST_BLOCKNEXT  0x80
#define ST_CLIENT  0x10
#define ST_CONNECTED  0x1
#define ST_INLIST  0x40
#define ST_ISLOCAL  0x4
#define ST_ISSELF  0x100
#define ST_TERMINATED  0x20

; CoordinateSpace
#define CoordinateSpaceWorld  0x0
#define CoordinateSpacePage  0x1
#define CoordinateSpaceDevice  0x2

; COPYFILE2_COPY_PHASE
#define COPYFILE2_PHASE_NONE  0x0
#define COPYFILE2_PHASE_PREPARE_SOURCE  0x1
#define COPYFILE2_PHASE_PREPARE_DEST  0x2
#define COPYFILE2_PHASE_READ_SOURCE  0x3
#define COPYFILE2_PHASE_WRITE_DESTINATION  0x4
#define COPYFILE2_PHASE_SERVER_COPY  0x5
#define COPYFILE2_PHASE_NAMEGRAFT_COPY  0x6
#define COPYFILE2_PHASE_MAX  0x7

; COPYFILE2_MESSAGE_ACTION
#define COPYFILE2_PROGRESS_CONTINUE  0x0
#define COPYFILE2_PROGRESS_CANCEL  0x1
#define COPYFILE2_PROGRESS_STOP  0x2
#define COPYFILE2_PROGRESS_QUIET  0x3
#define COPYFILE2_PROGRESS_PAUSE  0x4

; COPYFILE2_MESSAGE_TYPE
#define COPYFILE2_CALLBACK_NONE  0x0
#define COPYFILE2_CALLBACK_CHUNK_STARTED  0x1
#define COPYFILE2_CALLBACK_CHUNK_FINISHED  0x2
#define COPYFILE2_CALLBACK_STREAM_STARTED  0x3
#define COPYFILE2_CALLBACK_STREAM_FINISHED  0x4
#define COPYFILE2_CALLBACK_POLL_CONTINUE  0x5
#define COPYFILE2_CALLBACK_ERROR  0x6
#define COPYFILE2_CALLBACK_MAX  0x7

; CREATE_EVENT
#define CREATE_EVENT_INITIAL_SET  0x2
#define CREATE_EVENT_MANUAL_RESET  0x1

; CREATE_POLYGON_RGN_MODE
#define ALTERNATE  0x1
#define WINDING  0x2

; CREATE_PROCESS_LOGON_FLAGS
#define LOGON_WITH_PROFILE  0x1
#define LOGON_NETCREDENTIALS_ONLY  0x2

; CREATE_RESTRICTED_TOKEN_FLAGS
#define DISABLE_MAX_PRIVILEGE  0x1
#define SANDBOX_INERT  0x2
#define LUA_TOKEN  0x4
#define WRITE_RESTRICTED  0x8

; CREATE_TAPE_PARTITION_METHOD
#define TAPE_FIXED_PARTITIONS  0x0
#define TAPE_INITIATOR_PARTITIONS  0x2
#define TAPE_SELECT_PARTITIONS  0x1

; CREATE_TOOLHELP_SNAPSHOT_FLAGS
#define TH32CS_INHERIT  0x80000000
#define TH32CS_SNAPALL  0xf
#define TH32CS_SNAPHEAPLIST  0x1
#define TH32CS_SNAPMODULE  0x8
#define TH32CS_SNAPMODULE32  0x10
#define TH32CS_SNAPPROCESS  0x2
#define TH32CS_SNAPTHREAD  0x4

; CRED_ENUMERATE_FLAGS
#define CRED_ENUMERATE_ALL_CREDENTIALS  0x1

; CRED_FLAGS
#define CRED_FLAGS_PASSWORD_FOR_CERT  0x1
#define CRED_FLAGS_PROMPT_NOW  0x2
#define CRED_FLAGS_USERNAME_TARGET  0x4
#define CRED_FLAGS_OWF_CRED_BLOB  0x8
#define CRED_FLAGS_REQUIRE_CONFIRMATION  0x10
#define CRED_FLAGS_WILDCARD_MATCH  0x20
#define CRED_FLAGS_VSM_PROTECTED  0x40
#define CRED_FLAGS_NGC_CERT  0x80
#define CRED_FLAGS_VALID_FLAGS  0xf0ff
#define CRED_FLAGS_VALID_INPUT_FLAGS  0xf09f

; CRED_MARSHAL_TYPE
#define CertCredential  0x1
#define UsernameTargetCredential  0x2
#define BinaryBlobCredential  0x3
#define UsernameForPackedCredentials  0x4
#define BinaryBlobForSystem  0x5

; CRED_PERSIST
#define CRED_PERSIST_NONE  0x0
#define CRED_PERSIST_SESSION  0x1
#define CRED_PERSIST_LOCAL_MACHINE  0x2
#define CRED_PERSIST_ENTERPRISE  0x3

; CRED_PROTECTION_TYPE
#define CredUnprotected  0x0
#define CredUserProtection  0x1
#define CredTrustedProtection  0x2
#define CredForSystemProtection  0x3

; CRED_TYPE
#define CRED_TYPE_GENERIC  0x1
#define CRED_TYPE_DOMAIN_PASSWORD  0x2
#define CRED_TYPE_DOMAIN_CERTIFICATE  0x3
#define CRED_TYPE_DOMAIN_VISIBLE_PASSWORD  0x4
#define CRED_TYPE_GENERIC_CERTIFICATE  0x5
#define CRED_TYPE_DOMAIN_EXTENDED  0x6
#define CRED_TYPE_MAXIMUM  0x7
#define CRED_TYPE_MAXIMUM_EX  0x3ef

; CRYPT_ACQUIRE_FLAGS
#define CRYPT_ACQUIRE_CACHE_FLAG  0x1
#define CRYPT_ACQUIRE_USE_PROV_INFO_FLAG  0x2
#define CRYPT_ACQUIRE_COMPARE_KEY_FLAG  0x4
#define CRYPT_ACQUIRE_NO_HEALING  0x8
#define CRYPT_ACQUIRE_SILENT_FLAG  0x40
#define CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG  0x80
#define CRYPT_ACQUIRE_NCRYPT_KEY_FLAGS_MASK  0x70000
#define CRYPT_ACQUIRE_ALLOW_NCRYPT_KEY_FLAG  0x10000
#define CRYPT_ACQUIRE_PREFER_NCRYPT_KEY_FLAG  0x20000
#define CRYPT_ACQUIRE_ONLY_NCRYPT_KEY_FLAG  0x40000

; CRYPT_CONTEXT_CONFIG_FLAGS
#define CRYPT_EXCLUSIVE  0x1
#define CRYPT_OVERRIDE  0x10000

; CRYPT_DEFAULT_CONTEXT_FLAGS
#define CRYPT_DEFAULT_CONTEXT_AUTO_RELEASE_FLAG  0x1
#define CRYPT_DEFAULT_CONTEXT_PROCESS_FLAG  0x2

; CRYPT_DEFAULT_CONTEXT_TYPE
#define CRYPT_DEFAULT_CONTEXT_CERT_SIGN_OID  0x1
#define CRYPT_DEFAULT_CONTEXT_MULTI_CERT_SIGN_OID  0x2

; CRYPT_ENCODE_OBJECT_FLAGS
#define CRYPT_ENCODE_ALLOC_FLAG  0x8000
#define CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG  0x20000
#define CRYPT_UNICODE_NAME_ENCODE_DISABLE_CHECK_TYPE_FLAG  0x40000000
#define CRYPT_UNICODE_NAME_ENCODE_ENABLE_T61_UNICODE_FLAG  0x80000000
#define CRYPT_UNICODE_NAME_ENCODE_ENABLE_UTF8_UNICODE_FLAG  0x20000000

; CRYPT_FIND_FLAGS
#define CRYPT_FIND_USER_KEYSET_FLAG  0x1
#define CRYPT_FIND_MACHINE_KEYSET_FLAG  0x2
#define CRYPT_FIND_SILENT_KEYSET_FLAG  0x40

; CRYPT_IMAGE_REF_FLAGS
#define CRYPT_MIN_DEPENDENCIES  0x1
#define CRYPT_PROCESS_ISOLATE  0x10000

; CRYPT_IMPORT_PUBLIC_KEY_FLAGS
#define CRYPT_OID_INFO_PUBKEY_SIGN_KEY_FLAG  0x80000000
#define CRYPT_OID_INFO_PUBKEY_ENCRYPT_KEY_FLAG  0x40000000

; CRYPT_KEY_FLAGS
#define CRYPT_EXPORTABLE  0x1
#define CRYPT_USER_PROTECTED  0x2
#define CRYPT_ARCHIVABLE  0x4000
#define CRYPT_CREATE_IV  0x200
#define CRYPT_CREATE_SALT  0x4
#define CRYPT_DATA_KEY  0x800
#define CRYPT_FORCE_KEY_PROTECTION_HIGH  0x8000
#define CRYPT_KEK  0x400
#define CRYPT_INITIATOR  0x40
#define CRYPT_NO_SALT  0x10
#define CRYPT_ONLINE  0x80
#define CRYPT_PREGEN  0x40
#define CRYPT_RECIPIENT  0x10
#define CRYPT_SF  0x100
#define CRYPT_SGCKEY  0x2000
#define CRYPT_VOLATILE  0x1000
#define CRYPT_MACHINE_KEYSET  0x20
#define CRYPT_USER_KEYSET  0x1000
#define PKCS12_PREFER_CNG_KSP  0x100
#define PKCS12_ALWAYS_CNG_KSP  0x200
#define PKCS12_ALLOW_OVERWRITE_KEY  0x4000
#define PKCS12_NO_PERSIST_KEY  0x8000
#define PKCS12_INCLUDE_EXTENDED_PROPERTIES  0x10
#define CRYPT_OAEP  0x40
#define CRYPT_BLOB_VER3  0x80
#define CRYPT_DESTROYKEY  0x4
#define CRYPT_SSL2_FALLBACK  0x2
#define CRYPT_Y_ONLY  0x1
#define CRYPT_IPSEC_HMAC_KEY  0x100
#define CERT_SET_KEY_PROV_HANDLE_PROP_ID  0x1
#define CERT_SET_KEY_CONTEXT_PROP_ID  0x1

; CRYPT_KEY_PARAM_ID
#define KP_ALGID  0x7
#define KP_CERTIFICATE  0x1a
#define KP_PERMISSIONS  0x6
#define KP_SALT  0x2
#define KP_SALT_EX  0xa
#define KP_BLOCKLEN  0x8
#define KP_GET_USE_COUNT  0x2a
#define KP_KEYLEN  0x9

; CRYPT_MSG_TYPE
#define CMSG_DATA  0x1
#define CMSG_SIGNED  0x2
#define CMSG_ENVELOPED  0x3
#define CMSG_SIGNED_AND_ENVELOPED  0x4
#define CMSG_HASHED  0x5

; CRYPT_SET_HASH_PARAM
#define HP_HMAC_INFO  0x5
#define HP_HASHVAL  0x2

; CRYPT_SET_PROV_PARAM_ID
#define PP_CLIENT_HWND  0x1
#define PP_DELETEKEY  0x18
#define PP_KEYEXCHANGE_ALG  0xe
#define PP_KEYEXCHANGE_PIN  0x20
#define PP_KEYEXCHANGE_KEYSIZE  0xc
#define PP_KEYSET_SEC_DESCR  0x8
#define PP_PIN_PROMPT_STRING  0x2c
#define PP_ROOT_CERTSTORE  0x2e
#define PP_SIGNATURE_ALG  0xf
#define PP_SIGNATURE_PIN  0x21
#define PP_SIGNATURE_KEYSIZE  0xd
#define PP_UI_PROMPT  0x15
#define PP_USE_HARDWARE_RNG  0x26
#define PP_USER_CERTSTORE  0x2a
#define PP_SECURE_KEYEXCHANGE_PIN  0x2f
#define PP_SECURE_SIGNATURE_PIN  0x30
#define PP_SMARTCARD_READER  0x2b

; CRYPT_STRING
#define CRYPT_STRING_BASE64HEADER  0x0
#define CRYPT_STRING_BASE64  0x1
#define CRYPT_STRING_BINARY  0x2
#define CRYPT_STRING_BASE64REQUESTHEADER  0x3
#define CRYPT_STRING_HEX  0x4
#define CRYPT_STRING_HEXASCII  0x5
#define CRYPT_STRING_BASE64X509CRLHEADER  0x9
#define CRYPT_STRING_HEXADDR  0xa
#define CRYPT_STRING_HEXASCIIADDR  0xb
#define CRYPT_STRING_HEXRAW  0xc
#define CRYPT_STRING_STRICT  0x20000000
#define CRYPT_STRING_BASE64_ANY  0x6
#define CRYPT_STRING_ANY  0x7
#define CRYPT_STRING_HEX_ANY  0x8

; CRYPT_VERIFY_CERT_FLAGS
#define CRYPT_VERIFY_CERT_SIGN_DISABLE_MD2_MD4_FLAG  0x1
#define CRYPT_VERIFY_CERT_SIGN_SET_STRONG_PROPERTIES_FLAG  0x2
#define CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG  0x4

; CRYPTCAT_OPEN_FLAGS
#define CRYPTCAT_OPEN_ALWAYS  0x2
#define CRYPTCAT_OPEN_CREATENEW  0x1
#define CRYPTCAT_OPEN_EXISTING  0x4
#define CRYPTCAT_OPEN_EXCLUDE_PAGE_HASHES  0x10000
#define CRYPTCAT_OPEN_INCLUDE_PAGE_HASHES  0x20000
#define CRYPTCAT_OPEN_VERIFYSIGHASH  0x10000000
#define CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG  0x20000000
#define CRYPTCAT_OPEN_SORTED  0x40000000
#define CRYPTCAT_OPEN_FLAGS_MASK  0xffff0000

; CURSORINFO_FLAGS
#define CURSOR_SHOWING  0x1
#define CURSOR_SUPPRESSED  0x2

; CustomLineCapType
#define CustomLineCapTypeDefault  0x0
#define CustomLineCapTypeAdjustableArrow  0x1

; CWP_FLAGS
#define CWP_ALL  0x0
#define CWP_SKIPINVISIBLE  0x1
#define CWP_SKIPDISABLED  0x2
#define CWP_SKIPTRANSPARENT  0x4

; D2D1_ALPHA_MODE
#define D2D1_ALPHA_MODE_UNKNOWN  0x0
#define D2D1_ALPHA_MODE_PREMULTIPLIED  0x1
#define D2D1_ALPHA_MODE_STRAIGHT  0x2
#define D2D1_ALPHA_MODE_IGNORE  0x3

; D2D1_ANTIALIAS_MODE
#define D2D1_ANTIALIAS_MODE_PER_PRIMITIVE  0x0
#define D2D1_ANTIALIAS_MODE_ALIASED  0x1

; D2D1_ARC_SIZE
#define D2D1_ARC_SIZE_SMALL  0x0
#define D2D1_ARC_SIZE_LARGE  0x1

; D2D1_BITMAP_INTERPOLATION_MODE
#define D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR  0x0
#define D2D1_BITMAP_INTERPOLATION_MODE_LINEAR  0x1

; D2D1_BITMAP_OPTIONS
#define D2D1_BITMAP_OPTIONS_NONE  0x0
#define D2D1_BITMAP_OPTIONS_TARGET  0x1
#define D2D1_BITMAP_OPTIONS_CANNOT_DRAW  0x2
#define D2D1_BITMAP_OPTIONS_CPU_READ  0x4
#define D2D1_BITMAP_OPTIONS_GDI_COMPATIBLE  0x8

; D2D1_BUFFER_PRECISION
#define D2D1_BUFFER_PRECISION_UNKNOWN  0x0
#define D2D1_BUFFER_PRECISION_8BPC_UNORM  0x1
#define D2D1_BUFFER_PRECISION_8BPC_UNORM_SRGB  0x2
#define D2D1_BUFFER_PRECISION_16BPC_UNORM  0x3
#define D2D1_BUFFER_PRECISION_16BPC_FLOAT  0x4
#define D2D1_BUFFER_PRECISION_32BPC_FLOAT  0x5

; D2D1_CAP_STYLE
#define D2D1_CAP_STYLE_FLAT  0x0
#define D2D1_CAP_STYLE_SQUARE  0x1
#define D2D1_CAP_STYLE_ROUND  0x2
#define D2D1_CAP_STYLE_TRIANGLE  0x3

; D2D1_COLOR_INTERPOLATION_MODE
#define D2D1_COLOR_INTERPOLATION_MODE_STRAIGHT  0x0
#define D2D1_COLOR_INTERPOLATION_MODE_PREMULTIPLIED  0x1

; D2D1_COLOR_SPACE
#define D2D1_COLOR_SPACE_CUSTOM  0x0
#define D2D1_COLOR_SPACE_SRGB  0x1
#define D2D1_COLOR_SPACE_SCRGB  0x2

; D2D1_COMBINE_MODE
#define D2D1_COMBINE_MODE_UNION  0x0
#define D2D1_COMBINE_MODE_INTERSECT  0x1
#define D2D1_COMBINE_MODE_XOR  0x2
#define D2D1_COMBINE_MODE_EXCLUDE  0x3

; D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS
#define D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_NONE  0x0
#define D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE  0x1

; D2D1_COMPOSITE_MODE
#define D2D1_COMPOSITE_MODE_SOURCE_OVER  0x0
#define D2D1_COMPOSITE_MODE_DESTINATION_OVER  0x1
#define D2D1_COMPOSITE_MODE_SOURCE_IN  0x2
#define D2D1_COMPOSITE_MODE_DESTINATION_IN  0x3
#define D2D1_COMPOSITE_MODE_SOURCE_OUT  0x4
#define D2D1_COMPOSITE_MODE_DESTINATION_OUT  0x5
#define D2D1_COMPOSITE_MODE_SOURCE_ATOP  0x6
#define D2D1_COMPOSITE_MODE_DESTINATION_ATOP  0x7
#define D2D1_COMPOSITE_MODE_XOR  0x8
#define D2D1_COMPOSITE_MODE_PLUS  0x9
#define D2D1_COMPOSITE_MODE_SOURCE_COPY  0xa
#define D2D1_COMPOSITE_MODE_BOUNDED_SOURCE_COPY  0xb
#define D2D1_COMPOSITE_MODE_MASK_INVERT  0xc

; D2D1_DASH_STYLE
#define D2D1_DASH_STYLE_SOLID  0x0

; D2D1_DEBUG_LEVEL
#define D2D1_DEBUG_LEVEL_NONE  0x0
#define D2D1_DEBUG_LEVEL_ERROR  0x1
#define D2D1_DEBUG_LEVEL_WARNING  0x2
#define D2D1_DEBUG_LEVEL_INFORMATION  0x3

; D2D1_DEVICE_CONTEXT_OPTIONS
#define D2D1_DEVICE_CONTEXT_OPTIONS_NONE  0x0
#define D2D1_DEVICE_CONTEXT_OPTIONS_ENABLE_MULTITHREADED_OPTIMIZATIONS  0x1

; D2D1_DRAW_TEXT_OPTIONS
#define D2D1_DRAW_TEXT_OPTIONS_NO_SNAP  0x1
#define D2D1_DRAW_TEXT_OPTIONS_CLIP  0x2
#define D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT  0x4
#define D2D1_DRAW_TEXT_OPTIONS_DISABLE_COLOR_BITMAP_SNAPPING  0x8
#define D2D1_DRAW_TEXT_OPTIONS_NONE  0x0

; D2D1_EXTEND_MODE
#define D2D1_EXTEND_MODE_CLAMP  0x0
#define D2D1_EXTEND_MODE_WRAP  0x1
#define D2D1_EXTEND_MODE_MIRROR  0x2

; D2D1_FACTORY_TYPE
#define D2D1_FACTORY_TYPE_SINGLE_THREADED  0x0
#define D2D1_FACTORY_TYPE_MULTI_THREADED  0x1

; D2D1_FEATURE_LEVEL
#define D2D1_FEATURE_LEVEL_DEFAULT  0x0
#define D2D1_FEATURE_LEVEL_9  0x9100
#define D2D1_FEATURE_LEVEL_10  0xa000

; D2D1_FIGURE_BEGIN
#define D2D1_FIGURE_BEGIN_FILLED  0x0
#define D2D1_FIGURE_BEGIN_HOLLOW  0x1

; D2D1_FIGURE_END
#define D2D1_FIGURE_END_OPEN  0x0
#define D2D1_FIGURE_END_CLOSED  0x1

; D2D1_FILL_MODE
#define D2D1_FILL_MODE_ALTERNATE  0x0
#define D2D1_FILL_MODE_WINDING  0x1

; D2D1_GAMMA
#define D2D1_GAMMA_2_2  0x0
#define D2D1_GAMMA_1_0  0x1

; D2D1_GEOMETRY_RELATION
#define D2D1_GEOMETRY_RELATION_UNKNOWN  0x0
#define D2D1_GEOMETRY_RELATION_DISJOINT  0x1
#define D2D1_GEOMETRY_RELATION_IS_CONTAINED  0x2
#define D2D1_GEOMETRY_RELATION_CONTAINS  0x3
#define D2D1_GEOMETRY_RELATION_OVERLAP  0x4

; D2D1_GEOMETRY_SIMPLIFICATION_OPTION
#define D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES  0x0
#define D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES  0x1

; D2D1_INTERPOLATION_MODE
#define D2D1_INTERPOLATION_MODE_NEAREST_NEIGHBOR  0x0
#define D2D1_INTERPOLATION_MODE_LINEAR  0x1
#define D2D1_INTERPOLATION_MODE_CUBIC  0x2
#define D2D1_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR  0x3
#define D2D1_INTERPOLATION_MODE_ANISOTROPIC  0x4
#define D2D1_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC  0x5

; D2D1_LAYER_OPTIONS
#define D2D1_LAYER_OPTIONS_NONE  0x0
#define D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE  0x1

; D2D1_LAYER_OPTIONS1
#define D2D1_LAYER_OPTIONS1_NONE  0x0
#define D2D1_LAYER_OPTIONS1_INITIALIZE_FROM_BACKGROUND  0x1
#define D2D1_LAYER_OPTIONS1_IGNORE_ALPHA  0x2

; D2D1_LINE_JOIN
#define D2D1_LINE_JOIN_MITER  0x0
#define D2D1_LINE_JOIN_BEVEL  0x1
#define D2D1_LINE_JOIN_ROUND  0x2
#define D2D1_LINE_JOIN_MITER_OR_BEVEL  0x3

; D2D1_MAP_OPTIONS
#define D2D1_MAP_OPTIONS_NONE  0x0
#define D2D1_MAP_OPTIONS_READ  0x1
#define D2D1_MAP_OPTIONS_WRITE  0x2
#define D2D1_MAP_OPTIONS_DISCARD  0x4

; D2D1_OPACITY_MASK_CONTENT
#define D2D1_OPACITY_MASK_CONTENT_GRAPHICS  0x0
#define D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL  0x1
#define D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE  0x2

; D2D1_PATH_SEGMENT
#define D2D1_PATH_SEGMENT_NONE  0x0
#define D2D1_PATH_SEGMENT_FORCE_UNSTROKED  0x1
#define D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN  0x2

; D2D1_PRESENT_OPTIONS
#define D2D1_PRESENT_OPTIONS_NONE  0x0
#define D2D1_PRESENT_OPTIONS_RETAIN_CONTENTS  0x1
#define D2D1_PRESENT_OPTIONS_IMMEDIATELY  0x2

; D2D1_PRIMITIVE_BLEND
#define D2D1_PRIMITIVE_BLEND_SOURCE_OVER  0x0
#define D2D1_PRIMITIVE_BLEND_COPY  0x1
#define D2D1_PRIMITIVE_BLEND_MIN  0x2
#define D2D1_PRIMITIVE_BLEND_ADD  0x3
#define D2D1_PRIMITIVE_BLEND_MAX  0x4

; D2D1_PRINT_FONT_SUBSET_MODE
#define D2D1_PRINT_FONT_SUBSET_MODE_DEFAULT  0x0
#define D2D1_PRINT_FONT_SUBSET_MODE_EACHPAGE  0x1
#define D2D1_PRINT_FONT_SUBSET_MODE_NONE  0x2

; D2D1_PROPERTY_TYPE
#define D2D1_PROPERTY_TYPE_UNKNOWN  0x0
#define D2D1_PROPERTY_TYPE_STRING  0x1
#define D2D1_PROPERTY_TYPE_BOOL  0x2
#define D2D1_PROPERTY_TYPE_UINT32  0x3
#define D2D1_PROPERTY_TYPE_INT32  0x4
#define D2D1_PROPERTY_TYPE_FLOAT  0x5
#define D2D1_PROPERTY_TYPE_VECTOR2  0x6
#define D2D1_PROPERTY_TYPE_VECTOR3  0x7
#define D2D1_PROPERTY_TYPE_VECTOR4  0x8
#define D2D1_PROPERTY_TYPE_BLOB  0x9
#define D2D1_PROPERTY_TYPE_IUNKNOWN  0xa
#define D2D1_PROPERTY_TYPE_ENUM  0xb
#define D2D1_PROPERTY_TYPE_ARRAY  0xc
#define D2D1_PROPERTY_TYPE_CLSID  0xd
#define D2D1_PROPERTY_TYPE_MATRIX_3X2  0xe
#define D2D1_PROPERTY_TYPE_MATRIX_4X3  0xf
#define D2D1_PROPERTY_TYPE_MATRIX_4X4  0x10
#define D2D1_PROPERTY_TYPE_MATRIX_5X4  0x11
#define D2D1_PROPERTY_TYPE_COLOR_CONTEXT  0x12

; D2D1_RENDER_TARGET_TYPE
#define D2D1_RENDER_TARGET_TYPE_DEFAULT  0x0
#define D2D1_RENDER_TARGET_TYPE_SOFTWARE  0x1
#define D2D1_RENDER_TARGET_TYPE_HARDWARE  0x2

; D2D1_RENDER_TARGET_USAGE
#define D2D1_RENDER_TARGET_USAGE_NONE  0x0
#define D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING  0x1
#define D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE  0x2

; D2D1_SWEEP_DIRECTION
#define D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE  0x0
#define D2D1_SWEEP_DIRECTION_CLOCKWISE  0x1

; D2D1_TEXT_ANTIALIAS_MODE
#define D2D1_TEXT_ANTIALIAS_MODE_DEFAULT  0x0
#define D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE  0x1
#define D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE  0x2
#define D2D1_TEXT_ANTIALIAS_MODE_ALIASED  0x3

; D2D1_THREADING_MODE
#define D2D1_THREADING_MODE_SINGLE_THREADED  0x0
#define D2D1_THREADING_MODE_MULTI_THREADED  0x1

; D2D1_UNIT_MODE
#define D2D1_UNIT_MODE_DIPS  0x0
#define D2D1_UNIT_MODE_PIXELS  0x1

; D2D1_WINDOW_STATE
#define D2D1_WINDOW_STATE_NONE  0x0
#define D2D1_WINDOW_STATE_OCCLUDED  0x1

; D3D11_BIND_FLAG
#define D3D11_BIND_VERTEX_BUFFER  0x1
#define D3D11_BIND_INDEX_BUFFER  0x2
#define D3D11_BIND_CONSTANT_BUFFER  0x4
#define D3D11_BIND_SHADER_RESOURCE  0x8
#define D3D11_BIND_STREAM_OUTPUT  0x10
#define D3D11_BIND_RENDER_TARGET  0x20
#define D3D11_BIND_DEPTH_STENCIL  0x40
#define D3D11_BIND_UNORDERED_ACCESS  0x80
#define D3D11_BIND_DECODER  0x200
#define D3D11_BIND_VIDEO_ENCODER  0x400

; D3D11_BLEND
#define D3D11_BLEND_ZERO  0x1
#define D3D11_BLEND_ONE  0x2
#define D3D11_BLEND_SRC_COLOR  0x3
#define D3D11_BLEND_INV_SRC_COLOR  0x4
#define D3D11_BLEND_SRC_ALPHA  0x5
#define D3D11_BLEND_INV_SRC_ALPHA  0x6
#define D3D11_BLEND_DEST_ALPHA  0x7
#define D3D11_BLEND_INV_DEST_ALPHA  0x8
#define D3D11_BLEND_DEST_COLOR  0x9
#define D3D11_BLEND_INV_DEST_COLOR  0xa
#define D3D11_BLEND_SRC_ALPHA_SAT  0xb
#define D3D11_BLEND_BLEND_FACTOR  0xe
#define D3D11_BLEND_INV_BLEND_FACTOR  0xf
#define D3D11_BLEND_SRC1_COLOR  0x10
#define D3D11_BLEND_INV_SRC1_COLOR  0x11
#define D3D11_BLEND_SRC1_ALPHA  0x12
#define D3D11_BLEND_INV_SRC1_ALPHA  0x13

; D3D11_BLEND_OP
#define D3D11_BLEND_OP_ADD  0x1
#define D3D11_BLEND_OP_SUBTRACT  0x2
#define D3D11_BLEND_OP_REV_SUBTRACT  0x3
#define D3D11_BLEND_OP_MIN  0x4
#define D3D11_BLEND_OP_MAX  0x5

; D3D11_COMPARISON_FUNC
#define D3D11_COMPARISON_NEVER  0x1
#define D3D11_COMPARISON_LESS  0x2
#define D3D11_COMPARISON_EQUAL  0x3
#define D3D11_COMPARISON_LESS_EQUAL  0x4
#define D3D11_COMPARISON_GREATER  0x5
#define D3D11_COMPARISON_NOT_EQUAL  0x6
#define D3D11_COMPARISON_GREATER_EQUAL  0x7
#define D3D11_COMPARISON_ALWAYS  0x8

; D3D11_COUNTER
#define D3D11_COUNTER_DEVICE_DEPENDENT_0  0x40000000

; D3D11_COUNTER_TYPE
#define D3D11_COUNTER_TYPE_FLOAT32  0x0
#define D3D11_COUNTER_TYPE_UINT16  0x1
#define D3D11_COUNTER_TYPE_UINT32  0x2
#define D3D11_COUNTER_TYPE_UINT64  0x3

; D3D11_CPU_ACCESS_FLAG
#define D3D11_CPU_ACCESS_WRITE  0x10000
#define D3D11_CPU_ACCESS_READ  0x20000

; D3D11_CREATE_DEVICE_FLAG
#define D3D11_CREATE_DEVICE_SINGLETHREADED  0x1
#define D3D11_CREATE_DEVICE_DEBUG  0x2
#define D3D11_CREATE_DEVICE_SWITCH_TO_REF  0x4
#define D3D11_CREATE_DEVICE_PREVENT_INTERNAL_THREADING_OPTIMIZATIONS  0x8
#define D3D11_CREATE_DEVICE_BGRA_SUPPORT  0x20
#define D3D11_CREATE_DEVICE_DEBUGGABLE  0x40
#define D3D11_CREATE_DEVICE_PREVENT_ALTERING_LAYER_SETTINGS_FROM_REGISTRY  0x80
#define D3D11_CREATE_DEVICE_DISABLE_GPU_TIMEOUT  0x100
#define D3D11_CREATE_DEVICE_VIDEO_SUPPORT  0x800

; D3D11_CULL_MODE
#define D3D11_CULL_NONE  0x1
#define D3D11_CULL_FRONT  0x2
#define D3D11_CULL_BACK  0x3

; D3D11_DEPTH_WRITE_MASK
#define D3D11_DEPTH_WRITE_MASK_ZERO  0x0
#define D3D11_DEPTH_WRITE_MASK_ALL  0x1

; D3D11_DEVICE_CONTEXT_TYPE
#define D3D11_DEVICE_CONTEXT_IMMEDIATE  0x0
#define D3D11_DEVICE_CONTEXT_DEFERRED  0x1

; D3D11_DSV_DIMENSION
#define D3D11_DSV_DIMENSION_UNKNOWN  0x0
#define D3D11_DSV_DIMENSION_TEXTURE1D  0x1
#define D3D11_DSV_DIMENSION_TEXTURE1DARRAY  0x2
#define D3D11_DSV_DIMENSION_TEXTURE2D  0x3
#define D3D11_DSV_DIMENSION_TEXTURE2DARRAY  0x4
#define D3D11_DSV_DIMENSION_TEXTURE2DMS  0x5
#define D3D11_DSV_DIMENSION_TEXTURE2DMSARRAY  0x6

; D3D11_FEATURE
#define D3D11_FEATURE_THREADING  0x0
#define D3D11_FEATURE_DOUBLES  0x1
#define D3D11_FEATURE_FORMAT_SUPPORT  0x2
#define D3D11_FEATURE_FORMAT_SUPPORT2  0x3
#define D3D11_FEATURE_D3D10_X_HARDWARE_OPTIONS  0x4
#define D3D11_FEATURE_D3D11_OPTIONS  0x5
#define D3D11_FEATURE_ARCHITECTURE_INFO  0x6
#define D3D11_FEATURE_D3D9_OPTIONS  0x7
#define D3D11_FEATURE_SHADER_MIN_PRECISION_SUPPORT  0x8
#define D3D11_FEATURE_D3D9_SHADOW_SUPPORT  0x9
#define D3D11_FEATURE_D3D11_OPTIONS1  0xa
#define D3D11_FEATURE_D3D9_SIMPLE_INSTANCING_SUPPORT  0xb
#define D3D11_FEATURE_MARKER_SUPPORT  0xc
#define D3D11_FEATURE_D3D9_OPTIONS1  0xd
#define D3D11_FEATURE_D3D11_OPTIONS2  0xe
#define D3D11_FEATURE_D3D11_OPTIONS3  0xf
#define D3D11_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT  0x10
#define D3D11_FEATURE_D3D11_OPTIONS4  0x11
#define D3D11_FEATURE_SHADER_CACHE  0x12
#define D3D11_FEATURE_D3D11_OPTIONS5  0x13
#define D3D11_FEATURE_DISPLAYABLE  0x14

; D3D11_FILL_MODE
#define D3D11_FILL_WIREFRAME  0x2
#define D3D11_FILL_SOLID  0x3

; D3D11_FILTER
#define D3D11_FILTER_MIN_MAG_MIP_POINT  0x0
#define D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR  0x1
#define D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT  0x4
#define D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR  0x5
#define D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT  0x10
#define D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x11
#define D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT  0x14
#define D3D11_FILTER_MIN_MAG_MIP_LINEAR  0x15
#define D3D11_FILTER_ANISOTROPIC  0x55
#define D3D11_FILTER_COMPARISON_MIN_MAG_MIP_POINT  0x80
#define D3D11_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR  0x81
#define D3D11_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT  0x84
#define D3D11_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR  0x85
#define D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT  0x90
#define D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x91
#define D3D11_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT  0x94
#define D3D11_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR  0x95
#define D3D11_FILTER_COMPARISON_ANISOTROPIC  0xd5
#define D3D11_FILTER_MINIMUM_MIN_MAG_MIP_POINT  0x100
#define D3D11_FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR  0x101
#define D3D11_FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT  0x104
#define D3D11_FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR  0x105
#define D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT  0x110
#define D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x111
#define D3D11_FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT  0x114
#define D3D11_FILTER_MINIMUM_MIN_MAG_MIP_LINEAR  0x115
#define D3D11_FILTER_MINIMUM_ANISOTROPIC  0x155
#define D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_POINT  0x180
#define D3D11_FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR  0x181
#define D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT  0x184
#define D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR  0x185
#define D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT  0x190
#define D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x191
#define D3D11_FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT  0x194
#define D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR  0x195
#define D3D11_FILTER_MAXIMUM_ANISOTROPIC  0x1d5

; D3D11_INPUT_CLASSIFICATION
#define D3D11_INPUT_PER_VERTEX_DATA  0x0
#define D3D11_INPUT_PER_INSTANCE_DATA  0x1

; D3D11_MAP
#define D3D11_MAP_READ  0x1
#define D3D11_MAP_WRITE  0x2
#define D3D11_MAP_READ_WRITE  0x3
#define D3D11_MAP_WRITE_DISCARD  0x4
#define D3D11_MAP_WRITE_NO_OVERWRITE  0x5

; D3D11_QUERY
#define D3D11_QUERY_EVENT  0x0
#define D3D11_QUERY_OCCLUSION  0x1
#define D3D11_QUERY_TIMESTAMP  0x2
#define D3D11_QUERY_TIMESTAMP_DISJOINT  0x3
#define D3D11_QUERY_PIPELINE_STATISTICS  0x4
#define D3D11_QUERY_OCCLUSION_PREDICATE  0x5
#define D3D11_QUERY_SO_STATISTICS  0x6
#define D3D11_QUERY_SO_OVERFLOW_PREDICATE  0x7
#define D3D11_QUERY_SO_STATISTICS_STREAM0  0x8
#define D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM0  0x9
#define D3D11_QUERY_SO_STATISTICS_STREAM1  0xa
#define D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM1  0xb
#define D3D11_QUERY_SO_STATISTICS_STREAM2  0xc
#define D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM2  0xd
#define D3D11_QUERY_SO_STATISTICS_STREAM3  0xe
#define D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM3  0xf

; D3D11_RESOURCE_DIMENSION
#define D3D11_RESOURCE_DIMENSION_UNKNOWN  0x0
#define D3D11_RESOURCE_DIMENSION_BUFFER  0x1
#define D3D11_RESOURCE_DIMENSION_TEXTURE1D  0x2
#define D3D11_RESOURCE_DIMENSION_TEXTURE2D  0x3
#define D3D11_RESOURCE_DIMENSION_TEXTURE3D  0x4

; D3D11_RESOURCE_MISC_FLAG
#define D3D11_RESOURCE_MISC_GENERATE_MIPS  0x1
#define D3D11_RESOURCE_MISC_SHARED  0x2
#define D3D11_RESOURCE_MISC_TEXTURECUBE  0x4
#define D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS  0x10
#define D3D11_RESOURCE_MISC_BUFFER_ALLOW_RAW_VIEWS  0x20
#define D3D11_RESOURCE_MISC_BUFFER_STRUCTURED  0x40
#define D3D11_RESOURCE_MISC_RESOURCE_CLAMP  0x80
#define D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX  0x100
#define D3D11_RESOURCE_MISC_GDI_COMPATIBLE  0x200
#define D3D11_RESOURCE_MISC_SHARED_NTHANDLE  0x800
#define D3D11_RESOURCE_MISC_RESTRICTED_CONTENT  0x1000
#define D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE  0x2000
#define D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE_DRIVER  0x4000
#define D3D11_RESOURCE_MISC_GUARDED  0x8000
#define D3D11_RESOURCE_MISC_TILE_POOL  0x20000
#define D3D11_RESOURCE_MISC_TILED  0x40000
#define D3D11_RESOURCE_MISC_HW_PROTECTED  0x80000
#define D3D11_RESOURCE_MISC_SHARED_DISPLAYABLE  0x100000
#define D3D11_RESOURCE_MISC_SHARED_EXCLUSIVE_WRITER  0x200000

; D3D11_RTV_DIMENSION
#define D3D11_RTV_DIMENSION_UNKNOWN  0x0
#define D3D11_RTV_DIMENSION_BUFFER  0x1
#define D3D11_RTV_DIMENSION_TEXTURE1D  0x2
#define D3D11_RTV_DIMENSION_TEXTURE1DARRAY  0x3
#define D3D11_RTV_DIMENSION_TEXTURE2D  0x4
#define D3D11_RTV_DIMENSION_TEXTURE2DARRAY  0x5
#define D3D11_RTV_DIMENSION_TEXTURE2DMS  0x6
#define D3D11_RTV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define D3D11_RTV_DIMENSION_TEXTURE3D  0x8

; D3D11_STENCIL_OP
#define D3D11_STENCIL_OP_KEEP  0x1
#define D3D11_STENCIL_OP_ZERO  0x2
#define D3D11_STENCIL_OP_REPLACE  0x3
#define D3D11_STENCIL_OP_INCR_SAT  0x4
#define D3D11_STENCIL_OP_DECR_SAT  0x5
#define D3D11_STENCIL_OP_INVERT  0x6
#define D3D11_STENCIL_OP_INCR  0x7
#define D3D11_STENCIL_OP_DECR  0x8

; D3D11_TEXTURE_ADDRESS_MODE
#define D3D11_TEXTURE_ADDRESS_WRAP  0x1
#define D3D11_TEXTURE_ADDRESS_MIRROR  0x2
#define D3D11_TEXTURE_ADDRESS_CLAMP  0x3
#define D3D11_TEXTURE_ADDRESS_BORDER  0x4
#define D3D11_TEXTURE_ADDRESS_MIRROR_ONCE  0x5

; D3D11_UAV_DIMENSION
#define D3D11_UAV_DIMENSION_UNKNOWN  0x0
#define D3D11_UAV_DIMENSION_BUFFER  0x1
#define D3D11_UAV_DIMENSION_TEXTURE1D  0x2
#define D3D11_UAV_DIMENSION_TEXTURE1DARRAY  0x3
#define D3D11_UAV_DIMENSION_TEXTURE2D  0x4
#define D3D11_UAV_DIMENSION_TEXTURE2DARRAY  0x5
#define D3D11_UAV_DIMENSION_TEXTURE3D  0x8

; D3D11_USAGE
#define D3D11_USAGE_DEFAULT  0x0
#define D3D11_USAGE_IMMUTABLE  0x1
#define D3D11_USAGE_DYNAMIC  0x2
#define D3D11_USAGE_STAGING  0x3

; D3D_DRIVER_TYPE
#define D3D_DRIVER_TYPE_UNKNOWN  0x0
#define D3D_DRIVER_TYPE_HARDWARE  0x1
#define D3D_DRIVER_TYPE_REFERENCE  0x2
#define D3D_DRIVER_TYPE_NULL  0x3
#define D3D_DRIVER_TYPE_SOFTWARE  0x4
#define D3D_DRIVER_TYPE_WARP  0x5

; D3D_FEATURE_LEVEL
#define D3D_FEATURE_LEVEL_1_0_GENERIC  0x100
#define D3D_FEATURE_LEVEL_1_0_CORE  0x1000
#define D3D_FEATURE_LEVEL_9_1  0x9100
#define D3D_FEATURE_LEVEL_9_2  0x9200
#define D3D_FEATURE_LEVEL_9_3  0x9300
#define D3D_FEATURE_LEVEL_10_0  0xa000
#define D3D_FEATURE_LEVEL_10_1  0xa100
#define D3D_FEATURE_LEVEL_11_0  0xb000
#define D3D_FEATURE_LEVEL_11_1  0xb100
#define D3D_FEATURE_LEVEL_12_0  0xc000
#define D3D_FEATURE_LEVEL_12_1  0xc100
#define D3D_FEATURE_LEVEL_12_2  0xc200

; D3D_PRIMITIVE_TOPOLOGY
#define D3D_PRIMITIVE_TOPOLOGY_UNDEFINED  0x0
#define D3D_PRIMITIVE_TOPOLOGY_POINTLIST  0x1
#define D3D_PRIMITIVE_TOPOLOGY_LINELIST  0x2
#define D3D_PRIMITIVE_TOPOLOGY_LINESTRIP  0x3
#define D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST  0x4
#define D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP  0x5
#define D3D_PRIMITIVE_TOPOLOGY_TRIANGLEFAN  0x6
#define D3D_PRIMITIVE_TOPOLOGY_LINELIST_ADJ  0xa
#define D3D_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ  0xb
#define D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ  0xc
#define D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ  0xd
#define D3D_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST  0x21
#define D3D_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST  0x22
#define D3D_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST  0x23
#define D3D_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST  0x24
#define D3D_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST  0x25
#define D3D_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST  0x26
#define D3D_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST  0x27
#define D3D_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST  0x28
#define D3D_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST  0x29
#define D3D_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST  0x2a
#define D3D_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST  0x2b
#define D3D_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST  0x2c
#define D3D_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST  0x2d
#define D3D_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST  0x2e
#define D3D_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST  0x2f
#define D3D_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST  0x30
#define D3D_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST  0x31
#define D3D_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST  0x32
#define D3D_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST  0x33
#define D3D_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST  0x34
#define D3D_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST  0x35
#define D3D_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST  0x36
#define D3D_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST  0x37
#define D3D_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST  0x38
#define D3D_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST  0x39
#define D3D_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST  0x3a
#define D3D_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST  0x3b
#define D3D_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST  0x3c
#define D3D_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST  0x3d
#define D3D_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST  0x3e
#define D3D_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST  0x3f
#define D3D_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST  0x40
#define D3D10_PRIMITIVE_TOPOLOGY_UNDEFINED  0x0
#define D3D10_PRIMITIVE_TOPOLOGY_POINTLIST  0x1
#define D3D10_PRIMITIVE_TOPOLOGY_LINELIST  0x2
#define D3D10_PRIMITIVE_TOPOLOGY_LINESTRIP  0x3
#define D3D10_PRIMITIVE_TOPOLOGY_TRIANGLELIST  0x4
#define D3D10_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP  0x5
#define D3D10_PRIMITIVE_TOPOLOGY_LINELIST_ADJ  0xa
#define D3D10_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ  0xb
#define D3D10_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ  0xc
#define D3D10_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ  0xd
#define D3D11_PRIMITIVE_TOPOLOGY_UNDEFINED  0x0
#define D3D11_PRIMITIVE_TOPOLOGY_POINTLIST  0x1
#define D3D11_PRIMITIVE_TOPOLOGY_LINELIST  0x2
#define D3D11_PRIMITIVE_TOPOLOGY_LINESTRIP  0x3
#define D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST  0x4
#define D3D11_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP  0x5
#define D3D11_PRIMITIVE_TOPOLOGY_LINELIST_ADJ  0xa
#define D3D11_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ  0xb
#define D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ  0xc
#define D3D11_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ  0xd
#define D3D11_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST  0x21
#define D3D11_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST  0x22
#define D3D11_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST  0x23
#define D3D11_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST  0x24
#define D3D11_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST  0x25
#define D3D11_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST  0x26
#define D3D11_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST  0x27
#define D3D11_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST  0x28
#define D3D11_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST  0x29
#define D3D11_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST  0x2a
#define D3D11_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST  0x2b
#define D3D11_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST  0x2c
#define D3D11_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST  0x2d
#define D3D11_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST  0x2e
#define D3D11_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST  0x2f
#define D3D11_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST  0x30
#define D3D11_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST  0x31
#define D3D11_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST  0x32
#define D3D11_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST  0x33
#define D3D11_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST  0x34
#define D3D11_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST  0x35
#define D3D11_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST  0x36
#define D3D11_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST  0x37
#define D3D11_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST  0x38
#define D3D11_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST  0x39
#define D3D11_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST  0x3a
#define D3D11_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST  0x3b
#define D3D11_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST  0x3c
#define D3D11_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST  0x3d
#define D3D11_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST  0x3e
#define D3D11_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST  0x3f
#define D3D11_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST  0x40

; D3D_SRV_DIMENSION
#define D3D_SRV_DIMENSION_UNKNOWN  0x0
#define D3D_SRV_DIMENSION_BUFFER  0x1
#define D3D_SRV_DIMENSION_TEXTURE1D  0x2
#define D3D_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define D3D_SRV_DIMENSION_TEXTURE2D  0x4
#define D3D_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define D3D_SRV_DIMENSION_TEXTURE2DMS  0x6
#define D3D_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define D3D_SRV_DIMENSION_TEXTURE3D  0x8
#define D3D_SRV_DIMENSION_TEXTURECUBE  0x9
#define D3D_SRV_DIMENSION_TEXTURECUBEARRAY  0xa
#define D3D_SRV_DIMENSION_BUFFEREX  0xb
#define D3D10_SRV_DIMENSION_UNKNOWN  0x0
#define D3D10_SRV_DIMENSION_BUFFER  0x1
#define D3D10_SRV_DIMENSION_TEXTURE1D  0x2
#define D3D10_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define D3D10_SRV_DIMENSION_TEXTURE2D  0x4
#define D3D10_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define D3D10_SRV_DIMENSION_TEXTURE2DMS  0x6
#define D3D10_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define D3D10_SRV_DIMENSION_TEXTURE3D  0x8
#define D3D10_SRV_DIMENSION_TEXTURECUBE  0x9
#define D3D10_1_SRV_DIMENSION_UNKNOWN  0x0
#define D3D10_1_SRV_DIMENSION_BUFFER  0x1
#define D3D10_1_SRV_DIMENSION_TEXTURE1D  0x2
#define D3D10_1_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define D3D10_1_SRV_DIMENSION_TEXTURE2D  0x4
#define D3D10_1_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define D3D10_1_SRV_DIMENSION_TEXTURE2DMS  0x6
#define D3D10_1_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define D3D10_1_SRV_DIMENSION_TEXTURE3D  0x8
#define D3D10_1_SRV_DIMENSION_TEXTURECUBE  0x9
#define D3D10_1_SRV_DIMENSION_TEXTURECUBEARRAY  0xa
#define D3D11_SRV_DIMENSION_UNKNOWN  0x0
#define D3D11_SRV_DIMENSION_BUFFER  0x1
#define D3D11_SRV_DIMENSION_TEXTURE1D  0x2
#define D3D11_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define D3D11_SRV_DIMENSION_TEXTURE2D  0x4
#define D3D11_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define D3D11_SRV_DIMENSION_TEXTURE2DMS  0x6
#define D3D11_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define D3D11_SRV_DIMENSION_TEXTURE3D  0x8
#define D3D11_SRV_DIMENSION_TEXTURECUBE  0x9
#define D3D11_SRV_DIMENSION_TEXTURECUBEARRAY  0xa
#define D3D11_SRV_DIMENSION_BUFFEREX  0xb

; DashCap
#define DashCapFlat  0x0
#define DashCapRound  0x2
#define DashCapTriangle  0x3

; DashStyle
#define DashStyleSolid  0x0
#define DashStyleDash  0x1
#define DashStyleDot  0x2
#define DashStyleDashDot  0x3
#define DashStyleDashDotDot  0x4
#define DashStyleCustom  0x5

; DATAOBJ_GET_ITEM_FLAGS
#define DOGIF_DEFAULT  0x0
#define DOGIF_TRAVERSE_LINK  0x1
#define DOGIF_NO_HDROP  0x2
#define DOGIF_NO_URL  0x4
#define DOGIF_ONLY_IF_ONE  0x8

; DC_LAYOUT
#define LAYOUT_BITMAPORIENTATIONPRESERVED  0x8
#define LAYOUT_RTL  0x1

; DCB_PARITY
#define EVENPARITY  0x2
#define MARKPARITY  0x3
#define NOPARITY  0x0
#define ODDPARITY  0x1
#define SPACEPARITY  0x4

; DCB_STOP_BITS
#define ONESTOPBIT  0x0
#define ONE5STOPBITS  0x1
#define TWOSTOPBITS  0x2

; DDE_CLIENT_TRANSACTION_TYPE
#define XTYP_ADVSTART  0x1030
#define XTYP_ADVSTOP  0x8040
#define XTYP_EXECUTE  0x4050
#define XTYP_POKE  0x4090
#define XTYP_REQUEST  0x20b0
#define XTYP_ADVDATA  0x4010
#define XTYP_ADVREQ  0x2022
#define XTYP_CONNECT  0x1062
#define XTYP_CONNECT_CONFIRM  0x8072
#define XTYP_DISCONNECT  0x80c2
#define XTYP_MONITOR  0x80f2
#define XTYP_REGISTER  0x80a2
#define XTYP_UNREGISTER  0x80d2
#define XTYP_WILDCONNECT  0x20e2
#define XTYP_XACT_COMPLETE  0x8080

; DDE_ENABLE_CALLBACK_CMD
#define EC_ENABLEALL  0x0
#define EC_ENABLEONE  0x80
#define EC_DISABLE  0x8
#define EC_QUERYWAITING  0x2

; DDE_INITIALIZE_COMMAND
#define APPCLASS_MONITOR  0x1
#define APPCLASS_STANDARD  0x0
#define APPCMD_CLIENTONLY  0x10
#define APPCMD_FILTERINITS  0x20
#define CBF_FAIL_ALLSVRXACTIONS  0x3f000
#define CBF_FAIL_ADVISES  0x4000
#define CBF_FAIL_CONNECTIONS  0x2000
#define CBF_FAIL_EXECUTES  0x8000
#define CBF_FAIL_POKES  0x10000
#define CBF_FAIL_REQUESTS  0x20000
#define CBF_FAIL_SELFCONNECTIONS  0x1000
#define CBF_SKIP_ALLNOTIFICATIONS  0x3c0000
#define CBF_SKIP_CONNECT_CONFIRMS  0x40000
#define CBF_SKIP_DISCONNECTS  0x200000
#define CBF_SKIP_REGISTRATIONS  0x80000
#define CBF_SKIP_UNREGISTRATIONS  0x100000
#define MF_CALLBACKS  0x8000000
#define MF_CONV  0x40000000
#define MF_ERRORS  0x10000000
#define MF_HSZ_INFO  0x1000000
#define MF_LINKS  0x20000000
#define MF_POSTMSGS  0x4000000
#define MF_SENDMSGS  0x2000000

; DDE_NAME_SERVICE_CMD
#define DNS_REGISTER  0x1
#define DNS_UNREGISTER  0x2
#define DNS_FILTERON  0x4
#define DNS_FILTEROFF  0x8

; DEBUG_EVENT_CODE
#define CREATE_PROCESS_DEBUG_EVENT  0x3
#define CREATE_THREAD_DEBUG_EVENT  0x2
#define EXCEPTION_DEBUG_EVENT  0x1
#define EXIT_PROCESS_DEBUG_EVENT  0x5
#define EXIT_THREAD_DEBUG_EVENT  0x4
#define LOAD_DLL_DEBUG_EVENT  0x6
#define OUTPUT_DEBUG_STRING_EVENT  0x8
#define RIP_EVENT  0x9
#define UNLOAD_DLL_DEBUG_EVENT  0x7

; DEFINE_DOS_DEVICE_FLAGS
#define DDD_RAW_TARGET_PATH  0x1
#define DDD_REMOVE_DEFINITION  0x2
#define DDD_EXACT_MATCH_ON_REMOVE  0x4
#define DDD_NO_BROADCAST_SYSTEM  0x8
#define DDD_LUID_BROADCAST_DRIVE  0x10

; DEP_SYSTEM_POLICY_TYPE
#define DEPPolicyAlwaysOff  0x0
#define DEPPolicyAlwaysOn  0x1
#define DEPPolicyOptIn  0x2
#define DEPPolicyOptOut  0x3
#define DEPTotalPolicyCount  0x4

; DESCKIND
#define DESCKIND_NONE  0x0
#define DESCKIND_FUNCDESC  0x1
#define DESCKIND_VARDESC  0x2
#define DESCKIND_TYPECOMP  0x3
#define DESCKIND_IMPLICITAPPOBJ  0x4
#define DESCKIND_MAX  0x5

; DESKTOP_ACCESS_FLAGS
#define DESKTOP_DELETE  0x10000
#define DESKTOP_READ_CONTROL  0x20000
#define DESKTOP_WRITE_DAC  0x40000
#define DESKTOP_WRITE_OWNER  0x80000
#define DESKTOP_SYNCHRONIZE  0x100000
#define DESKTOP_READOBJECTS  0x1
#define DESKTOP_CREATEWINDOW  0x2
#define DESKTOP_CREATEMENU  0x4
#define DESKTOP_HOOKCONTROL  0x8
#define DESKTOP_JOURNALRECORD  0x10
#define DESKTOP_JOURNALPLAYBACK  0x20
#define DESKTOP_ENUMERATE  0x40
#define DESKTOP_WRITEOBJECTS  0x80
#define DESKTOP_SWITCHDESKTOP  0x100

; DESKTOP_CONTROL_FLAGS
#define DF_ALLOWOTHERACCOUNTHOOK  0x1

; DEVMODE_COLLATE
#define DMCOLLATE_FALSE  0x0
#define DMCOLLATE_TRUE  0x1

; DEVMODE_COLOR
#define DMCOLOR_MONOCHROME  0x1
#define DMCOLOR_COLOR  0x2

; DEVMODE_DISPLAY_FIXED_OUTPUT
#define DMDFO_DEFAULT  0x0
#define DMDFO_STRETCH  0x1
#define DMDFO_CENTER  0x2

; DEVMODE_DISPLAY_ORIENTATION
#define DMDO_DEFAULT  0x0
#define DMDO_90  0x1
#define DMDO_180  0x2
#define DMDO_270  0x3

; DEVMODE_DUPLEX
#define DMDUP_SIMPLEX  0x1
#define DMDUP_VERTICAL  0x2
#define DMDUP_HORIZONTAL  0x3

; DEVMODE_FIELD_FLAGS
#define DM_SPECVERSION  0x401
#define DM_ORIENTATION  0x1
#define DM_PAPERSIZE  0x2
#define DM_PAPERLENGTH  0x4
#define DM_PAPERWIDTH  0x8
#define DM_SCALE  0x10
#define DM_POSITION  0x20
#define DM_NUP  0x40
#define DM_DISPLAYORIENTATION  0x80
#define DM_COPIES  0x100
#define DM_DEFAULTSOURCE  0x200
#define DM_PRINTQUALITY  0x400
#define DM_COLOR  0x800
#define DM_DUPLEX  0x1000
#define DM_YRESOLUTION  0x2000
#define DM_TTOPTION  0x4000
#define DM_COLLATE  0x8000
#define DM_FORMNAME  0x10000
#define DM_LOGPIXELS  0x20000
#define DM_BITSPERPEL  0x40000
#define DM_PELSWIDTH  0x80000
#define DM_PELSHEIGHT  0x100000
#define DM_DISPLAYFLAGS  0x200000
#define DM_DISPLAYFREQUENCY  0x400000
#define DM_ICMMETHOD  0x800000
#define DM_ICMINTENT  0x1000000
#define DM_MEDIATYPE  0x2000000
#define DM_DITHERTYPE  0x4000000
#define DM_PANNINGWIDTH  0x8000000
#define DM_PANNINGHEIGHT  0x10000000
#define DM_DISPLAYFIXEDOUTPUT  0x20000000
#define DM_INTERLACED  0x2
#define DM_UPDATE  0x1
#define DM_COPY  0x2
#define DM_PROMPT  0x4
#define DM_MODIFY  0x8
#define DM_IN_BUFFER  0x8
#define DM_IN_PROMPT  0x4
#define DM_OUT_BUFFER  0x2
#define DM_OUT_DEFAULT  0x1

; DEVMODE_TRUETYPE_OPTION
#define DMTT_BITMAP  0x1
#define DMTT_DOWNLOAD  0x2
#define DMTT_SUBDEV  0x3
#define DMTT_DOWNLOAD_OUTLINE  0x4

; DFC_TYPE
#define DFC_CAPTION  0x1
#define DFC_MENU  0x2
#define DFC_SCROLL  0x3
#define DFC_BUTTON  0x4
#define DFC_POPUPMENU  0x5

; DFCS_STATE
#define DFCS_CAPTIONCLOSE  0x0
#define DFCS_CAPTIONMIN  0x1
#define DFCS_CAPTIONMAX  0x2
#define DFCS_CAPTIONRESTORE  0x3
#define DFCS_CAPTIONHELP  0x4
#define DFCS_MENUARROW  0x0
#define DFCS_MENUCHECK  0x1
#define DFCS_MENUBULLET  0x2
#define DFCS_MENUARROWRIGHT  0x4
#define DFCS_SCROLLUP  0x0
#define DFCS_SCROLLDOWN  0x1
#define DFCS_SCROLLLEFT  0x2
#define DFCS_SCROLLRIGHT  0x3
#define DFCS_SCROLLCOMBOBOX  0x5
#define DFCS_SCROLLSIZEGRIP  0x8
#define DFCS_SCROLLSIZEGRIPRIGHT  0x10
#define DFCS_BUTTONCHECK  0x0
#define DFCS_BUTTONRADIOIMAGE  0x1
#define DFCS_BUTTONRADIOMASK  0x2
#define DFCS_BUTTONRADIO  0x4
#define DFCS_BUTTON3STATE  0x8
#define DFCS_BUTTONPUSH  0x10
#define DFCS_INACTIVE  0x100
#define DFCS_PUSHED  0x200
#define DFCS_CHECKED  0x400
#define DFCS_TRANSPARENT  0x800
#define DFCS_HOT  0x1000
#define DFCS_ADJUSTRECT  0x2000
#define DFCS_FLAT  0x4000
#define DFCS_MONO  0x8000

; DI_FLAGS
#define DI_MASK  0x1
#define DI_IMAGE  0x2
#define DI_NORMAL  0x3
#define DI_COMPAT  0x4
#define DI_DEFAULTSIZE  0x8
#define DI_NOMIRROR  0x10

; DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS
#define DCDC_DEFAULT  0x0
#define DCDC_DISABLE_FONT_UPDATE  0x1
#define DCDC_DISABLE_RELAYOUT  0x2

; DIALOG_DPI_CHANGE_BEHAVIORS
#define DDC_DEFAULT  0x0
#define DDC_DISABLE_ALL  0x1
#define DDC_DISABLE_RESIZE  0x2
#define DDC_DISABLE_CONTROL_RELAYOUT  0x4

; DIB_USAGE
#define DIB_RGB_COLORS  0x0
#define DIB_PAL_COLORS  0x1

; DISP_CHANGE
#define DISP_CHANGE_SUCCESSFUL  0x0
#define DISP_CHANGE_RESTART  0x1
#define DISP_CHANGE_FAILED  -1
#define DISP_CHANGE_BADMODE  -2
#define DISP_CHANGE_NOTUPDATED  -3
#define DISP_CHANGE_BADFLAGS  -4
#define DISP_CHANGE_BADPARAM  -5
#define DISP_CHANGE_BADDUALVIEW  -6

; DISPATCH_FLAGS
#define DISPATCH_METHOD  0x1
#define DISPATCH_PROPERTYGET  0x2
#define DISPATCH_PROPERTYPUT  0x4
#define DISPATCH_PROPERTYPUTREF  0x8

; DISPLAYCONFIG_DEVICE_INFO_TYPE
#define DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME  0x1
#define DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_NAME  0x2
#define DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_PREFERRED_MODE  0x3
#define DISPLAYCONFIG_DEVICE_INFO_GET_ADAPTER_NAME  0x4
#define DISPLAYCONFIG_DEVICE_INFO_SET_TARGET_PERSISTENCE  0x5
#define DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_BASE_TYPE  0x6
#define DISPLAYCONFIG_DEVICE_INFO_GET_SUPPORT_VIRTUAL_RESOLUTION  0x7
#define DISPLAYCONFIG_DEVICE_INFO_SET_SUPPORT_VIRTUAL_RESOLUTION  0x8
#define DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO  0x9
#define DISPLAYCONFIG_DEVICE_INFO_SET_ADVANCED_COLOR_STATE  0xa
#define DISPLAYCONFIG_DEVICE_INFO_GET_SDR_WHITE_LEVEL  0xb
#define DISPLAYCONFIG_DEVICE_INFO_GET_MONITOR_SPECIALIZATION  0xc
#define DISPLAYCONFIG_DEVICE_INFO_SET_MONITOR_SPECIALIZATION  0xd

; DISPLAYCONFIG_MODE_INFO_TYPE
#define DISPLAYCONFIG_MODE_INFO_TYPE_SOURCE  0x1
#define DISPLAYCONFIG_MODE_INFO_TYPE_TARGET  0x2
#define DISPLAYCONFIG_MODE_INFO_TYPE_DESKTOP_IMAGE  0x3

; DISPLAYCONFIG_PIXELFORMAT
#define DISPLAYCONFIG_PIXELFORMAT_8BPP  0x1
#define DISPLAYCONFIG_PIXELFORMAT_16BPP  0x2
#define DISPLAYCONFIG_PIXELFORMAT_24BPP  0x3
#define DISPLAYCONFIG_PIXELFORMAT_32BPP  0x4
#define DISPLAYCONFIG_PIXELFORMAT_NONGDI  0x5

; DISPLAYCONFIG_ROTATION
#define DISPLAYCONFIG_ROTATION_IDENTITY  0x1
#define DISPLAYCONFIG_ROTATION_ROTATE90  0x2
#define DISPLAYCONFIG_ROTATION_ROTATE180  0x3
#define DISPLAYCONFIG_ROTATION_ROTATE270  0x4

; DISPLAYCONFIG_SCALING
#define DISPLAYCONFIG_SCALING_IDENTITY  0x1
#define DISPLAYCONFIG_SCALING_CENTERED  0x2
#define DISPLAYCONFIG_SCALING_STRETCHED  0x3
#define DISPLAYCONFIG_SCALING_ASPECTRATIOCENTEREDMAX  0x4
#define DISPLAYCONFIG_SCALING_CUSTOM  0x5
#define DISPLAYCONFIG_SCALING_PREFERRED  0x80

; DISPLAYCONFIG_SCANLINE_ORDERING
#define DISPLAYCONFIG_SCANLINE_ORDERING_UNSPECIFIED  0x0
#define DISPLAYCONFIG_SCANLINE_ORDERING_PROGRESSIVE  0x1
#define DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED  0x2
#define DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_UPPERFIELDFIRST  0x2
#define DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_LOWERFIELDFIRST  0x3

; DISPLAYCONFIG_TOPOLOGY_ID
#define DISPLAYCONFIG_TOPOLOGY_INTERNAL  0x1
#define DISPLAYCONFIG_TOPOLOGY_CLONE  0x2
#define DISPLAYCONFIG_TOPOLOGY_EXTEND  0x4
#define DISPLAYCONFIG_TOPOLOGY_EXTERNAL  0x8

; DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_OTHER  -1
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HD15  0x0
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SVIDEO  0x1
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPOSITE_VIDEO  0x2
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPONENT_VIDEO  0x3
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DVI  0x4
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HDMI  0x5
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_LVDS  0x6
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_D_JPN  0x8
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDI  0x9
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EXTERNAL  0xa
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EMBEDDED  0xb
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EXTERNAL  0xc
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EMBEDDED  0xd
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDTVDONGLE  0xe
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_MIRACAST  0xf
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_WIRED  0x10
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_VIRTUAL  0x11
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_USB_TUNNEL  0x12
#define DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL  -2147483648

; DitherType
#define DitherTypeNone  0x0
#define DitherTypeSolid  0x1
#define DitherTypeOrdered4x4  0x2
#define DitherTypeOrdered8x8  0x3
#define DitherTypeOrdered16x16  0x4
#define DitherTypeSpiral4x4  0x5
#define DitherTypeSpiral8x8  0x6
#define DitherTypeDualSpiral4x4  0x7
#define DitherTypeDualSpiral8x8  0x8
#define DitherTypeErrorDiffusion  0x9
#define DitherTypeMax  0xa

; DLG_BUTTON_CHECK_STATE
#define BST_CHECKED  0x1
#define BST_INDETERMINATE  0x2
#define BST_UNCHECKED  0x0

; DLG_DIR_LIST_FILE_TYPE
#define DDL_ARCHIVE  0x20
#define DDL_DIRECTORY  0x10
#define DDL_DRIVES  0x4000
#define DDL_EXCLUSIVE  0x8000
#define DDL_HIDDEN  0x2
#define DDL_READONLY  0x1
#define DDL_READWRITE  0x0
#define DDL_SYSTEM  0x4
#define DDL_POSTMSGS  0x2000

; DOT11_AUTH_ALGORITHM
#define DOT11_AUTH_ALGO_80211_OPEN  0x1
#define DOT11_AUTH_ALGO_80211_SHARED_KEY  0x2
#define DOT11_AUTH_ALGO_WPA  0x3
#define DOT11_AUTH_ALGO_WPA_PSK  0x4
#define DOT11_AUTH_ALGO_WPA_NONE  0x5
#define DOT11_AUTH_ALGO_RSNA  0x6
#define DOT11_AUTH_ALGO_RSNA_PSK  0x7
#define DOT11_AUTH_ALGO_WPA3  0x8
#define DOT11_AUTH_ALGO_WPA3_ENT_192  0x8
#define DOT11_AUTH_ALGO_WPA3_SAE  0x9
#define DOT11_AUTH_ALGO_OWE  0xa
#define DOT11_AUTH_ALGO_WPA3_ENT  0xb
#define DOT11_AUTH_ALGO_IHV_START  -2147483648
#define DOT11_AUTH_ALGO_IHV_END  -1

; DOT11_BSS_TYPE
#define dot11_BSS_type_infrastructure  0x1
#define dot11_BSS_type_independent  0x2
#define dot11_BSS_type_any  0x3

; DOT11_CIPHER_ALGORITHM
#define DOT11_CIPHER_ALGO_NONE  0x0
#define DOT11_CIPHER_ALGO_WEP40  0x1
#define DOT11_CIPHER_ALGO_TKIP  0x2
#define DOT11_CIPHER_ALGO_CCMP  0x4
#define DOT11_CIPHER_ALGO_WEP104  0x5
#define DOT11_CIPHER_ALGO_BIP  0x6
#define DOT11_CIPHER_ALGO_GCMP  0x8
#define DOT11_CIPHER_ALGO_GCMP_256  0x9
#define DOT11_CIPHER_ALGO_CCMP_256  0xa
#define DOT11_CIPHER_ALGO_BIP_GMAC_128  0xb
#define DOT11_CIPHER_ALGO_BIP_GMAC_256  0xc
#define DOT11_CIPHER_ALGO_BIP_CMAC_256  0xd
#define DOT11_CIPHER_ALGO_WPA_USE_GROUP  0x100
#define DOT11_CIPHER_ALGO_RSN_USE_GROUP  0x100
#define DOT11_CIPHER_ALGO_WEP  0x101
#define DOT11_CIPHER_ALGO_IHV_START  -2147483648
#define DOT11_CIPHER_ALGO_IHV_END  -1

; DOT11_PHY_TYPE
#define dot11_phy_type_unknown  0x0
#define dot11_phy_type_any  0x0
#define dot11_phy_type_fhss  0x1
#define dot11_phy_type_dsss  0x2
#define dot11_phy_type_irbaseband  0x3
#define dot11_phy_type_ofdm  0x4
#define dot11_phy_type_hrdsss  0x5
#define dot11_phy_type_erp  0x6
#define dot11_phy_type_ht  0x7
#define dot11_phy_type_vht  0x8
#define dot11_phy_type_dmg  0x9
#define dot11_phy_type_he  0xa
#define dot11_phy_type_eht  0xb
#define dot11_phy_type_IHV_start  -2147483648
#define dot11_phy_type_IHV_end  -1

; DPAMM_MESSAGE
#define DPAMM_MERGE  0x1
#define DPAMM_DELETE  0x2
#define DPAMM_INSERT  0x3

; DPI_AWARENESS
#define DPI_AWARENESS_INVALID  -1
#define DPI_AWARENESS_UNAWARE  0x0
#define DPI_AWARENESS_SYSTEM_AWARE  0x1
#define DPI_AWARENESS_PER_MONITOR_AWARE  0x2

; DPI_HOSTING_BEHAVIOR
#define DPI_HOSTING_BEHAVIOR_INVALID  -1
#define DPI_HOSTING_BEHAVIOR_DEFAULT  0x0
#define DPI_HOSTING_BEHAVIOR_MIXED  0x1

; DRAW_CAPTION_FLAGS
#define DC_ACTIVE  0x1
#define DC_BUTTONS  0x1000
#define DC_GRADIENT  0x20
#define DC_ICON  0x4
#define DC_INBUTTON  0x10
#define DC_SMALLCAP  0x2
#define DC_TEXT  0x8

; DRAW_EDGE_FLAGS
#define BF_ADJUST  0x2000
#define BF_BOTTOM  0x8
#define BF_BOTTOMLEFT  0x9
#define BF_BOTTOMRIGHT  0xc
#define BF_DIAGONAL  0x10
#define BF_DIAGONAL_ENDBOTTOMLEFT  0x19
#define BF_DIAGONAL_ENDBOTTOMRIGHT  0x1c
#define BF_DIAGONAL_ENDTOPLEFT  0x13
#define BF_DIAGONAL_ENDTOPRIGHT  0x16
#define BF_FLAT  0x4000
#define BF_LEFT  0x1
#define BF_MIDDLE  0x800
#define BF_MONO  0x8000
#define BF_RECT  0xf
#define BF_RIGHT  0x4
#define BF_SOFT  0x1000
#define BF_TOP  0x2
#define BF_TOPLEFT  0x3
#define BF_TOPRIGHT  0x6

; DRAW_TEXT_FORMAT
#define DT_BOTTOM  0x8
#define DT_CALCRECT  0x400
#define DT_CENTER  0x1
#define DT_EDITCONTROL  0x2000
#define DT_END_ELLIPSIS  0x8000
#define DT_EXPANDTABS  0x40
#define DT_EXTERNALLEADING  0x200
#define DT_HIDEPREFIX  0x100000
#define DT_INTERNAL  0x1000
#define DT_LEFT  0x0
#define DT_MODIFYSTRING  0x10000
#define DT_NOCLIP  0x100
#define DT_NOFULLWIDTHCHARBREAK  0x80000
#define DT_NOPREFIX  0x800
#define DT_PATH_ELLIPSIS  0x4000
#define DT_PREFIXONLY  0x200000
#define DT_RIGHT  0x2
#define DT_RTLREADING  0x20000
#define DT_SINGLELINE  0x20
#define DT_TABSTOP  0x80
#define DT_TOP  0x0
#define DT_VCENTER  0x4
#define DT_WORDBREAK  0x10
#define DT_WORD_ELLIPSIS  0x40000

; DRAW_THEME_PARENT_BACKGROUND_FLAGS
#define DTPB_WINDOWDC  0x1
#define DTPB_USECTLCOLORSTATIC  0x2
#define DTPB_USEERASEBKGND  0x4

; DRAWEDGE_FLAGS
#define BDR_RAISEDOUTER  0x1
#define BDR_SUNKENOUTER  0x2
#define BDR_RAISEDINNER  0x4
#define BDR_SUNKENINNER  0x8
#define BDR_OUTER  0x3
#define BDR_INNER  0xc
#define BDR_RAISED  0x5
#define BDR_SUNKEN  0xa
#define EDGE_RAISED  0x5
#define EDGE_SUNKEN  0xa
#define EDGE_ETCHED  0x6
#define EDGE_BUMP  0x9

; DRAWSTATE_FLAGS
#define DST_COMPLEX  0x0
#define DST_TEXT  0x1
#define DST_PREFIXTEXT  0x2
#define DST_ICON  0x3
#define DST_BITMAP  0x4
#define DSS_NORMAL  0x0
#define DSS_UNION  0x10
#define DSS_DISABLED  0x20
#define DSS_MONO  0x80
#define DSS_HIDEPREFIX  0x200
#define DSS_PREFIXONLY  0x400
#define DSS_RIGHT  0x8000

; DROPEFFECT
#define DROPEFFECT_NONE  0x0
#define DROPEFFECT_COPY  0x1
#define DROPEFFECT_MOVE  0x2
#define DROPEFFECT_LINK  0x4
#define DROPEFFECT_SCROLL  0x80000000

; DTTOPTS_FLAGS
#define DTT_TEXTCOLOR  0x1
#define DTT_BORDERCOLOR  0x2
#define DTT_SHADOWCOLOR  0x4
#define DTT_SHADOWTYPE  0x8
#define DTT_SHADOWOFFSET  0x10
#define DTT_BORDERSIZE  0x20
#define DTT_FONTPROP  0x40
#define DTT_COLORPROP  0x80
#define DTT_STATEID  0x100
#define DTT_CALCRECT  0x200
#define DTT_APPLYOVERLAY  0x400
#define DTT_GLOWSIZE  0x800
#define DTT_CALLBACK  0x1000
#define DTT_COMPOSITED  0x2000
#define DTT_VALIDBITS  0x2fff

; DUPLICATE_HANDLE_OPTIONS
#define DUPLICATE_CLOSE_SOURCE  0x1
#define DUPLICATE_SAME_ACCESS  0x2

; DVASPECT
#define DVASPECT_CONTENT  0x1
#define DVASPECT_THUMBNAIL  0x2
#define DVASPECT_ICON  0x4
#define DVASPECT_DOCPRINT  0x8
#define DVASPECT_OPAQUE  0x10
#define DVASPECT_TRANSPARENT  0x20

; DWM_SHOWCONTACT
#define DWMSC_DOWN  0x1
#define DWMSC_UP  0x2
#define DWMSC_DRAG  0x4
#define DWMSC_HOLD  0x8
#define DWMSC_PENBARREL  0x10
#define DWMSC_NONE  0x0
#define DWMSC_ALL  0xffffffff

; DWM_SOURCE_FRAME_SAMPLING
#define DWM_SOURCE_FRAME_SAMPLING_POINT  0x0
#define DWM_SOURCE_FRAME_SAMPLING_COVERAGE  0x1
#define DWM_SOURCE_FRAME_SAMPLING_LAST  0x2

; DWM_TAB_WINDOW_REQUIREMENTS
#define DWMTWR_NONE  0x0
#define DWMTWR_IMPLEMENTED_BY_SYSTEM  0x1
#define DWMTWR_WINDOW_RELATIONSHIP  0x2
#define DWMTWR_WINDOW_STYLES  0x4
#define DWMTWR_WINDOW_REGION  0x8
#define DWMTWR_WINDOW_DWM_ATTRIBUTES  0x10
#define DWMTWR_WINDOW_MARGINS  0x20
#define DWMTWR_TABBING_ENABLED  0x40
#define DWMTWR_USER_POLICY  0x80
#define DWMTWR_GROUP_POLICY  0x100
#define DWMTWR_APP_COMPAT  0x200

; DWMTRANSITION_OWNEDWINDOW_TARGET
#define DWMTRANSITION_OWNEDWINDOW_NULL  -1
#define DWMTRANSITION_OWNEDWINDOW_REPOSITION  0x0

; DWMWINDOWATTRIBUTE
#define DWMWA_NCRENDERING_ENABLED  0x1
#define DWMWA_NCRENDERING_POLICY  0x2
#define DWMWA_TRANSITIONS_FORCEDISABLED  0x3
#define DWMWA_ALLOW_NCPAINT  0x4
#define DWMWA_CAPTION_BUTTON_BOUNDS  0x5
#define DWMWA_NONCLIENT_RTL_LAYOUT  0x6
#define DWMWA_FORCE_ICONIC_REPRESENTATION  0x7
#define DWMWA_FLIP3D_POLICY  0x8
#define DWMWA_EXTENDED_FRAME_BOUNDS  0x9
#define DWMWA_HAS_ICONIC_BITMAP  0xa
#define DWMWA_DISALLOW_PEEK  0xb
#define DWMWA_EXCLUDED_FROM_PEEK  0xc
#define DWMWA_CLOAK  0xd
#define DWMWA_CLOAKED  0xe
#define DWMWA_FREEZE_REPRESENTATION  0xf
#define DWMWA_PASSIVE_UPDATE_MODE  0x10
#define DWMWA_USE_HOSTBACKDROPBRUSH  0x11
#define DWMWA_USE_IMMERSIVE_DARK_MODE  0x14
#define DWMWA_WINDOW_CORNER_PREFERENCE  0x21
#define DWMWA_BORDER_COLOR  0x22
#define DWMWA_CAPTION_COLOR  0x23
#define DWMWA_TEXT_COLOR  0x24
#define DWMWA_VISIBLE_FRAME_BORDER_THICKNESS  0x25
#define DWMWA_SYSTEMBACKDROP_TYPE  0x26
#define DWMWA_LAST  0x27

; DWRITE_BREAK_CONDITION
#define DWRITE_BREAK_CONDITION_NEUTRAL  0x0
#define DWRITE_BREAK_CONDITION_CAN_BREAK  0x1
#define DWRITE_BREAK_CONDITION_MAY_NOT_BREAK  0x2
#define DWRITE_BREAK_CONDITION_MUST_BREAK  0x3

; DWRITE_FACTORY_TYPE
#define DWRITE_FACTORY_TYPE_SHARED  0x0
#define DWRITE_FACTORY_TYPE_ISOLATED  0x1

; DWRITE_FLOW_DIRECTION
#define DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM  0x0
#define DWRITE_FLOW_DIRECTION_BOTTOM_TO_TOP  0x1
#define DWRITE_FLOW_DIRECTION_LEFT_TO_RIGHT  0x2
#define DWRITE_FLOW_DIRECTION_RIGHT_TO_LEFT  0x3

; DWRITE_FONT_FACE_TYPE
#define DWRITE_FONT_FACE_TYPE_CFF  0x0
#define DWRITE_FONT_FACE_TYPE_TRUETYPE  0x1
#define DWRITE_FONT_FACE_TYPE_OPENTYPE_COLLECTION  0x2
#define DWRITE_FONT_FACE_TYPE_TYPE1  0x3
#define DWRITE_FONT_FACE_TYPE_VECTOR  0x4
#define DWRITE_FONT_FACE_TYPE_BITMAP  0x5
#define DWRITE_FONT_FACE_TYPE_UNKNOWN  0x6
#define DWRITE_FONT_FACE_TYPE_RAW_CFF  0x7
#define DWRITE_FONT_FACE_TYPE_TRUETYPE_COLLECTION  0x2

; DWRITE_FONT_FEATURE_TAG
#define DWRITE_FONT_FEATURE_TAG_ALTERNATIVE_FRACTIONS  0x63726661
#define DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS_FROM_CAPITALS  0x63703263
#define DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS_FROM_CAPITALS  0x63733263
#define DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_ALTERNATES  0x746c6163
#define DWRITE_FONT_FEATURE_TAG_CASE_SENSITIVE_FORMS  0x65736163
#define DWRITE_FONT_FEATURE_TAG_GLYPH_COMPOSITION_DECOMPOSITION  0x706d6363
#define DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_LIGATURES  0x67696c63
#define DWRITE_FONT_FEATURE_TAG_CAPITAL_SPACING  0x70737063
#define DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_SWASH  0x68777363
#define DWRITE_FONT_FEATURE_TAG_CURSIVE_POSITIONING  0x73727563
#define DWRITE_FONT_FEATURE_TAG_DEFAULT  0x746c6664
#define DWRITE_FONT_FEATURE_TAG_DISCRETIONARY_LIGATURES  0x67696c64
#define DWRITE_FONT_FEATURE_TAG_EXPERT_FORMS  0x74707865
#define DWRITE_FONT_FEATURE_TAG_FRACTIONS  0x63617266
#define DWRITE_FONT_FEATURE_TAG_FULL_WIDTH  0x64697766
#define DWRITE_FONT_FEATURE_TAG_HALF_FORMS  0x666c6168
#define DWRITE_FONT_FEATURE_TAG_HALANT_FORMS  0x6e6c6168
#define DWRITE_FONT_FEATURE_TAG_ALTERNATE_HALF_WIDTH  0x746c6168
#define DWRITE_FONT_FEATURE_TAG_HISTORICAL_FORMS  0x74736968
#define DWRITE_FONT_FEATURE_TAG_HORIZONTAL_KANA_ALTERNATES  0x616e6b68
#define DWRITE_FONT_FEATURE_TAG_HISTORICAL_LIGATURES  0x67696c68
#define DWRITE_FONT_FEATURE_TAG_HALF_WIDTH  0x64697768
#define DWRITE_FONT_FEATURE_TAG_HOJO_KANJI_FORMS  0x6f6a6f68
#define DWRITE_FONT_FEATURE_TAG_JIS04_FORMS  0x3430706a
#define DWRITE_FONT_FEATURE_TAG_JIS78_FORMS  0x3837706a
#define DWRITE_FONT_FEATURE_TAG_JIS83_FORMS  0x3338706a
#define DWRITE_FONT_FEATURE_TAG_JIS90_FORMS  0x3039706a
#define DWRITE_FONT_FEATURE_TAG_KERNING  0x6e72656b
#define DWRITE_FONT_FEATURE_TAG_STANDARD_LIGATURES  0x6167696c
#define DWRITE_FONT_FEATURE_TAG_LINING_FIGURES  0x6d756e6c
#define DWRITE_FONT_FEATURE_TAG_LOCALIZED_FORMS  0x6c636f6c
#define DWRITE_FONT_FEATURE_TAG_MARK_POSITIONING  0x6b72616d
#define DWRITE_FONT_FEATURE_TAG_MATHEMATICAL_GREEK  0x6b72676d
#define DWRITE_FONT_FEATURE_TAG_MARK_TO_MARK_POSITIONING  0x6b6d6b6d
#define DWRITE_FONT_FEATURE_TAG_ALTERNATE_ANNOTATION_FORMS  0x746c616e
#define DWRITE_FONT_FEATURE_TAG_NLC_KANJI_FORMS  0x6b636c6e
#define DWRITE_FONT_FEATURE_TAG_OLD_STYLE_FIGURES  0x6d756e6f
#define DWRITE_FONT_FEATURE_TAG_ORDINALS  0x6e64726f
#define DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_ALTERNATE_WIDTH  0x746c6170
#define DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS  0x70616370
#define DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_FIGURES  0x6d756e70
#define DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_WIDTHS  0x64697770
#define DWRITE_FONT_FEATURE_TAG_QUARTER_WIDTHS  0x64697771
#define DWRITE_FONT_FEATURE_TAG_REQUIRED_LIGATURES  0x67696c72
#define DWRITE_FONT_FEATURE_TAG_RUBY_NOTATION_FORMS  0x79627572
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_ALTERNATES  0x746c6173
#define DWRITE_FONT_FEATURE_TAG_SCIENTIFIC_INFERIORS  0x666e6973
#define DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS  0x70636d73
#define DWRITE_FONT_FEATURE_TAG_SIMPLIFIED_FORMS  0x6c706d73
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1  0x31307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_2  0x32307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_3  0x33307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_4  0x34307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_5  0x35307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_6  0x36307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_7  0x37307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_8  0x38307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_9  0x39307373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_10  0x30317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_11  0x31317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_12  0x32317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_13  0x33317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_14  0x34317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_15  0x35317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_16  0x36317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_17  0x37317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_18  0x38317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_19  0x39317373
#define DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_20  0x30327373
#define DWRITE_FONT_FEATURE_TAG_SUBSCRIPT  0x73627573
#define DWRITE_FONT_FEATURE_TAG_SUPERSCRIPT  0x73707573
#define DWRITE_FONT_FEATURE_TAG_SWASH  0x68737773
#define DWRITE_FONT_FEATURE_TAG_TITLING  0x6c746974
#define DWRITE_FONT_FEATURE_TAG_TRADITIONAL_NAME_FORMS  0x6d616e74
#define DWRITE_FONT_FEATURE_TAG_TABULAR_FIGURES  0x6d756e74
#define DWRITE_FONT_FEATURE_TAG_TRADITIONAL_FORMS  0x64617274
#define DWRITE_FONT_FEATURE_TAG_THIRD_WIDTHS  0x64697774
#define DWRITE_FONT_FEATURE_TAG_UNICASE  0x63696e75
#define DWRITE_FONT_FEATURE_TAG_VERTICAL_WRITING  0x74726576
#define DWRITE_FONT_FEATURE_TAG_VERTICAL_ALTERNATES_AND_ROTATION  0x32747276
#define DWRITE_FONT_FEATURE_TAG_SLASHED_ZERO  0x6f72657a

; DWRITE_FONT_FILE_TYPE
#define DWRITE_FONT_FILE_TYPE_UNKNOWN  0x0
#define DWRITE_FONT_FILE_TYPE_CFF  0x1
#define DWRITE_FONT_FILE_TYPE_TRUETYPE  0x2
#define DWRITE_FONT_FILE_TYPE_OPENTYPE_COLLECTION  0x3
#define DWRITE_FONT_FILE_TYPE_TYPE1_PFM  0x4
#define DWRITE_FONT_FILE_TYPE_TYPE1_PFB  0x5
#define DWRITE_FONT_FILE_TYPE_VECTOR  0x6
#define DWRITE_FONT_FILE_TYPE_BITMAP  0x7
#define DWRITE_FONT_FILE_TYPE_TRUETYPE_COLLECTION  0x3

; DWRITE_FONT_SIMULATIONS
#define DWRITE_FONT_SIMULATIONS_NONE  0x0
#define DWRITE_FONT_SIMULATIONS_BOLD  0x1
#define DWRITE_FONT_SIMULATIONS_OBLIQUE  0x2

; DWRITE_FONT_STRETCH
#define DWRITE_FONT_STRETCH_UNDEFINED  0x0
#define DWRITE_FONT_STRETCH_ULTRA_CONDENSED  0x1
#define DWRITE_FONT_STRETCH_EXTRA_CONDENSED  0x2
#define DWRITE_FONT_STRETCH_CONDENSED  0x3
#define DWRITE_FONT_STRETCH_SEMI_CONDENSED  0x4
#define DWRITE_FONT_STRETCH_NORMAL  0x5
#define DWRITE_FONT_STRETCH_MEDIUM  0x5
#define DWRITE_FONT_STRETCH_SEMI_EXPANDED  0x6
#define DWRITE_FONT_STRETCH_EXPANDED  0x7
#define DWRITE_FONT_STRETCH_EXTRA_EXPANDED  0x8
#define DWRITE_FONT_STRETCH_ULTRA_EXPANDED  0x9

; DWRITE_FONT_STYLE
#define DWRITE_FONT_STYLE_NORMAL  0x0
#define DWRITE_FONT_STYLE_OBLIQUE  0x1
#define DWRITE_FONT_STYLE_ITALIC  0x2

; DWRITE_FONT_WEIGHT
#define DWRITE_FONT_WEIGHT_THIN  0x64
#define DWRITE_FONT_WEIGHT_EXTRA_LIGHT  0xc8
#define DWRITE_FONT_WEIGHT_ULTRA_LIGHT  0xc8
#define DWRITE_FONT_WEIGHT_LIGHT  0x12c
#define DWRITE_FONT_WEIGHT_SEMI_LIGHT  0x15e
#define DWRITE_FONT_WEIGHT_NORMAL  0x190
#define DWRITE_FONT_WEIGHT_REGULAR  0x190
#define DWRITE_FONT_WEIGHT_MEDIUM  0x1f4
#define DWRITE_FONT_WEIGHT_DEMI_BOLD  0x258
#define DWRITE_FONT_WEIGHT_SEMI_BOLD  0x258
#define DWRITE_FONT_WEIGHT_BOLD  0x2bc
#define DWRITE_FONT_WEIGHT_EXTRA_BOLD  0x320
#define DWRITE_FONT_WEIGHT_ULTRA_BOLD  0x320
#define DWRITE_FONT_WEIGHT_BLACK  0x384
#define DWRITE_FONT_WEIGHT_HEAVY  0x384
#define DWRITE_FONT_WEIGHT_EXTRA_BLACK  0x3b6
#define DWRITE_FONT_WEIGHT_ULTRA_BLACK  0x3b6

; DWRITE_INFORMATIONAL_STRING_ID
#define DWRITE_INFORMATIONAL_STRING_NONE  0x0
#define DWRITE_INFORMATIONAL_STRING_COPYRIGHT_NOTICE  0x1
#define DWRITE_INFORMATIONAL_STRING_VERSION_STRINGS  0x2
#define DWRITE_INFORMATIONAL_STRING_TRADEMARK  0x3
#define DWRITE_INFORMATIONAL_STRING_MANUFACTURER  0x4
#define DWRITE_INFORMATIONAL_STRING_DESIGNER  0x5
#define DWRITE_INFORMATIONAL_STRING_DESIGNER_URL  0x6
#define DWRITE_INFORMATIONAL_STRING_DESCRIPTION  0x7
#define DWRITE_INFORMATIONAL_STRING_FONT_VENDOR_URL  0x8
#define DWRITE_INFORMATIONAL_STRING_LICENSE_DESCRIPTION  0x9
#define DWRITE_INFORMATIONAL_STRING_LICENSE_INFO_URL  0xa
#define DWRITE_INFORMATIONAL_STRING_WIN32_FAMILY_NAMES  0xb
#define DWRITE_INFORMATIONAL_STRING_WIN32_SUBFAMILY_NAMES  0xc
#define DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_FAMILY_NAMES  0xd
#define DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_SUBFAMILY_NAMES  0xe
#define DWRITE_INFORMATIONAL_STRING_SAMPLE_TEXT  0xf
#define DWRITE_INFORMATIONAL_STRING_FULL_NAME  0x10
#define DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_NAME  0x11
#define DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_CID_NAME  0x12
#define DWRITE_INFORMATIONAL_STRING_WEIGHT_STRETCH_STYLE_FAMILY_NAME  0x13
#define DWRITE_INFORMATIONAL_STRING_DESIGN_SCRIPT_LANGUAGE_TAG  0x14
#define DWRITE_INFORMATIONAL_STRING_SUPPORTED_SCRIPT_LANGUAGE_TAG  0x15
#define DWRITE_INFORMATIONAL_STRING_PREFERRED_FAMILY_NAMES  0xd
#define DWRITE_INFORMATIONAL_STRING_PREFERRED_SUBFAMILY_NAMES  0xe
#define DWRITE_INFORMATIONAL_STRING_WWS_FAMILY_NAME  0x13

; DWRITE_LINE_SPACING_METHOD
#define DWRITE_LINE_SPACING_METHOD_DEFAULT  0x0
#define DWRITE_LINE_SPACING_METHOD_UNIFORM  0x1
#define DWRITE_LINE_SPACING_METHOD_PROPORTIONAL  0x2

; DWRITE_MEASURING_MODE
#define DWRITE_MEASURING_MODE_NATURAL  0x0
#define DWRITE_MEASURING_MODE_GDI_CLASSIC  0x1
#define DWRITE_MEASURING_MODE_GDI_NATURAL  0x2

; DWRITE_PARAGRAPH_ALIGNMENT
#define DWRITE_PARAGRAPH_ALIGNMENT_NEAR  0x0
#define DWRITE_PARAGRAPH_ALIGNMENT_FAR  0x1
#define DWRITE_PARAGRAPH_ALIGNMENT_CENTER  0x2

; DWRITE_PIXEL_GEOMETRY
#define DWRITE_PIXEL_GEOMETRY_FLAT  0x0
#define DWRITE_PIXEL_GEOMETRY_RGB  0x1
#define DWRITE_PIXEL_GEOMETRY_BGR  0x2

; DWRITE_READING_DIRECTION
#define DWRITE_READING_DIRECTION_LEFT_TO_RIGHT  0x0
#define DWRITE_READING_DIRECTION_RIGHT_TO_LEFT  0x1
#define DWRITE_READING_DIRECTION_TOP_TO_BOTTOM  0x2
#define DWRITE_READING_DIRECTION_BOTTOM_TO_TOP  0x3

; DWRITE_RENDERING_MODE
#define DWRITE_RENDERING_MODE_DEFAULT  0x0
#define DWRITE_RENDERING_MODE_ALIASED  0x1
#define DWRITE_RENDERING_MODE_GDI_CLASSIC  0x2
#define DWRITE_RENDERING_MODE_GDI_NATURAL  0x3
#define DWRITE_RENDERING_MODE_NATURAL  0x4
#define DWRITE_RENDERING_MODE_NATURAL_SYMMETRIC  0x5
#define DWRITE_RENDERING_MODE_OUTLINE  0x6
#define DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC  0x2
#define DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL  0x3
#define DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL  0x4
#define DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL_SYMMETRIC  0x5

; DWRITE_TEXT_ALIGNMENT
#define DWRITE_TEXT_ALIGNMENT_LEADING  0x0
#define DWRITE_TEXT_ALIGNMENT_TRAILING  0x1
#define DWRITE_TEXT_ALIGNMENT_CENTER  0x2
#define DWRITE_TEXT_ALIGNMENT_JUSTIFIED  0x3

; DWRITE_TRIMMING_GRANULARITY
#define DWRITE_TRIMMING_GRANULARITY_NONE  0x0
#define DWRITE_TRIMMING_GRANULARITY_CHARACTER  0x1
#define DWRITE_TRIMMING_GRANULARITY_WORD  0x2

; DWRITE_WORD_WRAPPING
#define DWRITE_WORD_WRAPPING_WRAP  0x0
#define DWRITE_WORD_WRAPPING_NO_WRAP  0x1
#define DWRITE_WORD_WRAPPING_EMERGENCY_BREAK  0x2
#define DWRITE_WORD_WRAPPING_WHOLE_WORD  0x3
#define DWRITE_WORD_WRAPPING_CHARACTER  0x4

; DXGI_CREATE_FACTORY_FLAGS
#define DXGI_CREATE_FACTORY_DEBUG  0x1

; DXGI_ENUM_MODES
#define DXGI_ENUM_MODES_INTERLACED  0x1
#define DXGI_ENUM_MODES_SCALING  0x2
#define DXGI_ENUM_MODES_STEREO  0x4
#define DXGI_ENUM_MODES_DISABLED_STEREO  0x8

; DXGI_FORMAT
#define DXGI_FORMAT_UNKNOWN  0x0
#define DXGI_FORMAT_R32G32B32A32_TYPELESS  0x1
#define DXGI_FORMAT_R32G32B32A32_FLOAT  0x2
#define DXGI_FORMAT_R32G32B32A32_UINT  0x3
#define DXGI_FORMAT_R32G32B32A32_SINT  0x4
#define DXGI_FORMAT_R32G32B32_TYPELESS  0x5
#define DXGI_FORMAT_R32G32B32_FLOAT  0x6
#define DXGI_FORMAT_R32G32B32_UINT  0x7
#define DXGI_FORMAT_R32G32B32_SINT  0x8
#define DXGI_FORMAT_R16G16B16A16_TYPELESS  0x9
#define DXGI_FORMAT_R16G16B16A16_FLOAT  0xa
#define DXGI_FORMAT_R16G16B16A16_UNORM  0xb
#define DXGI_FORMAT_R16G16B16A16_UINT  0xc
#define DXGI_FORMAT_R16G16B16A16_SNORM  0xd
#define DXGI_FORMAT_R16G16B16A16_SINT  0xe
#define DXGI_FORMAT_R32G32_TYPELESS  0xf
#define DXGI_FORMAT_R32G32_FLOAT  0x10
#define DXGI_FORMAT_R32G32_UINT  0x11
#define DXGI_FORMAT_R32G32_SINT  0x12
#define DXGI_FORMAT_R32G8X24_TYPELESS  0x13
#define DXGI_FORMAT_D32_FLOAT_S8X24_UINT  0x14
#define DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS  0x15
#define DXGI_FORMAT_X32_TYPELESS_G8X24_UINT  0x16
#define DXGI_FORMAT_R10G10B10A2_TYPELESS  0x17
#define DXGI_FORMAT_R10G10B10A2_UNORM  0x18
#define DXGI_FORMAT_R10G10B10A2_UINT  0x19
#define DXGI_FORMAT_R11G11B10_FLOAT  0x1a
#define DXGI_FORMAT_R8G8B8A8_TYPELESS  0x1b
#define DXGI_FORMAT_R8G8B8A8_UNORM  0x1c
#define DXGI_FORMAT_R8G8B8A8_UNORM_SRGB  0x1d
#define DXGI_FORMAT_R8G8B8A8_UINT  0x1e
#define DXGI_FORMAT_R8G8B8A8_SNORM  0x1f
#define DXGI_FORMAT_R8G8B8A8_SINT  0x20
#define DXGI_FORMAT_R16G16_TYPELESS  0x21
#define DXGI_FORMAT_R16G16_FLOAT  0x22
#define DXGI_FORMAT_R16G16_UNORM  0x23
#define DXGI_FORMAT_R16G16_UINT  0x24
#define DXGI_FORMAT_R16G16_SNORM  0x25
#define DXGI_FORMAT_R16G16_SINT  0x26
#define DXGI_FORMAT_R32_TYPELESS  0x27
#define DXGI_FORMAT_D32_FLOAT  0x28
#define DXGI_FORMAT_R32_FLOAT  0x29
#define DXGI_FORMAT_R32_UINT  0x2a
#define DXGI_FORMAT_R32_SINT  0x2b
#define DXGI_FORMAT_R24G8_TYPELESS  0x2c
#define DXGI_FORMAT_D24_UNORM_S8_UINT  0x2d
#define DXGI_FORMAT_R24_UNORM_X8_TYPELESS  0x2e
#define DXGI_FORMAT_X24_TYPELESS_G8_UINT  0x2f
#define DXGI_FORMAT_R8G8_TYPELESS  0x30
#define DXGI_FORMAT_R8G8_UNORM  0x31
#define DXGI_FORMAT_R8G8_UINT  0x32
#define DXGI_FORMAT_R8G8_SNORM  0x33
#define DXGI_FORMAT_R8G8_SINT  0x34
#define DXGI_FORMAT_R16_TYPELESS  0x35
#define DXGI_FORMAT_R16_FLOAT  0x36
#define DXGI_FORMAT_D16_UNORM  0x37
#define DXGI_FORMAT_R16_UNORM  0x38
#define DXGI_FORMAT_R16_UINT  0x39
#define DXGI_FORMAT_R16_SNORM  0x3a
#define DXGI_FORMAT_R16_SINT  0x3b
#define DXGI_FORMAT_R8_TYPELESS  0x3c
#define DXGI_FORMAT_R8_UNORM  0x3d
#define DXGI_FORMAT_R8_UINT  0x3e
#define DXGI_FORMAT_R8_SNORM  0x3f
#define DXGI_FORMAT_R8_SINT  0x40
#define DXGI_FORMAT_A8_UNORM  0x41
#define DXGI_FORMAT_R1_UNORM  0x42
#define DXGI_FORMAT_R9G9B9E5_SHAREDEXP  0x43
#define DXGI_FORMAT_R8G8_B8G8_UNORM  0x44
#define DXGI_FORMAT_G8R8_G8B8_UNORM  0x45
#define DXGI_FORMAT_BC1_TYPELESS  0x46
#define DXGI_FORMAT_BC1_UNORM  0x47
#define DXGI_FORMAT_BC1_UNORM_SRGB  0x48
#define DXGI_FORMAT_BC2_TYPELESS  0x49
#define DXGI_FORMAT_BC2_UNORM  0x4a
#define DXGI_FORMAT_BC2_UNORM_SRGB  0x4b
#define DXGI_FORMAT_BC3_TYPELESS  0x4c
#define DXGI_FORMAT_BC3_UNORM  0x4d
#define DXGI_FORMAT_BC3_UNORM_SRGB  0x4e
#define DXGI_FORMAT_BC4_TYPELESS  0x4f
#define DXGI_FORMAT_BC4_UNORM  0x50
#define DXGI_FORMAT_BC4_SNORM  0x51
#define DXGI_FORMAT_BC5_TYPELESS  0x52
#define DXGI_FORMAT_BC5_UNORM  0x53
#define DXGI_FORMAT_BC5_SNORM  0x54
#define DXGI_FORMAT_B5G6R5_UNORM  0x55
#define DXGI_FORMAT_B5G5R5A1_UNORM  0x56
#define DXGI_FORMAT_B8G8R8A8_UNORM  0x57
#define DXGI_FORMAT_B8G8R8X8_UNORM  0x58
#define DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM  0x59
#define DXGI_FORMAT_B8G8R8A8_TYPELESS  0x5a
#define DXGI_FORMAT_B8G8R8A8_UNORM_SRGB  0x5b
#define DXGI_FORMAT_B8G8R8X8_TYPELESS  0x5c
#define DXGI_FORMAT_B8G8R8X8_UNORM_SRGB  0x5d
#define DXGI_FORMAT_BC6H_TYPELESS  0x5e
#define DXGI_FORMAT_BC6H_UF16  0x5f
#define DXGI_FORMAT_BC6H_SF16  0x60
#define DXGI_FORMAT_BC7_TYPELESS  0x61
#define DXGI_FORMAT_BC7_UNORM  0x62
#define DXGI_FORMAT_BC7_UNORM_SRGB  0x63
#define DXGI_FORMAT_AYUV  0x64
#define DXGI_FORMAT_Y410  0x65
#define DXGI_FORMAT_Y416  0x66
#define DXGI_FORMAT_NV12  0x67
#define DXGI_FORMAT_P010  0x68
#define DXGI_FORMAT_P016  0x69
#define DXGI_FORMAT_420_OPAQUE  0x6a
#define DXGI_FORMAT_YUY2  0x6b
#define DXGI_FORMAT_Y210  0x6c
#define DXGI_FORMAT_Y216  0x6d
#define DXGI_FORMAT_NV11  0x6e
#define DXGI_FORMAT_AI44  0x6f
#define DXGI_FORMAT_IA44  0x70
#define DXGI_FORMAT_P8  0x71
#define DXGI_FORMAT_A8P8  0x72
#define DXGI_FORMAT_B4G4R4A4_UNORM  0x73
#define DXGI_FORMAT_P208  0x82
#define DXGI_FORMAT_V208  0x83
#define DXGI_FORMAT_V408  0x84
#define DXGI_FORMAT_SAMPLER_FEEDBACK_MIN_MIP_OPAQUE  0xbd
#define DXGI_FORMAT_SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE  0xbe
#define DXGI_FORMAT_A4B4G4R4_UNORM  0xbf

; DXGI_MAP_FLAGS
#define DXGI_MAP_READ  0x1
#define DXGI_MAP_WRITE  0x2
#define DXGI_MAP_DISCARD  0x4

; DXGI_MODE_ROTATION
#define DXGI_MODE_ROTATION_UNSPECIFIED  0x0
#define DXGI_MODE_ROTATION_IDENTITY  0x1
#define DXGI_MODE_ROTATION_ROTATE90  0x2
#define DXGI_MODE_ROTATION_ROTATE180  0x3
#define DXGI_MODE_ROTATION_ROTATE270  0x4

; DXGI_MODE_SCALING
#define DXGI_MODE_SCALING_UNSPECIFIED  0x0
#define DXGI_MODE_SCALING_CENTERED  0x1
#define DXGI_MODE_SCALING_STRETCHED  0x2

; DXGI_MODE_SCANLINE_ORDER
#define DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED  0x0
#define DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE  0x1
#define DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST  0x2
#define DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST  0x3

; DXGI_PRESENT
#define DXGI_PRESENT_TEST  0x1
#define DXGI_PRESENT_DO_NOT_SEQUENCE  0x2
#define DXGI_PRESENT_RESTART  0x4
#define DXGI_PRESENT_DO_NOT_WAIT  0x8
#define DXGI_PRESENT_STEREO_PREFER_RIGHT  0x10
#define DXGI_PRESENT_STEREO_TEMPORARY_MONO  0x20
#define DXGI_PRESENT_RESTRICT_TO_OUTPUT  0x40
#define DXGI_PRESENT_USE_DURATION  0x100
#define DXGI_PRESENT_ALLOW_TEARING  0x200

; DXGI_RESIDENCY
#define DXGI_RESIDENCY_FULLY_RESIDENT  0x1
#define DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY  0x2
#define DXGI_RESIDENCY_EVICTED_TO_DISK  0x3

; DXGI_SWAP_CHAIN_FLAG
#define DXGI_SWAP_CHAIN_FLAG_NONPREROTATED  0x1
#define DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH  0x2
#define DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE  0x4
#define DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT  0x8
#define DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER  0x10
#define DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY  0x20
#define DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT  0x40
#define DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER  0x80
#define DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO  0x100
#define DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO  0x200
#define DXGI_SWAP_CHAIN_FLAG_HW_PROTECTED  0x400
#define DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING  0x800
#define DXGI_SWAP_CHAIN_FLAG_RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS  0x1000

; DXGI_SWAP_EFFECT
#define DXGI_SWAP_EFFECT_DISCARD  0x0
#define DXGI_SWAP_EFFECT_SEQUENTIAL  0x1
#define DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL  0x3
#define DXGI_SWAP_EFFECT_FLIP_DISCARD  0x4

; DXGI_USAGE
#define DXGI_USAGE_SHADER_INPUT  0x10
#define DXGI_USAGE_RENDER_TARGET_OUTPUT  0x20
#define DXGI_USAGE_BACK_BUFFER  0x40
#define DXGI_USAGE_SHARED  0x80
#define DXGI_USAGE_READ_ONLY  0x100
#define DXGI_USAGE_DISCARD_ON_PRESENT  0x200
#define DXGI_USAGE_UNORDERED_ACCESS  0x400

; EFFECTIVE_POWER_MODE
#define EffectivePowerModeBatterySaver  0x0
#define EffectivePowerModeBetterBattery  0x1
#define EffectivePowerModeBalanced  0x2
#define EffectivePowerModeHighPerformance  0x3
#define EffectivePowerModeMaxPerformance  0x4
#define EffectivePowerModeGameMode  0x5
#define EffectivePowerModeMixedReality  0x6

; EMBDHLP_FLAGS
#define EMBDHLP_INPROC_HANDLER  0x0
#define EMBDHLP_INPROC_SERVER  0x1
#define EMBDHLP_CREATENOW  0x0
#define EMBDHLP_DELAYCREATE  0x10000

; EmfPlusRecordType
#define WmfRecordTypeSetBkColor  0x10201
#define WmfRecordTypeSetBkMode  0x10102
#define WmfRecordTypeSetMapMode  0x10103
#define WmfRecordTypeSetROP2  0x10104
#define WmfRecordTypeSetRelAbs  0x10105
#define WmfRecordTypeSetPolyFillMode  0x10106
#define WmfRecordTypeSetStretchBltMode  0x10107
#define WmfRecordTypeSetTextCharExtra  0x10108
#define WmfRecordTypeSetTextColor  0x10209
#define WmfRecordTypeSetTextJustification  0x1020a
#define WmfRecordTypeSetWindowOrg  0x1020b
#define WmfRecordTypeSetWindowExt  0x1020c
#define WmfRecordTypeSetViewportOrg  0x1020d
#define WmfRecordTypeSetViewportExt  0x1020e
#define WmfRecordTypeOffsetWindowOrg  0x1020f
#define WmfRecordTypeScaleWindowExt  0x10410
#define WmfRecordTypeOffsetViewportOrg  0x10211
#define WmfRecordTypeScaleViewportExt  0x10412
#define WmfRecordTypeLineTo  0x10213
#define WmfRecordTypeMoveTo  0x10214
#define WmfRecordTypeExcludeClipRect  0x10415
#define WmfRecordTypeIntersectClipRect  0x10416
#define WmfRecordTypeArc  0x10817
#define WmfRecordTypeEllipse  0x10418
#define WmfRecordTypeFloodFill  0x10419
#define WmfRecordTypePie  0x1081a
#define WmfRecordTypeRectangle  0x1041b
#define WmfRecordTypeRoundRect  0x1061c
#define WmfRecordTypePatBlt  0x1061d
#define WmfRecordTypeSaveDC  0x1001e
#define WmfRecordTypeSetPixel  0x1041f
#define WmfRecordTypeOffsetClipRgn  0x10220
#define WmfRecordTypeTextOut  0x10521
#define WmfRecordTypeBitBlt  0x10922
#define WmfRecordTypeStretchBlt  0x10b23
#define WmfRecordTypePolygon  0x10324
#define WmfRecordTypePolyline  0x10325
#define WmfRecordTypeEscape  0x10626
#define WmfRecordTypeRestoreDC  0x10127
#define WmfRecordTypeFillRegion  0x10228
#define WmfRecordTypeFrameRegion  0x10429
#define WmfRecordTypeInvertRegion  0x1012a
#define WmfRecordTypePaintRegion  0x1012b
#define WmfRecordTypeSelectClipRegion  0x1012c
#define WmfRecordTypeSelectObject  0x1012d
#define WmfRecordTypeSetTextAlign  0x1012e
#define WmfRecordTypeDrawText  0x1062f
#define WmfRecordTypeChord  0x10830
#define WmfRecordTypeSetMapperFlags  0x10231
#define WmfRecordTypeExtTextOut  0x10a32
#define WmfRecordTypeSetDIBToDev  0x10d33
#define WmfRecordTypeSelectPalette  0x10234
#define WmfRecordTypeRealizePalette  0x10035
#define WmfRecordTypeAnimatePalette  0x10436
#define WmfRecordTypeSetPalEntries  0x10037
#define WmfRecordTypePolyPolygon  0x10538
#define WmfRecordTypeResizePalette  0x10139
#define WmfRecordTypeDIBBitBlt  0x10940
#define WmfRecordTypeDIBStretchBlt  0x10b41
#define WmfRecordTypeDIBCreatePatternBrush  0x10142
#define WmfRecordTypeStretchDIB  0x10f43
#define WmfRecordTypeExtFloodFill  0x10548
#define WmfRecordTypeSetLayout  0x10149
#define WmfRecordTypeResetDC  0x1014c
#define WmfRecordTypeStartDoc  0x1014d
#define WmfRecordTypeStartPage  0x1004f
#define WmfRecordTypeEndPage  0x10050
#define WmfRecordTypeAbortDoc  0x10052
#define WmfRecordTypeEndDoc  0x1005e
#define WmfRecordTypeDeleteObject  0x101f0
#define WmfRecordTypeCreatePalette  0x100f7
#define WmfRecordTypeCreateBrush  0x100f8
#define WmfRecordTypeCreatePatternBrush  0x101f9
#define WmfRecordTypeCreatePenIndirect  0x102fa
#define WmfRecordTypeCreateFontIndirect  0x102fb
#define WmfRecordTypeCreateBrushIndirect  0x102fc
#define WmfRecordTypeCreateBitmapIndirect  0x102fd
#define WmfRecordTypeCreateBitmap  0x106fe
#define WmfRecordTypeCreateRegion  0x106ff
#define EmfRecordTypeHeader  0x1
#define EmfRecordTypePolyBezier  0x2
#define EmfRecordTypePolygon  0x3
#define EmfRecordTypePolyline  0x4
#define EmfRecordTypePolyBezierTo  0x5
#define EmfRecordTypePolyLineTo  0x6
#define EmfRecordTypePolyPolyline  0x7
#define EmfRecordTypePolyPolygon  0x8
#define EmfRecordTypeSetWindowExtEx  0x9
#define EmfRecordTypeSetWindowOrgEx  0xa
#define EmfRecordTypeSetViewportExtEx  0xb
#define EmfRecordTypeSetViewportOrgEx  0xc
#define EmfRecordTypeSetBrushOrgEx  0xd
#define EmfRecordTypeEOF  0xe
#define EmfRecordTypeSetPixelV  0xf
#define EmfRecordTypeSetMapperFlags  0x10
#define EmfRecordTypeSetMapMode  0x11
#define EmfRecordTypeSetBkMode  0x12
#define EmfRecordTypeSetPolyFillMode  0x13
#define EmfRecordTypeSetROP2  0x14
#define EmfRecordTypeSetStretchBltMode  0x15
#define EmfRecordTypeSetTextAlign  0x16
#define EmfRecordTypeSetColorAdjustment  0x17
#define EmfRecordTypeSetTextColor  0x18
#define EmfRecordTypeSetBkColor  0x19
#define EmfRecordTypeOffsetClipRgn  0x1a
#define EmfRecordTypeMoveToEx  0x1b
#define EmfRecordTypeSetMetaRgn  0x1c
#define EmfRecordTypeExcludeClipRect  0x1d
#define EmfRecordTypeIntersectClipRect  0x1e
#define EmfRecordTypeScaleViewportExtEx  0x1f
#define EmfRecordTypeScaleWindowExtEx  0x20
#define EmfRecordTypeSaveDC  0x21
#define EmfRecordTypeRestoreDC  0x22
#define EmfRecordTypeSetWorldTransform  0x23
#define EmfRecordTypeModifyWorldTransform  0x24
#define EmfRecordTypeSelectObject  0x25
#define EmfRecordTypeCreatePen  0x26
#define EmfRecordTypeCreateBrushIndirect  0x27
#define EmfRecordTypeDeleteObject  0x28
#define EmfRecordTypeAngleArc  0x29
#define EmfRecordTypeEllipse  0x2a
#define EmfRecordTypeRectangle  0x2b
#define EmfRecordTypeRoundRect  0x2c
#define EmfRecordTypeArc  0x2d
#define EmfRecordTypeChord  0x2e
#define EmfRecordTypePie  0x2f
#define EmfRecordTypeSelectPalette  0x30
#define EmfRecordTypeCreatePalette  0x31
#define EmfRecordTypeSetPaletteEntries  0x32
#define EmfRecordTypeResizePalette  0x33
#define EmfRecordTypeRealizePalette  0x34
#define EmfRecordTypeExtFloodFill  0x35
#define EmfRecordTypeLineTo  0x36
#define EmfRecordTypeArcTo  0x37
#define EmfRecordTypePolyDraw  0x38
#define EmfRecordTypeSetArcDirection  0x39
#define EmfRecordTypeSetMiterLimit  0x3a
#define EmfRecordTypeBeginPath  0x3b
#define EmfRecordTypeEndPath  0x3c
#define EmfRecordTypeCloseFigure  0x3d
#define EmfRecordTypeFillPath  0x3e
#define EmfRecordTypeStrokeAndFillPath  0x3f
#define EmfRecordTypeStrokePath  0x40
#define EmfRecordTypeFlattenPath  0x41
#define EmfRecordTypeWidenPath  0x42
#define EmfRecordTypeSelectClipPath  0x43
#define EmfRecordTypeAbortPath  0x44
#define EmfRecordTypeReserved_069  0x45
#define EmfRecordTypeGdiComment  0x46
#define EmfRecordTypeFillRgn  0x47
#define EmfRecordTypeFrameRgn  0x48
#define EmfRecordTypeInvertRgn  0x49
#define EmfRecordTypePaintRgn  0x4a
#define EmfRecordTypeExtSelectClipRgn  0x4b
#define EmfRecordTypeBitBlt  0x4c
#define EmfRecordTypeStretchBlt  0x4d
#define EmfRecordTypeMaskBlt  0x4e
#define EmfRecordTypePlgBlt  0x4f
#define EmfRecordTypeSetDIBitsToDevice  0x50
#define EmfRecordTypeStretchDIBits  0x51
#define EmfRecordTypeExtCreateFontIndirect  0x52
#define EmfRecordTypeExtTextOutA  0x53
#define EmfRecordTypeExtTextOutW  0x54
#define EmfRecordTypePolyBezier16  0x55
#define EmfRecordTypePolygon16  0x56
#define EmfRecordTypePolyline16  0x57
#define EmfRecordTypePolyBezierTo16  0x58
#define EmfRecordTypePolylineTo16  0x59
#define EmfRecordTypePolyPolyline16  0x5a
#define EmfRecordTypePolyPolygon16  0x5b
#define EmfRecordTypePolyDraw16  0x5c
#define EmfRecordTypeCreateMonoBrush  0x5d
#define EmfRecordTypeCreateDIBPatternBrushPt  0x5e
#define EmfRecordTypeExtCreatePen  0x5f
#define EmfRecordTypePolyTextOutA  0x60
#define EmfRecordTypePolyTextOutW  0x61
#define EmfRecordTypeSetICMMode  0x62
#define EmfRecordTypeCreateColorSpace  0x63
#define EmfRecordTypeSetColorSpace  0x64
#define EmfRecordTypeDeleteColorSpace  0x65
#define EmfRecordTypeGLSRecord  0x66
#define EmfRecordTypeGLSBoundedRecord  0x67
#define EmfRecordTypePixelFormat  0x68
#define EmfRecordTypeDrawEscape  0x69
#define EmfRecordTypeExtEscape  0x6a
#define EmfRecordTypeStartDoc  0x6b
#define EmfRecordTypeSmallTextOut  0x6c
#define EmfRecordTypeForceUFIMapping  0x6d
#define EmfRecordTypeNamedEscape  0x6e
#define EmfRecordTypeColorCorrectPalette  0x6f
#define EmfRecordTypeSetICMProfileA  0x70
#define EmfRecordTypeSetICMProfileW  0x71
#define EmfRecordTypeAlphaBlend  0x72
#define EmfRecordTypeSetLayout  0x73
#define EmfRecordTypeTransparentBlt  0x74
#define EmfRecordTypeReserved_117  0x75
#define EmfRecordTypeGradientFill  0x76
#define EmfRecordTypeSetLinkedUFIs  0x77
#define EmfRecordTypeSetTextJustification  0x78
#define EmfRecordTypeColorMatchToTargetW  0x79
#define EmfRecordTypeCreateColorSpaceW  0x7a
#define EmfRecordTypeMax  0x7a
#define EmfRecordTypeMin  0x1
#define EmfPlusRecordTypeInvalid  0x4000
#define EmfPlusRecordTypeHeader  0x4001
#define EmfPlusRecordTypeEndOfFile  0x4002
#define EmfPlusRecordTypeComment  0x4003
#define EmfPlusRecordTypeGetDC  0x4004
#define EmfPlusRecordTypeMultiFormatStart  0x4005
#define EmfPlusRecordTypeMultiFormatSection  0x4006
#define EmfPlusRecordTypeMultiFormatEnd  0x4007
#define EmfPlusRecordTypeObject  0x4008
#define EmfPlusRecordTypeClear  0x4009
#define EmfPlusRecordTypeFillRects  0x400a
#define EmfPlusRecordTypeDrawRects  0x400b
#define EmfPlusRecordTypeFillPolygon  0x400c
#define EmfPlusRecordTypeDrawLines  0x400d
#define EmfPlusRecordTypeFillEllipse  0x400e
#define EmfPlusRecordTypeDrawEllipse  0x400f
#define EmfPlusRecordTypeFillPie  0x4010
#define EmfPlusRecordTypeDrawPie  0x4011
#define EmfPlusRecordTypeDrawArc  0x4012
#define EmfPlusRecordTypeFillRegion  0x4013
#define EmfPlusRecordTypeFillPath  0x4014
#define EmfPlusRecordTypeDrawPath  0x4015
#define EmfPlusRecordTypeFillClosedCurve  0x4016
#define EmfPlusRecordTypeDrawClosedCurve  0x4017
#define EmfPlusRecordTypeDrawCurve  0x4018
#define EmfPlusRecordTypeDrawBeziers  0x4019
#define EmfPlusRecordTypeDrawImage  0x401a
#define EmfPlusRecordTypeDrawImagePoints  0x401b
#define EmfPlusRecordTypeDrawString  0x401c
#define EmfPlusRecordTypeSetRenderingOrigin  0x401d
#define EmfPlusRecordTypeSetAntiAliasMode  0x401e
#define EmfPlusRecordTypeSetTextRenderingHint  0x401f
#define EmfPlusRecordTypeSetTextContrast  0x4020
#define EmfPlusRecordTypeSetInterpolationMode  0x4021
#define EmfPlusRecordTypeSetPixelOffsetMode  0x4022
#define EmfPlusRecordTypeSetCompositingMode  0x4023
#define EmfPlusRecordTypeSetCompositingQuality  0x4024
#define EmfPlusRecordTypeSave  0x4025
#define EmfPlusRecordTypeRestore  0x4026
#define EmfPlusRecordTypeBeginContainer  0x4027
#define EmfPlusRecordTypeBeginContainerNoParams  0x4028
#define EmfPlusRecordTypeEndContainer  0x4029
#define EmfPlusRecordTypeSetWorldTransform  0x402a
#define EmfPlusRecordTypeResetWorldTransform  0x402b
#define EmfPlusRecordTypeMultiplyWorldTransform  0x402c
#define EmfPlusRecordTypeTranslateWorldTransform  0x402d
#define EmfPlusRecordTypeScaleWorldTransform  0x402e
#define EmfPlusRecordTypeRotateWorldTransform  0x402f
#define EmfPlusRecordTypeSetPageTransform  0x4030
#define EmfPlusRecordTypeResetClip  0x4031
#define EmfPlusRecordTypeSetClipRect  0x4032
#define EmfPlusRecordTypeSetClipPath  0x4033
#define EmfPlusRecordTypeSetClipRegion  0x4034
#define EmfPlusRecordTypeOffsetClip  0x4035
#define EmfPlusRecordTypeDrawDriverString  0x4036
#define EmfPlusRecordTypeStrokeFillPath  0x4037
#define EmfPlusRecordTypeSerializableObject  0x4038
#define EmfPlusRecordTypeSetTSGraphics  0x4039
#define EmfPlusRecordTypeSetTSClip  0x403a
#define EmfPlusRecordTotal  0x403b
#define EmfPlusRecordTypeMax  0x403a
#define EmfPlusRecordTypeMin  0x4001

; EmfType
#define EmfTypeEmfOnly  0x3
#define EmfTypeEmfPlusOnly  0x4
#define EmfTypeEmfPlusDual  0x5

; ENABLE_SCROLL_BAR_ARROWS
#define ESB_DISABLE_BOTH  0x3
#define ESB_DISABLE_DOWN  0x2
#define ESB_DISABLE_LEFT  0x1
#define ESB_DISABLE_LTUP  0x1
#define ESB_DISABLE_RIGHT  0x2
#define ESB_DISABLE_RTDN  0x2
#define ESB_DISABLE_UP  0x1
#define ESB_ENABLE_BOTH  0x0

; ENHANCED_METAFILE_RECORD_TYPE
#define EMR_HEADER  0x1
#define EMR_POLYBEZIER  0x2
#define EMR_POLYGON  0x3
#define EMR_POLYLINE  0x4
#define EMR_POLYBEZIERTO  0x5
#define EMR_POLYLINETO  0x6
#define EMR_POLYPOLYLINE  0x7
#define EMR_POLYPOLYGON  0x8
#define EMR_SETWINDOWEXTEX  0x9
#define EMR_SETWINDOWORGEX  0xa
#define EMR_SETVIEWPORTEXTEX  0xb
#define EMR_SETVIEWPORTORGEX  0xc
#define EMR_SETBRUSHORGEX  0xd
#define EMR_EOF  0xe
#define EMR_SETPIXELV  0xf
#define EMR_SETMAPPERFLAGS  0x10
#define EMR_SETMAPMODE  0x11
#define EMR_SETBKMODE  0x12
#define EMR_SETPOLYFILLMODE  0x13
#define EMR_SETROP2  0x14
#define EMR_SETSTRETCHBLTMODE  0x15
#define EMR_SETTEXTALIGN  0x16
#define EMR_SETCOLORADJUSTMENT  0x17
#define EMR_SETTEXTCOLOR  0x18
#define EMR_SETBKCOLOR  0x19
#define EMR_OFFSETCLIPRGN  0x1a
#define EMR_MOVETOEX  0x1b
#define EMR_SETMETARGN  0x1c
#define EMR_EXCLUDECLIPRECT  0x1d
#define EMR_INTERSECTCLIPRECT  0x1e
#define EMR_SCALEVIEWPORTEXTEX  0x1f
#define EMR_SCALEWINDOWEXTEX  0x20
#define EMR_SAVEDC  0x21
#define EMR_RESTOREDC  0x22
#define EMR_SETWORLDTRANSFORM  0x23
#define EMR_MODIFYWORLDTRANSFORM  0x24
#define EMR_SELECTOBJECT  0x25
#define EMR_CREATEPEN  0x26
#define EMR_CREATEBRUSHINDIRECT  0x27
#define EMR_DELETEOBJECT  0x28
#define EMR_ANGLEARC  0x29
#define EMR_ELLIPSE  0x2a
#define EMR_RECTANGLE  0x2b
#define EMR_ROUNDRECT  0x2c
#define EMR_ARC  0x2d
#define EMR_CHORD  0x2e
#define EMR_PIE  0x2f
#define EMR_SELECTPALETTE  0x30
#define EMR_CREATEPALETTE  0x31
#define EMR_SETPALETTEENTRIES  0x32
#define EMR_RESIZEPALETTE  0x33
#define EMR_REALIZEPALETTE  0x34
#define EMR_EXTFLOODFILL  0x35
#define EMR_LINETO  0x36
#define EMR_ARCTO  0x37
#define EMR_POLYDRAW  0x38
#define EMR_SETARCDIRECTION  0x39
#define EMR_SETMITERLIMIT  0x3a
#define EMR_BEGINPATH  0x3b
#define EMR_ENDPATH  0x3c
#define EMR_CLOSEFIGURE  0x3d
#define EMR_FILLPATH  0x3e
#define EMR_STROKEANDFILLPATH  0x3f
#define EMR_STROKEPATH  0x40
#define EMR_FLATTENPATH  0x41
#define EMR_WIDENPATH  0x42
#define EMR_SELECTCLIPPATH  0x43
#define EMR_ABORTPATH  0x44
#define EMR_GDICOMMENT  0x46
#define EMR_FILLRGN  0x47
#define EMR_FRAMERGN  0x48
#define EMR_INVERTRGN  0x49
#define EMR_PAINTRGN  0x4a
#define EMR_EXTSELECTCLIPRGN  0x4b
#define EMR_BITBLT  0x4c
#define EMR_STRETCHBLT  0x4d
#define EMR_MASKBLT  0x4e
#define EMR_PLGBLT  0x4f
#define EMR_SETDIBITSTODEVICE  0x50
#define EMR_STRETCHDIBITS  0x51
#define EMR_EXTCREATEFONTINDIRECTW  0x52
#define EMR_EXTTEXTOUTA  0x53
#define EMR_EXTTEXTOUTW  0x54
#define EMR_POLYBEZIER16  0x55
#define EMR_POLYGON16  0x56
#define EMR_POLYLINE16  0x57
#define EMR_POLYBEZIERTO16  0x58
#define EMR_POLYLINETO16  0x59
#define EMR_POLYPOLYLINE16  0x5a
#define EMR_POLYPOLYGON16  0x5b
#define EMR_POLYDRAW16  0x5c
#define EMR_CREATEMONOBRUSH  0x5d
#define EMR_CREATEDIBPATTERNBRUSHPT  0x5e
#define EMR_EXTCREATEPEN  0x5f
#define EMR_POLYTEXTOUTA  0x60
#define EMR_POLYTEXTOUTW  0x61
#define EMR_SETICMMODE  0x62
#define EMR_CREATECOLORSPACE  0x63
#define EMR_SETCOLORSPACE  0x64
#define EMR_DELETECOLORSPACE  0x65
#define EMR_GLSRECORD  0x66
#define EMR_GLSBOUNDEDRECORD  0x67
#define EMR_PIXELFORMAT  0x68
#define EMR_RESERVED_105  0x69
#define EMR_RESERVED_106  0x6a
#define EMR_RESERVED_107  0x6b
#define EMR_RESERVED_108  0x6c
#define EMR_RESERVED_109  0x6d
#define EMR_RESERVED_110  0x6e
#define EMR_COLORCORRECTPALETTE  0x6f
#define EMR_SETICMPROFILEA  0x70
#define EMR_SETICMPROFILEW  0x71
#define EMR_ALPHABLEND  0x72
#define EMR_SETLAYOUT  0x73
#define EMR_TRANSPARENTBLT  0x74
#define EMR_RESERVED_117  0x75
#define EMR_GRADIENTFILL  0x76
#define EMR_RESERVED_119  0x77
#define EMR_RESERVED_120  0x78
#define EMR_COLORMATCHTOTARGETW  0x79
#define EMR_CREATECOLORSPACEW  0x7a
#define EMR_MIN  0x1
#define EMR_MAX  0x7a

; ENUM_DATE_FORMATS_FLAGS
#define DATE_SHORTDATE  0x1
#define DATE_LONGDATE  0x2
#define DATE_YEARMONTH  0x8
#define DATE_MONTHDAY  0x80
#define DATE_AUTOLAYOUT  0x40
#define DATE_LTRREADING  0x10
#define DATE_RTLREADING  0x20
#define DATE_USE_ALT_CALENDAR  0x4

; ENUM_DISPLAY_SETTINGS_FLAGS
#define EDS_RAWMODE  0x2
#define EDS_ROTATEDMODE  0x4

; ENUM_DISPLAY_SETTINGS_MODE
#define ENUM_CURRENT_SETTINGS  0xffffffff
#define ENUM_REGISTRY_SETTINGS  0xfffffffe

; ENUM_PROCESS_MODULES_EX_FLAGS
#define LIST_MODULES_ALL  0x3
#define LIST_MODULES_DEFAULT  0x0
#define LIST_MODULES_32BIT  0x1
#define LIST_MODULES_64BIT  0x2

; ENUM_SERVICE_STATE
#define SERVICE_ACTIVE  0x1
#define SERVICE_INACTIVE  0x2
#define SERVICE_STATE_ALL  0x3

; ENUM_SERVICE_TYPE
#define SERVICE_DRIVER  0xb
#define SERVICE_KERNEL_DRIVER  0x1
#define SERVICE_WIN32  0x30
#define SERVICE_WIN32_SHARE_PROCESS  0x20
#define SERVICE_ADAPTER  0x4
#define SERVICE_FILE_SYSTEM_DRIVER  0x2
#define SERVICE_RECOGNIZER_DRIVER  0x8
#define SERVICE_WIN32_OWN_PROCESS  0x10
#define SERVICE_USER_OWN_PROCESS  0x50
#define SERVICE_USER_SHARE_PROCESS  0x60
#define SERVICE_NO_CHANGE  0xffffffff

; ENUM_SYSTEM_CODE_PAGES_FLAGS
#define CP_INSTALLED  0x1
#define CP_SUPPORTED  0x2

; ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS
#define LGRPID_INSTALLED  0x1
#define LGRPID_SUPPORTED  0x2

; ERASE_TAPE_TYPE
#define TAPE_ERASE_LONG  0x1
#define TAPE_ERASE_SHORT  0x0

; ESCAPE_COMM_FUNCTION
#define CLRBREAK  0x9
#define CLRDTR  0x6
#define CLRRTS  0x4
#define SETBREAK  0x8
#define SETDTR  0x5
#define SETRTS  0x3
#define SETXOFF  0x1
#define SETXON  0x2

; ETO_OPTIONS
#define ETO_OPAQUE  0x2
#define ETO_CLIPPED  0x4
#define ETO_GLYPH_INDEX  0x10
#define ETO_RTLREADING  0x80
#define ETO_NUMERICSLOCAL  0x400
#define ETO_NUMERICSLATIN  0x800
#define ETO_IGNORELANGUAGE  0x1000
#define ETO_PDY  0x2000
#define ETO_REVERSE_INDEX_MAP  0x10000

; ETW_PROCESS_HANDLE_INFO_TYPE
#define EtwQueryPartitionInformation  0x1
#define EtwQueryPartitionInformationV2  0x2
#define EtwQueryLastDroppedTimes  0x3
#define EtwQueryLogFileHeader  0x4
#define EtwQueryProcessHandleInfoMax  0x5

; EVENT_TRACE_CONTROL
#define EVENT_TRACE_CONTROL_FLUSH  0x3
#define EVENT_TRACE_CONTROL_QUERY  0x0
#define EVENT_TRACE_CONTROL_STOP  0x1
#define EVENT_TRACE_CONTROL_UPDATE  0x2

; EVENT_TRACE_FLAG
#define EVENT_TRACE_FLAG_ALPC  0x100000
#define EVENT_TRACE_FLAG_CSWITCH  0x10
#define EVENT_TRACE_FLAG_DBGPRINT  0x40000
#define EVENT_TRACE_FLAG_DISK_FILE_IO  0x200
#define EVENT_TRACE_FLAG_DISK_IO  0x100
#define EVENT_TRACE_FLAG_DISK_IO_INIT  0x400
#define EVENT_TRACE_FLAG_DISPATCHER  0x800
#define EVENT_TRACE_FLAG_DPC  0x20
#define EVENT_TRACE_FLAG_DRIVER  0x800000
#define EVENT_TRACE_FLAG_FILE_IO  0x2000000
#define EVENT_TRACE_FLAG_FILE_IO_INIT  0x4000000
#define EVENT_TRACE_FLAG_IMAGE_LOAD  0x4
#define EVENT_TRACE_FLAG_INTERRUPT  0x40
#define EVENT_TRACE_FLAG_JOB  0x80000
#define EVENT_TRACE_FLAG_MEMORY_HARD_FAULTS  0x2000
#define EVENT_TRACE_FLAG_MEMORY_PAGE_FAULTS  0x1000
#define EVENT_TRACE_FLAG_NETWORK_TCPIP  0x10000
#define EVENT_TRACE_FLAG_NO_SYSCONFIG  0x10000000
#define EVENT_TRACE_FLAG_PROCESS  0x1
#define EVENT_TRACE_FLAG_PROCESS_COUNTERS  0x8
#define EVENT_TRACE_FLAG_PROFILE  0x1000000
#define EVENT_TRACE_FLAG_REGISTRY  0x20000
#define EVENT_TRACE_FLAG_SPLIT_IO  0x200000
#define EVENT_TRACE_FLAG_SYSTEMCALL  0x80
#define EVENT_TRACE_FLAG_THREAD  0x2
#define EVENT_TRACE_FLAG_VAMAP  0x8000
#define EVENT_TRACE_FLAG_VIRTUAL_ALLOC  0x4000

; EXECUTION_STATE
#define ES_AWAYMODE_REQUIRED  0x40
#define ES_CONTINUOUS  0x80000000
#define ES_DISPLAY_REQUIRED  0x2
#define ES_SYSTEM_REQUIRED  0x1
#define ES_USER_PRESENT  0x4

; EXIT_WINDOWS_FLAGS
#define EWX_LOGOFF  0x0
#define EWX_SHUTDOWN  0x1
#define EWX_REBOOT  0x2
#define EWX_FORCE  0x4
#define EWX_POWEROFF  0x8
#define EWX_FORCEIFHUNG  0x10
#define EWX_QUICKRESOLVE  0x20
#define EWX_RESTARTAPPS  0x40
#define EWX_HYBRID_SHUTDOWN  0x400000
#define EWX_BOOTOPTIONS  0x1000000
#define EWX_ARSO  0x4000000
#define EWX_CHECK_SAFE_FOR_SERVER  0x8000000
#define EWX_SYSTEM_INITIATED  0x10000000

; EXT_FLOOD_FILL_TYPE
#define FLOODFILLBORDER  0x0
#define FLOODFILLSURFACE  0x1

; EXTENDED_NAME_FORMAT
#define NameUnknown  0x0
#define NameFullyQualifiedDN  0x1
#define NameSamCompatible  0x2
#define NameDisplay  0x3

; FEEDBACK_TYPE
#define FEEDBACK_TOUCH_CONTACTVISUALIZATION  0x1
#define FEEDBACK_PEN_BARRELVISUALIZATION  0x2
#define FEEDBACK_PEN_TAP  0x3
#define FEEDBACK_PEN_DOUBLETAP  0x4
#define FEEDBACK_PEN_PRESSANDHOLD  0x5
#define FEEDBACK_PEN_RIGHTTAP  0x6
#define FEEDBACK_TOUCH_TAP  0x7
#define FEEDBACK_TOUCH_DOUBLETAP  0x8
#define FEEDBACK_TOUCH_PRESSANDHOLD  0x9
#define FEEDBACK_TOUCH_RIGHTTAP  0xa
#define FEEDBACK_GESTURE_PRESSANDTAP  0xb
#define FEEDBACK_MAX  -1

; FILE_CREATION_DISPOSITION
#define CREATE_NEW  0x1
#define CREATE_ALWAYS  0x2
#define OPEN_EXISTING  0x3
#define OPEN_ALWAYS  0x4
#define TRUNCATE_EXISTING  0x5

; FILE_FLAGS_AND_ATTRIBUTES
#define FILE_ATTRIBUTE_READONLY  0x1
#define FILE_ATTRIBUTE_HIDDEN  0x2
#define FILE_ATTRIBUTE_SYSTEM  0x4
#define FILE_ATTRIBUTE_DIRECTORY  0x10
#define FILE_ATTRIBUTE_ARCHIVE  0x20
#define FILE_ATTRIBUTE_DEVICE  0x40
#define FILE_ATTRIBUTE_NORMAL  0x80
#define FILE_ATTRIBUTE_TEMPORARY  0x100
#define FILE_ATTRIBUTE_SPARSE_FILE  0x200
#define FILE_ATTRIBUTE_REPARSE_POINT  0x400
#define FILE_ATTRIBUTE_COMPRESSED  0x800
#define FILE_ATTRIBUTE_OFFLINE  0x1000
#define FILE_ATTRIBUTE_NOT_CONTENT_INDEXED  0x2000
#define FILE_ATTRIBUTE_ENCRYPTED  0x4000
#define FILE_ATTRIBUTE_INTEGRITY_STREAM  0x8000
#define FILE_ATTRIBUTE_VIRTUAL  0x10000
#define FILE_ATTRIBUTE_NO_SCRUB_DATA  0x20000
#define FILE_ATTRIBUTE_EA  0x40000
#define FILE_ATTRIBUTE_PINNED  0x80000
#define FILE_ATTRIBUTE_UNPINNED  0x100000
#define FILE_ATTRIBUTE_RECALL_ON_OPEN  0x40000
#define FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS  0x400000
#define FILE_FLAG_WRITE_THROUGH  0x80000000
#define FILE_FLAG_OVERLAPPED  0x40000000
#define FILE_FLAG_NO_BUFFERING  0x20000000
#define FILE_FLAG_RANDOM_ACCESS  0x10000000
#define FILE_FLAG_SEQUENTIAL_SCAN  0x8000000
#define FILE_FLAG_DELETE_ON_CLOSE  0x4000000
#define FILE_FLAG_BACKUP_SEMANTICS  0x2000000
#define FILE_FLAG_POSIX_SEMANTICS  0x1000000
#define FILE_FLAG_SESSION_AWARE  0x800000
#define FILE_FLAG_OPEN_REPARSE_POINT  0x200000
#define FILE_FLAG_OPEN_NO_RECALL  0x100000
#define FILE_FLAG_FIRST_PIPE_INSTANCE  0x80000
#define PIPE_ACCESS_DUPLEX  0x3
#define PIPE_ACCESS_INBOUND  0x1
#define PIPE_ACCESS_OUTBOUND  0x2
#define SECURITY_ANONYMOUS  0x0
#define SECURITY_IDENTIFICATION  0x10000
#define SECURITY_IMPERSONATION  0x20000
#define SECURITY_DELEGATION  0x30000
#define SECURITY_CONTEXT_TRACKING  0x40000
#define SECURITY_EFFECTIVE_ONLY  0x80000
#define SECURITY_SQOS_PRESENT  0x100000
#define SECURITY_VALID_SQOS_FLAGS  0x1f0000

; FILE_ID_TYPE
#define FileIdType  0x0
#define ObjectIdType  0x1
#define ExtendedFileIdType  0x2
#define MaximumFileIdType  0x3

; FILE_INFO_BY_HANDLE_CLASS
#define FileBasicInfo  0x0
#define FileStandardInfo  0x1
#define FileNameInfo  0x2
#define FileRenameInfo  0x3
#define FileDispositionInfo  0x4
#define FileAllocationInfo  0x5
#define FileEndOfFileInfo  0x6
#define FileStreamInfo  0x7
#define FileCompressionInfo  0x8
#define FileAttributeTagInfo  0x9
#define FileIdBothDirectoryInfo  0xa
#define FileIdBothDirectoryRestartInfo  0xb
#define FileIoPriorityHintInfo  0xc
#define FileRemoteProtocolInfo  0xd
#define FileFullDirectoryInfo  0xe
#define FileFullDirectoryRestartInfo  0xf
#define FileStorageInfo  0x10
#define FileAlignmentInfo  0x11
#define FileIdInfo  0x12
#define FileIdExtdDirectoryInfo  0x13
#define FileIdExtdDirectoryRestartInfo  0x14
#define FileDispositionInfoEx  0x15
#define FileRenameInfoEx  0x16
#define FileCaseSensitiveInfo  0x17
#define FileNormalizedNameInfo  0x18
#define MaximumFileInfoByHandleClass  0x19

; FILE_MAP
#define FILE_MAP_WRITE  0x2
#define FILE_MAP_READ  0x4
#define FILE_MAP_ALL_ACCESS  0xf001f
#define FILE_MAP_EXECUTE  0x20
#define FILE_MAP_COPY  0x1
#define FILE_MAP_RESERVE  0x80000000
#define FILE_MAP_TARGETS_INVALID  0x40000000
#define FILE_MAP_LARGE_PAGES  0x20000000

; FILE_NOTIFY_CHANGE
#define FILE_NOTIFY_CHANGE_FILE_NAME  0x1
#define FILE_NOTIFY_CHANGE_DIR_NAME  0x2
#define FILE_NOTIFY_CHANGE_ATTRIBUTES  0x4
#define FILE_NOTIFY_CHANGE_SIZE  0x8
#define FILE_NOTIFY_CHANGE_LAST_WRITE  0x10
#define FILE_NOTIFY_CHANGE_LAST_ACCESS  0x20
#define FILE_NOTIFY_CHANGE_CREATION  0x40
#define FILE_NOTIFY_CHANGE_SECURITY  0x100

; FILE_SHARE_MODE
#define FILE_SHARE_NONE  0x0
#define FILE_SHARE_DELETE  0x4
#define FILE_SHARE_READ  0x1
#define FILE_SHARE_WRITE  0x2

; FILE_TYPE
#define FILE_TYPE_UNKNOWN  0x0
#define FILE_TYPE_DISK  0x1
#define FILE_TYPE_CHAR  0x2
#define FILE_TYPE_PIPE  0x3
#define FILE_TYPE_REMOTE  0x8000

; FILEOPERATION_FLAGS
#define FOFX_NOSKIPJUNCTIONS  0x10000
#define FOFX_PREFERHARDLINK  0x20000
#define FOFX_SHOWELEVATIONPROMPT  0x40000
#define FOFX_RECYCLEONDELETE  0x80000
#define FOFX_EARLYFAILURE  0x100000
#define FOFX_PRESERVEFILEEXTENSIONS  0x200000
#define FOFX_KEEPNEWERFILE  0x400000
#define FOFX_NOCOPYHOOKS  0x800000
#define FOFX_NOMINIMIZEBOX  0x1000000
#define FOFX_MOVEACLSACROSSVOLUMES  0x2000000
#define FOFX_DONTDISPLAYSOURCEPATH  0x4000000
#define FOFX_DONTDISPLAYDESTPATH  0x8000000
#define FOFX_REQUIREELEVATION  0x10000000
#define FOFX_ADDUNDORECORD  0x20000000
#define FOFX_COPYASDOWNLOAD  0x40000000
#define FOFX_DONTDISPLAYLOCATIONS  0x80000000
#define FOF_MULTIDESTFILES  0x1
#define FOF_CONFIRMMOUSE  0x2
#define FOF_SILENT  0x4
#define FOF_RENAMEONCOLLISION  0x8
#define FOF_NOCONFIRMATION  0x10
#define FOF_WANTMAPPINGHANDLE  0x20
#define FOF_ALLOWUNDO  0x40
#define FOF_FILESONLY  0x80
#define FOF_SIMPLEPROGRESS  0x100
#define FOF_NOCONFIRMMKDIR  0x200
#define FOF_NOERRORUI  0x400
#define FOF_NOCOPYSECURITYATTRIBS  0x800
#define FOF_NORECURSION  0x1000
#define FOF_NO_CONNECTED_ELEMENTS  0x2000
#define FOF_WANTNUKEWARNING  0x4000
#define FOF_NORECURSEREPARSE  0x8000
#define FOF_NO_UI  0x614

; FillMode
#define FillModeAlternate  0x0
#define FillModeWinding  0x1

; FIND_FIRST_EX_FLAGS
#define FIND_FIRST_EX_CASE_SENSITIVE  0x1
#define FIND_FIRST_EX_LARGE_FETCH  0x2
#define FIND_FIRST_EX_ON_DISK_ENTRIES_ONLY  0x4

; FINDEX_INFO_LEVELS
#define FindExInfoStandard  0x0
#define FindExInfoBasic  0x1
#define FindExInfoMaxInfoLevel  0x2

; FINDEX_SEARCH_OPS
#define FindExSearchNameMatch  0x0
#define FindExSearchLimitToDirectories  0x1
#define FindExSearchLimitToDevices  0x2
#define FindExSearchMaxSearchOp  0x3

; FIRMWARE_TABLE_PROVIDER
#define ACPI  0x41435049
#define FIRM  0x4649524d
#define RSMB  0x52534d42

; FIRMWARE_TYPE
#define FirmwareTypeUnknown  0x0
#define FirmwareTypeBios  0x1
#define FirmwareTypeUefi  0x2
#define FirmwareTypeMax  0x3

; FLASHWINFO_FLAGS
#define FLASHW_ALL  0x3
#define FLASHW_CAPTION  0x1
#define FLASHW_STOP  0x0
#define FLASHW_TIMER  0x4
#define FLASHW_TIMERNOFG  0xc
#define FLASHW_TRAY  0x2

; FlushIntention
#define FlushIntentionFlush  0x0
#define FlushIntentionSync  0x1

; FOLD_STRING_MAP_FLAGS
#define MAP_COMPOSITE  0x40
#define MAP_EXPAND_LIGATURES  0x2000
#define MAP_FOLDCZONE  0x10
#define MAP_FOLDDIGITS  0x80
#define MAP_PRECOMPOSED  0x20

; FONT_CHARSET
#define ANSI_CHARSET  0x0
#define DEFAULT_CHARSET  0x1
#define SYMBOL_CHARSET  0x2
#define SHIFTJIS_CHARSET  0x80
#define HANGEUL_CHARSET  0x81
#define HANGUL_CHARSET  0x81
#define GB2312_CHARSET  0x86
#define CHINESEBIG5_CHARSET  0x88
#define OEM_CHARSET  0xff
#define JOHAB_CHARSET  0x82
#define HEBREW_CHARSET  0xb1
#define ARABIC_CHARSET  0xb2
#define GREEK_CHARSET  0xa1
#define TURKISH_CHARSET  0xa2
#define VIETNAMESE_CHARSET  0xa3
#define THAI_CHARSET  0xde
#define EASTEUROPE_CHARSET  0xee
#define RUSSIAN_CHARSET  0xcc
#define MAC_CHARSET  0x4d
#define BALTIC_CHARSET  0xba

; FONT_CLIP_PRECISION
#define CLIP_DEFAULT_PRECIS  0x0
#define CLIP_CHARACTER_PRECIS  0x1
#define CLIP_STROKE_PRECIS  0x2
#define CLIP_MASK  0xf
#define CLIP_LH_ANGLES  0x10
#define CLIP_TT_ALWAYS  0x20
#define CLIP_DFA_DISABLE  0x40
#define CLIP_EMBEDDED  0x80
#define CLIP_DFA_OVERRIDE  0x40

; FONT_OUTPUT_PRECISION
#define OUT_DEFAULT_PRECIS  0x0
#define OUT_STRING_PRECIS  0x1
#define OUT_CHARACTER_PRECIS  0x2
#define OUT_STROKE_PRECIS  0x3
#define OUT_TT_PRECIS  0x4
#define OUT_DEVICE_PRECIS  0x5
#define OUT_RASTER_PRECIS  0x6
#define OUT_TT_ONLY_PRECIS  0x7
#define OUT_OUTLINE_PRECIS  0x8
#define OUT_SCREEN_OUTLINE_PRECIS  0x9
#define OUT_PS_ONLY_PRECIS  0xa

; FONT_QUALITY
#define DEFAULT_QUALITY  0x0
#define DRAFT_QUALITY  0x1
#define PROOF_QUALITY  0x2
#define NONANTIALIASED_QUALITY  0x3
#define ANTIALIASED_QUALITY  0x4
#define CLEARTYPE_QUALITY  0x5

; FONT_RESOURCE_CHARACTERISTICS
#define FR_PRIVATE  0x10
#define FR_NOT_ENUM  0x20

; FOREGROUND_WINDOW_LOCK_CODE
#define LSFW_LOCK  0x1
#define LSFW_UNLOCK  0x2

; FORMAT_MESSAGE_OPTIONS
#define FORMAT_MESSAGE_ALLOCATE_BUFFER  0x100
#define FORMAT_MESSAGE_ARGUMENT_ARRAY  0x2000
#define FORMAT_MESSAGE_FROM_HMODULE  0x800
#define FORMAT_MESSAGE_FROM_STRING  0x400
#define FORMAT_MESSAGE_FROM_SYSTEM  0x1000
#define FORMAT_MESSAGE_IGNORE_INSERTS  0x200

; FTP_FLAGS
#define FTP_TRANSFER_TYPE_ASCII  0x1
#define FTP_TRANSFER_TYPE_BINARY  0x2
#define FTP_TRANSFER_TYPE_UNKNOWN  0x0
#define INTERNET_FLAG_TRANSFER_ASCII  0x1
#define INTERNET_FLAG_TRANSFER_BINARY  0x2

; FUNCFLAGS
#define FUNCFLAG_FRESTRICTED  0x1
#define FUNCFLAG_FSOURCE  0x2
#define FUNCFLAG_FBINDABLE  0x4
#define FUNCFLAG_FREQUESTEDIT  0x8
#define FUNCFLAG_FDISPLAYBIND  0x10
#define FUNCFLAG_FDEFAULTBIND  0x20
#define FUNCFLAG_FHIDDEN  0x40
#define FUNCFLAG_FUSESGETLASTERROR  0x80
#define FUNCFLAG_FDEFAULTCOLLELEM  0x100
#define FUNCFLAG_FUIDEFAULT  0x200
#define FUNCFLAG_FNONBROWSABLE  0x400
#define FUNCFLAG_FREPLACEABLE  0x800
#define FUNCFLAG_FIMMEDIATEBIND  0x1000

; FUNCKIND
#define FUNC_VIRTUAL  0x0
#define FUNC_PUREVIRTUAL  0x1
#define FUNC_NONVIRTUAL  0x2
#define FUNC_STATIC  0x3
#define FUNC_DISPATCH  0x4

; GDI_IMAGE_TYPE
#define IMAGE_BITMAP  0x0
#define IMAGE_CURSOR  0x2
#define IMAGE_ICON  0x1

; GDI_REGION_TYPE
#define RGN_ERROR  0x0
#define NULLREGION  0x1
#define SIMPLEREGION  0x2
#define COMPLEXREGION  0x3

; GENERIC_ACCESS_RIGHTS
#define GENERIC_READ  0x80000000
#define GENERIC_WRITE  0x40000000
#define GENERIC_EXECUTE  0x20000000
#define GENERIC_ALL  0x10000000

; GESTURE_TYPE
#define GT_PEN_TAP  0x0
#define GT_PEN_DOUBLETAP  0x1
#define GT_PEN_RIGHTTAP  0x2
#define GT_PEN_PRESSANDHOLD  0x3
#define GT_PEN_PRESSANDHOLDABORT  0x4
#define GT_TOUCH_TAP  0x5
#define GT_TOUCH_DOUBLETAP  0x6
#define GT_TOUCH_RIGHTTAP  0x7
#define GT_TOUCH_PRESSANDHOLD  0x8
#define GT_TOUCH_PRESSANDHOLDABORT  0x9
#define GT_TOUCH_PRESSANDTAP  0xa

; GESTURECONFIG_ID
#define GID_BEGIN  0x1
#define GID_END  0x2
#define GID_ZOOM  0x3
#define GID_PAN  0x4
#define GID_ROTATE  0x5
#define GID_TWOFINGERTAP  0x6
#define GID_PRESSANDTAP  0x7
#define GID_ROLLOVER  0x7

; GET_ADAPTERS_ADDRESSES_FLAGS
#define GAA_FLAG_SKIP_UNICAST  0x1
#define GAA_FLAG_SKIP_ANYCAST  0x2
#define GAA_FLAG_SKIP_MULTICAST  0x4
#define GAA_FLAG_SKIP_DNS_SERVER  0x8
#define GAA_FLAG_INCLUDE_PREFIX  0x10
#define GAA_FLAG_SKIP_FRIENDLY_NAME  0x20
#define GAA_FLAG_INCLUDE_WINS_INFO  0x40
#define GAA_FLAG_INCLUDE_GATEWAYS  0x80
#define GAA_FLAG_INCLUDE_ALL_INTERFACES  0x100
#define GAA_FLAG_INCLUDE_ALL_COMPARTMENTS  0x200
#define GAA_FLAG_INCLUDE_TUNNEL_BINDINGORDER  0x400

; GET_ANCESTOR_FLAGS
#define GA_PARENT  0x1
#define GA_ROOT  0x2
#define GA_ROOTOWNER  0x3

; GET_CHARACTER_PLACEMENT_FLAGS
#define GCP_CLASSIN  0x80000
#define GCP_DIACRITIC  0x100
#define GCP_DISPLAYZWG  0x400000
#define GCP_GLYPHSHAPE  0x10
#define GCP_JUSTIFY  0x10000
#define GCP_KASHIDA  0x400
#define GCP_LIGATE  0x20
#define GCP_MAXEXTENT  0x100000
#define GCP_NEUTRALOVERRIDE  0x2000000
#define GCP_NUMERICOVERRIDE  0x1000000
#define GCP_NUMERICSLATIN  0x4000000
#define GCP_NUMERICSLOCAL  0x8000000
#define GCP_REORDER  0x2
#define GCP_SYMSWAPOFF  0x800000
#define GCP_USEKERNING  0x8

; GET_CLASS_LONG_INDEX
#define GCW_ATOM  -32
#define GCL_CBCLSEXTRA  -20
#define GCL_CBWNDEXTRA  -18
#define GCL_HBRBACKGROUND  -10
#define GCL_HCURSOR  -12
#define GCL_HICON  -14
#define GCL_HICONSM  -34
#define GCL_HMODULE  -16
#define GCL_MENUNAME  -8
#define GCL_STYLE  -26
#define GCL_WNDPROC  -24
#define GCLP_HBRBACKGROUND  -10
#define GCLP_HCURSOR  -12
#define GCLP_HICON  -14
#define GCLP_HICONSM  -34
#define GCLP_HMODULE  -16
#define GCLP_MENUNAME  -8
#define GCLP_WNDPROC  -24

; GET_CONVERSION_LIST_FLAG
#define GCL_CONVERSION  0x1
#define GCL_REVERSECONVERSION  0x2
#define GCL_REVERSE_LENGTH  0x3

; GET_DCX_FLAGS
#define DCX_WINDOW  0x1
#define DCX_CACHE  0x2
#define DCX_PARENTCLIP  0x20
#define DCX_CLIPSIBLINGS  0x10
#define DCX_CLIPCHILDREN  0x8
#define DCX_NORESETATTRS  0x4
#define DCX_LOCKWINDOWUPDATE  0x400
#define DCX_EXCLUDERGN  0x40
#define DCX_INTERSECTRGN  0x80
#define DCX_INTERSECTUPDATE  0x200
#define DCX_VALIDATE  0x200000

; GET_DEVICE_CAPS_INDEX
#define DRIVERVERSION  0x0
#define TECHNOLOGY  0x2
#define HORZSIZE  0x4
#define VERTSIZE  0x6
#define HORZRES  0x8
#define VERTRES  0xa
#define BITSPIXEL  0xc
#define PLANES  0xe
#define NUMBRUSHES  0x10
#define NUMPENS  0x12
#define NUMMARKERS  0x14
#define NUMFONTS  0x16
#define NUMCOLORS  0x18
#define PDEVICESIZE  0x1a
#define CURVECAPS  0x1c
#define LINECAPS  0x1e
#define POLYGONALCAPS  0x20
#define TEXTCAPS  0x22
#define CLIPCAPS  0x24
#define RASTERCAPS  0x26
#define ASPECTX  0x28
#define ASPECTY  0x2a
#define ASPECTXY  0x2c
#define LOGPIXELSX  0x58
#define LOGPIXELSY  0x5a
#define SIZEPALETTE  0x68
#define NUMRESERVED  0x6a
#define COLORRES  0x6c
#define PHYSICALWIDTH  0x6e
#define PHYSICALHEIGHT  0x6f
#define PHYSICALOFFSETX  0x70
#define PHYSICALOFFSETY  0x71
#define SCALINGFACTORX  0x72
#define SCALINGFACTORY  0x73
#define VREFRESH  0x74
#define DESKTOPVERTRES  0x75
#define DESKTOPHORZRES  0x76
#define BLTALIGNMENT  0x77
#define SHADEBLENDCAPS  0x78
#define COLORMGMTCAPS  0x79

; GET_FILE_VERSION_INFO_FLAGS
#define FILE_VER_GET_LOCALISED  0x1
#define FILE_VER_GET_NEUTRAL  0x2
#define FILE_VER_GET_PREFETCHED  0x4

; GET_FILEEX_INFO_LEVELS
#define GetFileExInfoStandard  0x0
#define GetFileExMaxInfoLevel  0x1

; GET_GLYPH_OUTLINE_FORMAT
#define GGO_BEZIER  0x3
#define GGO_BITMAP  0x1
#define GGO_GLYPH_INDEX  0x80
#define GGO_GRAY2_BITMAP  0x4
#define GGO_GRAY4_BITMAP  0x5
#define GGO_GRAY8_BITMAP  0x6
#define GGO_METRICS  0x0
#define GGO_NATIVE  0x2
#define GGO_UNHINTED  0x100

; GET_GUI_RESOURCES_FLAGS
#define GR_GDIOBJECTS  0x0
#define GR_GDIOBJECTS_PEAK  0x2
#define GR_USEROBJECTS  0x1
#define GR_USEROBJECTS_PEAK  0x4

; GET_GUIDE_LINE_TYPE
#define GGL_LEVEL  0x1
#define GGL_INDEX  0x2
#define GGL_STRING  0x3
#define GGL_PRIVATE  0x4

; GET_MENU_DEFAULT_ITEM_FLAGS
#define GMDI_GOINTOPOPUPS  0x2
#define GMDI_USEDISABLED  0x1

; GET_MOUSE_MOVE_POINTS_EX_RESOLUTION
#define GMMP_USE_DISPLAY_POINTS  0x1
#define GMMP_USE_HIGH_RESOLUTION_POINTS  0x2

; GET_STOCK_OBJECT_FLAGS
#define BLACK_BRUSH  0x4
#define DKGRAY_BRUSH  0x3
#define DC_BRUSH  0x12
#define GRAY_BRUSH  0x2
#define HOLLOW_BRUSH  0x5
#define LTGRAY_BRUSH  0x1
#define NULL_BRUSH  0x5
#define WHITE_BRUSH  0x0
#define BLACK_PEN  0x7
#define DC_PEN  0x13
#define NULL_PEN  0x8
#define WHITE_PEN  0x6
#define ANSI_FIXED_FONT  0xb
#define ANSI_VAR_FONT  0xc
#define DEVICE_DEFAULT_FONT  0xe
#define DEFAULT_GUI_FONT  0x11
#define OEM_FIXED_FONT  0xa
#define SYSTEM_FONT  0xd
#define SYSTEM_FIXED_FONT  0x10
#define DEFAULT_PALETTE  0xf

; GET_TAPE_DRIVE_PARAMETERS_OPERATION
#define GET_TAPE_DRIVE_INFORMATION  0x1
#define GET_TAPE_MEDIA_INFORMATION  0x0

; GET_THEME_BITMAP_FLAGS
#define GBF_DIRECT  0x1
#define GBF_COPY  0x2
#define GBF_VALIDBITS  0x3

; GET_WINDOW_CMD
#define GW_CHILD  0x5
#define GW_ENABLEDPOPUP  0x6
#define GW_HWNDFIRST  0x0
#define GW_HWNDLAST  0x1
#define GW_HWNDNEXT  0x2
#define GW_HWNDPREV  0x3
#define GW_OWNER  0x4

; GETFINALPATHNAMEBYHANDLE_FLAGS
#define VOLUME_NAME_DOS  0x0
#define VOLUME_NAME_GUID  0x1
#define VOLUME_NAME_NT  0x2
#define VOLUME_NAME_NONE  0x4
#define FILE_NAME_NORMALIZED  0x0
#define FILE_NAME_OPENED  0x8

; GETPROPERTYSTOREFLAGS
#define GPS_DEFAULT  0x0
#define GPS_HANDLERPROPERTIESONLY  0x1
#define GPS_READWRITE  0x2
#define GPS_TEMPORARY  0x4
#define GPS_FASTPROPERTIESONLY  0x8
#define GPS_OPENSLOWITEM  0x10
#define GPS_DELAYCREATION  0x20
#define GPS_BESTEFFORT  0x40
#define GPS_NO_OPLOCK  0x80
#define GPS_PREFERQUERYPROPERTIES  0x100
#define GPS_EXTRINSICPROPERTIES  0x200
#define GPS_EXTRINSICPROPERTIESONLY  0x400
#define GPS_VOLATILEPROPERTIES  0x800
#define GPS_VOLATILEPROPERTIESONLY  0x1000
#define GPS_MASK_VALID  0x1fff

; GLOBAL_ALLOC_FLAGS
#define GHND  0x42
#define GMEM_FIXED  0x0
#define GMEM_MOVEABLE  0x2
#define GMEM_ZEROINIT  0x40
#define GPTR  0x40

; GLOBAL_FILTER
#define GF_FRAGMENTS  0x2
#define GF_STRONGHOST  0x8
#define GF_FRAGCACHE  0x9

; GOPHER_TYPE
#define GOPHER_TYPE_ASK  0x40000000
#define GOPHER_TYPE_BINARY  0x200
#define GOPHER_TYPE_BITMAP  0x4000
#define GOPHER_TYPE_CALENDAR  0x80000
#define GOPHER_TYPE_CSO  0x4
#define GOPHER_TYPE_DIRECTORY  0x2
#define GOPHER_TYPE_DOS_ARCHIVE  0x20
#define GOPHER_TYPE_ERROR  0x8
#define GOPHER_TYPE_GIF  0x1000
#define GOPHER_TYPE_GOPHER_PLUS  0x80000000
#define GOPHER_TYPE_HTML  0x20000
#define GOPHER_TYPE_IMAGE  0x2000
#define GOPHER_TYPE_INDEX_SERVER  0x80
#define GOPHER_TYPE_INLINE  0x100000
#define GOPHER_TYPE_MAC_BINHEX  0x10
#define GOPHER_TYPE_MOVIE  0x8000
#define GOPHER_TYPE_PDF  0x40000
#define GOPHER_TYPE_REDUNDANT  0x400
#define GOPHER_TYPE_SOUND  0x10000
#define GOPHER_TYPE_TELNET  0x100
#define GOPHER_TYPE_TEXT_FILE  0x1
#define GOPHER_TYPE_TN3270  0x800
#define GOPHER_TYPE_UNIX_UUENCODED  0x40
#define GOPHER_TYPE_UNKNOWN  0x20000000

; GPFIDL_FLAGS
#define GPFIDL_DEFAULT  0x0
#define GPFIDL_ALTNAME  0x1
#define GPFIDL_UNCPRINTER  0x2

; GPO_LINK
#define GPLinkUnknown  0x0
#define GPLinkMachine  0x1
#define GPLinkSite  0x2
#define GPLinkDomain  0x3
#define GPLinkOrganizationalUnit  0x4

; GpTestControlEnum
#define TestControlForceBilinear  0x0
#define TestControlNoICM  0x1
#define TestControlGetBuildNumber  0x2

; GRADIENT_FILL
#define GRADIENT_FILL_RECT_H  0x0
#define GRADIENT_FILL_RECT_V  0x1
#define GRADIENT_FILL_TRIANGLE  0x2

; GRAPHICS_MODE
#define GM_COMPATIBLE  0x1
#define GM_ADVANCED  0x2

; GUITHREADINFO_FLAGS
#define GUI_CARETBLINKING  0x1
#define GUI_INMENUMODE  0x4
#define GUI_INMOVESIZE  0x2
#define GUI_POPUPMENUMODE  0x10
#define GUI_SYSTEMMENUMODE  0x8

; HANDLE_FLAGS
#define HANDLE_FLAG_INHERIT  0x1
#define HANDLE_FLAG_PROTECT_FROM_CLOSE  0x2

; HARDWARE_COUNTER_TYPE
#define PMCCounter  0x0
#define MaxHardwareCounterType  0x1

; HATCH_BRUSH_STYLE
#define HS_BDIAGONAL  0x3
#define HS_CROSS  0x4
#define HS_DIAGCROSS  0x5
#define HS_FDIAGONAL  0x2
#define HS_HORIZONTAL  0x0
#define HS_VERTICAL  0x1

; HatchStyle
#define HatchStyleHorizontal  0x0
#define HatchStyleVertical  0x1
#define HatchStyleForwardDiagonal  0x2
#define HatchStyleBackwardDiagonal  0x3
#define HatchStyleCross  0x4
#define HatchStyleDiagonalCross  0x5
#define HatchStyle05Percent  0x6
#define HatchStyle10Percent  0x7
#define HatchStyle20Percent  0x8
#define HatchStyle25Percent  0x9
#define HatchStyle30Percent  0xa
#define HatchStyle40Percent  0xb
#define HatchStyle50Percent  0xc
#define HatchStyle60Percent  0xd
#define HatchStyle70Percent  0xe
#define HatchStyle75Percent  0xf
#define HatchStyle80Percent  0x10
#define HatchStyle90Percent  0x11
#define HatchStyleLightDownwardDiagonal  0x12
#define HatchStyleLightUpwardDiagonal  0x13
#define HatchStyleDarkDownwardDiagonal  0x14
#define HatchStyleDarkUpwardDiagonal  0x15
#define HatchStyleWideDownwardDiagonal  0x16
#define HatchStyleWideUpwardDiagonal  0x17
#define HatchStyleLightVertical  0x18
#define HatchStyleLightHorizontal  0x19
#define HatchStyleNarrowVertical  0x1a
#define HatchStyleNarrowHorizontal  0x1b
#define HatchStyleDarkVertical  0x1c
#define HatchStyleDarkHorizontal  0x1d
#define HatchStyleDashedDownwardDiagonal  0x1e
#define HatchStyleDashedUpwardDiagonal  0x1f
#define HatchStyleDashedHorizontal  0x20
#define HatchStyleDashedVertical  0x21
#define HatchStyleSmallConfetti  0x22
#define HatchStyleLargeConfetti  0x23
#define HatchStyleZigZag  0x24
#define HatchStyleWave  0x25
#define HatchStyleDiagonalBrick  0x26
#define HatchStyleHorizontalBrick  0x27
#define HatchStyleWeave  0x28
#define HatchStylePlaid  0x29
#define HatchStyleDivot  0x2a
#define HatchStyleDottedGrid  0x2b
#define HatchStyleDottedDiamond  0x2c
#define HatchStyleShingle  0x2d
#define HatchStyleTrellis  0x2e
#define HatchStyleSphere  0x2f
#define HatchStyleSmallGrid  0x30
#define HatchStyleSmallCheckerBoard  0x31
#define HatchStyleLargeCheckerBoard  0x32
#define HatchStyleOutlinedDiamond  0x33
#define HatchStyleSolidDiamond  0x34
#define HatchStyleTotal  0x35
#define HatchStyleLargeGrid  0x4
#define HatchStyleMin  0x0
#define HatchStyleMax  0x34

; HDC_MAP_MODE
#define MM_ANISOTROPIC  0x8
#define MM_HIENGLISH  0x5
#define MM_HIMETRIC  0x3
#define MM_ISOTROPIC  0x7
#define MM_LOENGLISH  0x4
#define MM_LOMETRIC  0x2
#define MM_TEXT  0x1
#define MM_TWIPS  0x6

; HEAP_FLAGS
#define HEAP_NONE  0x0
#define HEAP_NO_SERIALIZE  0x1
#define HEAP_GROWABLE  0x2
#define HEAP_GENERATE_EXCEPTIONS  0x4
#define HEAP_ZERO_MEMORY  0x8
#define HEAP_REALLOC_IN_PLACE_ONLY  0x10
#define HEAP_TAIL_CHECKING_ENABLED  0x20
#define HEAP_FREE_CHECKING_ENABLED  0x40
#define HEAP_DISABLE_COALESCE_ON_FREE  0x80
#define HEAP_CREATE_ALIGN_16  0x10000
#define HEAP_CREATE_ENABLE_TRACING  0x20000
#define HEAP_CREATE_ENABLE_EXECUTE  0x40000
#define HEAP_MAXIMUM_TAG  0xfff
#define HEAP_PSEUDO_TAG_FLAG  0x8000
#define HEAP_TAG_SHIFT  0x12
#define HEAP_CREATE_SEGMENT_HEAP  0x100
#define HEAP_CREATE_HARDENED  0x200

; HEAP_INFORMATION_CLASS
#define HeapCompatibilityInformation  0x0
#define HeapEnableTerminationOnCorruption  0x1
#define HeapOptimizeResources  0x3
#define HeapTag  0x7

; HEAPENTRY32_FLAGS
#define LF32_FIXED  0x1
#define LF32_FREE  0x2
#define LF32_MOVEABLE  0x4

; HELP_INFO_TYPE
#define HELPINFO_WINDOW  0x1
#define HELPINFO_MENUITEM  0x2

; HistogramFormat
#define HistogramFormatARGB  0x0
#define HistogramFormatPARGB  0x1
#define HistogramFormatRGB  0x2
#define HistogramFormatGray  0x3
#define HistogramFormatB  0x4
#define HistogramFormatG  0x5
#define HistogramFormatR  0x6
#define HistogramFormatA  0x7

; HIT_TEST_BACKGROUND_OPTIONS
#define HTTB_BACKGROUNDSEG  0x0
#define HTTB_FIXEDBORDER  0x2
#define HTTB_CAPTION  0x4
#define HTTB_RESIZINGBORDER_LEFT  0x10
#define HTTB_RESIZINGBORDER_TOP  0x20
#define HTTB_RESIZINGBORDER_RIGHT  0x40
#define HTTB_RESIZINGBORDER_BOTTOM  0x80
#define HTTB_RESIZINGBORDER  0xf0
#define HTTB_SIZINGTEMPLATE  0x100
#define HTTB_SYSTEMSIZINGMARGINS  0x200

; HOT_KEY_MODIFIERS
#define MOD_ALT  0x1
#define MOD_CONTROL  0x2
#define MOD_NOREPEAT  0x4000
#define MOD_SHIFT  0x4
#define MOD_WIN  0x8

; HTTP_ADDREQ_FLAG
#define HTTP_ADDREQ_FLAG_ADD  0x20000000
#define HTTP_ADDREQ_FLAG_ADD_IF_NEW  0x10000000
#define HTTP_ADDREQ_FLAG_COALESCE  0x40000000
#define HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA  0x40000000
#define HTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON  0x1000000
#define HTTP_ADDREQ_FLAG_REPLACE  0x80000000

; HTTP_CACHE_POLICY_TYPE
#define HttpCachePolicyNocache  0x0
#define HttpCachePolicyUserInvalidates  0x1
#define HttpCachePolicyTimeToLive  0x2
#define HttpCachePolicyMaximum  0x3

; HTTP_DATA_CHUNK_TYPE
#define HttpDataChunkFromMemory  0x0
#define HttpDataChunkFromFileHandle  0x1
#define HttpDataChunkFromFragmentCache  0x2
#define HttpDataChunkFromFragmentCacheEx  0x3
#define HttpDataChunkTrailers  0x4
#define HttpDataChunkMaximum  0x5

; HTTP_DELEGATE_REQUEST_PROPERTY_ID
#define DelegateRequestReservedProperty  0x0
#define DelegateRequestDelegateUrlProperty  0x1

; HTTP_FEATURE_ID
#define HttpFeatureUnknown  0x0
#define HttpFeatureResponseTrailers  0x1
#define HttpFeatureApiTimings  0x2
#define HttpFeatureDelegateEx  0x3
#define HttpFeatureHttp3  0x4
#define HttpFeatureLast  0x5
#define HttpFeaturemax  -1

; HTTP_INITIALIZE
#define HTTP_INITIALIZE_CONFIG  0x2
#define HTTP_INITIALIZE_SERVER  0x1

; HTTP_LOG_DATA_TYPE
#define HttpLogDataTypeFields  0x0

; HTTP_PUSH_WAIT_TYPE
#define HttpPushWaitEnableComplete  0x0
#define HttpPushWaitReceiveComplete  0x1
#define HttpPushWaitSendComplete  0x2

; HTTP_RECEIVE_HTTP_REQUEST_FLAGS
#define HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY  0x1
#define HTTP_RECEIVE_REQUEST_FLAG_FLUSH_BODY  0x2

; HTTP_REQUEST_INFO_TYPE
#define HttpRequestInfoTypeAuth  0x0
#define HttpRequestInfoTypeChannelBind  0x1
#define HttpRequestInfoTypeSslProtocol  0x2
#define HttpRequestInfoTypeSslTokenBindingDraft  0x3
#define HttpRequestInfoTypeSslTokenBinding  0x4
#define HttpRequestInfoTypeRequestTiming  0x5
#define HttpRequestInfoTypeTcpInfoV0  0x6
#define HttpRequestInfoTypeRequestSizing  0x7
#define HttpRequestInfoTypeQuicStats  0x8
#define HttpRequestInfoTypeTcpInfoV1  0x9

; HTTP_RESPONSE_INFO_TYPE
#define HttpResponseInfoTypeMultipleKnownHeaders  0x0
#define HttpResponseInfoTypeAuthenticationProperty  0x1
#define HttpResponseInfoTypeQoSProperty  0x2
#define HttpResponseInfoTypeChannelBind  0x3

; HTTP_SERVER_PROPERTY
#define HttpServerAuthenticationProperty  0x0
#define HttpServerLoggingProperty  0x1
#define HttpServerQosProperty  0x2
#define HttpServerTimeoutsProperty  0x3
#define HttpServerQueueLengthProperty  0x4
#define HttpServerStateProperty  0x5
#define HttpServer503VerbosityProperty  0x6
#define HttpServerBindingProperty  0x7
#define HttpServerExtendedAuthenticationProperty  0x8
#define HttpServerListenEndpointProperty  0x9
#define HttpServerChannelBindProperty  0xa
#define HttpServerProtectionLevelProperty  0xb
#define HttpServerDelegationProperty  0x10

; HTTP_SERVICE_CONFIG_ID
#define HttpServiceConfigIPListenList  0x0
#define HttpServiceConfigSSLCertInfo  0x1
#define HttpServiceConfigUrlAclInfo  0x2
#define HttpServiceConfigTimeout  0x3
#define HttpServiceConfigCache  0x4
#define HttpServiceConfigSslSniCertInfo  0x5
#define HttpServiceConfigSslCcsCertInfo  0x6
#define HttpServiceConfigSetting  0x7
#define HttpServiceConfigSslCertInfoEx  0x8
#define HttpServiceConfigSslSniCertInfoEx  0x9
#define HttpServiceConfigSslCcsCertInfoEx  0xa
#define HttpServiceConfigSslScopedCcsCertInfo  0xb
#define HttpServiceConfigSslScopedCcsCertInfoEx  0xc
#define HttpServiceConfigMax  0xd

; HTTP_VERB
#define HttpVerbUnparsed  0x0
#define HttpVerbUnknown  0x1
#define HttpVerbInvalid  0x2
#define HttpVerbOPTIONS  0x3
#define HttpVerbGET  0x4
#define HttpVerbHEAD  0x5
#define HttpVerbPOST  0x6
#define HttpVerbPUT  0x7
#define HttpVerbDELETE  0x8
#define HttpVerbTRACE  0x9
#define HttpVerbCONNECT  0xa
#define HttpVerbTRACK  0xb
#define HttpVerbMOVE  0xc
#define HttpVerbCOPY  0xd
#define HttpVerbPROPFIND  0xe
#define HttpVerbPROPPATCH  0xf
#define HttpVerbMKCOL  0x10
#define HttpVerbLOCK  0x11
#define HttpVerbUNLOCK  0x12
#define HttpVerbSEARCH  0x13
#define HttpVerbMaximum  0x14

; HTTP_WEB_SOCKET_BUFFER_TYPE
#define HTTP_WEB_SOCKET_BINARY_MESSAGE_TYPE  0x0
#define HTTP_WEB_SOCKET_BINARY_FRAGMENT_TYPE  0x1
#define HTTP_WEB_SOCKET_UTF8_MESSAGE_TYPE  0x2
#define HTTP_WEB_SOCKET_UTF8_FRAGMENT_TYPE  0x3
#define HTTP_WEB_SOCKET_CLOSE_TYPE  0x4
#define HTTP_WEB_SOCKET_PING_TYPE  0x5

; ICM_COMMAND
#define ICM_ADDPROFILE  0x1
#define ICM_DELETEPROFILE  0x2
#define ICM_QUERYPROFILE  0x3
#define ICM_SETDEFAULTPROFILE  0x4
#define ICM_REGISTERICMATCHER  0x5
#define ICM_UNREGISTERICMATCHER  0x6
#define ICM_QUERYMATCH  0x7

; ICM_MODE
#define ICM_OFF  0x1
#define ICM_ON  0x2
#define ICM_QUERY  0x3
#define ICM_DONE_OUTSIDEDC  0x4

; IDLFLAGS
#define IDLFLAG_NONE  0x0
#define IDLFLAG_FIN  0x1
#define IDLFLAG_FOUT  0x2
#define IDLFLAG_FLCID  0x4
#define IDLFLAG_FRETVAL  0x8

; IEObjectType
#define IE_EPM_OBJECT_EVENT  0x0
#define IE_EPM_OBJECT_MUTEX  0x1
#define IE_EPM_OBJECT_SEMAPHORE  0x2
#define IE_EPM_OBJECT_SHARED_MEMORY  0x3
#define IE_EPM_OBJECT_WAITABLE_TIMER  0x4
#define IE_EPM_OBJECT_FILE  0x5
#define IE_EPM_OBJECT_NAMED_PIPE  0x6
#define IE_EPM_OBJECT_REGISTRY  0x7

; IF_OPER_STATUS
#define IfOperStatusUp  0x1
#define IfOperStatusDown  0x2
#define IfOperStatusTesting  0x3
#define IfOperStatusUnknown  0x4
#define IfOperStatusDormant  0x5
#define IfOperStatusNotPresent  0x6
#define IfOperStatusLowerLayerDown  0x7

; IMAGE_DIRECTORY_ENTRY
#define IMAGE_DIRECTORY_ENTRY_ARCHITECTURE  0x7
#define IMAGE_DIRECTORY_ENTRY_BASERELOC  0x5
#define IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT  0xb
#define IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR  0xe
#define IMAGE_DIRECTORY_ENTRY_DEBUG  0x6
#define IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT  0xd
#define IMAGE_DIRECTORY_ENTRY_EXCEPTION  0x3
#define IMAGE_DIRECTORY_ENTRY_EXPORT  0x0
#define IMAGE_DIRECTORY_ENTRY_GLOBALPTR  0x8
#define IMAGE_DIRECTORY_ENTRY_IAT  0xc
#define IMAGE_DIRECTORY_ENTRY_IMPORT  0x1
#define IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG  0xa
#define IMAGE_DIRECTORY_ENTRY_RESOURCE  0x2
#define IMAGE_DIRECTORY_ENTRY_SECURITY  0x4
#define IMAGE_DIRECTORY_ENTRY_TLS  0x9

; IMAGE_FLAGS
#define LR_CREATEDIBSECTION  0x2000
#define LR_DEFAULTCOLOR  0x0
#define LR_DEFAULTSIZE  0x40
#define LR_LOADFROMFILE  0x10
#define LR_LOADMAP3DCOLORS  0x1000
#define LR_LOADTRANSPARENT  0x20
#define LR_MONOCHROME  0x1
#define LR_SHARED  0x8000
#define LR_VGACOLOR  0x80
#define LR_COPYDELETEORG  0x8
#define LR_COPYFROMRESOURCE  0x4000
#define LR_COPYRETURNORG  0x4

; IMAGE_LIST_COPY_FLAGS
#define ILCF_MOVE  0x0
#define ILCF_SWAP  0x1

; IMAGE_LIST_DRAW_STYLE
#define ILD_NORMAL  0x0
#define ILD_TRANSPARENT  0x1
#define ILD_BLEND25  0x2
#define ILD_FOCUS  0x2
#define ILD_BLEND50  0x4
#define ILD_SELECTED  0x4
#define ILD_BLEND  0x4
#define ILD_MASK  0x10
#define ILD_IMAGE  0x20
#define ILD_ROP  0x40
#define ILD_OVERLAYMASK  0xf00
#define ILD_PRESERVEALPHA  0x1000
#define ILD_SCALE  0x2000
#define ILD_DPISCALE  0x4000
#define ILD_ASYNC  0x8000

; IMAGE_SECTION_CHARACTERISTICS
#define IMAGE_SCN_TYPE_NO_PAD  0x8
#define IMAGE_SCN_CNT_CODE  0x20
#define IMAGE_SCN_CNT_INITIALIZED_DATA  0x40
#define IMAGE_SCN_CNT_UNINITIALIZED_DATA  0x80
#define IMAGE_SCN_LNK_OTHER  0x100
#define IMAGE_SCN_LNK_INFO  0x200
#define IMAGE_SCN_LNK_REMOVE  0x800
#define IMAGE_SCN_LNK_COMDAT  0x1000
#define IMAGE_SCN_NO_DEFER_SPEC_EXC  0x4000
#define IMAGE_SCN_GPREL  0x8000
#define IMAGE_SCN_MEM_FARDATA  0x8000
#define IMAGE_SCN_MEM_PURGEABLE  0x20000
#define IMAGE_SCN_MEM_16BIT  0x20000
#define IMAGE_SCN_MEM_LOCKED  0x40000
#define IMAGE_SCN_MEM_PRELOAD  0x80000
#define IMAGE_SCN_ALIGN_1BYTES  0x100000
#define IMAGE_SCN_ALIGN_2BYTES  0x200000
#define IMAGE_SCN_ALIGN_4BYTES  0x300000
#define IMAGE_SCN_ALIGN_8BYTES  0x400000
#define IMAGE_SCN_ALIGN_16BYTES  0x500000
#define IMAGE_SCN_ALIGN_32BYTES  0x600000
#define IMAGE_SCN_ALIGN_64BYTES  0x700000
#define IMAGE_SCN_ALIGN_128BYTES  0x800000
#define IMAGE_SCN_ALIGN_256BYTES  0x900000
#define IMAGE_SCN_ALIGN_512BYTES  0xa00000
#define IMAGE_SCN_ALIGN_1024BYTES  0xb00000
#define IMAGE_SCN_ALIGN_2048BYTES  0xc00000
#define IMAGE_SCN_ALIGN_4096BYTES  0xd00000
#define IMAGE_SCN_ALIGN_8192BYTES  0xe00000
#define IMAGE_SCN_ALIGN_MASK  0xf00000
#define IMAGE_SCN_LNK_NRELOC_OVFL  0x1000000
#define IMAGE_SCN_MEM_DISCARDABLE  0x2000000
#define IMAGE_SCN_MEM_NOT_CACHED  0x4000000
#define IMAGE_SCN_MEM_NOT_PAGED  0x8000000
#define IMAGE_SCN_MEM_SHARED  0x10000000
#define IMAGE_SCN_MEM_EXECUTE  0x20000000
#define IMAGE_SCN_MEM_READ  0x40000000
#define IMAGE_SCN_MEM_WRITE  0x80000000
#define IMAGE_SCN_SCALE_INDEX  0x1

; IMAGEHLP_EXTENDED_OPTIONS
#define SYMOPT_EX_DISABLEACCESSTIMEUPDATE  0x0
#define SYMOPT_EX_LASTVALIDDEBUGDIRECTORY  0x1
#define SYMOPT_EX_NOIMPLICITPATTERNSEARCH  0x2
#define SYMOPT_EX_NEVERLOADSYMBOLS  0x3
#define SYMOPT_EX_MAX  0x4

; IMAGEHLP_GET_TYPE_INFO_FLAGS
#define IMAGEHLP_GET_TYPE_INFO_CHILDREN  0x2
#define IMAGEHLP_GET_TYPE_INFO_UNCACHED  0x1

; IMAGEHLP_HD_TYPE
#define hdBase  0x0
#define hdSym  0x1
#define hdSrc  0x2
#define hdMax  0x3

; IMAGEHLP_SF_TYPE
#define sfImage  0x0
#define sfDbg  0x1
#define sfPdb  0x2
#define sfMpd  0x3
#define sfMax  0x4

; IMAGEHLP_SYMBOL_TYPE_INFO
#define TI_GET_SYMTAG  0x0
#define TI_GET_SYMNAME  0x1
#define TI_GET_LENGTH  0x2
#define TI_GET_TYPE  0x3
#define TI_GET_TYPEID  0x4
#define TI_GET_BASETYPE  0x5
#define TI_GET_ARRAYINDEXTYPEID  0x6
#define TI_FINDCHILDREN  0x7
#define TI_GET_DATAKIND  0x8
#define TI_GET_ADDRESSOFFSET  0x9
#define TI_GET_OFFSET  0xa
#define TI_GET_VALUE  0xb
#define TI_GET_COUNT  0xc
#define TI_GET_CHILDRENCOUNT  0xd
#define TI_GET_BITPOSITION  0xe
#define TI_GET_VIRTUALBASECLASS  0xf
#define TI_GET_VIRTUALTABLESHAPEID  0x10
#define TI_GET_VIRTUALBASEPOINTEROFFSET  0x11
#define TI_GET_CLASSPARENTID  0x12
#define TI_GET_NESTED  0x13
#define TI_GET_SYMINDEX  0x14
#define TI_GET_LEXICALPARENT  0x15
#define TI_GET_ADDRESS  0x16
#define TI_GET_THISADJUST  0x17
#define TI_GET_UDTKIND  0x18
#define TI_IS_EQUIV_TO  0x19
#define TI_GET_CALLING_CONVENTION  0x1a
#define TI_IS_CLOSE_EQUIV_TO  0x1b
#define TI_GTIEX_REQS_VALID  0x1c
#define TI_GET_VIRTUALBASEOFFSET  0x1d
#define TI_GET_VIRTUALBASEDISPINDEX  0x1e
#define TI_GET_IS_REFERENCE  0x1f
#define TI_GET_INDIRECTVIRTUALBASECLASS  0x20
#define TI_GET_VIRTUALBASETABLETYPE  0x21
#define TI_GET_OBJECTPOINTERTYPE  0x22
#define IMAGEHLP_SYMBOL_TYPE_INFO_MAX  0x23

; IMAGELIST_CREATION_FLAGS
#define ILC_MASK  0x1
#define ILC_COLOR  0x0
#define ILC_COLORDDB  0xfe
#define ILC_COLOR4  0x4
#define ILC_COLOR8  0x8
#define ILC_COLOR16  0x10
#define ILC_COLOR24  0x18
#define ILC_COLOR32  0x20
#define ILC_PALETTE  0x800
#define ILC_MIRROR  0x2000
#define ILC_PERITEMMIRROR  0x8000
#define ILC_ORIGINALSIZE  0x10000
#define ILC_HIGHQUALITYSCALE  0x20000

; ImageType
#define ImageTypeUnknown  0x0
#define ImageTypeBitmap  0x1
#define ImageTypeMetafile  0x2

; IME_COMPOSITION_STRING
#define GCS_COMPREADSTR  0x1
#define GCS_COMPREADATTR  0x2
#define GCS_COMPREADCLAUSE  0x4
#define GCS_COMPSTR  0x8
#define GCS_COMPATTR  0x10
#define GCS_COMPCLAUSE  0x20
#define GCS_CURSORPOS  0x80
#define GCS_DELTASTART  0x100
#define GCS_RESULTREADSTR  0x200
#define GCS_RESULTREADCLAUSE  0x400
#define GCS_RESULTSTR  0x800
#define GCS_RESULTCLAUSE  0x1000

; IME_CONVERSION_MODE
#define IME_CMODE_ALPHANUMERIC  0x0
#define IME_CMODE_NATIVE  0x1
#define IME_CMODE_CHINESE  0x1
#define IME_CMODE_HANGUL  0x1
#define IME_CMODE_JAPANESE  0x1
#define IME_CMODE_KATAKANA  0x2
#define IME_CMODE_LANGUAGE  0x3
#define IME_CMODE_FULLSHAPE  0x8
#define IME_CMODE_ROMAN  0x10
#define IME_CMODE_CHARCODE  0x20
#define IME_CMODE_HANJACONVERT  0x40
#define IME_CMODE_NATIVESYMBOL  0x80
#define IME_CMODE_HANGEUL  0x1
#define IME_CMODE_SOFTKBD  0x80
#define IME_CMODE_NOCONVERSION  0x100
#define IME_CMODE_EUDC  0x200
#define IME_CMODE_SYMBOL  0x400
#define IME_CMODE_FIXED  0x800
#define IME_CMODE_RESERVED  0xf0000000

; IME_ESCAPE
#define IME_ESC_QUERY_SUPPORT  0x3
#define IME_ESC_RESERVED_FIRST  0x4
#define IME_ESC_RESERVED_LAST  0x7ff
#define IME_ESC_PRIVATE_FIRST  0x800
#define IME_ESC_PRIVATE_LAST  0xfff
#define IME_ESC_SEQUENCE_TO_INTERNAL  0x1001
#define IME_ESC_GET_EUDC_DICTIONARY  0x1003
#define IME_ESC_SET_EUDC_DICTIONARY  0x1004
#define IME_ESC_MAX_KEY  0x1005
#define IME_ESC_IME_NAME  0x1006
#define IME_ESC_SYNC_HOTKEY  0x1007
#define IME_ESC_HANJA_MODE  0x1008
#define IME_ESC_AUTOMATA  0x1009
#define IME_ESC_PRIVATE_HOTKEY  0x100a
#define IME_ESC_GETHELPFILENAME  0x100b

; IME_HOTKEY_IDENTIFIER
#define IME_CHOTKEY_IME_NONIME_TOGGLE  0x10
#define IME_CHOTKEY_SHAPE_TOGGLE  0x11
#define IME_CHOTKEY_SYMBOL_TOGGLE  0x12
#define IME_JHOTKEY_CLOSE_OPEN  0x30
#define IME_KHOTKEY_SHAPE_TOGGLE  0x50
#define IME_KHOTKEY_HANJACONVERT  0x51
#define IME_KHOTKEY_ENGLISH  0x52
#define IME_THOTKEY_IME_NONIME_TOGGLE  0x70
#define IME_THOTKEY_SHAPE_TOGGLE  0x71
#define IME_THOTKEY_SYMBOL_TOGGLE  0x72
#define IME_ITHOTKEY_RESEND_RESULTSTR  0x200
#define IME_ITHOTKEY_PREVIOUS_COMPOSITION  0x201
#define IME_ITHOTKEY_UISTYLE_TOGGLE  0x202
#define IME_ITHOTKEY_RECONVERTSTRING  0x203

; IME_SENTENCE_MODE
#define IME_SMODE_NONE  0x0
#define IME_SMODE_PLAURALCLAUSE  0x1
#define IME_SMODE_SINGLECONVERT  0x2
#define IME_SMODE_AUTOMATIC  0x4
#define IME_SMODE_PHRASEPREDICT  0x8
#define IME_SMODE_CONVERSATION  0x10
#define IME_SMODE_RESERVED  0xf000

; IMPLTYPEFLAGS
#define IMPLTYPEFLAG_FDEFAULT  0x1
#define IMPLTYPEFLAG_FSOURCE  0x2
#define IMPLTYPEFLAG_FRESTRICTED  0x4
#define IMPLTYPEFLAG_FDEFAULTVTABLE  0x8

; INITCOMMONCONTROLSEX_ICC
#define ICC_ANIMATE_CLASS  0x80
#define ICC_BAR_CLASSES  0x4
#define ICC_COOL_CLASSES  0x400
#define ICC_DATE_CLASSES  0x100
#define ICC_HOTKEY_CLASS  0x40
#define ICC_INTERNET_CLASSES  0x800
#define ICC_LINK_CLASS  0x8000
#define ICC_LISTVIEW_CLASSES  0x1
#define ICC_NATIVEFNTCTL_CLASS  0x2000
#define ICC_PAGESCROLLER_CLASS  0x1000
#define ICC_PROGRESS_CLASS  0x20
#define ICC_STANDARD_CLASSES  0x4000
#define ICC_TAB_CLASSES  0x8
#define ICC_TREEVIEW_CLASSES  0x2
#define ICC_UPDOWN_CLASS  0x10
#define ICC_USEREX_CLASSES  0x200
#define ICC_WIN95_CLASSES  0xff

; INPUT_MESSAGE_DEVICE_TYPE
#define IMDT_UNAVAILABLE  0x0
#define IMDT_KEYBOARD  0x1
#define IMDT_MOUSE  0x2
#define IMDT_TOUCH  0x4
#define IMDT_PEN  0x8
#define IMDT_TOUCHPAD  0x10

; INPUT_MESSAGE_ORIGIN_ID
#define IMO_UNAVAILABLE  0x0
#define IMO_HARDWARE  0x1
#define IMO_INJECTED  0x2
#define IMO_SYSTEM  0x4

; INPUT_TYPE
#define INPUT_MOUSE  0x0
#define INPUT_KEYBOARD  0x1
#define INPUT_HARDWARE  0x2

; INSTALLSPECTYPE
#define APPNAME  0x1
#define FILEEXT  0x2
#define PROGID  0x3
#define COMCLASS  0x4

; INTERNAL_IF_OPER_STATUS
#define IF_OPER_STATUS_NON_OPERATIONAL  0x0
#define IF_OPER_STATUS_UNREACHABLE  0x1
#define IF_OPER_STATUS_DISCONNECTED  0x2
#define IF_OPER_STATUS_CONNECTING  0x3
#define IF_OPER_STATUS_CONNECTED  0x4
#define IF_OPER_STATUS_OPERATIONAL  0x5

; INTERNET_AUTODIAL
#define INTERNET_AUTODIAL_FAILIFSECURITYCHECK  0x4
#define INTERNET_AUTODIAL_FORCE_ONLINE  0x1
#define INTERNET_AUTODIAL_FORCE_UNATTENDED  0x2
#define INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT  0x8

; INTERNET_CONNECTION
#define INTERNET_CONNECTION_CONFIGURED  0x40
#define INTERNET_CONNECTION_LAN  0x2
#define INTERNET_CONNECTION_MODEM  0x1
#define INTERNET_CONNECTION_MODEM_BUSY  0x8
#define INTERNET_CONNECTION_OFFLINE  0x20
#define INTERNET_CONNECTION_PROXY  0x4
#define INTERNET_RAS_INSTALLED  0x10

; INTERNET_COOKIE_FLAGS
#define INTERNET_COOKIE_HTTPONLY  0x2000
#define INTERNET_COOKIE_THIRD_PARTY  0x10
#define INTERNET_FLAG_RESTRICTED_ZONE  0x20000

; INTERNET_SCHEME
#define INTERNET_SCHEME_PARTIAL  -2
#define INTERNET_SCHEME_UNKNOWN  -1
#define INTERNET_SCHEME_DEFAULT  0x0
#define INTERNET_SCHEME_FTP  0x1
#define INTERNET_SCHEME_GOPHER  0x2
#define INTERNET_SCHEME_HTTP  0x3
#define INTERNET_SCHEME_HTTPS  0x4
#define INTERNET_SCHEME_FILE  0x5
#define INTERNET_SCHEME_NEWS  0x6
#define INTERNET_SCHEME_MAILTO  0x7
#define INTERNET_SCHEME_SOCKS  0x8
#define INTERNET_SCHEME_JAVASCRIPT  0x9
#define INTERNET_SCHEME_VBSCRIPT  0xa
#define INTERNET_SCHEME_RES  0xb
#define INTERNET_SCHEME_FIRST  0x1
#define INTERNET_SCHEME_LAST  0xb

; INTERNETFEATURELIST
#define FEATURE_OBJECT_CACHING  0x0
#define FEATURE_ZONE_ELEVATION  0x1
#define FEATURE_MIME_HANDLING  0x2
#define FEATURE_MIME_SNIFFING  0x3
#define FEATURE_WINDOW_RESTRICTIONS  0x4
#define FEATURE_WEBOC_POPUPMANAGEMENT  0x5
#define FEATURE_BEHAVIORS  0x6
#define FEATURE_DISABLE_MK_PROTOCOL  0x7
#define FEATURE_LOCALMACHINE_LOCKDOWN  0x8
#define FEATURE_SECURITYBAND  0x9
#define FEATURE_RESTRICT_ACTIVEXINSTALL  0xa
#define FEATURE_VALIDATE_NAVIGATE_URL  0xb
#define FEATURE_RESTRICT_FILEDOWNLOAD  0xc
#define FEATURE_ADDON_MANAGEMENT  0xd
#define FEATURE_PROTOCOL_LOCKDOWN  0xe
#define FEATURE_HTTP_USERNAME_PASSWORD_DISABLE  0xf
#define FEATURE_SAFE_BINDTOOBJECT  0x10
#define FEATURE_UNC_SAVEDFILECHECK  0x11
#define FEATURE_GET_URL_DOM_FILEPATH_UNENCODED  0x12
#define FEATURE_TABBED_BROWSING  0x13
#define FEATURE_SSLUX  0x14
#define FEATURE_DISABLE_NAVIGATION_SOUNDS  0x15
#define FEATURE_DISABLE_LEGACY_COMPRESSION  0x16
#define FEATURE_FORCE_ADDR_AND_STATUS  0x17
#define FEATURE_XMLHTTP  0x18
#define FEATURE_DISABLE_TELNET_PROTOCOL  0x19
#define FEATURE_FEEDS  0x1a
#define FEATURE_BLOCK_INPUT_PROMPTS  0x1b
#define FEATURE_ENTRY_COUNT  0x1c

; InterpolationMode
#define InterpolationModeInvalid  -1
#define InterpolationModeDefault  0x0
#define InterpolationModeLowQuality  0x1
#define InterpolationModeHighQuality  0x2
#define InterpolationModeBilinear  0x3
#define InterpolationModeBicubic  0x4
#define InterpolationModeNearestNeighbor  0x5
#define InterpolationModeHighQualityBilinear  0x6
#define InterpolationModeHighQualityBicubic  0x7

; INVOKEKIND
#define INVOKE_FUNC  0x1
#define INVOKE_PROPERTYGET  0x2
#define INVOKE_PROPERTYPUT  0x4
#define INVOKE_PROPERTYPUTREF  0x8

; IS_TEXT_UNICODE_RESULT
#define IS_TEXT_UNICODE_ASCII16  0x1
#define IS_TEXT_UNICODE_REVERSE_ASCII16  0x10
#define IS_TEXT_UNICODE_STATISTICS  0x2
#define IS_TEXT_UNICODE_REVERSE_STATISTICS  0x20
#define IS_TEXT_UNICODE_CONTROLS  0x4
#define IS_TEXT_UNICODE_REVERSE_CONTROLS  0x40
#define IS_TEXT_UNICODE_SIGNATURE  0x8
#define IS_TEXT_UNICODE_REVERSE_SIGNATURE  0x80
#define IS_TEXT_UNICODE_ILLEGAL_CHARS  0x100
#define IS_TEXT_UNICODE_ODD_LENGTH  0x200
#define IS_TEXT_UNICODE_NULL_BYTES  0x1000
#define IS_TEXT_UNICODE_UNICODE_MASK  0xf
#define IS_TEXT_UNICODE_REVERSE_MASK  0xf0
#define IS_TEXT_UNICODE_NOT_UNICODE_MASK  0xf00
#define IS_TEXT_UNICODE_NOT_ASCII_MASK  0xf000

; IS_VALID_LOCALE_FLAGS
#define LCID_INSTALLED  0x1
#define LCID_SUPPORTED  0x2

; JOB_OBJECT_IO_RATE_CONTROL_FLAGS
#define JOB_OBJECT_IO_RATE_CONTROL_ENABLE  0x1
#define JOB_OBJECT_IO_RATE_CONTROL_STANDALONE_VOLUME  0x2
#define JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ALL  0x4
#define JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ON_SOFT_CAP  0x8
#define JOB_OBJECT_IO_RATE_CONTROL_VALID_FLAGS  0xf

; JOBOBJECTINFOCLASS
#define JobObjectBasicAccountingInformation  0x1
#define JobObjectBasicLimitInformation  0x2
#define JobObjectBasicProcessIdList  0x3
#define JobObjectBasicUIRestrictions  0x4
#define JobObjectSecurityLimitInformation  0x5
#define JobObjectEndOfJobTimeInformation  0x6
#define JobObjectAssociateCompletionPortInformation  0x7
#define JobObjectBasicAndIoAccountingInformation  0x8
#define JobObjectExtendedLimitInformation  0x9
#define JobObjectJobSetInformation  0xa
#define JobObjectGroupInformation  0xb
#define JobObjectNotificationLimitInformation  0xc
#define JobObjectLimitViolationInformation  0xd
#define JobObjectGroupInformationEx  0xe
#define JobObjectCpuRateControlInformation  0xf
#define JobObjectCompletionFilter  0x10
#define JobObjectCompletionCounter  0x11
#define JobObjectReserved1Information  0x12
#define JobObjectReserved2Information  0x13
#define JobObjectReserved3Information  0x14
#define JobObjectReserved4Information  0x15
#define JobObjectReserved5Information  0x16
#define JobObjectReserved6Information  0x17
#define JobObjectReserved7Information  0x18
#define JobObjectReserved8Information  0x19
#define JobObjectReserved9Information  0x1a
#define JobObjectReserved10Information  0x1b
#define JobObjectReserved11Information  0x1c
#define JobObjectReserved12Information  0x1d
#define JobObjectReserved13Information  0x1e
#define JobObjectReserved14Information  0x1f
#define JobObjectNetRateControlInformation  0x20
#define JobObjectNotificationLimitInformation2  0x21
#define JobObjectLimitViolationInformation2  0x22
#define JobObjectCreateSilo  0x23
#define JobObjectSiloBasicInformation  0x24
#define JobObjectReserved15Information  0x25
#define JobObjectReserved16Information  0x26
#define JobObjectReserved17Information  0x27
#define JobObjectReserved18Information  0x28
#define JobObjectReserved19Information  0x29
#define JobObjectReserved20Information  0x2a
#define JobObjectReserved21Information  0x2b
#define JobObjectReserved22Information  0x2c
#define JobObjectReserved23Information  0x2d
#define JobObjectReserved24Information  0x2e
#define JobObjectReserved25Information  0x2f
#define JobObjectReserved26Information  0x30
#define JobObjectReserved27Information  0x31
#define MaxJobObjectInfoClass  0x32

; KEYBD_EVENT_FLAGS
#define KEYEVENTF_EXTENDEDKEY  0x1
#define KEYEVENTF_KEYUP  0x2
#define KEYEVENTF_SCANCODE  0x8
#define KEYEVENTF_UNICODE  0x4

; KNOWN_FOLDER_FLAG
#define KF_FLAG_DEFAULT  0x0
#define KF_FLAG_FORCE_APP_DATA_REDIRECTION  0x80000
#define KF_FLAG_RETURN_FILTER_REDIRECTION_TARGET  0x40000
#define KF_FLAG_FORCE_PACKAGE_REDIRECTION  0x20000
#define KF_FLAG_NO_PACKAGE_REDIRECTION  0x10000
#define KF_FLAG_FORCE_APPCONTAINER_REDIRECTION  0x20000
#define KF_FLAG_NO_APPCONTAINER_REDIRECTION  0x10000
#define KF_FLAG_CREATE  0x8000
#define KF_FLAG_DONT_VERIFY  0x4000
#define KF_FLAG_DONT_UNEXPAND  0x2000
#define KF_FLAG_NO_ALIAS  0x1000
#define KF_FLAG_INIT  0x800
#define KF_FLAG_DEFAULT_PATH  0x400
#define KF_FLAG_NOT_PARENT_RELATIVE  0x200
#define KF_FLAG_SIMPLE_IDLIST  0x100
#define KF_FLAG_ALIAS_ONLY  0x101

; LATENCY_TIME
#define LT_DONT_CARE  0x0
#define LT_LOWEST_LATENCY  0x1

; LAYERED_WINDOW_ATTRIBUTES_FLAGS
#define LWA_ALPHA  0x2
#define LWA_COLORKEY  0x1

; LCSCSTYPE
#define LCS_CALIBRATED_RGB  0x0
#define LCS_sRGB  0x73524742
#define LCS_WINDOWS_COLOR_SPACE  0x57696e20

; LIBRARYMANAGEDIALOGOPTIONS
#define LMD_DEFAULT  0x0
#define LMD_ALLOWUNINDEXABLENETWORKLOCATIONS  0x1

; LinearGradientMode
#define LinearGradientModeHorizontal  0x0
#define LinearGradientModeVertical  0x1
#define LinearGradientModeForwardDiagonal  0x2
#define LinearGradientModeBackwardDiagonal  0x3

; LineCap
#define LineCapFlat  0x0
#define LineCapSquare  0x1
#define LineCapRound  0x2
#define LineCapTriangle  0x3
#define LineCapNoAnchor  0x10
#define LineCapSquareAnchor  0x11
#define LineCapRoundAnchor  0x12
#define LineCapDiamondAnchor  0x13
#define LineCapArrowAnchor  0x14
#define LineCapCustom  0xff
#define LineCapAnchorMask  0xf0

; LineJoin
#define LineJoinMiter  0x0
#define LineJoinBevel  0x1
#define LineJoinRound  0x2
#define LineJoinMiterClipped  0x3

; LOAD_LIBRARY_FLAGS
#define DONT_RESOLVE_DLL_REFERENCES  0x1
#define LOAD_LIBRARY_AS_DATAFILE  0x2
#define LOAD_WITH_ALTERED_SEARCH_PATH  0x8
#define LOAD_IGNORE_CODE_AUTHZ_LEVEL  0x10
#define LOAD_LIBRARY_AS_IMAGE_RESOURCE  0x20
#define LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE  0x40
#define LOAD_LIBRARY_REQUIRE_SIGNED_TARGET  0x80
#define LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR  0x100
#define LOAD_LIBRARY_SEARCH_APPLICATION_DIR  0x200
#define LOAD_LIBRARY_SEARCH_USER_DIRS  0x400
#define LOAD_LIBRARY_SEARCH_SYSTEM32  0x800
#define LOAD_LIBRARY_SEARCH_DEFAULT_DIRS  0x1000
#define LOAD_LIBRARY_SAFE_CURRENT_DIRS  0x2000
#define LOAD_LIBRARY_SEARCH_SYSTEM32_NO_FORWARDER  0x4000

; LOAD_PICTURE_FLAGS
#define LP_DEFAULT  0x0
#define LP_MONOCHROME  0x1
#define LP_VGACOLOR  0x2
#define LP_COLOR  0x4

; LOCAL_ALLOC_FLAGS
#define LHND  0x42
#define LMEM_FIXED  0x0
#define LMEM_MOVEABLE  0x2
#define LMEM_ZEROINIT  0x40
#define LPTR  0x40
#define NONZEROLHND  0x2
#define NONZEROLPTR  0x0

; LOCK_FILE_FLAGS
#define LOCKFILE_EXCLUSIVE_LOCK  0x2
#define LOCKFILE_FAIL_IMMEDIATELY  0x1

; LOCKTYPE
#define LOCK_WRITE  0x1
#define LOCK_EXCLUSIVE  0x2
#define LOCK_ONLYONCE  0x4

; LOGICAL_PROCESSOR_RELATIONSHIP
#define RelationProcessorCore  0x0
#define RelationNumaNode  0x1
#define RelationCache  0x2
#define RelationProcessorPackage  0x3
#define RelationGroup  0x4
#define RelationProcessorDie  0x5
#define RelationNumaNodeEx  0x6
#define RelationProcessorModule  0x7
#define RelationAll  0xffff

; LOGON32_LOGON
#define LOGON32_LOGON_BATCH  0x4
#define LOGON32_LOGON_INTERACTIVE  0x2
#define LOGON32_LOGON_NETWORK  0x3
#define LOGON32_LOGON_NETWORK_CLEARTEXT  0x8
#define LOGON32_LOGON_NEW_CREDENTIALS  0x9
#define LOGON32_LOGON_SERVICE  0x5
#define LOGON32_LOGON_UNLOCK  0x7

; LOGON32_PROVIDER
#define LOGON32_PROVIDER_DEFAULT  0x0
#define LOGON32_PROVIDER_WINNT50  0x3
#define LOGON32_PROVIDER_WINNT40  0x2

; LPPROGRESS_ROUTINE_CALLBACK_REASON
#define CALLBACK_CHUNK_FINISHED  0x0
#define CALLBACK_STREAM_SWITCH  0x1

; LSA_AUTH_INFORMATION_AUTH_TYPE
#define TRUST_AUTH_TYPE_NONE  0x0
#define TRUST_AUTH_TYPE_NT4OWF  0x1
#define TRUST_AUTH_TYPE_CLEAR  0x2
#define TRUST_AUTH_TYPE_VERSION  0x3

; LSA_FOREST_TRUST_COLLISION_RECORD_TYPE
#define CollisionTdo  0x0
#define CollisionXref  0x1
#define CollisionOther  0x2

; LSA_FOREST_TRUST_RECORD_TYPE
#define ForestTrustTopLevelName  0x0
#define ForestTrustTopLevelNameEx  0x1
#define ForestTrustDomainInfo  0x2
#define ForestTrustBinaryInfo  0x3
#define ForestTrustScannerInfo  0x4
#define ForestTrustRecordTypeLast  0x4

; LZOPENFILE_STYLE
#define OF_CANCEL  0x800
#define OF_CREATE  0x1000
#define OF_DELETE  0x200
#define OF_EXIST  0x4000
#define OF_PARSE  0x100
#define OF_PROMPT  0x2000
#define OF_READ  0x0
#define OF_READWRITE  0x2
#define OF_REOPEN  0x8000
#define OF_SHARE_DENY_NONE  0x40
#define OF_SHARE_DENY_READ  0x30
#define OF_SHARE_DENY_WRITE  0x20
#define OF_SHARE_EXCLUSIVE  0x10
#define OF_WRITE  0x1
#define OF_SHARE_COMPAT  0x0
#define OF_VERIFY  0x400

; MAP_VIRTUAL_KEY_TYPE
#define MAPVK_VK_TO_VSC  0x0
#define MAPVK_VSC_TO_VK  0x1
#define MAPVK_VK_TO_CHAR  0x2
#define MAPVK_VSC_TO_VK_EX  0x3
#define MAPVK_VK_TO_VSC_EX  0x4

; MatrixOrder
#define MatrixOrderPrepend  0x0
#define MatrixOrderAppend  0x1

; MEMORY_RESOURCE_NOTIFICATION_TYPE
#define LowMemoryResourceNotification  0x0
#define HighMemoryResourceNotification  0x1

; MENU_ITEM_FLAGS
#define MF_BYCOMMAND  0x0
#define MF_BYPOSITION  0x400
#define MF_BITMAP  0x4
#define MF_CHECKED  0x8
#define MF_DISABLED  0x2
#define MF_ENABLED  0x0
#define MF_GRAYED  0x1
#define MF_MENUBARBREAK  0x20
#define MF_MENUBREAK  0x40
#define MF_OWNERDRAW  0x100
#define MF_POPUP  0x10
#define MF_SEPARATOR  0x800
#define MF_STRING  0x0
#define MF_UNCHECKED  0x0
#define MF_INSERT  0x0
#define MF_CHANGE  0x80
#define MF_APPEND  0x100
#define MF_DELETE  0x200
#define MF_REMOVE  0x1000
#define MF_USECHECKBITMAPS  0x200
#define MF_UNHILITE  0x0
#define MF_HILITE  0x80
#define MF_DEFAULT  0x1000
#define MF_SYSMENU  0x2000
#define MF_HELP  0x4000
#define MF_RIGHTJUSTIFY  0x4000
#define MF_MOUSESELECT  0x8000
#define MF_END  0x80

; MENU_ITEM_MASK
#define MIIM_BITMAP  0x80
#define MIIM_CHECKMARKS  0x8
#define MIIM_DATA  0x20
#define MIIM_FTYPE  0x100
#define MIIM_ID  0x2
#define MIIM_STATE  0x1
#define MIIM_STRING  0x40
#define MIIM_SUBMENU  0x4
#define MIIM_TYPE  0x10

; MENU_ITEM_STATE
#define MFS_GRAYED  0x3
#define MFS_DISABLED  0x3
#define MFS_CHECKED  0x8
#define MFS_HILITE  0x80
#define MFS_ENABLED  0x0
#define MFS_UNCHECKED  0x0
#define MFS_UNHILITE  0x0
#define MFS_DEFAULT  0x1000

; MENU_ITEM_TYPE
#define MFT_BITMAP  0x4
#define MFT_MENUBARBREAK  0x20
#define MFT_MENUBREAK  0x40
#define MFT_OWNERDRAW  0x100
#define MFT_RADIOCHECK  0x200
#define MFT_RIGHTJUSTIFY  0x4000
#define MFT_RIGHTORDER  0x2000
#define MFT_SEPARATOR  0x800
#define MFT_STRING  0x0

; MENUINFO_MASK
#define MIM_APPLYTOSUBMENUS  0x80000000
#define MIM_BACKGROUND  0x2
#define MIM_HELPID  0x4
#define MIM_MAXHEIGHT  0x1
#define MIM_MENUDATA  0x8
#define MIM_STYLE  0x10

; MENUINFO_STYLE
#define MNS_AUTODISMISS  0x10000000
#define MNS_CHECKORBMP  0x4000000
#define MNS_DRAGDROP  0x20000000
#define MNS_MODELESS  0x40000000
#define MNS_NOCHECK  0x80000000
#define MNS_NOTIFYBYPOS  0x8000000

; MESSAGEBOX_RESULT
#define IDOK  0x1
#define IDCANCEL  0x2
#define IDABORT  0x3
#define IDRETRY  0x4
#define IDIGNORE  0x5
#define IDYES  0x6
#define IDNO  0x7
#define IDCLOSE  0x8
#define IDHELP  0x9
#define IDTRYAGAIN  0xa
#define IDCONTINUE  0xb
#define IDASYNC  0x7d01
#define IDTIMEOUT  0x7d00

; MESSAGEBOX_STYLE
#define MB_ABORTRETRYIGNORE  0x2
#define MB_CANCELTRYCONTINUE  0x6
#define MB_HELP  0x4000
#define MB_OK  0x0
#define MB_OKCANCEL  0x1
#define MB_RETRYCANCEL  0x5
#define MB_YESNO  0x4
#define MB_YESNOCANCEL  0x3
#define MB_ICONHAND  0x10
#define MB_ICONQUESTION  0x20
#define MB_ICONEXCLAMATION  0x30
#define MB_ICONASTERISK  0x40
#define MB_USERICON  0x80
#define MB_ICONWARNING  0x30
#define MB_ICONERROR  0x10
#define MB_ICONINFORMATION  0x40
#define MB_ICONSTOP  0x10
#define MB_DEFBUTTON1  0x0
#define MB_DEFBUTTON2  0x100
#define MB_DEFBUTTON3  0x200
#define MB_DEFBUTTON4  0x300
#define MB_APPLMODAL  0x0
#define MB_SYSTEMMODAL  0x1000
#define MB_TASKMODAL  0x2000
#define MB_NOFOCUS  0x8000
#define MB_SETFOREGROUND  0x10000
#define MB_DEFAULT_DESKTOP_ONLY  0x20000
#define MB_TOPMOST  0x40000
#define MB_RIGHT  0x80000
#define MB_RTLREADING  0x100000
#define MB_SERVICE_NOTIFICATION  0x200000
#define MB_SERVICE_NOTIFICATION_NT3X  0x40000
#define MB_TYPEMASK  0xf
#define MB_ICONMASK  0xf0
#define MB_DEFMASK  0xf00
#define MB_MODEMASK  0x3000
#define MB_MISCMASK  0xc000

; MetafileFrameUnit
#define MetafileFrameUnitPixel  0x2
#define MetafileFrameUnitPoint  0x3
#define MetafileFrameUnitInch  0x4
#define MetafileFrameUnitDocument  0x5
#define MetafileFrameUnitMillimeter  0x6
#define MetafileFrameUnitGdi  0x7

; MetafileType
#define MetafileTypeInvalid  0x0
#define MetafileTypeWmf  0x1
#define MetafileTypeWmfPlaceable  0x2
#define MetafileTypeEmf  0x3
#define MetafileTypeEmfPlusOnly  0x4
#define MetafileTypeEmfPlusDual  0x5

; MIB_IF_ENTRY_LEVEL
#define MibIfEntryNormal  0x0
#define MibIfEntryNormalWithoutStatistics  0x2

; MIB_IF_TABLE_LEVEL
#define MibIfTableNormal  0x0
#define MibIfTableRaw  0x1
#define MibIfTableNormalWithoutStatistics  0x2

; MIB_IPFORWARD_TYPE
#define MIB_IPROUTE_TYPE_OTHER  0x1
#define MIB_IPROUTE_TYPE_INVALID  0x2
#define MIB_IPROUTE_TYPE_DIRECT  0x3
#define MIB_IPROUTE_TYPE_INDIRECT  0x4

; MIB_IPNET_TYPE
#define MIB_IPNET_TYPE_OTHER  0x1
#define MIB_IPNET_TYPE_INVALID  0x2
#define MIB_IPNET_TYPE_DYNAMIC  0x3
#define MIB_IPNET_TYPE_STATIC  0x4

; MIB_IPSTATS_FORWARDING
#define MIB_IP_FORWARDING  0x1
#define MIB_IP_NOT_FORWARDING  0x2

; MIB_NOTIFICATION_TYPE
#define MibParameterNotification  0x0
#define MibAddInstance  0x1
#define MibDeleteInstance  0x2
#define MibInitialNotification  0x3

; MIB_TCP_STATE
#define MIB_TCP_STATE_CLOSED  0x1
#define MIB_TCP_STATE_LISTEN  0x2
#define MIB_TCP_STATE_SYN_SENT  0x3
#define MIB_TCP_STATE_SYN_RCVD  0x4
#define MIB_TCP_STATE_ESTAB  0x5
#define MIB_TCP_STATE_FIN_WAIT1  0x6
#define MIB_TCP_STATE_FIN_WAIT2  0x7
#define MIB_TCP_STATE_CLOSE_WAIT  0x8
#define MIB_TCP_STATE_CLOSING  0x9
#define MIB_TCP_STATE_LAST_ACK  0xa
#define MIB_TCP_STATE_TIME_WAIT  0xb
#define MIB_TCP_STATE_DELETE_TCB  0xc
#define MIB_TCP_STATE_RESERVED  0x64

; MIDI_WAVE_OPEN_TYPE
#define CALLBACK_TYPEMASK  0x70000
#define CALLBACK_NULL  0x0
#define CALLBACK_WINDOW  0x10000
#define CALLBACK_TASK  0x20000
#define CALLBACK_FUNCTION  0x30000
#define CALLBACK_THREAD  0x20000
#define CALLBACK_EVENT  0x50000
#define WAVE_FORMAT_QUERY  0x1
#define WAVE_ALLOWSYNC  0x2
#define WAVE_MAPPED  0x4
#define WAVE_FORMAT_DIRECT  0x8
#define WAVE_FORMAT_DIRECT_QUERY  0x9
#define WAVE_MAPPED_DEFAULT_COMMUNICATION_DEVICE  0x10
#define MIDI_IO_STATUS  0x20

; MIXERLINE_COMPONENTTYPE
#define MIXERLINE_COMPONENTTYPE_DST_DIGITAL  0x1
#define MIXERLINE_COMPONENTTYPE_DST_HEADPHONES  0x5
#define MIXERLINE_COMPONENTTYPE_DST_LINE  0x2
#define MIXERLINE_COMPONENTTYPE_DST_MONITOR  0x3
#define MIXERLINE_COMPONENTTYPE_DST_SPEAKERS  0x4
#define MIXERLINE_COMPONENTTYPE_DST_TELEPHONE  0x6
#define MIXERLINE_COMPONENTTYPE_DST_UNDEFINED  0x0
#define MIXERLINE_COMPONENTTYPE_DST_VOICEIN  0x8
#define MIXERLINE_COMPONENTTYPE_DST_WAVEIN  0x7
#define MIXERLINE_COMPONENTTYPE_SRC_ANALOG  0x100a
#define MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY  0x1009
#define MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC  0x1005
#define MIXERLINE_COMPONENTTYPE_SRC_DIGITAL  0x1001
#define MIXERLINE_COMPONENTTYPE_SRC_LINE  0x1002
#define MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE  0x1003
#define MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER  0x1007
#define MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER  0x1004
#define MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE  0x1006
#define MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED  0x1000
#define MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT  0x1008

; MM_FLAGS
#define MM_ADDSEPARATOR  0x1
#define MM_SUBMENUSHAVEIDS  0x2
#define MM_DONTREMOVESEPS  0x4

; MODEM_STATUS_FLAGS
#define MS_CTS_ON  0x10
#define MS_DSR_ON  0x20
#define MS_RING_ON  0x40
#define MS_RLSD_ON  0x80

; MODIFIERKEYS_FLAGS
#define MK_LBUTTON  0x1
#define MK_RBUTTON  0x2
#define MK_SHIFT  0x4
#define MK_CONTROL  0x8
#define MK_MBUTTON  0x10
#define MK_XBUTTON1  0x20
#define MK_XBUTTON2  0x40

; MODIFY_WORLD_TRANSFORM_MODE
#define MWT_IDENTITY  0x1
#define MWT_LEFTMULTIPLY  0x2
#define MWT_RIGHTMULTIPLY  0x3

; MODLOAD_DATA_TYPE
#define DBHHEADER_DEBUGDIRS  0x1
#define DBHHEADER_CVMISC  0x2

; MONITOR_FROM_FLAGS
#define MONITOR_DEFAULTTONEAREST  0x2
#define MONITOR_DEFAULTTONULL  0x0
#define MONITOR_DEFAULTTOPRIMARY  0x1

; MOUSE_EVENT_FLAGS
#define MOUSEEVENTF_ABSOLUTE  0x8000
#define MOUSEEVENTF_LEFTDOWN  0x2
#define MOUSEEVENTF_LEFTUP  0x4
#define MOUSEEVENTF_MIDDLEDOWN  0x20
#define MOUSEEVENTF_MIDDLEUP  0x40
#define MOUSEEVENTF_MOVE  0x1
#define MOUSEEVENTF_RIGHTDOWN  0x8
#define MOUSEEVENTF_RIGHTUP  0x10
#define MOUSEEVENTF_WHEEL  0x800
#define MOUSEEVENTF_XDOWN  0x80
#define MOUSEEVENTF_XUP  0x100
#define MOUSEEVENTF_HWHEEL  0x1000
#define MOUSEEVENTF_MOVE_NOCOALESCE  0x2000
#define MOUSEEVENTF_VIRTUALDESK  0x4000

; MOUSE_STATE
#define MOUSE_MOVE_RELATIVE  0x0
#define MOUSE_MOVE_ABSOLUTE  0x1
#define MOUSE_VIRTUAL_DESKTOP  0x2
#define MOUSE_ATTRIBUTES_CHANGED  0x4
#define MOUSE_MOVE_NOCOALESCE  0x8

; MOVE_FILE_FLAGS
#define MOVEFILE_COPY_ALLOWED  0x2
#define MOVEFILE_CREATE_HARDLINK  0x10
#define MOVEFILE_DELAY_UNTIL_REBOOT  0x4
#define MOVEFILE_REPLACE_EXISTING  0x1
#define MOVEFILE_WRITE_THROUGH  0x8
#define MOVEFILE_FAIL_IF_NOT_TRACKABLE  0x20

; MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS
#define MWMO_NONE  0x0
#define MWMO_ALERTABLE  0x2
#define MWMO_INPUTAVAILABLE  0x4
#define MWMO_WAITALL  0x1

; MSGFLTINFO_STATUS
#define MSGFLTINFO_NONE  0x0
#define MSGFLTINFO_ALLOWED_HIGHER  0x3
#define MSGFLTINFO_ALREADYALLOWED_FORWND  0x1
#define MSGFLTINFO_ALREADYDISALLOWED_FORWND  0x2

; MULTI_BYTE_TO_WIDE_CHAR_FLAGS
#define MB_COMPOSITE  0x2
#define MB_ERR_INVALID_CHARS  0x8
#define MB_PRECOMPOSED  0x1
#define MB_USEGLYPHCHARS  0x4

; MULTIPLE_TRUSTEE_OPERATION
#define NO_MULTIPLE_TRUSTEE  0x0
#define TRUSTEE_IS_IMPERSONATE  0x1

; NAMED_PIPE_MODE
#define PIPE_WAIT  0x0
#define PIPE_NOWAIT  0x1
#define PIPE_READMODE_BYTE  0x0
#define PIPE_READMODE_MESSAGE  0x2
#define PIPE_CLIENT_END  0x0
#define PIPE_SERVER_END  0x1
#define PIPE_TYPE_BYTE  0x0
#define PIPE_TYPE_MESSAGE  0x4
#define PIPE_ACCEPT_REMOTE_CLIENTS  0x0
#define PIPE_REJECT_REMOTE_CLIENTS  0x8

; NDIS_MEDIUM
#define NdisMedium802_3  0x0
#define NdisMedium802_5  0x1
#define NdisMediumFddi  0x2
#define NdisMediumWan  0x3
#define NdisMediumLocalTalk  0x4
#define NdisMediumDix  0x5
#define NdisMediumArcnetRaw  0x6
#define NdisMediumArcnet878_2  0x7
#define NdisMediumAtm  0x8
#define NdisMediumWirelessWan  0x9
#define NdisMediumIrda  0xa
#define NdisMediumBpc  0xb
#define NdisMediumCoWan  0xc
#define NdisMedium1394  0xd
#define NdisMediumInfiniBand  0xe
#define NdisMediumTunnel  0xf
#define NdisMediumNative802_11  0x10
#define NdisMediumLoopback  0x11
#define NdisMediumWiMAX  0x12
#define NdisMediumIP  0x13
#define NdisMediumMax  0x14

; NDIS_PHYSICAL_MEDIUM
#define NdisPhysicalMediumUnspecified  0x0
#define NdisPhysicalMediumWirelessLan  0x1
#define NdisPhysicalMediumCableModem  0x2
#define NdisPhysicalMediumPhoneLine  0x3
#define NdisPhysicalMediumPowerLine  0x4
#define NdisPhysicalMediumDSL  0x5
#define NdisPhysicalMediumFibreChannel  0x6
#define NdisPhysicalMedium1394  0x7
#define NdisPhysicalMediumWirelessWan  0x8
#define NdisPhysicalMediumNative802_11  0x9
#define NdisPhysicalMediumBluetooth  0xa
#define NdisPhysicalMediumInfiniband  0xb
#define NdisPhysicalMediumWiMax  0xc
#define NdisPhysicalMediumUWB  0xd
#define NdisPhysicalMedium802_3  0xe
#define NdisPhysicalMedium802_5  0xf
#define NdisPhysicalMediumIrda  0x10
#define NdisPhysicalMediumWiredWAN  0x11
#define NdisPhysicalMediumWiredCoWan  0x12
#define NdisPhysicalMediumOther  0x13
#define NdisPhysicalMediumNative802_15_4  0x14
#define NdisPhysicalMediumMax  0x15

; NET_ADDRESS_FORMAT
#define NET_ADDRESS_FORMAT_UNSPECIFIED  0x0
#define NET_ADDRESS_DNS_NAME  0x1
#define NET_ADDRESS_IPV4  0x2
#define NET_ADDRESS_IPV6  0x3

; NET_IF_ACCESS_TYPE
#define NET_IF_ACCESS_LOOPBACK  0x1
#define NET_IF_ACCESS_BROADCAST  0x2
#define NET_IF_ACCESS_POINT_TO_POINT  0x3
#define NET_IF_ACCESS_POINT_TO_MULTI_POINT  0x4
#define NET_IF_ACCESS_MAXIMUM  0x5

; NET_IF_ADMIN_STATUS
#define NET_IF_ADMIN_STATUS_UP  0x1
#define NET_IF_ADMIN_STATUS_DOWN  0x2
#define NET_IF_ADMIN_STATUS_TESTING  0x3

; NET_IF_CONNECTION_TYPE
#define NET_IF_CONNECTION_DEDICATED  0x1
#define NET_IF_CONNECTION_PASSIVE  0x2
#define NET_IF_CONNECTION_DEMAND  0x3
#define NET_IF_CONNECTION_MAXIMUM  0x4

; NET_IF_DIRECTION_TYPE
#define NET_IF_DIRECTION_SENDRECEIVE  0x0
#define NET_IF_DIRECTION_SENDONLY  0x1
#define NET_IF_DIRECTION_RECEIVEONLY  0x2
#define NET_IF_DIRECTION_MAXIMUM  0x3

; NET_IF_MEDIA_CONNECT_STATE
#define MediaConnectStateUnknown  0x0
#define MediaConnectStateConnected  0x1
#define MediaConnectStateDisconnected  0x2

; NET_SERVER_TYPE
#define SV_TYPE_WORKSTATION  0x1
#define SV_TYPE_SERVER  0x2
#define SV_TYPE_SQLSERVER  0x4
#define SV_TYPE_DOMAIN_CTRL  0x8
#define SV_TYPE_DOMAIN_BAKCTRL  0x10
#define SV_TYPE_TIME_SOURCE  0x20
#define SV_TYPE_AFP  0x40
#define SV_TYPE_NOVELL  0x80
#define SV_TYPE_DOMAIN_MEMBER  0x100
#define SV_TYPE_PRINTQ_SERVER  0x200
#define SV_TYPE_DIALIN_SERVER  0x400
#define SV_TYPE_XENIX_SERVER  0x800
#define SV_TYPE_SERVER_UNIX  0x800
#define SV_TYPE_NT  0x1000
#define SV_TYPE_WFW  0x2000
#define SV_TYPE_SERVER_MFPN  0x4000
#define SV_TYPE_SERVER_NT  0x8000
#define SV_TYPE_POTENTIAL_BROWSER  0x10000
#define SV_TYPE_BACKUP_BROWSER  0x20000
#define SV_TYPE_MASTER_BROWSER  0x40000
#define SV_TYPE_DOMAIN_MASTER  0x80000
#define SV_TYPE_SERVER_OSF  0x100000
#define SV_TYPE_SERVER_VMS  0x200000
#define SV_TYPE_WINDOWS  0x400000
#define SV_TYPE_DFS  0x800000
#define SV_TYPE_CLUSTER_NT  0x1000000
#define SV_TYPE_TERMINALSERVER  0x2000000
#define SV_TYPE_CLUSTER_VS_NT  0x4000000
#define SV_TYPE_DCE  0x10000000
#define SV_TYPE_ALTERNATE_XPORT  0x20000000
#define SV_TYPE_LOCAL_LIST_ONLY  0x40000000
#define SV_TYPE_DOMAIN_ENUM  0x80000000
#define SV_TYPE_ALL  0xffffffff

; NL_DAD_STATE
#define NldsInvalid  0x0
#define NldsTentative  0x1
#define NldsDuplicate  0x2
#define NldsDeprecated  0x3
#define NldsPreferred  0x4
#define IpDadStateInvalid  0x0
#define IpDadStateTentative  0x1
#define IpDadStateDuplicate  0x2
#define IpDadStateDeprecated  0x3
#define IpDadStatePreferred  0x4

; NL_LINK_LOCAL_ADDRESS_BEHAVIOR
#define LinkLocalAlwaysOff  0x0
#define LinkLocalDelayed  0x1
#define LinkLocalAlwaysOn  0x2
#define LinkLocalUnchanged  -1

; NL_NEIGHBOR_STATE
#define NlnsUnreachable  0x0
#define NlnsIncomplete  0x1
#define NlnsProbe  0x2
#define NlnsDelay  0x3
#define NlnsStale  0x4
#define NlnsReachable  0x5
#define NlnsPermanent  0x6
#define NlnsMaximum  0x7

; NL_NETWORK_CONNECTIVITY_COST_HINT
#define NetworkConnectivityCostHintUnknown  0x0
#define NetworkConnectivityCostHintUnrestricted  0x1
#define NetworkConnectivityCostHintFixed  0x2
#define NetworkConnectivityCostHintVariable  0x3

; NL_NETWORK_CONNECTIVITY_LEVEL_HINT
#define NetworkConnectivityLevelHintUnknown  0x0
#define NetworkConnectivityLevelHintNone  0x1
#define NetworkConnectivityLevelHintLocalAccess  0x2
#define NetworkConnectivityLevelHintInternetAccess  0x3
#define NetworkConnectivityLevelHintConstrainedInternetAccess  0x4
#define NetworkConnectivityLevelHintHidden  0x5

; NL_PREFIX_ORIGIN
#define IpPrefixOriginOther  0x0
#define IpPrefixOriginManual  0x1
#define IpPrefixOriginWellKnown  0x2
#define IpPrefixOriginDhcp  0x3
#define IpPrefixOriginRouterAdvertisement  0x4
#define IpPrefixOriginUnchanged  0x10

; NL_ROUTE_ORIGIN
#define NlroManual  0x0
#define NlroWellKnown  0x1
#define NlroDHCP  0x2
#define NlroRouterAdvertisement  0x3
#define Nlro6to4  0x4

; NL_ROUTE_PROTOCOL
#define RouteProtocolOther  0x1
#define RouteProtocolLocal  0x2
#define RouteProtocolNetMgmt  0x3
#define RouteProtocolIcmp  0x4
#define RouteProtocolEgp  0x5
#define RouteProtocolGgp  0x6
#define RouteProtocolHello  0x7
#define RouteProtocolRip  0x8
#define RouteProtocolIsIs  0x9
#define RouteProtocolEsIs  0xa
#define RouteProtocolCisco  0xb
#define RouteProtocolBbn  0xc
#define RouteProtocolOspf  0xd
#define RouteProtocolBgp  0xe
#define RouteProtocolIdpr  0xf
#define RouteProtocolEigrp  0x10
#define RouteProtocolDvmrp  0x11
#define RouteProtocolRpl  0x12
#define RouteProtocolDhcp  0x13
#define MIB_IPPROTO_OTHER  0x1
#define PROTO_IP_OTHER  0x1
#define MIB_IPPROTO_LOCAL  0x2
#define PROTO_IP_LOCAL  0x2
#define MIB_IPPROTO_NETMGMT  0x3
#define PROTO_IP_NETMGMT  0x3
#define MIB_IPPROTO_ICMP  0x4
#define PROTO_IP_ICMP  0x4
#define MIB_IPPROTO_EGP  0x5
#define PROTO_IP_EGP  0x5
#define MIB_IPPROTO_GGP  0x6
#define PROTO_IP_GGP  0x6
#define MIB_IPPROTO_HELLO  0x7
#define PROTO_IP_HELLO  0x7
#define MIB_IPPROTO_RIP  0x8
#define PROTO_IP_RIP  0x8
#define MIB_IPPROTO_IS_IS  0x9
#define PROTO_IP_IS_IS  0x9
#define MIB_IPPROTO_ES_IS  0xa
#define PROTO_IP_ES_IS  0xa
#define MIB_IPPROTO_CISCO  0xb
#define PROTO_IP_CISCO  0xb
#define MIB_IPPROTO_BBN  0xc
#define PROTO_IP_BBN  0xc
#define MIB_IPPROTO_OSPF  0xd
#define PROTO_IP_OSPF  0xd
#define MIB_IPPROTO_BGP  0xe
#define PROTO_IP_BGP  0xe
#define MIB_IPPROTO_IDPR  0xf
#define PROTO_IP_IDPR  0xf
#define MIB_IPPROTO_EIGRP  0x10
#define PROTO_IP_EIGRP  0x10
#define MIB_IPPROTO_DVMRP  0x11
#define PROTO_IP_DVMRP  0x11
#define MIB_IPPROTO_RPL  0x12
#define PROTO_IP_RPL  0x12
#define MIB_IPPROTO_DHCP  0x13
#define PROTO_IP_DHCP  0x13
#define MIB_IPPROTO_NT_AUTOSTATIC  0x2712
#define PROTO_IP_NT_AUTOSTATIC  0x2712
#define MIB_IPPROTO_NT_STATIC  0x2716
#define PROTO_IP_NT_STATIC  0x2716
#define MIB_IPPROTO_NT_STATIC_NON_DOD  0x2717
#define PROTO_IP_NT_STATIC_NON_DOD  0x2717

; NL_ROUTER_DISCOVERY_BEHAVIOR
#define RouterDiscoveryDisabled  0x0
#define RouterDiscoveryEnabled  0x1
#define RouterDiscoveryDhcp  0x2
#define RouterDiscoveryUnchanged  -1

; NL_SUFFIX_ORIGIN
#define NlsoOther  0x0
#define NlsoManual  0x1
#define NlsoWellKnown  0x2
#define NlsoDhcp  0x3
#define NlsoLinkLayerAddress  0x4
#define NlsoRandom  0x5
#define IpSuffixOriginOther  0x0
#define IpSuffixOriginManual  0x1
#define IpSuffixOriginWellKnown  0x2
#define IpSuffixOriginDhcp  0x3
#define IpSuffixOriginLinkLayerAddress  0x4
#define IpSuffixOriginRandom  0x5
#define IpSuffixOriginUnchanged  0x10

; NORM_FORM
#define NormalizationOther  0x0
#define NormalizationC  0x1
#define NormalizationD  0x2
#define NormalizationKC  0x5
#define NormalizationKD  0x6

; NOTIFY_IME_ACTION
#define NI_CHANGECANDIDATELIST  0x13
#define NI_CLOSECANDIDATE  0x11
#define NI_COMPOSITIONSTR  0x15
#define NI_IMEMENUSELECTED  0x18
#define NI_OPENCANDIDATE  0x10
#define NI_SELECTCANDIDATESTR  0x12
#define NI_SETCANDIDATE_PAGESIZE  0x17
#define NI_SETCANDIDATE_PAGESTART  0x16

; NOTIFY_IME_INDEX
#define CPS_CANCEL  0x4
#define CPS_COMPLETE  0x1
#define CPS_CONVERT  0x2
#define CPS_REVERT  0x3

; Severity
#define Success  0x0
#define Informational  0x1
#define Warning  0x2
#define Error  0x3

; NUMPARSE_FLAGS
#define NUMPRS_LEADING_WHITE  0x1
#define NUMPRS_TRAILING_WHITE  0x2
#define NUMPRS_LEADING_PLUS  0x4
#define NUMPRS_TRAILING_PLUS  0x8
#define NUMPRS_LEADING_MINUS  0x10
#define NUMPRS_TRAILING_MINUS  0x20
#define NUMPRS_HEX_OCT  0x40
#define NUMPRS_PARENS  0x80
#define NUMPRS_DECIMAL  0x100
#define NUMPRS_THOUSANDS  0x200
#define NUMPRS_CURRENCY  0x400
#define NUMPRS_EXPONENT  0x800
#define NUMPRS_USE_ALL  0x1000
#define NUMPRS_STD  0x1fff
#define NUMPRS_NEG  0x10000
#define NUMPRS_INEXACT  0x20000

; OBJ_TYPE
#define OBJ_PEN  0x1
#define OBJ_BRUSH  0x2
#define OBJ_DC  0x3
#define OBJ_METADC  0x4
#define OBJ_PAL  0x5
#define OBJ_FONT  0x6
#define OBJ_BITMAP  0x7
#define OBJ_REGION  0x8
#define OBJ_METAFILE  0x9
#define OBJ_MEMDC  0xa
#define OBJ_EXTPEN  0xb
#define OBJ_ENHMETADC  0xc
#define OBJ_ENHMETAFILE  0xd
#define OBJ_COLORSPACE  0xe

; OBJECT_IDENTIFIER
#define OBJID_WINDOW  0x0
#define OBJID_SYSMENU  -1
#define OBJID_TITLEBAR  -2
#define OBJID_MENU  -3
#define OBJID_CLIENT  -4
#define OBJID_VSCROLL  -5
#define OBJID_HSCROLL  -6
#define OBJID_SIZEGRIP  -7
#define OBJID_CARET  -8
#define OBJID_CURSOR  -9
#define OBJID_ALERT  -10
#define OBJID_SOUND  -11
#define OBJID_QUERYCLASSNAMEIDX  -12
#define OBJID_NATIVEOM  -16

; OBJECT_SECURITY_INFORMATION
#define ATTRIBUTE_SECURITY_INFORMATION  0x20
#define BACKUP_SECURITY_INFORMATION  0x10000
#define DACL_SECURITY_INFORMATION  0x4
#define GROUP_SECURITY_INFORMATION  0x2
#define LABEL_SECURITY_INFORMATION  0x10
#define OWNER_SECURITY_INFORMATION  0x1
#define PROTECTED_DACL_SECURITY_INFORMATION  0x80000000
#define PROTECTED_SACL_SECURITY_INFORMATION  0x40000000
#define SACL_SECURITY_INFORMATION  0x8
#define SCOPE_SECURITY_INFORMATION  0x40
#define UNPROTECTED_DACL_SECURITY_INFORMATION  0x20000000
#define UNPROTECTED_SACL_SECURITY_INFORMATION  0x10000000

; OLECREATE
#define OLECREATE_ZERO  0x0
#define OLECREATE_LEAVERUNNING  0x1

; OLEIVERB
#define OLEIVERB_PRIMARY  0x0
#define OLEIVERB_SHOW  -1
#define OLEIVERB_OPEN  -2
#define OLEIVERB_HIDE  -3
#define OLEIVERB_UIACTIVATE  -4
#define OLEIVERB_INPLACEACTIVATE  -5
#define OLEIVERB_DISCARDUNDOSTATE  -6

; OLEMISC
#define OLEMISC_RECOMPOSEONRESIZE  0x1
#define OLEMISC_ONLYICONIC  0x2
#define OLEMISC_INSERTNOTREPLACE  0x4
#define OLEMISC_STATIC  0x8
#define OLEMISC_CANTLINKINSIDE  0x10
#define OLEMISC_CANLINKBYOLE1  0x20
#define OLEMISC_ISLINKOBJECT  0x40
#define OLEMISC_INSIDEOUT  0x80
#define OLEMISC_ACTIVATEWHENVISIBLE  0x100
#define OLEMISC_RENDERINGISDEVICEINDEPENDENT  0x200
#define OLEMISC_INVISIBLEATRUNTIME  0x400
#define OLEMISC_ALWAYSRUN  0x800
#define OLEMISC_ACTSLIKEBUTTON  0x1000
#define OLEMISC_ACTSLIKELABEL  0x2000
#define OLEMISC_NOUIACTIVATE  0x4000
#define OLEMISC_ALIGNABLE  0x8000
#define OLEMISC_SIMPLEFRAME  0x10000
#define OLEMISC_SETCLIENTSITEFIRST  0x20000
#define OLEMISC_IMEMODE  0x40000
#define OLEMISC_IGNOREACTIVATEWHENVISIBLE  0x80000
#define OLEMISC_WANTSTOMENUMERGE  0x100000
#define OLEMISC_SUPPORTSMULTILEVELUNDO  0x200000

; OLERENDER
#define OLERENDER_NONE  0x0
#define OLERENDER_DRAW  0x1
#define OLERENDER_FORMAT  0x2
#define OLERENDER_ASIS  0x3

; OLEVERBATTRIB
#define OLEVERBATTRIB_NEVERDIRTIES  0x1
#define OLEVERBATTRIB_ONCONTAINERMENU  0x2

; OPEN_AS_INFO_FLAGS
#define OAIF_ALLOW_REGISTRATION  0x1
#define OAIF_REGISTER_EXT  0x2
#define OAIF_EXEC  0x4
#define OAIF_FORCE_REGISTRATION  0x8
#define OAIF_HIDE_REGISTRATION  0x20
#define OAIF_URL_PROTOCOL  0x40
#define OAIF_FILE_IS_URI  0x80

; OPEN_THEME_DATA_FLAGS
#define OTD_FORCE_RECT_SIZING  0x1
#define OTD_NONCLIENT  0x2

; OPEN_THREAD_WAIT_CHAIN_SESSION_FLAGS
#define WCT_ASYNC_OPEN_FLAG  0x1

; OPERATION_END_PARAMETERS_FLAGS
#define OPERATION_END_DISCARD  0x1

; OPERATION_START_FLAGS
#define OPERATION_START_TRACE_CURRENT_THREAD  0x1

; ORIENTATION_PREFERENCE
#define ORIENTATION_PREFERENCE_NONE  0x0
#define ORIENTATION_PREFERENCE_LANDSCAPE  0x1
#define ORIENTATION_PREFERENCE_PORTRAIT  0x2
#define ORIENTATION_PREFERENCE_LANDSCAPE_FLIPPED  0x4
#define ORIENTATION_PREFERENCE_PORTRAIT_FLIPPED  0x8

; OS_PRODUCT_TYPE
#define PRODUCT_BUSINESS  0x6
#define PRODUCT_BUSINESS_N  0x10
#define PRODUCT_CLUSTER_SERVER  0x12
#define PRODUCT_CLUSTER_SERVER_V  0x40
#define PRODUCT_CORE  0x65
#define PRODUCT_CORE_COUNTRYSPECIFIC  0x63
#define PRODUCT_CORE_N  0x62
#define PRODUCT_CORE_SINGLELANGUAGE  0x64
#define PRODUCT_DATACENTER_EVALUATION_SERVER  0x50
#define PRODUCT_DATACENTER_A_SERVER_CORE  0x91
#define PRODUCT_STANDARD_A_SERVER_CORE  0x92
#define PRODUCT_DATACENTER_SERVER  0x8
#define PRODUCT_DATACENTER_SERVER_CORE  0xc
#define PRODUCT_DATACENTER_SERVER_CORE_V  0x27
#define PRODUCT_DATACENTER_SERVER_V  0x25
#define PRODUCT_EDUCATION  0x79
#define PRODUCT_EDUCATION_N  0x7a
#define PRODUCT_ENTERPRISE  0x4
#define PRODUCT_ENTERPRISE_E  0x46
#define PRODUCT_ENTERPRISE_EVALUATION  0x48
#define PRODUCT_ENTERPRISE_N  0x1b
#define PRODUCT_ENTERPRISE_N_EVALUATION  0x54
#define PRODUCT_ENTERPRISE_S  0x7d
#define PRODUCT_ENTERPRISE_S_EVALUATION  0x81
#define PRODUCT_ENTERPRISE_S_N  0x7e
#define PRODUCT_ENTERPRISE_S_N_EVALUATION  0x82
#define PRODUCT_ENTERPRISE_SERVER  0xa
#define PRODUCT_ENTERPRISE_SERVER_CORE  0xe
#define PRODUCT_ENTERPRISE_SERVER_CORE_V  0x29
#define PRODUCT_ENTERPRISE_SERVER_IA64  0xf
#define PRODUCT_ENTERPRISE_SERVER_V  0x26
#define PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL  0x3c
#define PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC  0x3e
#define PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT  0x3b
#define PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC  0x3d
#define PRODUCT_HOME_BASIC  0x2
#define PRODUCT_HOME_BASIC_E  0x43
#define PRODUCT_HOME_BASIC_N  0x5
#define PRODUCT_HOME_PREMIUM  0x3
#define PRODUCT_HOME_PREMIUM_E  0x44
#define PRODUCT_HOME_PREMIUM_N  0x1a
#define PRODUCT_HOME_PREMIUM_SERVER  0x22
#define PRODUCT_HOME_SERVER  0x13
#define PRODUCT_HYPERV  0x2a
#define PRODUCT_IOTUAP  0x7b
#define PRODUCT_IOTUAPCOMMERCIAL  0x83
#define PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT  0x1e
#define PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING  0x20
#define PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY  0x1f
#define PRODUCT_MOBILE_CORE  0x68
#define PRODUCT_MOBILE_ENTERPRISE  0x85
#define PRODUCT_MULTIPOINT_PREMIUM_SERVER  0x4d
#define PRODUCT_MULTIPOINT_STANDARD_SERVER  0x4c
#define PRODUCT_PRO_WORKSTATION  0xa1
#define PRODUCT_PRO_WORKSTATION_N  0xa2
#define PRODUCT_PROFESSIONAL  0x30
#define PRODUCT_PROFESSIONAL_E  0x45
#define PRODUCT_PROFESSIONAL_N  0x31
#define PRODUCT_PROFESSIONAL_WMC  0x67
#define PRODUCT_SB_SOLUTION_SERVER  0x32
#define PRODUCT_SB_SOLUTION_SERVER_EM  0x36
#define PRODUCT_SERVER_FOR_SB_SOLUTIONS  0x33
#define PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM  0x37
#define PRODUCT_SERVER_FOR_SMALLBUSINESS  0x18
#define PRODUCT_SERVER_FOR_SMALLBUSINESS_V  0x23
#define PRODUCT_SERVER_FOUNDATION  0x21
#define PRODUCT_SMALLBUSINESS_SERVER  0x9
#define PRODUCT_SMALLBUSINESS_SERVER_PREMIUM  0x19
#define PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE  0x3f
#define PRODUCT_SOLUTION_EMBEDDEDSERVER  0x38
#define PRODUCT_STANDARD_EVALUATION_SERVER  0x4f
#define PRODUCT_STANDARD_SERVER  0x7
#define PRODUCT_STANDARD_SERVER_CORE_  0xd
#define PRODUCT_STANDARD_SERVER_CORE_V  0x28
#define PRODUCT_STANDARD_SERVER_V  0x24
#define PRODUCT_STANDARD_SERVER_SOLUTIONS  0x34
#define PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE  0x35
#define PRODUCT_STARTER  0xb
#define PRODUCT_STARTER_E  0x42
#define PRODUCT_STARTER_N  0x2f
#define PRODUCT_STORAGE_ENTERPRISE_SERVER  0x17
#define PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE  0x2e
#define PRODUCT_STORAGE_EXPRESS_SERVER  0x14
#define PRODUCT_STORAGE_EXPRESS_SERVER_CORE  0x2b
#define PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER  0x60
#define PRODUCT_STORAGE_STANDARD_SERVER  0x15
#define PRODUCT_STORAGE_STANDARD_SERVER_CORE  0x2c
#define PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER  0x5f
#define PRODUCT_STORAGE_WORKGROUP_SERVER  0x16
#define PRODUCT_STORAGE_WORKGROUP_SERVER_CORE  0x2d
#define PRODUCT_ULTIMATE  0x1
#define PRODUCT_ULTIMATE_E  0x47
#define PRODUCT_ULTIMATE_N  0x1c
#define PRODUCT_UNDEFINED  0x0
#define PRODUCT_WEB_SERVER  0x11
#define PRODUCT_WEB_SERVER_CORE  0x1d

; PAGE_PROTECTION_FLAGS
#define PAGE_NOACCESS  0x1
#define PAGE_READONLY  0x2
#define PAGE_READWRITE  0x4
#define PAGE_WRITECOPY  0x8
#define PAGE_EXECUTE  0x10
#define PAGE_EXECUTE_READ  0x20
#define PAGE_EXECUTE_READWRITE  0x40
#define PAGE_EXECUTE_WRITECOPY  0x80
#define PAGE_GUARD  0x100
#define PAGE_NOCACHE  0x200
#define PAGE_WRITECOMBINE  0x400
#define PAGE_GRAPHICS_NOACCESS  0x800
#define PAGE_GRAPHICS_READONLY  0x1000
#define PAGE_GRAPHICS_READWRITE  0x2000
#define PAGE_GRAPHICS_EXECUTE  0x4000
#define PAGE_GRAPHICS_EXECUTE_READ  0x8000
#define PAGE_GRAPHICS_EXECUTE_READWRITE  0x10000
#define PAGE_GRAPHICS_COHERENT  0x20000
#define PAGE_GRAPHICS_NOCACHE  0x40000
#define PAGE_ENCLAVE_THREAD_CONTROL  0x80000000
#define PAGE_REVERT_TO_FILE_MAP  0x80000000
#define PAGE_TARGETS_NO_UPDATE  0x40000000
#define PAGE_TARGETS_INVALID  0x40000000
#define PAGE_ENCLAVE_UNVALIDATED  0x20000000
#define PAGE_ENCLAVE_MASK  0x10000000
#define PAGE_ENCLAVE_DECOMMIT  0x10000000
#define PAGE_ENCLAVE_SS_FIRST  0x10000001
#define PAGE_ENCLAVE_SS_REST  0x10000002
#define SEC_PARTITION_OWNER_HANDLE  0x40000
#define SEC_64K_PAGES  0x80000
#define SEC_FILE  0x800000
#define SEC_IMAGE  0x1000000
#define SEC_PROTECTED_IMAGE  0x2000000
#define SEC_RESERVE  0x4000000
#define SEC_COMMIT  0x8000000
#define SEC_NOCACHE  0x10000000
#define SEC_WRITECOMBINE  0x40000000
#define SEC_LARGE_PAGES  0x80000000
#define SEC_IMAGE_NO_EXECUTE  0x11000000

; PaletteType
#define PaletteTypeCustom  0x0
#define PaletteTypeOptimal  0x1
#define PaletteTypeFixedBW  0x2
#define PaletteTypeFixedHalftone8  0x3
#define PaletteTypeFixedHalftone27  0x4
#define PaletteTypeFixedHalftone64  0x5
#define PaletteTypeFixedHalftone125  0x6
#define PaletteTypeFixedHalftone216  0x7
#define PaletteTypeFixedHalftone252  0x8
#define PaletteTypeFixedHalftone256  0x9

; PAN_ARM_STYLE
#define PAN_ARM_ANY  0x0
#define PAN_ARM_NO_FIT  0x1
#define PAN_STRAIGHT_ARMS_HORZ  0x2
#define PAN_STRAIGHT_ARMS_WEDGE  0x3
#define PAN_STRAIGHT_ARMS_VERT  0x4
#define PAN_STRAIGHT_ARMS_SINGLE_SERIF  0x5
#define PAN_STRAIGHT_ARMS_DOUBLE_SERIF  0x6
#define PAN_BENT_ARMS_HORZ  0x7
#define PAN_BENT_ARMS_WEDGE  0x8
#define PAN_BENT_ARMS_VERT  0x9
#define PAN_BENT_ARMS_SINGLE_SERIF  0xa
#define PAN_BENT_ARMS_DOUBLE_SERIF  0xb

; PAN_CONTRAST
#define PAN_CONTRAST_ANY  0x0
#define PAN_CONTRAST_NO_FIT  0x1
#define PAN_CONTRAST_INDEX  0x4
#define PAN_CONTRAST_NONE  0x2
#define PAN_CONTRAST_VERY_LOW  0x3
#define PAN_CONTRAST_LOW  0x4
#define PAN_CONTRAST_MEDIUM_LOW  0x5
#define PAN_CONTRAST_MEDIUM  0x6
#define PAN_CONTRAST_MEDIUM_HIGH  0x7
#define PAN_CONTRAST_HIGH  0x8
#define PAN_CONTRAST_VERY_HIGH  0x9

; PAN_FAMILY_TYPE
#define PAN_FAMILY_ANY  0x0
#define PAN_FAMILY_NO_FIT  0x1
#define PAN_FAMILY_TEXT_DISPLAY  0x2
#define PAN_FAMILY_SCRIPT  0x3
#define PAN_FAMILY_DECORATIVE  0x4
#define PAN_FAMILY_PICTORIAL  0x5

; PAN_LETT_FORM
#define PAN_LETT_FORM_ANY  0x0
#define PAN_LETT_FORM_NO_FIT  0x1
#define PAN_LETT_NORMAL_CONTACT  0x2
#define PAN_LETT_NORMAL_WEIGHTED  0x3
#define PAN_LETT_NORMAL_BOXED  0x4
#define PAN_LETT_NORMAL_FLATTENED  0x5
#define PAN_LETT_NORMAL_ROUNDED  0x6
#define PAN_LETT_NORMAL_OFF_CENTER  0x7
#define PAN_LETT_NORMAL_SQUARE  0x8
#define PAN_LETT_OBLIQUE_CONTACT  0x9
#define PAN_LETT_OBLIQUE_WEIGHTED  0xa
#define PAN_LETT_OBLIQUE_BOXED  0xb
#define PAN_LETT_OBLIQUE_FLATTENED  0xc
#define PAN_LETT_OBLIQUE_ROUNDED  0xd
#define PAN_LETT_OBLIQUE_OFF_CENTER  0xe
#define PAN_LETT_OBLIQUE_SQUARE  0xf

; PAN_MIDLINE
#define PAN_MIDLINE_ANY  0x0
#define PAN_MIDLINE_NO_FIT  0x1
#define PAN_MIDLINE_INDEX  0x8
#define PAN_MIDLINE_STANDARD_TRIMMED  0x2
#define PAN_MIDLINE_STANDARD_POINTED  0x3
#define PAN_MIDLINE_STANDARD_SERIFED  0x4
#define PAN_MIDLINE_HIGH_TRIMMED  0x5
#define PAN_MIDLINE_HIGH_POINTED  0x6
#define PAN_MIDLINE_HIGH_SERIFED  0x7
#define PAN_MIDLINE_CONSTANT_TRIMMED  0x8
#define PAN_MIDLINE_CONSTANT_POINTED  0x9
#define PAN_MIDLINE_CONSTANT_SERIFED  0xa
#define PAN_MIDLINE_LOW_TRIMMED  0xb
#define PAN_MIDLINE_LOW_POINTED  0xc
#define PAN_MIDLINE_LOW_SERIFED  0xd

; PAN_PROPORTION
#define PAN_PROP_ANY  0x0
#define PAN_PROP_NO_FIT  0x1
#define PAN_PROP_OLD_STYLE  0x2
#define PAN_PROP_MODERN  0x3
#define PAN_PROP_EVEN_WIDTH  0x4
#define PAN_PROP_EXPANDED  0x5
#define PAN_PROP_CONDENSED  0x6
#define PAN_PROP_VERY_EXPANDED  0x7
#define PAN_PROP_VERY_CONDENSED  0x8
#define PAN_PROP_MONOSPACED  0x9

; PAN_SERIF_STYLE
#define PAN_SERIF_ANY  0x0
#define PAN_SERIF_NO_FIT  0x1
#define PAN_SERIF_COVE  0x2
#define PAN_SERIF_OBTUSE_COVE  0x3
#define PAN_SERIF_SQUARE_COVE  0x4
#define PAN_SERIF_OBTUSE_SQUARE_COVE  0x5
#define PAN_SERIF_SQUARE  0x6
#define PAN_SERIF_THIN  0x7
#define PAN_SERIF_BONE  0x8
#define PAN_SERIF_EXAGGERATED  0x9
#define PAN_SERIF_TRIANGLE  0xa
#define PAN_SERIF_NORMAL_SANS  0xb
#define PAN_SERIF_OBTUSE_SANS  0xc
#define PAN_SERIF_PERP_SANS  0xd
#define PAN_SERIF_FLARED  0xe
#define PAN_SERIF_ROUNDED  0xf

; PAN_STROKE_VARIATION
#define PAN_STROKE_ANY  0x0
#define PAN_STROKE_NO_FIT  0x1
#define PAN_STROKE_GRADUAL_DIAG  0x2
#define PAN_STROKE_GRADUAL_TRAN  0x3
#define PAN_STROKE_GRADUAL_VERT  0x4
#define PAN_STROKE_GRADUAL_HORZ  0x5
#define PAN_STROKE_RAPID_VERT  0x6
#define PAN_STROKE_RAPID_HORZ  0x7
#define PAN_STROKE_INSTANT_VERT  0x8

; PAN_WEIGHT
#define PAN_WEIGHT_ANY  0x0
#define PAN_WEIGHT_NO_FIT  0x1
#define PAN_WEIGHT_INDEX  0x2
#define PAN_WEIGHT_VERY_LIGHT  0x2
#define PAN_WEIGHT_LIGHT  0x3
#define PAN_WEIGHT_THIN  0x4
#define PAN_WEIGHT_BOOK  0x5
#define PAN_WEIGHT_MEDIUM  0x6
#define PAN_WEIGHT_DEMI  0x7
#define PAN_WEIGHT_BOLD  0x8
#define PAN_WEIGHT_HEAVY  0x9
#define PAN_WEIGHT_BLACK  0xa
#define PAN_WEIGHT_NORD  0xb

; PAN_XHEIGHT
#define PAN_XHEIGHT_ANY  0x0
#define PAN_XHEIGHT_NO_FIT  0x1
#define PAN_XHEIGHT_INDEX  0x9
#define PAN_XHEIGHT_CONSTANT_SMALL  0x2
#define PAN_XHEIGHT_CONSTANT_STD  0x3
#define PAN_XHEIGHT_CONSTANT_LARGE  0x4
#define PAN_XHEIGHT_DUCKING_SMALL  0x5
#define PAN_XHEIGHT_DUCKING_STD  0x6
#define PAN_XHEIGHT_DUCKING_LARGE  0x7

; PARAMFLAGS
#define PARAMFLAG_NONE  0x0
#define PARAMFLAG_FIN  0x1
#define PARAMFLAG_FOUT  0x2
#define PARAMFLAG_FLCID  0x4
#define PARAMFLAG_FRETVAL  0x8
#define PARAMFLAG_FOPT  0x10
#define PARAMFLAG_FHASDEFAULT  0x20
#define PARAMFLAG_FHASCUSTDATA  0x40

; PARSEACTION
#define PARSE_CANONICALIZE  0x1
#define PARSE_FRIENDLY  0x2
#define PARSE_SECURITY_URL  0x3
#define PARSE_ROOTDOCUMENT  0x4
#define PARSE_DOCUMENT  0x5
#define PARSE_ANCHOR  0x6
#define PARSE_ENCODE_IS_UNESCAPE  0x7
#define PARSE_DECODE_IS_ESCAPE  0x8
#define PARSE_PATH_FROM_URL  0x9
#define PARSE_URL_FROM_PATH  0xa
#define PARSE_MIME  0xb
#define PARSE_SERVER  0xc
#define PARSE_SCHEMA  0xd
#define PARSE_SITE  0xe
#define PARSE_DOMAIN  0xf
#define PARSE_LOCATION  0x10
#define PARSE_SECURITY_DOMAIN  0x11
#define PARSE_ESCAPE  0x12
#define PARSE_UNESCAPE  0x13

; PCS_RET
#define PCS_FATAL  0x80000000
#define PCS_REPLACEDCHAR  0x1
#define PCS_REMOVEDCHAR  0x2
#define PCS_TRUNCATED  0x4
#define PCS_PATHTOOLONG  0x8

; PDOPSTATUS
#define PDOPS_RUNNING  0x1
#define PDOPS_PAUSED  0x2
#define PDOPS_CANCELLED  0x3
#define PDOPS_STOPPED  0x4
#define PDOPS_ERRORS  0x5

; PEEK_MESSAGE_REMOVE_TYPE
#define PM_NOREMOVE  0x0
#define PM_REMOVE  0x1
#define PM_NOYIELD  0x2
#define PM_QS_INPUT  0x4070000
#define PM_QS_POSTMESSAGE  0x980000
#define PM_QS_PAINT  0x200000
#define PM_QS_SENDMESSAGE  0x400000

; PEN_STYLE
#define PS_GEOMETRIC  0x10000
#define PS_COSMETIC  0x0
#define PS_SOLID  0x0
#define PS_DASH  0x1
#define PS_DOT  0x2
#define PS_DASHDOT  0x3
#define PS_DASHDOTDOT  0x4
#define PS_NULL  0x5
#define PS_INSIDEFRAME  0x6
#define PS_USERSTYLE  0x7
#define PS_ALTERNATE  0x8
#define PS_STYLE_MASK  0xf
#define PS_ENDCAP_ROUND  0x0
#define PS_ENDCAP_SQUARE  0x100
#define PS_ENDCAP_FLAT  0x200
#define PS_ENDCAP_MASK  0xf00
#define PS_JOIN_ROUND  0x0
#define PS_JOIN_BEVEL  0x1000
#define PS_JOIN_MITER  0x2000
#define PS_JOIN_MASK  0xf000
#define PS_TYPE_MASK  0xf0000

; PenAlignment
#define PenAlignmentCenter  0x0
#define PenAlignmentInset  0x1

; PenType
#define PenTypeSolidColor  0x0
#define PenTypeHatchFill  0x1
#define PenTypeTextureFill  0x2
#define PenTypePathGradient  0x3
#define PenTypeLinearGradient  0x4
#define PenTypeUnknown  -1

; PerfRegInfoType
#define PERF_REG_COUNTERSET_STRUCT  0x1
#define PERF_REG_COUNTER_STRUCT  0x2
#define PERF_REG_COUNTERSET_NAME_STRING  0x3
#define PERF_REG_COUNTERSET_HELP_STRING  0x4
#define PERF_REG_COUNTER_NAME_STRINGS  0x5
#define PERF_REG_COUNTER_HELP_STRINGS  0x6
#define PERF_REG_PROVIDER_NAME  0x7
#define PERF_REG_PROVIDER_GUID  0x8
#define PERF_REG_COUNTERSET_ENGLISH_NAME  0x9
#define PERF_REG_COUNTER_ENGLISH_NAMES  0xa

; PFADDRESSTYPE
#define PF_IPV4  0x0
#define PF_IPV6  0x1

; PFD_FLAGS
#define PFD_DOUBLEBUFFER  0x1
#define PFD_STEREO  0x2
#define PFD_DRAW_TO_WINDOW  0x4
#define PFD_DRAW_TO_BITMAP  0x8
#define PFD_SUPPORT_GDI  0x10
#define PFD_SUPPORT_OPENGL  0x20
#define PFD_GENERIC_FORMAT  0x40
#define PFD_NEED_PALETTE  0x80
#define PFD_NEED_SYSTEM_PALETTE  0x100
#define PFD_SWAP_EXCHANGE  0x200
#define PFD_SWAP_COPY  0x400
#define PFD_SWAP_LAYER_BUFFERS  0x800
#define PFD_GENERIC_ACCELERATED  0x1000
#define PFD_SUPPORT_DIRECTDRAW  0x2000
#define PFD_DIRECT3D_ACCELERATED  0x4000
#define PFD_SUPPORT_COMPOSITION  0x8000
#define PFD_DEPTH_DONTCARE  0x20000000
#define PFD_DOUBLEBUFFER_DONTCARE  0x40000000
#define PFD_STEREO_DONTCARE  0x80000000

; PFD_LAYER_TYPE
#define PFD_UNDERLAY_PLANE  -1
#define PFD_MAIN_PLANE  0x0
#define PFD_OVERLAY_PLANE  0x1

; PFD_PIXEL_TYPE
#define PFD_TYPE_RGBA  0x0
#define PFD_TYPE_COLORINDEX  0x1

; PFFORWARD_ACTION
#define PF_ACTION_FORWARD  0x0
#define PF_ACTION_DROP  0x1

; PICTYPE
#define PICTYPE_UNINITIALIZED  -1
#define PICTYPE_NONE  0x0
#define PICTYPE_BITMAP  0x1
#define PICTYPE_METAFILE  0x2
#define PICTYPE_ICON  0x3
#define PICTYPE_ENHMETAFILE  0x4

; PixelOffsetMode
#define PixelOffsetModeInvalid  -1
#define PixelOffsetModeDefault  0x0
#define PixelOffsetModeHighSpeed  0x1
#define PixelOffsetModeHighQuality  0x2
#define PixelOffsetModeNone  0x3
#define PixelOffsetModeHalf  0x4

; POINTER_BUTTON_CHANGE_TYPE
#define POINTER_CHANGE_NONE  0x0
#define POINTER_CHANGE_FIRSTBUTTON_DOWN  0x1
#define POINTER_CHANGE_FIRSTBUTTON_UP  0x2
#define POINTER_CHANGE_SECONDBUTTON_DOWN  0x3
#define POINTER_CHANGE_SECONDBUTTON_UP  0x4
#define POINTER_CHANGE_THIRDBUTTON_DOWN  0x5
#define POINTER_CHANGE_THIRDBUTTON_UP  0x6
#define POINTER_CHANGE_FOURTHBUTTON_DOWN  0x7
#define POINTER_CHANGE_FOURTHBUTTON_UP  0x8
#define POINTER_CHANGE_FIFTHBUTTON_DOWN  0x9
#define POINTER_CHANGE_FIFTHBUTTON_UP  0xa

; POINTER_DEVICE_CURSOR_TYPE
#define POINTER_DEVICE_CURSOR_TYPE_UNKNOWN  0x0
#define POINTER_DEVICE_CURSOR_TYPE_TIP  0x1
#define POINTER_DEVICE_CURSOR_TYPE_ERASER  0x2
#define POINTER_DEVICE_CURSOR_TYPE_MAX  -1

; POINTER_DEVICE_TYPE
#define POINTER_DEVICE_TYPE_INTEGRATED_PEN  0x1
#define POINTER_DEVICE_TYPE_EXTERNAL_PEN  0x2
#define POINTER_DEVICE_TYPE_TOUCH  0x3
#define POINTER_DEVICE_TYPE_TOUCH_PAD  0x4
#define POINTER_DEVICE_TYPE_MAX  -1

; POINTER_FEEDBACK_MODE
#define POINTER_FEEDBACK_DEFAULT  0x1
#define POINTER_FEEDBACK_INDIRECT  0x2
#define POINTER_FEEDBACK_NONE  0x3

; POINTER_FLAGS
#define POINTER_FLAG_NONE  0x0
#define POINTER_FLAG_NEW  0x1
#define POINTER_FLAG_INRANGE  0x2
#define POINTER_FLAG_INCONTACT  0x4
#define POINTER_FLAG_FIRSTBUTTON  0x10
#define POINTER_FLAG_SECONDBUTTON  0x20
#define POINTER_FLAG_THIRDBUTTON  0x40
#define POINTER_FLAG_FOURTHBUTTON  0x80
#define POINTER_FLAG_FIFTHBUTTON  0x100
#define POINTER_FLAG_PRIMARY  0x2000
#define POINTER_FLAG_CONFIDENCE  0x4000
#define POINTER_FLAG_CANCELED  0x8000
#define POINTER_FLAG_DOWN  0x10000
#define POINTER_FLAG_UPDATE  0x20000
#define POINTER_FLAG_UP  0x40000
#define POINTER_FLAG_WHEEL  0x80000
#define POINTER_FLAG_HWHEEL  0x100000
#define POINTER_FLAG_CAPTURECHANGED  0x200000
#define POINTER_FLAG_HASTRANSFORM  0x400000

; POINTER_INPUT_TYPE
#define PT_POINTER  0x1
#define PT_TOUCH  0x2
#define PT_PEN  0x3
#define PT_MOUSE  0x4
#define PT_TOUCHPAD  0x5

; POLICY_AUDIT_EVENT_TYPE
#define AuditCategorySystem  0x0
#define AuditCategoryLogon  0x1
#define AuditCategoryObjectAccess  0x2
#define AuditCategoryPrivilegeUse  0x3
#define AuditCategoryDetailedTracking  0x4
#define AuditCategoryPolicyChange  0x5
#define AuditCategoryAccountManagement  0x6
#define AuditCategoryDirectoryServiceAccess  0x7
#define AuditCategoryAccountLogon  0x8

; POLICY_DOMAIN_INFORMATION_CLASS
#define PolicyDomainEfsInformation  0x2
#define PolicyDomainKerberosTicketInformation  0x3

; POLICY_INFORMATION_CLASS
#define PolicyAuditLogInformation  0x1
#define PolicyAuditEventsInformation  0x2
#define PolicyPrimaryDomainInformation  0x3
#define PolicyPdAccountInformation  0x4
#define PolicyAccountDomainInformation  0x5
#define PolicyLsaServerRoleInformation  0x6
#define PolicyReplicaSourceInformation  0x7
#define PolicyDefaultQuotaInformation  0x8
#define PolicyModificationInformation  0x9
#define PolicyAuditFullSetInformation  0xa
#define PolicyAuditFullQueryInformation  0xb
#define PolicyDnsDomainInformation  0xc
#define PolicyDnsDomainInformationInt  0xd
#define PolicyLocalAccountDomainInformation  0xe
#define PolicyMachineAccountInformation  0xf
#define PolicyMachineAccountInformation2  0x10
#define PolicyLastEntry  0x11

; POWER_ACTION
#define PowerActionNone  0x0
#define PowerActionReserved  0x1
#define PowerActionSleep  0x2
#define PowerActionHibernate  0x3
#define PowerActionShutdown  0x4
#define PowerActionShutdownReset  0x5
#define PowerActionShutdownOff  0x6
#define PowerActionWarmEject  0x7
#define PowerActionDisplayOff  0x8

; POWER_ACTION_POLICY_EVENT_CODE
#define POWER_FORCE_TRIGGER_RESET  0x80000000
#define POWER_LEVEL_USER_NOTIFY_EXEC  0x4
#define POWER_LEVEL_USER_NOTIFY_SOUND  0x2
#define POWER_LEVEL_USER_NOTIFY_TEXT  0x1
#define POWER_USER_NOTIFY_BUTTON  0x8
#define POWER_USER_NOTIFY_SHUTDOWN  0x10

; POWER_DATA_ACCESSOR
#define ACCESS_AC_POWER_SETTING_INDEX  0x0
#define ACCESS_DC_POWER_SETTING_INDEX  0x1
#define ACCESS_FRIENDLY_NAME  0x2
#define ACCESS_DESCRIPTION  0x3
#define ACCESS_POSSIBLE_POWER_SETTING  0x4
#define ACCESS_POSSIBLE_POWER_SETTING_FRIENDLY_NAME  0x5
#define ACCESS_POSSIBLE_POWER_SETTING_DESCRIPTION  0x6
#define ACCESS_DEFAULT_AC_POWER_SETTING  0x7
#define ACCESS_DEFAULT_DC_POWER_SETTING  0x8
#define ACCESS_POSSIBLE_VALUE_MIN  0x9
#define ACCESS_POSSIBLE_VALUE_MAX  0xa
#define ACCESS_POSSIBLE_VALUE_INCREMENT  0xb
#define ACCESS_POSSIBLE_VALUE_UNITS  0xc
#define ACCESS_ICON_RESOURCE  0xd
#define ACCESS_DEFAULT_SECURITY_DESCRIPTOR  0xe
#define ACCESS_ATTRIBUTES  0xf
#define ACCESS_SCHEME  0x10
#define ACCESS_SUBGROUP  0x11
#define ACCESS_INDIVIDUAL_SETTING  0x12
#define ACCESS_ACTIVE_SCHEME  0x13
#define ACCESS_CREATE_SCHEME  0x14
#define ACCESS_AC_POWER_SETTING_MAX  0x15
#define ACCESS_DC_POWER_SETTING_MAX  0x16
#define ACCESS_AC_POWER_SETTING_MIN  0x17
#define ACCESS_DC_POWER_SETTING_MIN  0x18
#define ACCESS_PROFILE  0x19
#define ACCESS_OVERLAY_SCHEME  0x1a
#define ACCESS_ACTIVE_OVERLAY_SCHEME  0x1b

; POWER_INFORMATION_LEVEL
#define SystemPowerPolicyAc  0x0
#define SystemPowerPolicyDc  0x1
#define VerifySystemPolicyAc  0x2
#define VerifySystemPolicyDc  0x3
#define SystemPowerCapabilities  0x4
#define SystemBatteryState  0x5
#define SystemPowerStateHandler  0x6
#define ProcessorStateHandler  0x7
#define SystemPowerPolicyCurrent  0x8
#define AdministratorPowerPolicy  0x9
#define SystemReserveHiberFile  0xa
#define ProcessorInformation  0xb
#define SystemPowerInformation  0xc
#define ProcessorStateHandler2  0xd
#define LastWakeTime  0xe
#define LastSleepTime  0xf
#define SystemExecutionState  0x10
#define SystemPowerStateNotifyHandler  0x11
#define ProcessorPowerPolicyAc  0x12
#define ProcessorPowerPolicyDc  0x13
#define VerifyProcessorPowerPolicyAc  0x14
#define VerifyProcessorPowerPolicyDc  0x15
#define ProcessorPowerPolicyCurrent  0x16
#define SystemPowerStateLogging  0x17
#define SystemPowerLoggingEntry  0x18
#define SetPowerSettingValue  0x19
#define NotifyUserPowerSetting  0x1a
#define PowerInformationLevelUnused0  0x1b
#define SystemMonitorHiberBootPowerOff  0x1c
#define SystemVideoState  0x1d
#define TraceApplicationPowerMessage  0x1e
#define TraceApplicationPowerMessageEnd  0x1f
#define ProcessorPerfStates  0x20
#define ProcessorIdleStates  0x21
#define ProcessorCap  0x22
#define SystemWakeSource  0x23
#define SystemHiberFileInformation  0x24
#define TraceServicePowerMessage  0x25
#define ProcessorLoad  0x26
#define PowerShutdownNotification  0x27
#define MonitorCapabilities  0x28
#define SessionPowerInit  0x29
#define SessionDisplayState  0x2a
#define PowerRequestCreate  0x2b
#define PowerRequestAction  0x2c
#define GetPowerRequestList  0x2d
#define ProcessorInformationEx  0x2e
#define NotifyUserModeLegacyPowerEvent  0x2f
#define GroupPark  0x30
#define ProcessorIdleDomains  0x31
#define WakeTimerList  0x32
#define SystemHiberFileSize  0x33
#define ProcessorIdleStatesHv  0x34
#define ProcessorPerfStatesHv  0x35
#define ProcessorPerfCapHv  0x36
#define ProcessorSetIdle  0x37
#define LogicalProcessorIdling  0x38
#define UserPresence  0x39
#define PowerSettingNotificationName  0x3a
#define GetPowerSettingValue  0x3b
#define IdleResiliency  0x3c
#define SessionRITState  0x3d
#define SessionConnectNotification  0x3e
#define SessionPowerCleanup  0x3f
#define SessionLockState  0x40
#define SystemHiberbootState  0x41
#define PlatformInformation  0x42
#define PdcInvocation  0x43
#define MonitorInvocation  0x44
#define FirmwareTableInformationRegistered  0x45
#define SetShutdownSelectedTime  0x46
#define SuspendResumeInvocation  0x47
#define PlmPowerRequestCreate  0x48
#define ScreenOff  0x49
#define CsDeviceNotification  0x4a
#define PlatformRole  0x4b
#define LastResumePerformance  0x4c
#define DisplayBurst  0x4d
#define ExitLatencySamplingPercentage  0x4e
#define RegisterSpmPowerSettings  0x4f
#define PlatformIdleStates  0x50
#define ProcessorIdleVeto  0x51
#define PlatformIdleVeto  0x52
#define SystemBatteryStatePrecise  0x53
#define ThermalEvent  0x54
#define PowerRequestActionInternal  0x55
#define BatteryDeviceState  0x56
#define PowerInformationInternal  0x57
#define ThermalStandby  0x58
#define SystemHiberFileType  0x59
#define PhysicalPowerButtonPress  0x5a
#define QueryPotentialDripsConstraint  0x5b
#define EnergyTrackerCreate  0x5c
#define EnergyTrackerQuery  0x5d
#define UpdateBlackBoxRecorder  0x5e
#define SessionAllowExternalDmaDevices  0x5f
#define SendSuspendResumeNotification  0x60
#define BlackBoxRecorderDirectAccessBuffer  0x61
#define PowerInformationLevelMaximum  0x62

; POWER_PLATFORM_ROLE
#define PlatformRoleUnspecified  0x0
#define PlatformRoleDesktop  0x1
#define PlatformRoleMobile  0x2
#define PlatformRoleWorkstation  0x3
#define PlatformRoleEnterpriseServer  0x4
#define PlatformRoleSOHOServer  0x5
#define PlatformRoleAppliancePC  0x6
#define PlatformRolePerformanceServer  0x7
#define PlatformRoleSlate  0x8
#define PlatformRoleMaximum  0x9

; POWER_PLATFORM_ROLE_VERSION
#define POWER_PLATFORM_ROLE_V1  0x1
#define POWER_PLATFORM_ROLE_V2  0x2

; POWER_REQUEST_CONTEXT_FLAGS
#define POWER_REQUEST_CONTEXT_DETAILED_STRING  0x2
#define POWER_REQUEST_CONTEXT_SIMPLE_STRING  0x1

; POWER_REQUEST_TYPE
#define PowerRequestDisplayRequired  0x0
#define PowerRequestSystemRequired  0x1
#define PowerRequestAwayModeRequired  0x2
#define PowerRequestExecutionRequired  0x3

; PREPARE_TAPE_OPERATION
#define TAPE_FORMAT  0x5
#define TAPE_LOAD  0x0
#define TAPE_LOCK  0x3
#define TAPE_TENSION  0x2
#define TAPE_UNLOAD  0x1
#define TAPE_UNLOCK  0x4

; PRF_FLAGS
#define PRF_VERIFYEXISTS  0x1
#define PRF_TRYPROGRAMEXTENSIONS  0x3
#define PRF_FIRSTDIRDEF  0x4
#define PRF_DONTFINDLNK  0x8
#define PRF_REQUIREABSOLUTE  0x10

; PRINT_WINDOW_FLAGS
#define PW_CLIENTONLY  0x1

; PROCESS_ACCESS_RIGHTS
#define PROCESS_TERMINATE  0x1
#define PROCESS_CREATE_THREAD  0x2
#define PROCESS_SET_SESSIONID  0x4
#define PROCESS_VM_OPERATION  0x8
#define PROCESS_VM_READ  0x10
#define PROCESS_VM_WRITE  0x20
#define PROCESS_DUP_HANDLE  0x40
#define PROCESS_CREATE_PROCESS  0x80
#define PROCESS_SET_QUOTA  0x100
#define PROCESS_SET_INFORMATION  0x200
#define PROCESS_QUERY_INFORMATION  0x400
#define PROCESS_SUSPEND_RESUME  0x800
#define PROCESS_QUERY_LIMITED_INFORMATION  0x1000
#define PROCESS_SET_LIMITED_INFORMATION  0x2000
#define PROCESS_ALL_ACCESS  0x1fffff
#define PROCESS_DELETE  0x10000
#define PROCESS_READ_CONTROL  0x20000
#define PROCESS_WRITE_DAC  0x40000
#define PROCESS_WRITE_OWNER  0x80000
#define PROCESS_SYNCHRONIZE  0x100000
#define PROCESS_STANDARD_RIGHTS_REQUIRED  0xf0000

; PROCESS_AFFINITY_AUTO_UPDATE_FLAGS
#define PROCESS_AFFINITY_DISABLE_AUTO_UPDATE  0x0
#define PROCESS_AFFINITY_ENABLE_AUTO_UPDATE  0x1

; PROCESS_CREATION_FLAGS
#define DEBUG_PROCESS  0x1
#define DEBUG_ONLY_THIS_PROCESS  0x2
#define CREATE_SUSPENDED  0x4
#define DETACHED_PROCESS  0x8
#define CREATE_NEW_CONSOLE  0x10
#define NORMAL_PRIORITY_CLASS  0x20
#define IDLE_PRIORITY_CLASS  0x40
#define HIGH_PRIORITY_CLASS  0x80
#define REALTIME_PRIORITY_CLASS  0x100
#define CREATE_NEW_PROCESS_GROUP  0x200
#define CREATE_UNICODE_ENVIRONMENT  0x400
#define CREATE_SEPARATE_WOW_VDM  0x800
#define CREATE_SHARED_WOW_VDM  0x1000
#define CREATE_FORCEDOS  0x2000
#define BELOW_NORMAL_PRIORITY_CLASS  0x4000
#define ABOVE_NORMAL_PRIORITY_CLASS  0x8000
#define INHERIT_PARENT_AFFINITY  0x10000
#define INHERIT_CALLER_PRIORITY  0x20000
#define CREATE_PROTECTED_PROCESS  0x40000
#define EXTENDED_STARTUPINFO_PRESENT  0x80000
#define PROCESS_MODE_BACKGROUND_BEGIN  0x100000
#define PROCESS_MODE_BACKGROUND_END  0x200000
#define CREATE_SECURE_PROCESS  0x400000
#define CREATE_BREAKAWAY_FROM_JOB  0x1000000
#define CREATE_PRESERVE_CODE_AUTHZ_LEVEL  0x2000000
#define CREATE_DEFAULT_ERROR_MODE  0x4000000
#define CREATE_NO_WINDOW  0x8000000
#define PROFILE_USER  0x10000000
#define PROFILE_KERNEL  0x20000000
#define PROFILE_SERVER  0x40000000
#define CREATE_IGNORE_SYSTEM_DEFAULT  0x80000000

; PROCESS_DEP_FLAGS
#define PROCESS_DEP_ENABLE  0x1
#define PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION  0x2
#define PROCESS_DEP_NONE  0x0

; PROCESS_INFORMATION_CLASS
#define ProcessMemoryPriority  0x0
#define ProcessMemoryExhaustionInfo  0x1
#define ProcessAppMemoryInfo  0x2
#define ProcessInPrivateInfo  0x3
#define ProcessPowerThrottling  0x4
#define ProcessReservedValue1  0x5
#define ProcessTelemetryCoverageInfo  0x6
#define ProcessProtectionLevelInfo  0x7
#define ProcessLeapSecondInfo  0x8
#define ProcessMachineTypeInfo  0x9
#define ProcessOverrideSubsequentPrefetchParameter  0xa
#define ProcessMaxOverridePrefetchParameter  0xb
#define ProcessInformationClassMax  0xc

; PROCESS_NAME_FORMAT
#define PROCESS_NAME_WIN32  0x0
#define PROCESS_NAME_NATIVE  0x1

; PROCESSOR_ARCHITECTURE
#define PROCESSOR_ARCHITECTURE_INTEL  0x0
#define PROCESSOR_ARCHITECTURE_MIPS  0x1
#define PROCESSOR_ARCHITECTURE_ALPHA  0x2
#define PROCESSOR_ARCHITECTURE_PPC  0x3
#define PROCESSOR_ARCHITECTURE_SHX  0x4
#define PROCESSOR_ARCHITECTURE_ARM  0x5
#define PROCESSOR_ARCHITECTURE_IA64  0x6
#define PROCESSOR_ARCHITECTURE_ALPHA64  0x7
#define PROCESSOR_ARCHITECTURE_MSIL  0x8
#define PROCESSOR_ARCHITECTURE_AMD64  0x9
#define PROCESSOR_ARCHITECTURE_IA32_ON_WIN64  0xa
#define PROCESSOR_ARCHITECTURE_NEUTRAL  0xb
#define PROCESSOR_ARCHITECTURE_ARM64  0xc
#define PROCESSOR_ARCHITECTURE_ARM32_ON_WIN64  0xd
#define PROCESSOR_ARCHITECTURE_IA32_ON_ARM64  0xe
#define PROCESSOR_ARCHITECTURE_UNKNOWN  0xffff

; PROCESSOR_CACHE_TYPE
#define CacheUnified  0x0
#define CacheInstruction  0x1
#define CacheData  0x2
#define CacheTrace  0x3

; PROCESSOR_FEATURE_ID
#define PF_FLOATING_POINT_PRECISION_ERRATA  0x0
#define PF_FLOATING_POINT_EMULATED  0x1
#define PF_COMPARE_EXCHANGE_DOUBLE  0x2
#define PF_MMX_INSTRUCTIONS_AVAILABLE  0x3
#define PF_PPC_MOVEMEM_64BIT_OK  0x4
#define PF_ALPHA_BYTE_INSTRUCTIONS  0x5
#define PF_XMMI_INSTRUCTIONS_AVAILABLE  0x6
#define PF_3DNOW_INSTRUCTIONS_AVAILABLE  0x7
#define PF_RDTSC_INSTRUCTION_AVAILABLE  0x8
#define PF_PAE_ENABLED  0x9
#define PF_XMMI64_INSTRUCTIONS_AVAILABLE  0xa
#define PF_SSE_DAZ_MODE_AVAILABLE  0xb
#define PF_NX_ENABLED  0xc
#define PF_SSE3_INSTRUCTIONS_AVAILABLE  0xd
#define PF_COMPARE_EXCHANGE128  0xe
#define PF_COMPARE64_EXCHANGE128  0xf
#define PF_CHANNELS_ENABLED  0x10
#define PF_XSAVE_ENABLED  0x11
#define PF_ARM_VFP_32_REGISTERS_AVAILABLE  0x12
#define PF_ARM_NEON_INSTRUCTIONS_AVAILABLE  0x13
#define PF_SECOND_LEVEL_ADDRESS_TRANSLATION  0x14
#define PF_VIRT_FIRMWARE_ENABLED  0x15
#define PF_RDWRFSGSBASE_AVAILABLE  0x16
#define PF_FASTFAIL_AVAILABLE  0x17
#define PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE  0x18
#define PF_ARM_64BIT_LOADSTORE_ATOMIC  0x19
#define PF_ARM_EXTERNAL_CACHE_AVAILABLE  0x1a
#define PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE  0x1b
#define PF_RDRAND_INSTRUCTION_AVAILABLE  0x1c
#define PF_ARM_V8_INSTRUCTIONS_AVAILABLE  0x1d
#define PF_ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE  0x1e
#define PF_ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE  0x1f
#define PF_RDTSCP_INSTRUCTION_AVAILABLE  0x20
#define PF_RDPID_INSTRUCTION_AVAILABLE  0x21
#define PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE  0x22
#define PF_MONITORX_INSTRUCTION_AVAILABLE  0x23
#define PF_SSSE3_INSTRUCTIONS_AVAILABLE  0x24
#define PF_SSE4_1_INSTRUCTIONS_AVAILABLE  0x25
#define PF_SSE4_2_INSTRUCTIONS_AVAILABLE  0x26
#define PF_AVX_INSTRUCTIONS_AVAILABLE  0x27
#define PF_AVX2_INSTRUCTIONS_AVAILABLE  0x28
#define PF_AVX512F_INSTRUCTIONS_AVAILABLE  0x29
#define PF_ERMS_AVAILABLE  0x2a
#define PF_ARM_V82_DP_INSTRUCTIONS_AVAILABLE  0x2b
#define PF_ARM_V83_JSCVT_INSTRUCTIONS_AVAILABLE  0x2c
#define PF_ARM_V83_LRCPC_INSTRUCTIONS_AVAILABLE  0x2d

; PROG_INVOKE_SETTING
#define ProgressInvokeNever  0x1
#define ProgressInvokeEveryObject  0x2
#define ProgressInvokeOnError  0x3
#define ProgressCancelOperation  0x4
#define ProgressRetryOperation  0x5
#define ProgressInvokePrePostError  0x6

; PROPERTYORIGIN
#define PO_STATE  0x0
#define PO_PART  0x1
#define PO_CLASS  0x2
#define PO_GLOBAL  0x3
#define PO_NOTFOUND  0x4

; PROPSPEC_KIND
#define PRSPEC_LPWSTR  0x0
#define PRSPEC_PROPID  0x1

; PROPVAR_CHANGE_FLAGS
#define PVCHF_DEFAULT  0x0
#define PVCHF_NOVALUEPROP  0x1
#define PVCHF_ALPHABOOL  0x2
#define PVCHF_NOUSEROVERRIDE  0x4
#define PVCHF_LOCALBOOL  0x8
#define PVCHF_NOHEXSTRING  0x10

; PROXY_AUTO_DETECT_TYPE
#define PROXY_AUTO_DETECT_TYPE_DHCP  0x1
#define PROXY_AUTO_DETECT_TYPE_DNS_A  0x2

; PSPCB_MESSAGE
#define PSPCB_ADDREF  0x0
#define PSPCB_CREATE  0x2
#define PSPCB_RELEASE  0x1
#define PSPCB_SI_INITDIALOG  0x401

; PSUACTION
#define PSU_DEFAULT  0x1
#define PSU_SECURITY_URL_ONLY  0x2

; PURGE_COMM_FLAGS
#define PURGE_RXABORT  0x2
#define PURGE_RXCLEAR  0x8
#define PURGE_TXABORT  0x1
#define PURGE_TXCLEAR  0x4

; QUERY_DISPLAY_CONFIG_FLAGS
#define QDC_ALL_PATHS  0x1
#define QDC_ONLY_ACTIVE_PATHS  0x2
#define QDC_DATABASE_CURRENT  0x4
#define QDC_VIRTUAL_MODE_AWARE  0x10
#define QDC_INCLUDE_HMD  0x20
#define QDC_VIRTUAL_REFRESH_RATE_AWARE  0x40

; QUERY_USER_NOTIFICATION_STATE
#define QUNS_NOT_PRESENT  0x1
#define QUNS_BUSY  0x2
#define QUNS_RUNNING_D3D_FULL_SCREEN  0x3
#define QUNS_PRESENTATION_MODE  0x4
#define QUNS_ACCEPTS_NOTIFICATIONS  0x5
#define QUNS_QUIET_TIME  0x6
#define QUNS_APP  0x7

; QUERYOPTION
#define QUERY_EXPIRATION_DATE  0x1
#define QUERY_TIME_OF_LAST_CHANGE  0x2
#define QUERY_CONTENT_ENCODING  0x3
#define QUERY_CONTENT_TYPE  0x4
#define QUERY_REFRESH  0x5
#define QUERY_RECOMBINE  0x6
#define QUERY_CAN_NAVIGATE  0x7
#define QUERY_USES_NETWORK  0x8
#define QUERY_IS_CACHED  0x9
#define QUERY_IS_INSTALLEDENTRY  0xa
#define QUERY_IS_CACHED_OR_MAPPED  0xb
#define QUERY_USES_CACHE  0xc
#define QUERY_IS_SECURE  0xd
#define QUERY_IS_SAFE  0xe
#define QUERY_USES_HISTORYFOLDER  0xf
#define QUERY_IS_CACHED_AND_USABLE_OFFLINE  0x10

; QUEUE_STATUS_FLAGS
#define QS_ALLEVENTS  0x4bf
#define QS_ALLINPUT  0x4ff
#define QS_ALLPOSTMESSAGE  0x100
#define QS_HOTKEY  0x80
#define QS_INPUT  0x407
#define QS_KEY  0x1
#define QS_MOUSE  0x6
#define QS_MOUSEBUTTON  0x4
#define QS_MOUSEMOVE  0x2
#define QS_PAINT  0x20
#define QS_POSTMESSAGE  0x8
#define QS_RAWINPUT  0x400
#define QS_SENDMESSAGE  0x40
#define QS_TIMER  0x10

; R2_MODE
#define R2_BLACK  0x1
#define R2_NOTMERGEPEN  0x2
#define R2_MASKNOTPEN  0x3
#define R2_NOTCOPYPEN  0x4
#define R2_MASKPENNOT  0x5
#define R2_NOT  0x6
#define R2_XORPEN  0x7
#define R2_NOTMASKPEN  0x8
#define R2_MASKPEN  0x9
#define R2_NOTXORPEN  0xa
#define R2_NOP  0xb
#define R2_MERGENOTPEN  0xc
#define R2_COPYPEN  0xd
#define R2_MERGEPENNOT  0xe
#define R2_MERGEPEN  0xf
#define R2_WHITE  0x10
#define R2_LAST  0x10

; RAW_INPUT_DATA_COMMAND_FLAGS
#define RID_HEADER  0x10000005
#define RID_INPUT  0x10000003

; RAW_INPUT_DEVICE_INFO_COMMAND
#define RIDI_PREPARSEDDATA  0x20000005
#define RIDI_DEVICENAME  0x20000007
#define RIDI_DEVICEINFO  0x2000000b

; RAWINPUTDEVICE_FLAGS
#define RIDEV_REMOVE  0x1
#define RIDEV_EXCLUDE  0x10
#define RIDEV_PAGEONLY  0x20
#define RIDEV_NOLEGACY  0x30
#define RIDEV_INPUTSINK  0x100
#define RIDEV_CAPTUREMOUSE  0x200
#define RIDEV_NOHOTKEYS  0x200
#define RIDEV_APPKEYS  0x400
#define RIDEV_EXINPUTSINK  0x1000
#define RIDEV_DEVNOTIFY  0x2000

; READ_DIRECTORY_NOTIFY_INFORMATION_CLASS
#define ReadDirectoryNotifyInformation  0x1
#define ReadDirectoryNotifyExtendedInformation  0x2
#define ReadDirectoryNotifyFullInformation  0x3
#define ReadDirectoryNotifyMaximumInformation  0x4

; READ_EVENT_LOG_READ_FLAGS
#define EVENTLOG_SEEK_READ  0x2
#define EVENTLOG_SEQUENTIAL_READ  0x1

; REDRAW_WINDOW_FLAGS
#define RDW_INVALIDATE  0x1
#define RDW_INTERNALPAINT  0x2
#define RDW_ERASE  0x4
#define RDW_VALIDATE  0x8
#define RDW_NOINTERNALPAINT  0x10
#define RDW_NOERASE  0x20
#define RDW_NOCHILDREN  0x40
#define RDW_ALLCHILDREN  0x80
#define RDW_UPDATENOW  0x100
#define RDW_ERASENOW  0x200
#define RDW_FRAME  0x400
#define RDW_NOFRAME  0x800

; REG_CREATE_KEY_DISPOSITION
#define REG_CREATED_NEW_KEY  0x1
#define REG_OPENED_EXISTING_KEY  0x2

; REG_NOTIFY_FILTER
#define REG_NOTIFY_CHANGE_NAME  0x1
#define REG_NOTIFY_CHANGE_ATTRIBUTES  0x2
#define REG_NOTIFY_CHANGE_LAST_SET  0x4
#define REG_NOTIFY_CHANGE_SECURITY  0x8
#define REG_NOTIFY_THREAD_AGNOSTIC  0x10000000

; REG_OPEN_CREATE_OPTIONS
#define REG_OPTION_RESERVED  0x0
#define REG_OPTION_NON_VOLATILE  0x0
#define REG_OPTION_VOLATILE  0x1
#define REG_OPTION_CREATE_LINK  0x2
#define REG_OPTION_BACKUP_RESTORE  0x4
#define REG_OPTION_OPEN_LINK  0x8
#define REG_OPTION_DONT_VIRTUALIZE  0x10

; REG_RESTORE_KEY_FLAGS
#define REG_FORCE_RESTORE  0x8
#define REG_WHOLE_HIVE_VOLATILE  0x1

; REG_ROUTINE_FLAGS
#define RRF_RT_DWORD  0x18
#define RRF_RT_QWORD  0x48
#define RRF_RT_REG_NONE  0x1
#define RRF_RT_REG_SZ  0x2
#define RRF_RT_REG_EXPAND_SZ  0x4
#define RRF_RT_REG_BINARY  0x8
#define RRF_RT_REG_DWORD  0x10
#define RRF_RT_REG_MULTI_SZ  0x20
#define RRF_RT_REG_QWORD  0x40
#define RRF_RT_ANY  0xffff
#define RRF_SUBKEY_WOW6464KEY  0x10000
#define RRF_SUBKEY_WOW6432KEY  0x20000
#define RRF_WOW64_MASK  0x30000
#define RRF_NOEXPAND  0x10000000
#define RRF_ZEROONFAILURE  0x20000000

; REG_SAM_FLAGS
#define KEY_QUERY_VALUE  0x1
#define KEY_SET_VALUE  0x2
#define KEY_CREATE_SUB_KEY  0x4
#define KEY_ENUMERATE_SUB_KEYS  0x8
#define KEY_NOTIFY  0x10
#define KEY_CREATE_LINK  0x20
#define KEY_WOW64_32KEY  0x200
#define KEY_WOW64_64KEY  0x100
#define KEY_WOW64_RES  0x300
#define KEY_READ  0x20019
#define KEY_WRITE  0x20006
#define KEY_EXECUTE  0x20019
#define KEY_ALL_ACCESS  0xf003f

; REG_SAVE_FORMAT
#define REG_STANDARD_FORMAT  0x1
#define REG_LATEST_FORMAT  0x2
#define REG_NO_COMPRESSION  0x4

; REG_VALUE_TYPE
#define REG_NONE  0x0
#define REG_SZ  0x1
#define REG_EXPAND_SZ  0x2
#define REG_BINARY  0x3
#define REG_DWORD  0x4
#define REG_DWORD_LITTLE_ENDIAN  0x4
#define REG_DWORD_BIG_ENDIAN  0x5
#define REG_LINK  0x6
#define REG_MULTI_SZ  0x7
#define REG_RESOURCE_LIST  0x8
#define REG_FULL_RESOURCE_DESCRIPTOR  0x9
#define REG_RESOURCE_REQUIREMENTS_LIST  0xa
#define REG_QWORD  0xb
#define REG_QWORD_LITTLE_ENDIAN  0xb

; REGISTER_APPLICATION_RESTART_FLAGS
#define RESTART_NO_CRASH  0x1
#define RESTART_NO_HANG  0x2
#define RESTART_NO_PATCH  0x4
#define RESTART_NO_REBOOT  0x8

; REGISTER_NOTIFICATION_FLAGS
#define DEVICE_NOTIFY_SERVICE_HANDLE  0x1
#define DEVICE_NOTIFY_CALLBACK  0x2
#define DEVICE_NOTIFY_WINDOW_HANDLE  0x0
#define DEVICE_NOTIFY_ALL_INTERFACE_CLASSES  0x4

; REGISTER_TOUCH_WINDOW_FLAGS
#define TWF_FINETOUCH  0x1
#define TWF_WANTPALM  0x2

; REGKIND
#define REGKIND_DEFAULT  0x0
#define REGKIND_REGISTER  0x1
#define REGKIND_NONE  0x2

; REPLACE_FILE_FLAGS
#define REPLACEFILE_WRITE_THROUGH  0x1
#define REPLACEFILE_IGNORE_MERGE_ERRORS  0x2
#define REPLACEFILE_IGNORE_ACL_ERRORS  0x4

; REPORT_EVENT_TYPE
#define EVENTLOG_SUCCESS  0x0
#define EVENTLOG_AUDIT_FAILURE  0x10
#define EVENTLOG_AUDIT_SUCCESS  0x8
#define EVENTLOG_ERROR_TYPE  0x1
#define EVENTLOG_INFORMATION_TYPE  0x4
#define EVENTLOG_WARNING_TYPE  0x2

; REPORT_STORE_TYPES
#define E_STORE_USER_ARCHIVE  0x0
#define E_STORE_USER_QUEUE  0x1
#define E_STORE_MACHINE_ARCHIVE  0x2
#define E_STORE_MACHINE_QUEUE  0x3
#define E_STORE_INVALID  0x4

; RESTRICTIONS
#define REST_NONE  0x0
#define REST_NORUN  0x1
#define REST_NOCLOSE  0x2
#define REST_NOSAVESET  0x4
#define REST_NOFILEMENU  0x8
#define REST_NOSETFOLDERS  0x10
#define REST_NOSETTASKBAR  0x20
#define REST_NODESKTOP  0x40
#define REST_NOFIND  0x80
#define REST_NODRIVES  0x100
#define REST_NODRIVEAUTORUN  0x200
#define REST_NODRIVETYPEAUTORUN  0x400
#define REST_NONETHOOD  0x800
#define REST_STARTBANNER  0x1000
#define REST_RESTRICTRUN  0x2000
#define REST_NOPRINTERTABS  0x4000
#define REST_NOPRINTERDELETE  0x8000
#define REST_NOPRINTERADD  0x10000
#define REST_NOSTARTMENUSUBFOLDERS  0x20000
#define REST_MYDOCSONNET  0x40000
#define REST_NOEXITTODOS  0x80000
#define REST_ENFORCESHELLEXTSECURITY  0x100000
#define REST_LINKRESOLVEIGNORELINKINFO  0x200000
#define REST_NOCOMMONGROUPS  0x400000
#define REST_SEPARATEDESKTOPPROCESS  0x800000
#define REST_NOWEB  0x1000000
#define REST_NOTRAYCONTEXTMENU  0x2000000
#define REST_NOVIEWCONTEXTMENU  0x4000000
#define REST_NONETCONNECTDISCONNECT  0x8000000
#define REST_STARTMENULOGOFF  0x10000000
#define REST_NOSETTINGSASSIST  0x20000000
#define REST_NOINTERNETICON  0x40000001
#define REST_NORECENTDOCSHISTORY  0x40000002
#define REST_NORECENTDOCSMENU  0x40000003
#define REST_NOACTIVEDESKTOP  0x40000004
#define REST_NOACTIVEDESKTOPCHANGES  0x40000005
#define REST_NOFAVORITESMENU  0x40000006
#define REST_CLEARRECENTDOCSONEXIT  0x40000007
#define REST_CLASSICSHELL  0x40000008
#define REST_NOCUSTOMIZEWEBVIEW  0x40000009
#define REST_NOHTMLWALLPAPER  0x40000010
#define REST_NOCHANGINGWALLPAPER  0x40000011
#define REST_NODESKCOMP  0x40000012
#define REST_NOADDDESKCOMP  0x40000013
#define REST_NODELDESKCOMP  0x40000014
#define REST_NOCLOSEDESKCOMP  0x40000015
#define REST_NOCLOSE_DRAGDROPBAND  0x40000016
#define REST_NOMOVINGBAND  0x40000017
#define REST_NOEDITDESKCOMP  0x40000018
#define REST_NORESOLVESEARCH  0x40000019
#define REST_NORESOLVETRACK  0x4000001a
#define REST_FORCECOPYACLWITHFILE  0x4000001b
#define REST_NOFORGETSOFTWAREUPDATE  0x4000001d
#define REST_NOSETACTIVEDESKTOP  0x4000001e
#define REST_NOUPDATEWINDOWS  0x4000001f
#define REST_NOCHANGESTARMENU  0x40000020
#define REST_NOFOLDEROPTIONS  0x40000021
#define REST_HASFINDCOMPUTERS  0x40000022
#define REST_INTELLIMENUS  0x40000023
#define REST_RUNDLGMEMCHECKBOX  0x40000024
#define REST_ARP_ShowPostSetup  0x40000025
#define REST_NOCSC  0x40000026
#define REST_NOCONTROLPANEL  0x40000027
#define REST_ENUMWORKGROUP  0x40000028
#define REST_ARP_NOARP  0x40000029
#define REST_ARP_NOREMOVEPAGE  0x4000002a
#define REST_ARP_NOADDPAGE  0x4000002b
#define REST_ARP_NOWINSETUPPAGE  0x4000002c
#define REST_GREYMSIADS  0x4000002d
#define REST_NOCHANGEMAPPEDDRIVELABEL  0x4000002e
#define REST_NOCHANGEMAPPEDDRIVECOMMENT  0x4000002f
#define REST_MaxRecentDocs  0x40000030
#define REST_NONETWORKCONNECTIONS  0x40000031
#define REST_FORCESTARTMENULOGOFF  0x40000032
#define REST_NOWEBVIEW  0x40000033
#define REST_NOCUSTOMIZETHISFOLDER  0x40000034
#define REST_NOENCRYPTION  0x40000035
#define REST_DONTSHOWSUPERHIDDEN  0x40000037
#define REST_NOSHELLSEARCHBUTTON  0x40000038
#define REST_NOHARDWARETAB  0x40000039
#define REST_NORUNASINSTALLPROMPT  0x4000003a
#define REST_PROMPTRUNASINSTALLNETPATH  0x4000003b
#define REST_NOMANAGEMYCOMPUTERVERB  0x4000003c
#define REST_DISALLOWRUN  0x4000003e
#define REST_NOWELCOMESCREEN  0x4000003f
#define REST_RESTRICTCPL  0x40000040
#define REST_DISALLOWCPL  0x40000041
#define REST_NOSMBALLOONTIP  0x40000042
#define REST_NOSMHELP  0x40000043
#define REST_NOWINKEYS  0x40000044
#define REST_NOENCRYPTONMOVE  0x40000045
#define REST_NOLOCALMACHINERUN  0x40000046
#define REST_NOCURRENTUSERRUN  0x40000047
#define REST_NOLOCALMACHINERUNONCE  0x40000048
#define REST_NOCURRENTUSERRUNONCE  0x40000049
#define REST_FORCEACTIVEDESKTOPON  0x4000004a
#define REST_NOVIEWONDRIVE  0x4000004c
#define REST_NONETCRAWL  0x4000004d
#define REST_NOSHAREDDOCUMENTS  0x4000004e
#define REST_NOSMMYDOCS  0x4000004f
#define REST_NOSMMYPICS  0x40000050
#define REST_ALLOWBITBUCKDRIVES  0x40000051
#define REST_NONLEGACYSHELLMODE  0x40000052
#define REST_NOCONTROLPANELBARRICADE  0x40000053
#define REST_NOSTARTPAGE  0x40000054
#define REST_NOAUTOTRAYNOTIFY  0x40000055
#define REST_NOTASKGROUPING  0x40000056
#define REST_NOCDBURNING  0x40000057
#define REST_MYCOMPNOPROP  0x40000058
#define REST_MYDOCSNOPROP  0x40000059
#define REST_NOSTARTPANEL  0x4000005a
#define REST_NODISPLAYAPPEARANCEPAGE  0x4000005b
#define REST_NOTHEMESTAB  0x4000005c
#define REST_NOVISUALSTYLECHOICE  0x4000005d
#define REST_NOSIZECHOICE  0x4000005e
#define REST_NOCOLORCHOICE  0x4000005f
#define REST_SETVISUALSTYLE  0x40000060
#define REST_STARTRUNNOHOMEPATH  0x40000061
#define REST_NOUSERNAMEINSTARTPANEL  0x40000062
#define REST_NOMYCOMPUTERICON  0x40000063
#define REST_NOSMNETWORKPLACES  0x40000064
#define REST_NOSMPINNEDLIST  0x40000065
#define REST_NOSMMYMUSIC  0x40000066
#define REST_NOSMEJECTPC  0x40000067
#define REST_NOSMMOREPROGRAMS  0x40000068
#define REST_NOSMMFUPROGRAMS  0x40000069
#define REST_NOTRAYITEMSDISPLAY  0x4000006a
#define REST_NOTOOLBARSONTASKBAR  0x4000006b
#define REST_NOSMCONFIGUREPROGRAMS  0x4000006f
#define REST_HIDECLOCK  0x40000070
#define REST_NOLOWDISKSPACECHECKS  0x40000071
#define REST_NOENTIRENETWORK  0x40000072
#define REST_NODESKTOPCLEANUP  0x40000073
#define REST_BITBUCKNUKEONDELETE  0x40000074
#define REST_BITBUCKCONFIRMDELETE  0x40000075
#define REST_BITBUCKNOPROP  0x40000076
#define REST_NODISPBACKGROUND  0x40000077
#define REST_NODISPSCREENSAVEPG  0x40000078
#define REST_NODISPSETTINGSPG  0x40000079
#define REST_NODISPSCREENSAVEPREVIEW  0x4000007a
#define REST_NODISPLAYCPL  0x4000007b
#define REST_HIDERUNASVERB  0x4000007c
#define REST_NOTHUMBNAILCACHE  0x4000007d
#define REST_NOSTRCMPLOGICAL  0x4000007e
#define REST_NOPUBLISHWIZARD  0x4000007f
#define REST_NOONLINEPRINTSWIZARD  0x40000080
#define REST_NOWEBSERVICES  0x40000081
#define REST_ALLOWUNHASHEDWEBVIEW  0x40000082
#define REST_ALLOWLEGACYWEBVIEW  0x40000083
#define REST_REVERTWEBVIEWSECURITY  0x40000084
#define REST_INHERITCONSOLEHANDLES  0x40000086
#define REST_NOREMOTERECURSIVEEVENTS  0x40000089
#define REST_NOREMOTECHANGENOTIFY  0x40000091
#define REST_NOENUMENTIRENETWORK  0x40000093
#define REST_NOINTERNETOPENWITH  0x40000095
#define REST_DONTRETRYBADNETNAME  0x4000009b

; RGN_COMBINE_MODE
#define RGN_AND  0x1
#define RGN_OR  0x2
#define RGN_XOR  0x3
#define RGN_DIFF  0x4
#define RGN_COPY  0x5
#define RGN_MIN  0x1
#define RGN_MAX  0x5

; RID_DEVICE_INFO_TYPE
#define RIM_TYPEMOUSE  0x0
#define RIM_TYPEKEYBOARD  0x1
#define RIM_TYPEHID  0x2

; RIP_INFO_TYPE
#define SLE_ERROR  0x1
#define SLE_MINORERROR  0x2
#define SLE_WARNING  0x3

; ROP_CODE
#define BLACKNESS  0x42
#define NOTSRCERASE  0x1100a6
#define NOTSRCCOPY  0x330008
#define SRCERASE  0x440328
#define DSTINVERT  0x550009
#define PATINVERT  0x5a0049
#define SRCINVERT  0x660046
#define SRCAND  0x8800c6
#define MERGEPAINT  0xbb0226
#define MERGECOPY  0xc000ca
#define SRCCOPY  0xcc0020
#define SRCPAINT  0xee0086
#define PATCOPY  0xf00021
#define PATPAINT  0xfb0a09
#define WHITENESS  0xff0062
#define CAPTUREBLT  0x40000000
#define NOMIRRORBITMAP  0x80000000

; ROT_FLAGS
#define ROTFLAGS_REGISTRATIONKEEPSALIVE  0x1
#define ROTFLAGS_ALLOWANYCLIENT  0x2

; RotateFlipType
#define RotateNoneFlipNone  0x0
#define Rotate90FlipNone  0x1
#define Rotate180FlipNone  0x2
#define Rotate270FlipNone  0x3
#define RotateNoneFlipX  0x4
#define Rotate90FlipX  0x5
#define Rotate180FlipX  0x6
#define Rotate270FlipX  0x7
#define RotateNoneFlipY  0x6
#define Rotate90FlipY  0x7
#define Rotate180FlipY  0x4
#define Rotate270FlipY  0x5
#define RotateNoneFlipXY  0x2
#define Rotate90FlipXY  0x3
#define Rotate180FlipXY  0x0
#define Rotate270FlipXY  0x1

; RTL_UMS_SCHEDULER_REASON
#define UmsSchedulerStartup  0x0
#define UmsSchedulerThreadBlocked  0x1
#define UmsSchedulerThreadYield  0x2

; SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS
#define SAFER_TOKEN_NULL_IF_EQUAL  0x1
#define SAFER_TOKEN_COMPARE_ONLY  0x2
#define SAFER_TOKEN_MAKE_INERT  0x4
#define SAFER_TOKEN_WANT_FLAGS  0x8

; SAFER_OBJECT_INFO_CLASS
#define SaferObjectLevelId  0x1
#define SaferObjectScopeId  0x2
#define SaferObjectFriendlyName  0x3
#define SaferObjectDescription  0x4
#define SaferObjectBuiltin  0x5
#define SaferObjectDisallowed  0x6
#define SaferObjectDisableMaxPrivilege  0x7
#define SaferObjectInvertDeletedPrivileges  0x8
#define SaferObjectDeletedPrivileges  0x9
#define SaferObjectDefaultOwner  0xa
#define SaferObjectSidsToDisable  0xb
#define SaferObjectRestrictedSidsInverted  0xc
#define SaferObjectRestrictedSidsAdded  0xd
#define SaferObjectAllIdentificationGuids  0xe
#define SaferObjectSingleIdentification  0xf
#define SaferObjectExtendedError  0x10

; SAFER_POLICY_INFO_CLASS
#define SaferPolicyLevelList  0x1
#define SaferPolicyEnableTransparentEnforcement  0x2
#define SaferPolicyDefaultLevel  0x3
#define SaferPolicyEvaluateUserScope  0x4
#define SaferPolicyScopeFlags  0x5
#define SaferPolicyDefaultLevelFlags  0x6
#define SaferPolicyAuthenticodeEnabled  0x7

; SC_ENUM_TYPE
#define SC_ENUM_PROCESS_INFO  0x0

; SC_STATUS_TYPE
#define SC_STATUS_PROCESS_INFO  0x0

; SCNRT_STATUS
#define SCNRT_ENABLE  0x0
#define SCNRT_DISABLE  0x1

; SCROLL_WINDOW_FLAGS
#define SW_SCROLLCHILDREN  0x1
#define SW_INVALIDATE  0x2
#define SW_ERASE  0x4
#define SW_SMOOTHSCROLL  0x10

; SCROLLBAR_CONSTANTS
#define SB_CTL  0x2
#define SB_HORZ  0x0
#define SB_VERT  0x1
#define SB_BOTH  0x3

; SCROLLINFO_MASK
#define SIF_ALL  0x17
#define SIF_DISABLENOSCROLL  0x8
#define SIF_PAGE  0x2
#define SIF_POS  0x4
#define SIF_RANGE  0x1
#define SIF_TRACKPOS  0x10

; SE_OBJECT_TYPE
#define SE_UNKNOWN_OBJECT_TYPE  0x0
#define SE_FILE_OBJECT  0x1
#define SE_SERVICE  0x2
#define SE_PRINTER  0x3
#define SE_REGISTRY_KEY  0x4
#define SE_LMSHARE  0x5
#define SE_KERNEL_OBJECT  0x6
#define SE_WINDOW_OBJECT  0x7
#define SE_DS_OBJECT  0x8
#define SE_DS_OBJECT_ALL  0x9
#define SE_PROVIDER_DEFINED_OBJECT  0xa
#define SE_WMIGUID_OBJECT  0xb
#define SE_REGISTRY_WOW64_32KEY  0xc
#define SE_REGISTRY_WOW64_64KEY  0xd

; SECURITY_AUTO_INHERIT_FLAGS
#define SEF_AVOID_OWNER_CHECK  0x10
#define SEF_AVOID_OWNER_RESTRICTION  0x1000
#define SEF_AVOID_PRIVILEGE_CHECK  0x8
#define SEF_DACL_AUTO_INHERIT  0x1
#define SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT  0x4
#define SEF_DEFAULT_GROUP_FROM_PARENT  0x40
#define SEF_DEFAULT_OWNER_FROM_PARENT  0x20
#define SEF_MACL_NO_EXECUTE_UP  0x400
#define SEF_MACL_NO_READ_UP  0x200
#define SEF_MACL_NO_WRITE_UP  0x100
#define SEF_SACL_AUTO_INHERIT  0x2

; SECURITY_DESCRIPTOR_CONTROL
#define SE_OWNER_DEFAULTED  0x1
#define SE_GROUP_DEFAULTED  0x2
#define SE_DACL_PRESENT  0x4
#define SE_DACL_DEFAULTED  0x8
#define SE_SACL_PRESENT  0x10
#define SE_SACL_DEFAULTED  0x20
#define SE_DACL_AUTO_INHERIT_REQ  0x100
#define SE_SACL_AUTO_INHERIT_REQ  0x200
#define SE_DACL_AUTO_INHERITED  0x400
#define SE_SACL_AUTO_INHERITED  0x800
#define SE_DACL_PROTECTED  0x1000
#define SE_SACL_PROTECTED  0x2000
#define SE_RM_CONTROL_VALID  0x4000
#define SE_SELF_RELATIVE  0x8000

; SECURITY_IMPERSONATION_LEVEL
#define SecurityAnonymous  0x0
#define SecurityIdentification  0x1
#define SecurityImpersonation  0x2
#define SecurityDelegation  0x3

; SEND_MESSAGE_TIMEOUT_FLAGS
#define SMTO_ABORTIFHUNG  0x2
#define SMTO_BLOCK  0x1
#define SMTO_NORMAL  0x0
#define SMTO_NOTIMEOUTIFNOTHUNG  0x8
#define SMTO_ERRORONEXIT  0x20

; SERVICE_CONFIG
#define SERVICE_CONFIG_DELAYED_AUTO_START_INFO  0x3
#define SERVICE_CONFIG_DESCRIPTION  0x1
#define SERVICE_CONFIG_FAILURE_ACTIONS  0x2
#define SERVICE_CONFIG_FAILURE_ACTIONS_FLAG  0x4
#define SERVICE_CONFIG_PREFERRED_NODE  0x9
#define SERVICE_CONFIG_PRESHUTDOWN_INFO  0x7
#define SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO  0x6
#define SERVICE_CONFIG_SERVICE_SID_INFO  0x5
#define SERVICE_CONFIG_TRIGGER_INFO  0x8
#define SERVICE_CONFIG_LAUNCH_PROTECTED  0xc

; SERVICE_ERROR
#define SERVICE_ERROR_CRITICAL  0x3
#define SERVICE_ERROR_IGNORE  0x0
#define SERVICE_ERROR_NORMAL  0x1
#define SERVICE_ERROR_SEVERE  0x2
#define SERVICE_NO_CHANGE  0xffffffff

; SERVICE_NOTIFY
#define SERVICE_NOTIFY_CREATED  0x80
#define SERVICE_NOTIFY_CONTINUE_PENDING  0x10
#define SERVICE_NOTIFY_DELETE_PENDING  0x200
#define SERVICE_NOTIFY_DELETED  0x100
#define SERVICE_NOTIFY_PAUSE_PENDING  0x20
#define SERVICE_NOTIFY_PAUSED  0x40
#define SERVICE_NOTIFY_RUNNING  0x8
#define SERVICE_NOTIFY_START_PENDING  0x2
#define SERVICE_NOTIFY_STOP_PENDING  0x4
#define SERVICE_NOTIFY_STOPPED  0x1

; SERVICE_RUNS_IN_PROCESS
#define SERVICE_RUNS_IN_NON_SYSTEM_OR_NOT_RUNNING  0x0
#define SERVICE_RUNS_IN_SYSTEM_PROCESS  0x1

; SERVICE_START_TYPE
#define SERVICE_AUTO_START  0x2
#define SERVICE_BOOT_START  0x0
#define SERVICE_DEMAND_START  0x3
#define SERVICE_DISABLED  0x4
#define SERVICE_SYSTEM_START  0x1
#define SERVICE_NO_CHANGE  0xffffffff

; SERVICE_STATUS_CURRENT_STATE
#define SERVICE_CONTINUE_PENDING  0x5
#define SERVICE_PAUSE_PENDING  0x6
#define SERVICE_PAUSED  0x7
#define SERVICE_RUNNING  0x4
#define SERVICE_START_PENDING  0x2
#define SERVICE_STOP_PENDING  0x3
#define SERVICE_STOPPED  0x1

; SET_BOUNDS_RECT_FLAGS
#define DCB_ACCUMULATE  0x2
#define DCB_DISABLE  0x8
#define DCB_ENABLE  0x4
#define DCB_RESET  0x1

; SET_COMPOSITION_STRING_TYPE
#define SCS_SETSTR  0x9
#define SCS_CHANGEATTR  0x12
#define SCS_CHANGECLAUSE  0x24
#define SCS_SETRECONVERTSTRING  0x10000
#define SCS_QUERYRECONVERTSTRING  0x20000

; SET_DISPLAY_CONFIG_FLAGS
#define SDC_USE_DATABASE_CURRENT  0xf
#define SDC_TOPOLOGY_INTERNAL  0x1
#define SDC_TOPOLOGY_CLONE  0x2
#define SDC_TOPOLOGY_EXTEND  0x4
#define SDC_TOPOLOGY_EXTERNAL  0x8
#define SDC_TOPOLOGY_SUPPLIED  0x10
#define SDC_USE_SUPPLIED_DISPLAY_CONFIG  0x20
#define SDC_VALIDATE  0x40
#define SDC_APPLY  0x80
#define SDC_NO_OPTIMIZATION  0x100
#define SDC_SAVE_TO_DATABASE  0x200
#define SDC_ALLOW_CHANGES  0x400
#define SDC_PATH_PERSIST_IF_REQUIRED  0x800
#define SDC_FORCE_MODE_ENUMERATION  0x1000
#define SDC_ALLOW_PATH_ORDER_CHANGES  0x2000
#define SDC_VIRTUAL_MODE_AWARE  0x8000
#define SDC_VIRTUAL_REFRESH_RATE_AWARE  0x20000

; SET_FILE_POINTER_MOVE_METHOD
#define FILE_BEGIN  0x0
#define FILE_CURRENT  0x1
#define FILE_END  0x2

; SET_THEME_APP_PROPERTIES_FLAGS
#define ALLOW_NONCLIENT  0x1
#define ALLOW_CONTROLS  0x2
#define ALLOW_WEBCONTENT  0x4
#define VALIDBITS  0x7

; SET_WINDOW_POS_FLAGS
#define SWP_ASYNCWINDOWPOS  0x4000
#define SWP_DEFERERASE  0x2000
#define SWP_DRAWFRAME  0x20
#define SWP_FRAMECHANGED  0x20
#define SWP_HIDEWINDOW  0x80
#define SWP_NOACTIVATE  0x10
#define SWP_NOCOPYBITS  0x100
#define SWP_NOMOVE  0x2
#define SWP_NOOWNERZORDER  0x200
#define SWP_NOREDRAW  0x8
#define SWP_NOREPOSITION  0x200
#define SWP_NOSENDCHANGING  0x400
#define SWP_NOSIZE  0x1
#define SWP_NOZORDER  0x4
#define SWP_SHOWWINDOW  0x40

; SETPROCESSWORKINGSETSIZEEX_FLAGS
#define QUOTA_LIMITS_HARDWS_MIN_ENABLE  0x1
#define QUOTA_LIMITS_HARDWS_MIN_DISABLE  0x2
#define QUOTA_LIMITS_HARDWS_MAX_ENABLE  0x4
#define QUOTA_LIMITS_HARDWS_MAX_DISABLE  0x8

; SETTINGSTATUS
#define RSOPUnspecified  0x0
#define RSOPApplied  0x1
#define RSOPIgnored  0x2
#define RSOPFailed  0x3
#define RSOPSubsettingFailed  0x4

; SFGAO_FLAGS
#define SFGAO_CANCOPY  0x1
#define SFGAO_CANMOVE  0x2
#define SFGAO_CANLINK  0x4
#define SFGAO_STORAGE  0x8
#define SFGAO_CANRENAME  0x10
#define SFGAO_CANDELETE  0x20
#define SFGAO_HASPROPSHEET  0x40
#define SFGAO_DROPTARGET  0x100
#define SFGAO_CAPABILITYMASK  0x177
#define SFGAO_PLACEHOLDER  0x800
#define SFGAO_SYSTEM  0x1000
#define SFGAO_ENCRYPTED  0x2000
#define SFGAO_ISSLOW  0x4000
#define SFGAO_GHOSTED  0x8000
#define SFGAO_LINK  0x10000
#define SFGAO_SHARE  0x20000
#define SFGAO_READONLY  0x40000
#define SFGAO_HIDDEN  0x80000
#define SFGAO_DISPLAYATTRMASK  0xfc000
#define SFGAO_FILESYSANCESTOR  0x10000000
#define SFGAO_FOLDER  0x20000000
#define SFGAO_FILESYSTEM  0x40000000
#define SFGAO_HASSUBFOLDER  0x80000000
#define SFGAO_CONTENTSMASK  0x80000000
#define SFGAO_VALIDATE  0x1000000
#define SFGAO_REMOVABLE  0x2000000
#define SFGAO_COMPRESSED  0x4000000
#define SFGAO_BROWSABLE  0x8000000
#define SFGAO_NONENUMERATED  0x100000
#define SFGAO_NEWCONTENT  0x200000
#define SFGAO_CANMONIKER  0x400000
#define SFGAO_HASSTORAGE  0x400000
#define SFGAO_STREAM  0x400000
#define SFGAO_STORAGEANCESTOR  0x800000
#define SFGAO_STORAGECAPMASK  0x70c50008
#define SFGAO_PKEYSFGAOMASK  0x81044000

; SHCNE_ID
#define SHCNE_RENAMEITEM  0x1
#define SHCNE_CREATE  0x2
#define SHCNE_DELETE  0x4
#define SHCNE_MKDIR  0x8
#define SHCNE_RMDIR  0x10
#define SHCNE_MEDIAINSERTED  0x20
#define SHCNE_MEDIAREMOVED  0x40
#define SHCNE_DRIVEREMOVED  0x80
#define SHCNE_DRIVEADD  0x100
#define SHCNE_NETSHARE  0x200
#define SHCNE_NETUNSHARE  0x400
#define SHCNE_ATTRIBUTES  0x800
#define SHCNE_UPDATEDIR  0x1000
#define SHCNE_UPDATEITEM  0x2000
#define SHCNE_SERVERDISCONNECT  0x4000
#define SHCNE_UPDATEIMAGE  0x8000
#define SHCNE_DRIVEADDGUI  0x10000
#define SHCNE_RENAMEFOLDER  0x20000
#define SHCNE_FREESPACE  0x40000
#define SHCNE_EXTENDED_EVENT  0x4000000
#define SHCNE_ASSOCCHANGED  0x8000000
#define SHCNE_DISKEVENTS  0x2381f
#define SHCNE_GLOBALEVENTS  0xc0581e0
#define SHCNE_ALLEVENTS  0x7fffffff
#define SHCNE_INTERRUPT  0x80000000

; SHCNF_FLAGS
#define SHCNF_IDLIST  0x0
#define SHCNF_PATHA  0x1
#define SHCNF_PRINTERA  0x2
#define SHCNF_DWORD  0x3
#define SHCNF_PATHW  0x5
#define SHCNF_PRINTERW  0x6
#define SHCNF_TYPE  0xff
#define SHCNF_FLUSH  0x1000
#define SHCNF_FLUSHNOWAIT  0x3000
#define SHCNF_NOTIFYRECURSIVE  0x10000
#define SHCNF_PATH  0x5
#define SHCNF_PRINTER  0x6

; SHCNRF_SOURCE
#define SHCNRF_InterruptLevel  0x1
#define SHCNRF_ShellLevel  0x2
#define SHCNRF_RecursiveInterrupt  0x1000
#define SHCNRF_NewDelivery  0x8000

; SHFMT_ID
#define SHFMT_ID_DEFAULT  0xffff

; SHFMT_OPT
#define SHFMT_OPT_NONE  0x0
#define SHFMT_OPT_FULL  0x1
#define SHFMT_OPT_SYSONLY  0x2

; SHGDFIL_FORMAT
#define SHGDFIL_FINDDATA  0x1
#define SHGDFIL_NETRESOURCE  0x2
#define SHGDFIL_DESCRIPTIONID  0x3

; SHGDNF
#define SHGDN_NORMAL  0x0
#define SHGDN_INFOLDER  0x1
#define SHGDN_FOREDITING  0x1000
#define SHGDN_FORADDRESSBAR  0x4000
#define SHGDN_FORPARSING  0x8000

; SHOP_TYPE
#define SHOP_PRINTERNAME  0x1
#define SHOP_FILEPATH  0x2
#define SHOP_VOLUMEGUID  0x4

; SHOW_WINDOW_CMD
#define SW_HIDE  0x0
#define SW_SHOWNORMAL  0x1
#define SW_NORMAL  0x1
#define SW_SHOWMINIMIZED  0x2
#define SW_SHOWMAXIMIZED  0x3
#define SW_MAXIMIZE  0x3
#define SW_SHOWNOACTIVATE  0x4
#define SW_SHOW  0x5
#define SW_MINIMIZE  0x6
#define SW_SHOWMINNOACTIVE  0x7
#define SW_SHOWNA  0x8
#define SW_RESTORE  0x9
#define SW_SHOWDEFAULT  0xa
#define SW_FORCEMINIMIZE  0xb
#define SW_MAX  0xb

; SHUTDOWN_FLAGS
#define SHUTDOWN_FORCE_OTHERS  0x1
#define SHUTDOWN_FORCE_SELF  0x2
#define SHUTDOWN_RESTART  0x4
#define SHUTDOWN_POWEROFF  0x8
#define SHUTDOWN_NOREBOOT  0x10
#define SHUTDOWN_GRACE_OVERRIDE  0x20
#define SHUTDOWN_INSTALL_UPDATES  0x40
#define SHUTDOWN_RESTARTAPPS  0x80
#define SHUTDOWN_SKIP_SVC_PRESHUTDOWN  0x100
#define SHUTDOWN_HYBRID  0x200
#define SHUTDOWN_RESTART_BOOTOPTIONS  0x400
#define SHUTDOWN_SOFT_REBOOT  0x800
#define SHUTDOWN_MOBILE_UI  0x1000
#define SHUTDOWN_ARSO  0x2000
#define SHUTDOWN_CHECK_SAFE_FOR_SERVER  0x4000
#define SHUTDOWN_VAIL_CONTAINER  0x8000
#define SHUTDOWN_SYSTEM_INITIATED  0x10000

; SHUTDOWN_REASON
#define SHTDN_REASON_NONE  0x0
#define SHTDN_REASON_FLAG_COMMENT_REQUIRED  0x1000000
#define SHTDN_REASON_FLAG_DIRTY_PROBLEM_ID_REQUIRED  0x2000000
#define SHTDN_REASON_FLAG_CLEAN_UI  0x4000000
#define SHTDN_REASON_FLAG_DIRTY_UI  0x8000000
#define SHTDN_REASON_FLAG_MOBILE_UI_RESERVED  0x10000000
#define SHTDN_REASON_FLAG_USER_DEFINED  0x40000000
#define SHTDN_REASON_FLAG_PLANNED  0x80000000
#define SHTDN_REASON_MAJOR_OTHER  0x0
#define SHTDN_REASON_MAJOR_NONE  0x0
#define SHTDN_REASON_MAJOR_HARDWARE  0x10000
#define SHTDN_REASON_MAJOR_OPERATINGSYSTEM  0x20000
#define SHTDN_REASON_MAJOR_SOFTWARE  0x30000
#define SHTDN_REASON_MAJOR_APPLICATION  0x40000
#define SHTDN_REASON_MAJOR_SYSTEM  0x50000
#define SHTDN_REASON_MAJOR_POWER  0x60000
#define SHTDN_REASON_MAJOR_LEGACY_API  0x70000
#define SHTDN_REASON_MINOR_OTHER  0x0
#define SHTDN_REASON_MINOR_NONE  0xff
#define SHTDN_REASON_MINOR_MAINTENANCE  0x1
#define SHTDN_REASON_MINOR_INSTALLATION  0x2
#define SHTDN_REASON_MINOR_UPGRADE  0x3
#define SHTDN_REASON_MINOR_RECONFIG  0x4
#define SHTDN_REASON_MINOR_HUNG  0x5
#define SHTDN_REASON_MINOR_UNSTABLE  0x6
#define SHTDN_REASON_MINOR_DISK  0x7
#define SHTDN_REASON_MINOR_PROCESSOR  0x8
#define SHTDN_REASON_MINOR_NETWORKCARD  0x9
#define SHTDN_REASON_MINOR_POWER_SUPPLY  0xa
#define SHTDN_REASON_MINOR_CORDUNPLUGGED  0xb
#define SHTDN_REASON_MINOR_ENVIRONMENT  0xc
#define SHTDN_REASON_MINOR_HARDWARE_DRIVER  0xd
#define SHTDN_REASON_MINOR_OTHERDRIVER  0xe
#define SHTDN_REASON_MINOR_BLUESCREEN  0xf
#define SHTDN_REASON_MINOR_SERVICEPACK  0x10
#define SHTDN_REASON_MINOR_HOTFIX  0x11
#define SHTDN_REASON_MINOR_SECURITYFIX  0x12
#define SHTDN_REASON_MINOR_SECURITY  0x13
#define SHTDN_REASON_MINOR_NETWORK_CONNECTIVITY  0x14
#define SHTDN_REASON_MINOR_WMI  0x15
#define SHTDN_REASON_MINOR_SERVICEPACK_UNINSTALL  0x16
#define SHTDN_REASON_MINOR_HOTFIX_UNINSTALL  0x17
#define SHTDN_REASON_MINOR_SECURITYFIX_UNINSTALL  0x18
#define SHTDN_REASON_MINOR_MMC  0x19
#define SHTDN_REASON_MINOR_SYSTEMRESTORE  0x1a
#define SHTDN_REASON_MINOR_TERMSRV  0x20
#define SHTDN_REASON_MINOR_DC_PROMOTION  0x21
#define SHTDN_REASON_MINOR_DC_DEMOTION  0x22
#define SHTDN_REASON_UNKNOWN  0xff
#define SHTDN_REASON_LEGACY_API  0x80070000
#define SHTDN_REASON_VALID_BIT_MASK  0xc0ffffff

; SIATTRIBFLAGS
#define SIATTRIBFLAGS_AND  0x1
#define SIATTRIBFLAGS_OR  0x2
#define SIATTRIBFLAGS_APPCOMPAT  0x3
#define SIATTRIBFLAGS_MASK  0x3
#define SIATTRIBFLAGS_ALLITEMS  0x4000

; SID_NAME_USE
#define SidTypeUser  0x1
#define SidTypeGroup  0x2
#define SidTypeDomain  0x3
#define SidTypeAlias  0x4
#define SidTypeWellKnownGroup  0x5
#define SidTypeDeletedAccount  0x6
#define SidTypeInvalid  0x7
#define SidTypeUnknown  0x8
#define SidTypeComputer  0x9
#define SidTypeLabel  0xa
#define SidTypeLogonSession  0xb

; SIGDN
#define SIGDN_NORMALDISPLAY  0x0
#define SIGDN_PARENTRELATIVEPARSING  -2147385343
#define SIGDN_DESKTOPABSOLUTEPARSING  -2147319808
#define SIGDN_PARENTRELATIVEEDITING  -2147282943
#define SIGDN_DESKTOPABSOLUTEEDITING  -2147172352
#define SIGDN_FILESYSPATH  -2147123200
#define SIGDN_URL  -2147057664
#define SIGDN_PARENTRELATIVEFORADDRESSBAR  -2146975743
#define SIGDN_PARENTRELATIVE  -2146959359
#define SIGDN_PARENTRELATIVEFORUI  -2146877439

; SmoothingMode
#define SmoothingModeInvalid  -1
#define SmoothingModeDefault  0x0
#define SmoothingModeHighSpeed  0x1
#define SmoothingModeHighQuality  0x2
#define SmoothingModeNone  0x3
#define SmoothingModeAntiAlias  0x4
#define SmoothingModeAntiAlias8x4  0x4
#define SmoothingModeAntiAlias8x8  0x5

; SND_FLAGS
#define SND_APPLICATION  0x80
#define SND_ALIAS  0x10000
#define SND_ALIAS_ID  0x110000
#define SND_FILENAME  0x20000
#define SND_RESOURCE  0x40004
#define SND_ASYNC  0x1
#define SND_NODEFAULT  0x2
#define SND_LOOP  0x8
#define SND_MEMORY  0x4
#define SND_NOSTOP  0x10
#define SND_NOWAIT  0x2000
#define SND_PURGE  0x40
#define SND_SENTRY  0x80000
#define SND_SYNC  0x0
#define SND_SYSTEM  0x200000

; SPACTION
#define SPACTION_NONE  0x0
#define SPACTION_MOVING  0x1
#define SPACTION_COPYING  0x2
#define SPACTION_RECYCLING  0x3
#define SPACTION_APPLYINGATTRIBS  0x4
#define SPACTION_DOWNLOADING  0x5
#define SPACTION_SEARCHING_INTERNET  0x6
#define SPACTION_CALCULATING  0x7
#define SPACTION_UPLOADING  0x8
#define SPACTION_SEARCHING_FILES  0x9
#define SPACTION_DELETING  0xa
#define SPACTION_RENAMING  0xb
#define SPACTION_FORMATTING  0xc
#define SPACTION_COPY_MOVING  0xd

; SSF_MASK
#define SSF_SHOWALLOBJECTS  0x1
#define SSF_SHOWEXTENSIONS  0x2
#define SSF_HIDDENFILEEXTS  0x4
#define SSF_SERVERADMINUI  0x4
#define SSF_SHOWCOMPCOLOR  0x8
#define SSF_SORTCOLUMNS  0x10
#define SSF_SHOWSYSFILES  0x20
#define SSF_DOUBLECLICKINWEBVIEW  0x80
#define SSF_SHOWATTRIBCOL  0x100
#define SSF_DESKTOPHTML  0x200
#define SSF_WIN95CLASSIC  0x400
#define SSF_DONTPRETTYPATH  0x800
#define SSF_SHOWINFOTIP  0x2000
#define SSF_MAPNETDRVBUTTON  0x1000
#define SSF_NOCONFIRMRECYCLE  0x8000
#define SSF_HIDEICONS  0x4000
#define SSF_FILTER  0x10000
#define SSF_WEBVIEW  0x20000
#define SSF_SHOWSUPERHIDDEN  0x40000
#define SSF_SEPPROCESS  0x80000
#define SSF_NONETCRAWLING  0x100000
#define SSF_STARTPANELON  0x200000
#define SSF_SHOWSTARTPAGE  0x400000
#define SSF_AUTOCHECKSELECT  0x800000
#define SSF_ICONSONLY  0x1000000
#define SSF_SHOWTYPEOVERLAY  0x2000000
#define SSF_SHOWSTATUSBAR  0x4000000

; STARTUPINFOW_FLAGS
#define STARTF_FORCEONFEEDBACK  0x40
#define STARTF_FORCEOFFFEEDBACK  0x80
#define STARTF_PREVENTPINNING  0x2000
#define STARTF_RUNFULLSCREEN  0x20
#define STARTF_TITLEISAPPID  0x1000
#define STARTF_TITLEISLINKNAME  0x800
#define STARTF_UNTRUSTEDSOURCE  0x8000
#define STARTF_USECOUNTCHARS  0x8
#define STARTF_USEFILLATTRIBUTE  0x10
#define STARTF_USEHOTKEY  0x200
#define STARTF_USEPOSITION  0x4
#define STARTF_USESHOWWINDOW  0x1
#define STARTF_USESIZE  0x2
#define STARTF_USESTDHANDLES  0x100

; Status
#define Ok  0x0
#define GenericError  0x1
#define InvalidParameter  0x2
#define OutOfMemory  0x3
#define ObjectBusy  0x4
#define InsufficientBuffer  0x5
#define NotImplemented  0x6
#define Win32Error  0x7
#define WrongState  0x8
#define Aborted  0x9
#define FileNotFound  0xa
#define ValueOverflow  0xb
#define AccessDenied  0xc
#define UnknownImageFormat  0xd
#define FontFamilyNotFound  0xe
#define FontStyleNotFound  0xf
#define NotTrueTypeFont  0x10
#define UnsupportedGdiplusVersion  0x11
#define GdiplusNotInitialized  0x12
#define PropertyNotFound  0x13
#define PropertyNotSupported  0x14
#define ProfileNotFound  0x15

; STD_HANDLE
#define STD_INPUT_HANDLE  0xfffffff6
#define STD_OUTPUT_HANDLE  0xfffffff5
#define STD_ERROR_HANDLE  0xfffffff4

; STGFMT
#define STGFMT_STORAGE  0x0
#define STGFMT_NATIVE  0x1
#define STGFMT_FILE  0x3
#define STGFMT_ANY  0x4
#define STGFMT_DOCFILE  0x5
#define STGFMT_DOCUMENT  0x0

; STGM
#define STGM_DIRECT  0x0
#define STGM_TRANSACTED  0x10000
#define STGM_SIMPLE  0x8000000
#define STGM_READ  0x0
#define STGM_WRITE  0x1
#define STGM_READWRITE  0x2
#define STGM_SHARE_DENY_NONE  0x40
#define STGM_SHARE_DENY_READ  0x30
#define STGM_SHARE_DENY_WRITE  0x20
#define STGM_SHARE_EXCLUSIVE  0x10
#define STGM_PRIORITY  0x40000
#define STGM_DELETEONRELEASE  0x4000000
#define STGM_NOSCRATCH  0x100000
#define STGM_CREATE  0x1000
#define STGM_CONVERT  0x20000
#define STGM_FAILIFTHERE  0x0
#define STGM_NOSNAPSHOT  0x200000
#define STGM_DIRECT_SWMR  0x400000

; STREAM_INFO_LEVELS
#define FindStreamInfoStandard  0x0
#define FindStreamInfoMaxInfoLevel  0x1

; STRETCH_BLT_MODE
#define BLACKONWHITE  0x1
#define COLORONCOLOR  0x3
#define HALFTONE  0x4
#define STRETCH_ANDSCANS  0x1
#define STRETCH_DELETESCANS  0x3
#define STRETCH_HALFTONE  0x4
#define STRETCH_ORSCANS  0x2
#define WHITEONBLACK  0x2

; StringAlignment
#define StringAlignmentNear  0x0
#define StringAlignmentCenter  0x1
#define StringAlignmentFar  0x2

; StringDigitSubstitute
#define StringDigitSubstituteUser  0x0
#define StringDigitSubstituteNone  0x1
#define StringDigitSubstituteNational  0x2
#define StringDigitSubstituteTraditional  0x3

; StringTrimming
#define StringTrimmingNone  0x0
#define StringTrimmingCharacter  0x1
#define StringTrimmingWord  0x2
#define StringTrimmingEllipsisCharacter  0x3
#define StringTrimmingEllipsisWord  0x4
#define StringTrimmingEllipsisPath  0x5

; SYM_FIND_ID_OPTION
#define SSRVOPT_DWORD  0x2
#define SSRVOPT_DWORDPTR  0x4
#define SSRVOPT_GUIDPTR  0x8

; SYM_LOAD_FLAGS
#define SLMFLAG_NONE  0x0
#define SLMFLAG_VIRTUAL  0x1
#define SLMFLAG_ALT_INDEX  0x2
#define SLMFLAG_NO_SYMBOLS  0x4

; SYM_SRV_STORE_FILE_FLAGS
#define SYMSTOREOPT_COMPRESS  0x1
#define SYMSTOREOPT_OVERWRITE  0x2
#define SYMSTOREOPT_PASS_IF_EXISTS  0x40
#define SYMSTOREOPT_POINTER  0x8
#define SYMSTOREOPT_RETURNINDEX  0x4

; SYM_TYPE
#define SymNone  0x0
#define SymCoff  0x1
#define SymCv  0x2
#define SymPdb  0x3
#define SymExport  0x4
#define SymDeferred  0x5
#define SymSym  0x6
#define SymDia  0x7
#define SymVirtual  0x8
#define NumSymTypes  0x9

; SYMBOL_INFO_FLAGS
#define SYMFLAG_CLR_TOKEN  0x40000
#define SYMFLAG_CONSTANT  0x100
#define SYMFLAG_EXPORT  0x200
#define SYMFLAG_FORWARDER  0x400
#define SYMFLAG_FRAMEREL  0x20
#define SYMFLAG_FUNCTION  0x800
#define SYMFLAG_ILREL  0x10000
#define SYMFLAG_LOCAL  0x80
#define SYMFLAG_METADATA  0x20000
#define SYMFLAG_PARAMETER  0x40
#define SYMFLAG_REGISTER  0x8
#define SYMFLAG_REGREL  0x10
#define SYMFLAG_SLOT  0x8000
#define SYMFLAG_THUNK  0x2000
#define SYMFLAG_TLSREL  0x4000
#define SYMFLAG_VALUEPRESENT  0x1
#define SYMFLAG_VIRTUAL  0x1000

; SYMBOLIC_LINK_FLAGS
#define SYMBOLIC_LINK_FLAG_DIRECTORY  0x1
#define SYMBOLIC_LINK_FLAG_ALLOW_UNPRIVILEGED_CREATE  0x2

; SYNCHRONIZATION_ACCESS_RIGHTS
#define EVENT_ALL_ACCESS  0x1f0003
#define EVENT_MODIFY_STATE  0x2
#define MUTEX_ALL_ACCESS  0x1f0001
#define MUTEX_MODIFY_STATE  0x1
#define SEMAPHORE_ALL_ACCESS  0x1f0003
#define SEMAPHORE_MODIFY_STATE  0x2
#define TIMER_ALL_ACCESS  0x1f0003
#define TIMER_MODIFY_STATE  0x2
#define TIMER_QUERY_STATE  0x1
#define SYNCHRONIZATION_DELETE  0x10000
#define SYNCHRONIZATION_READ_CONTROL  0x20000
#define SYNCHRONIZATION_WRITE_DAC  0x40000
#define SYNCHRONIZATION_WRITE_OWNER  0x80000
#define SYNCHRONIZATION_SYNCHRONIZE  0x100000

; SYS_COLOR_INDEX
#define COLOR_SCROLLBAR  0x0
#define COLOR_BACKGROUND  0x1
#define COLOR_ACTIVECAPTION  0x2
#define COLOR_INACTIVECAPTION  0x3
#define COLOR_MENU  0x4
#define COLOR_WINDOW  0x5
#define COLOR_WINDOWFRAME  0x6
#define COLOR_MENUTEXT  0x7
#define COLOR_WINDOWTEXT  0x8
#define COLOR_CAPTIONTEXT  0x9
#define COLOR_ACTIVEBORDER  0xa
#define COLOR_INACTIVEBORDER  0xb
#define COLOR_APPWORKSPACE  0xc
#define COLOR_HIGHLIGHT  0xd
#define COLOR_HIGHLIGHTTEXT  0xe
#define COLOR_BTNFACE  0xf
#define COLOR_BTNSHADOW  0x10
#define COLOR_GRAYTEXT  0x11
#define COLOR_BTNTEXT  0x12
#define COLOR_INACTIVECAPTIONTEXT  0x13
#define COLOR_BTNHIGHLIGHT  0x14
#define COLOR_3DDKSHADOW  0x15
#define COLOR_3DLIGHT  0x16
#define COLOR_INFOTEXT  0x17
#define COLOR_INFOBK  0x18
#define COLOR_HOTLIGHT  0x1a
#define COLOR_GRADIENTACTIVECAPTION  0x1b
#define COLOR_GRADIENTINACTIVECAPTION  0x1c
#define COLOR_MENUHILIGHT  0x1d
#define COLOR_MENUBAR  0x1e
#define COLOR_DESKTOP  0x1
#define COLOR_3DFACE  0xf
#define COLOR_3DSHADOW  0x10
#define COLOR_3DHIGHLIGHT  0x14
#define COLOR_3DHILIGHT  0x14
#define COLOR_BTNHILIGHT  0x14

; SYSGEOCLASS
#define GEOCLASS_NATION  0x10
#define GEOCLASS_REGION  0xe
#define GEOCLASS_ALL  0x0

; SYSGEOTYPE
#define GEO_NATION  0x1
#define GEO_LATITUDE  0x2
#define GEO_LONGITUDE  0x3
#define GEO_ISO2  0x4
#define GEO_ISO3  0x5
#define GEO_RFC1766  0x6
#define GEO_LCID  0x7
#define GEO_FRIENDLYNAME  0x8
#define GEO_OFFICIALNAME  0x9
#define GEO_TIMEZONES  0xa
#define GEO_OFFICIALLANGUAGES  0xb
#define GEO_ISO_UN_NUMBER  0xc
#define GEO_PARENT  0xd
#define GEO_DIALINGCODE  0xe
#define GEO_CURRENCYCODE  0xf
#define GEO_CURRENCYSYMBOL  0x10
#define GEO_NAME  0x11
#define GEO_ID  0x12

; SYSKIND
#define SYS_WIN16  0x0
#define SYS_WIN32  0x1
#define SYS_MAC  0x2
#define SYS_WIN64  0x3

; SYSTEM_AUDIT_OBJECT_ACE_FLAGS
#define ACE_OBJECT_TYPE_PRESENT  0x1
#define ACE_INHERITED_OBJECT_TYPE_PRESENT  0x2

; SYSTEM_CURSOR_ID
#define OCR_APPSTARTING  0x7f8a
#define OCR_NORMAL  0x7f00
#define OCR_CROSS  0x7f03
#define OCR_HAND  0x7f89
#define OCR_HELP  0x7f8b
#define OCR_IBEAM  0x7f01
#define OCR_NO  0x7f88
#define OCR_SIZEALL  0x7f86
#define OCR_SIZENESW  0x7f83
#define OCR_SIZENS  0x7f85
#define OCR_SIZENWSE  0x7f82
#define OCR_SIZEWE  0x7f84
#define OCR_UP  0x7f04
#define OCR_WAIT  0x7f02

; SYSTEM_METRICS_INDEX
#define SM_ARRANGE  0x38
#define SM_CLEANBOOT  0x43
#define SM_CMONITORS  0x50
#define SM_CMOUSEBUTTONS  0x2b
#define SM_CONVERTIBLESLATEMODE  0x2003
#define SM_CXBORDER  0x5
#define SM_CXCURSOR  0xd
#define SM_CXDLGFRAME  0x7
#define SM_CXDOUBLECLK  0x24
#define SM_CXDRAG  0x44
#define SM_CXEDGE  0x2d
#define SM_CXFIXEDFRAME  0x7
#define SM_CXFOCUSBORDER  0x53
#define SM_CXFRAME  0x20
#define SM_CXFULLSCREEN  0x10
#define SM_CXHSCROLL  0x15
#define SM_CXHTHUMB  0xa
#define SM_CXICON  0xb
#define SM_CXICONSPACING  0x26
#define SM_CXMAXIMIZED  0x3d
#define SM_CXMAXTRACK  0x3b
#define SM_CXMENUCHECK  0x47
#define SM_CXMENUSIZE  0x36
#define SM_CXMIN  0x1c
#define SM_CXMINIMIZED  0x39
#define SM_CXMINSPACING  0x2f
#define SM_CXMINTRACK  0x22
#define SM_CXPADDEDBORDER  0x5c
#define SM_CXSCREEN  0x0
#define SM_CXSIZE  0x1e
#define SM_CXSIZEFRAME  0x20
#define SM_CXSMICON  0x31
#define SM_CXSMSIZE  0x34
#define SM_CXVIRTUALSCREEN  0x4e
#define SM_CXVSCROLL  0x2
#define SM_CYBORDER  0x6
#define SM_CYCAPTION  0x4
#define SM_CYCURSOR  0xe
#define SM_CYDLGFRAME  0x8
#define SM_CYDOUBLECLK  0x25
#define SM_CYDRAG  0x45
#define SM_CYEDGE  0x2e
#define SM_CYFIXEDFRAME  0x8
#define SM_CYFOCUSBORDER  0x54
#define SM_CYFRAME  0x21
#define SM_CYFULLSCREEN  0x11
#define SM_CYHSCROLL  0x3
#define SM_CYICON  0xc
#define SM_CYICONSPACING  0x27
#define SM_CYKANJIWINDOW  0x12
#define SM_CYMAXIMIZED  0x3e
#define SM_CYMAXTRACK  0x3c
#define SM_CYMENU  0xf
#define SM_CYMENUCHECK  0x48
#define SM_CYMENUSIZE  0x37
#define SM_CYMIN  0x1d
#define SM_CYMINIMIZED  0x3a
#define SM_CYMINSPACING  0x30
#define SM_CYMINTRACK  0x23
#define SM_CYSCREEN  0x1
#define SM_CYSIZE  0x1f
#define SM_CYSIZEFRAME  0x21
#define SM_CYSMCAPTION  0x33
#define SM_CYSMICON  0x32
#define SM_CYSMSIZE  0x35
#define SM_CYVIRTUALSCREEN  0x4f
#define SM_CYVSCROLL  0x14
#define SM_CYVTHUMB  0x9
#define SM_DBCSENABLED  0x2a
#define SM_DEBUG  0x16
#define SM_DIGITIZER  0x5e
#define SM_IMMENABLED  0x52
#define SM_MAXIMUMTOUCHES  0x5f
#define SM_MEDIACENTER  0x57
#define SM_MENUDROPALIGNMENT  0x28
#define SM_MIDEASTENABLED  0x4a
#define SM_MOUSEPRESENT  0x13
#define SM_MOUSEHORIZONTALWHEELPRESENT  0x5b
#define SM_MOUSEWHEELPRESENT  0x4b
#define SM_NETWORK  0x3f
#define SM_PENWINDOWS  0x29
#define SM_REMOTECONTROL  0x2001
#define SM_REMOTESESSION  0x1000
#define SM_SAMEDISPLAYFORMAT  0x51
#define SM_SECURE  0x2c
#define SM_SERVERR2  0x59
#define SM_SHOWSOUNDS  0x46
#define SM_SHUTTINGDOWN  0x2000
#define SM_SLOWMACHINE  0x49
#define SM_STARTER  0x58
#define SM_SWAPBUTTON  0x17
#define SM_SYSTEMDOCKED  0x2004
#define SM_TABLETPC  0x56
#define SM_XVIRTUALSCREEN  0x4c
#define SM_YVIRTUALSCREEN  0x4d

; SYSTEM_PALETTE_USE
#define SYSPAL_NOSTATIC  0x2
#define SYSPAL_NOSTATIC256  0x3
#define SYSPAL_STATIC  0x1

; SYSTEM_PARAMETERS_INFO_ACTION
#define SPI_GETBEEP  0x1
#define SPI_SETBEEP  0x2
#define SPI_GETMOUSE  0x3
#define SPI_SETMOUSE  0x4
#define SPI_GETBORDER  0x5
#define SPI_SETBORDER  0x6
#define SPI_GETKEYBOARDSPEED  0xa
#define SPI_SETKEYBOARDSPEED  0xb
#define SPI_LANGDRIVER  0xc
#define SPI_ICONHORIZONTALSPACING  0xd
#define SPI_GETSCREENSAVETIMEOUT  0xe
#define SPI_SETSCREENSAVETIMEOUT  0xf
#define SPI_GETSCREENSAVEACTIVE  0x10
#define SPI_SETSCREENSAVEACTIVE  0x11
#define SPI_GETGRIDGRANULARITY  0x12
#define SPI_SETGRIDGRANULARITY  0x13
#define SPI_SETDESKWALLPAPER  0x14
#define SPI_SETDESKPATTERN  0x15
#define SPI_GETKEYBOARDDELAY  0x16
#define SPI_SETKEYBOARDDELAY  0x17
#define SPI_ICONVERTICALSPACING  0x18
#define SPI_GETICONTITLEWRAP  0x19
#define SPI_SETICONTITLEWRAP  0x1a
#define SPI_GETMENUDROPALIGNMENT  0x1b
#define SPI_SETMENUDROPALIGNMENT  0x1c
#define SPI_SETDOUBLECLKWIDTH  0x1d
#define SPI_SETDOUBLECLKHEIGHT  0x1e
#define SPI_GETICONTITLELOGFONT  0x1f
#define SPI_SETDOUBLECLICKTIME  0x20
#define SPI_SETMOUSEBUTTONSWAP  0x21
#define SPI_SETICONTITLELOGFONT  0x22
#define SPI_GETFASTTASKSWITCH  0x23
#define SPI_SETFASTTASKSWITCH  0x24
#define SPI_SETDRAGFULLWINDOWS  0x25
#define SPI_GETDRAGFULLWINDOWS  0x26
#define SPI_GETNONCLIENTMETRICS  0x29
#define SPI_SETNONCLIENTMETRICS  0x2a
#define SPI_GETMINIMIZEDMETRICS  0x2b
#define SPI_SETMINIMIZEDMETRICS  0x2c
#define SPI_GETICONMETRICS  0x2d
#define SPI_SETICONMETRICS  0x2e
#define SPI_SETWORKAREA  0x2f
#define SPI_GETWORKAREA  0x30
#define SPI_SETPENWINDOWS  0x31
#define SPI_GETHIGHCONTRAST  0x42
#define SPI_SETHIGHCONTRAST  0x43
#define SPI_GETKEYBOARDPREF  0x44
#define SPI_SETKEYBOARDPREF  0x45
#define SPI_GETSCREENREADER  0x46
#define SPI_SETSCREENREADER  0x47
#define SPI_GETANIMATION  0x48
#define SPI_SETANIMATION  0x49
#define SPI_GETFONTSMOOTHING  0x4a
#define SPI_SETFONTSMOOTHING  0x4b
#define SPI_SETDRAGWIDTH  0x4c
#define SPI_SETDRAGHEIGHT  0x4d
#define SPI_SETHANDHELD  0x4e
#define SPI_GETLOWPOWERTIMEOUT  0x4f
#define SPI_GETPOWEROFFTIMEOUT  0x50
#define SPI_SETLOWPOWERTIMEOUT  0x51
#define SPI_SETPOWEROFFTIMEOUT  0x52
#define SPI_GETLOWPOWERACTIVE  0x53
#define SPI_GETPOWEROFFACTIVE  0x54
#define SPI_SETLOWPOWERACTIVE  0x55
#define SPI_SETPOWEROFFACTIVE  0x56
#define SPI_SETCURSORS  0x57
#define SPI_SETICONS  0x58
#define SPI_GETDEFAULTINPUTLANG  0x59
#define SPI_SETDEFAULTINPUTLANG  0x5a
#define SPI_SETLANGTOGGLE  0x5b
#define SPI_GETWINDOWSEXTENSION  0x5c
#define SPI_SETMOUSETRAILS  0x5d
#define SPI_GETMOUSETRAILS  0x5e
#define SPI_SETSCREENSAVERRUNNING  0x61
#define SPI_SCREENSAVERRUNNING  0x61
#define SPI_GETFILTERKEYS  0x32
#define SPI_SETFILTERKEYS  0x33
#define SPI_GETTOGGLEKEYS  0x34
#define SPI_SETTOGGLEKEYS  0x35
#define SPI_GETMOUSEKEYS  0x36
#define SPI_SETMOUSEKEYS  0x37
#define SPI_GETSHOWSOUNDS  0x38
#define SPI_SETSHOWSOUNDS  0x39
#define SPI_GETSTICKYKEYS  0x3a
#define SPI_SETSTICKYKEYS  0x3b
#define SPI_GETACCESSTIMEOUT  0x3c
#define SPI_SETACCESSTIMEOUT  0x3d
#define SPI_GETSERIALKEYS  0x3e
#define SPI_SETSERIALKEYS  0x3f
#define SPI_GETSOUNDSENTRY  0x40
#define SPI_SETSOUNDSENTRY  0x41
#define SPI_GETSNAPTODEFBUTTON  0x5f
#define SPI_SETSNAPTODEFBUTTON  0x60
#define SPI_GETMOUSEHOVERWIDTH  0x62
#define SPI_SETMOUSEHOVERWIDTH  0x63
#define SPI_GETMOUSEHOVERHEIGHT  0x64
#define SPI_SETMOUSEHOVERHEIGHT  0x65
#define SPI_GETMOUSEHOVERTIME  0x66
#define SPI_SETMOUSEHOVERTIME  0x67
#define SPI_GETWHEELSCROLLLINES  0x68
#define SPI_SETWHEELSCROLLLINES  0x69
#define SPI_GETMENUSHOWDELAY  0x6a
#define SPI_SETMENUSHOWDELAY  0x6b
#define SPI_GETWHEELSCROLLCHARS  0x6c
#define SPI_SETWHEELSCROLLCHARS  0x6d
#define SPI_GETSHOWIMEUI  0x6e
#define SPI_SETSHOWIMEUI  0x6f
#define SPI_GETMOUSESPEED  0x70
#define SPI_SETMOUSESPEED  0x71
#define SPI_GETSCREENSAVERRUNNING  0x72
#define SPI_GETDESKWALLPAPER  0x73
#define SPI_GETAUDIODESCRIPTION  0x74
#define SPI_SETAUDIODESCRIPTION  0x75
#define SPI_GETSCREENSAVESECURE  0x76
#define SPI_SETSCREENSAVESECURE  0x77
#define SPI_GETHUNGAPPTIMEOUT  0x78
#define SPI_SETHUNGAPPTIMEOUT  0x79
#define SPI_GETWAITTOKILLTIMEOUT  0x7a
#define SPI_SETWAITTOKILLTIMEOUT  0x7b
#define SPI_GETWAITTOKILLSERVICETIMEOUT  0x7c
#define SPI_SETWAITTOKILLSERVICETIMEOUT  0x7d
#define SPI_GETMOUSEDOCKTHRESHOLD  0x7e
#define SPI_SETMOUSEDOCKTHRESHOLD  0x7f
#define SPI_GETPENDOCKTHRESHOLD  0x80
#define SPI_SETPENDOCKTHRESHOLD  0x81
#define SPI_GETWINARRANGING  0x82
#define SPI_SETWINARRANGING  0x83
#define SPI_GETMOUSEDRAGOUTTHRESHOLD  0x84
#define SPI_SETMOUSEDRAGOUTTHRESHOLD  0x85
#define SPI_GETPENDRAGOUTTHRESHOLD  0x86
#define SPI_SETPENDRAGOUTTHRESHOLD  0x87
#define SPI_GETMOUSESIDEMOVETHRESHOLD  0x88
#define SPI_SETMOUSESIDEMOVETHRESHOLD  0x89
#define SPI_GETPENSIDEMOVETHRESHOLD  0x8a
#define SPI_SETPENSIDEMOVETHRESHOLD  0x8b
#define SPI_GETDRAGFROMMAXIMIZE  0x8c
#define SPI_SETDRAGFROMMAXIMIZE  0x8d
#define SPI_GETSNAPSIZING  0x8e
#define SPI_SETSNAPSIZING  0x8f
#define SPI_GETDOCKMOVING  0x90
#define SPI_SETDOCKMOVING  0x91
#define SPI_GETTOUCHPREDICTIONPARAMETERS  0x9c
#define SPI_SETTOUCHPREDICTIONPARAMETERS  0x9d
#define SPI_GETLOGICALDPIOVERRIDE  0x9e
#define SPI_SETLOGICALDPIOVERRIDE  0x9f
#define SPI_GETMENURECT  0xa2
#define SPI_SETMENURECT  0xa3
#define SPI_GETACTIVEWINDOWTRACKING  0x1000
#define SPI_SETACTIVEWINDOWTRACKING  0x1001
#define SPI_GETMENUANIMATION  0x1002
#define SPI_SETMENUANIMATION  0x1003
#define SPI_GETCOMBOBOXANIMATION  0x1004
#define SPI_SETCOMBOBOXANIMATION  0x1005
#define SPI_GETLISTBOXSMOOTHSCROLLING  0x1006
#define SPI_SETLISTBOXSMOOTHSCROLLING  0x1007
#define SPI_GETGRADIENTCAPTIONS  0x1008
#define SPI_SETGRADIENTCAPTIONS  0x1009
#define SPI_GETKEYBOARDCUES  0x100a
#define SPI_SETKEYBOARDCUES  0x100b
#define SPI_GETMENUUNDERLINES  0x100a
#define SPI_SETMENUUNDERLINES  0x100b
#define SPI_GETACTIVEWNDTRKZORDER  0x100c
#define SPI_SETACTIVEWNDTRKZORDER  0x100d
#define SPI_GETHOTTRACKING  0x100e
#define SPI_SETHOTTRACKING  0x100f
#define SPI_GETMENUFADE  0x1012
#define SPI_SETMENUFADE  0x1013
#define SPI_GETSELECTIONFADE  0x1014
#define SPI_SETSELECTIONFADE  0x1015
#define SPI_GETTOOLTIPANIMATION  0x1016
#define SPI_SETTOOLTIPANIMATION  0x1017
#define SPI_GETTOOLTIPFADE  0x1018
#define SPI_SETTOOLTIPFADE  0x1019
#define SPI_GETCURSORSHADOW  0x101a
#define SPI_SETCURSORSHADOW  0x101b
#define SPI_GETMOUSESONAR  0x101c
#define SPI_SETMOUSESONAR  0x101d
#define SPI_GETMOUSECLICKLOCK  0x101e
#define SPI_SETMOUSECLICKLOCK  0x101f
#define SPI_GETMOUSEVANISH  0x1020
#define SPI_SETMOUSEVANISH  0x1021
#define SPI_GETFLATMENU  0x1022
#define SPI_SETFLATMENU  0x1023
#define SPI_GETDROPSHADOW  0x1024
#define SPI_SETDROPSHADOW  0x1025
#define SPI_GETBLOCKSENDINPUTRESETS  0x1026
#define SPI_SETBLOCKSENDINPUTRESETS  0x1027
#define SPI_GETUIEFFECTS  0x103e
#define SPI_SETUIEFFECTS  0x103f
#define SPI_GETDISABLEOVERLAPPEDCONTENT  0x1040
#define SPI_SETDISABLEOVERLAPPEDCONTENT  0x1041
#define SPI_GETCLIENTAREAANIMATION  0x1042
#define SPI_SETCLIENTAREAANIMATION  0x1043
#define SPI_GETCLEARTYPE  0x1048
#define SPI_SETCLEARTYPE  0x1049
#define SPI_GETSPEECHRECOGNITION  0x104a
#define SPI_SETSPEECHRECOGNITION  0x104b
#define SPI_GETCARETBROWSING  0x104c
#define SPI_SETCARETBROWSING  0x104d
#define SPI_GETTHREADLOCALINPUTSETTINGS  0x104e
#define SPI_SETTHREADLOCALINPUTSETTINGS  0x104f
#define SPI_GETSYSTEMLANGUAGEBAR  0x1050
#define SPI_SETSYSTEMLANGUAGEBAR  0x1051
#define SPI_GETFOREGROUNDLOCKTIMEOUT  0x2000
#define SPI_SETFOREGROUNDLOCKTIMEOUT  0x2001
#define SPI_GETACTIVEWNDTRKTIMEOUT  0x2002
#define SPI_SETACTIVEWNDTRKTIMEOUT  0x2003
#define SPI_GETFOREGROUNDFLASHCOUNT  0x2004
#define SPI_SETFOREGROUNDFLASHCOUNT  0x2005
#define SPI_GETCARETWIDTH  0x2006
#define SPI_SETCARETWIDTH  0x2007
#define SPI_GETMOUSECLICKLOCKTIME  0x2008
#define SPI_SETMOUSECLICKLOCKTIME  0x2009
#define SPI_GETFONTSMOOTHINGTYPE  0x200a
#define SPI_SETFONTSMOOTHINGTYPE  0x200b
#define SPI_GETFONTSMOOTHINGCONTRAST  0x200c
#define SPI_SETFONTSMOOTHINGCONTRAST  0x200d
#define SPI_GETFOCUSBORDERWIDTH  0x200e
#define SPI_SETFOCUSBORDERWIDTH  0x200f
#define SPI_GETFOCUSBORDERHEIGHT  0x2010
#define SPI_SETFOCUSBORDERHEIGHT  0x2011
#define SPI_GETFONTSMOOTHINGORIENTATION  0x2012
#define SPI_SETFONTSMOOTHINGORIENTATION  0x2013
#define SPI_GETMINIMUMHITRADIUS  0x2014
#define SPI_SETMINIMUMHITRADIUS  0x2015
#define SPI_GETMESSAGEDURATION  0x2016
#define SPI_SETMESSAGEDURATION  0x2017
#define SPI_GETCONTACTVISUALIZATION  0x2018
#define SPI_SETCONTACTVISUALIZATION  0x2019
#define SPI_GETGESTUREVISUALIZATION  0x201a
#define SPI_SETGESTUREVISUALIZATION  0x201b
#define SPI_GETMOUSEWHEELROUTING  0x201c
#define SPI_SETMOUSEWHEELROUTING  0x201d
#define SPI_GETPENVISUALIZATION  0x201e
#define SPI_SETPENVISUALIZATION  0x201f
#define SPI_GETPENARBITRATIONTYPE  0x2020
#define SPI_SETPENARBITRATIONTYPE  0x2021
#define SPI_GETCARETTIMEOUT  0x2022
#define SPI_SETCARETTIMEOUT  0x2023
#define SPI_GETHANDEDNESS  0x2024
#define SPI_SETHANDEDNESS  0x2025

; SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS
#define SPIF_UPDATEINIFILE  0x1
#define SPIF_SENDCHANGE  0x2
#define SPIF_SENDWININICHANGE  0x2

; SYSTEM_POWER_STATE
#define PowerSystemUnspecified  0x0
#define PowerSystemWorking  0x1
#define PowerSystemSleeping1  0x2
#define PowerSystemSleeping2  0x3
#define PowerSystemSleeping3  0x4
#define PowerSystemHibernate  0x5
#define PowerSystemShutdown  0x6
#define PowerSystemMaximum  0x7

; TA_PROPERTY
#define TAP_FLAGS  0x0
#define TAP_TRANSFORMCOUNT  0x1
#define TAP_STAGGERDELAY  0x2
#define TAP_STAGGERDELAYCAP  0x3
#define TAP_STAGGERDELAYFACTOR  0x4
#define TAP_ZORDER  0x5

; TA_TIMINGFUNCTION_TYPE
#define TTFT_UNDEFINED  0x0
#define TTFT_CUBIC_BEZIER  0x1

; TA_TRANSFORM_FLAG
#define TATF_NONE  0x0
#define TATF_TARGETVALUES_USER  0x1
#define TATF_HASINITIALVALUES  0x2
#define TATF_HASORIGINVALUES  0x4

; TA_TRANSFORM_TYPE
#define TATT_TRANSLATE_2D  0x0
#define TATT_SCALE_2D  0x1
#define TATT_OPACITY  0x2
#define TATT_CLIP  0x3

; TAPE_INFORMATION_TYPE
#define SET_TAPE_DRIVE_INFORMATION  0x1
#define SET_TAPE_MEDIA_INFORMATION  0x0

; TAPE_POSITION_METHOD
#define TAPE_ABSOLUTE_BLOCK  0x1
#define TAPE_LOGICAL_BLOCK  0x2
#define TAPE_REWIND  0x0
#define TAPE_SPACE_END_OF_DATA  0x4
#define TAPE_SPACE_FILEMARKS  0x6
#define TAPE_SPACE_RELATIVE_BLOCKS  0x5
#define TAPE_SPACE_SEQUENTIAL_FMKS  0x7
#define TAPE_SPACE_SEQUENTIAL_SMKS  0x9
#define TAPE_SPACE_SETMARKS  0x8

; TAPE_POSITION_TYPE
#define TAPE_ABSOLUTE_POSITION  0x0
#define TAPE_LOGICAL_POSITION  0x1

; TAPEMARK_TYPE
#define TAPE_FILEMARKS  0x1
#define TAPE_LONG_FILEMARKS  0x3
#define TAPE_SETMARKS  0x0
#define TAPE_SHORT_FILEMARKS  0x2

; TCP_CONNECTION_OFFLOAD_STATE
#define TcpConnectionOffloadStateInHost  0x0
#define TcpConnectionOffloadStateOffloading  0x1
#define TcpConnectionOffloadStateOffloaded  0x2
#define TcpConnectionOffloadStateUploading  0x3
#define TcpConnectionOffloadStateMax  0x4

; TCP_ESTATS_TYPE
#define TcpConnectionEstatsSynOpts  0x0
#define TcpConnectionEstatsData  0x1
#define TcpConnectionEstatsSndCong  0x2
#define TcpConnectionEstatsPath  0x3
#define TcpConnectionEstatsSendBuff  0x4
#define TcpConnectionEstatsRec  0x5
#define TcpConnectionEstatsObsRec  0x6
#define TcpConnectionEstatsBandwidth  0x7
#define TcpConnectionEstatsFineRtt  0x8
#define TcpConnectionEstatsMaximum  0x9

; TCP_RTO_ALGORITHM
#define TcpRtoAlgorithmOther  0x1
#define TcpRtoAlgorithmConstant  0x2
#define TcpRtoAlgorithmRsre  0x3
#define TcpRtoAlgorithmVanj  0x4
#define MIB_TCP_RTO_OTHER  0x1
#define MIB_TCP_RTO_CONSTANT  0x2
#define MIB_TCP_RTO_RSRE  0x3
#define MIB_TCP_RTO_VANJ  0x4

; TCP_TABLE_CLASS
#define TCP_TABLE_BASIC_LISTENER  0x0
#define TCP_TABLE_BASIC_CONNECTIONS  0x1
#define TCP_TABLE_BASIC_ALL  0x2
#define TCP_TABLE_OWNER_PID_LISTENER  0x3
#define TCP_TABLE_OWNER_PID_CONNECTIONS  0x4
#define TCP_TABLE_OWNER_PID_ALL  0x5
#define TCP_TABLE_OWNER_MODULE_LISTENER  0x6
#define TCP_TABLE_OWNER_MODULE_CONNECTIONS  0x7
#define TCP_TABLE_OWNER_MODULE_ALL  0x8

; TCPIP_OWNER_MODULE_INFO_CLASS
#define TCPIP_OWNER_MODULE_INFO_BASIC  0x0

; TEXT_ALIGN_OPTIONS
#define TA_NOUPDATECP  0x0
#define TA_UPDATECP  0x1
#define TA_LEFT  0x0
#define TA_RIGHT  0x2
#define TA_CENTER  0x6
#define TA_TOP  0x0
#define TA_BOTTOM  0x8
#define TA_BASELINE  0x18
#define TA_RTLREADING  0x100
#define TA_MASK  0x11f
#define VTA_BASELINE  0x18
#define VTA_LEFT  0x8
#define VTA_RIGHT  0x0
#define VTA_CENTER  0x6
#define VTA_BOTTOM  0x2
#define VTA_TOP  0x0

; TextRenderingHint
#define TextRenderingHintSystemDefault  0x0
#define TextRenderingHintSingleBitPerPixelGridFit  0x1
#define TextRenderingHintSingleBitPerPixel  0x2
#define TextRenderingHintAntiAliasGridFit  0x3
#define TextRenderingHintAntiAlias  0x4
#define TextRenderingHintClearTypeGridFit  0x5

; THEME_PROPERTY_SYMBOL_ID
#define TMT_RESERVEDLOW  0x0
#define TMT_RESERVEDHIGH  0x1f3f
#define TMT_DIBDATA  0x2
#define TMT_GLYPHDIBDATA  0x8
#define TMT_ENUM  0xc8
#define TMT_STRING  0xc9
#define TMT_INT  0xca
#define TMT_BOOL  0xcb
#define TMT_COLOR  0xcc
#define TMT_MARGINS  0xcd
#define TMT_FILENAME  0xce
#define TMT_SIZE  0xcf
#define TMT_POSITION  0xd0
#define TMT_RECT  0xd1
#define TMT_FONT  0xd2
#define TMT_INTLIST  0xd3
#define TMT_HBITMAP  0xd4
#define TMT_DISKSTREAM  0xd5
#define TMT_STREAM  0xd6
#define TMT_BITMAPREF  0xd7
#define TMT_FLOAT  0xd8
#define TMT_FLOATLIST  0xd9
#define TMT_COLORSCHEMES  0x191
#define TMT_SIZES  0x192
#define TMT_CHARSET  0x193
#define TMT_NAME  0x258
#define TMT_DISPLAYNAME  0x259
#define TMT_TOOLTIP  0x25a
#define TMT_COMPANY  0x25b
#define TMT_AUTHOR  0x25c
#define TMT_COPYRIGHT  0x25d
#define TMT_URL  0x25e
#define TMT_VERSION  0x25f
#define TMT_DESCRIPTION  0x260
#define TMT_FIRST_RCSTRING_NAME  0x259
#define TMT_LAST_RCSTRING_NAME  0x260
#define TMT_CAPTIONFONT  0x321
#define TMT_SMALLCAPTIONFONT  0x322
#define TMT_MENUFONT  0x323
#define TMT_STATUSFONT  0x324
#define TMT_MSGBOXFONT  0x325
#define TMT_ICONTITLEFONT  0x326
#define TMT_HEADING1FONT  0x327
#define TMT_HEADING2FONT  0x328
#define TMT_BODYFONT  0x329
#define TMT_FIRSTFONT  0x321
#define TMT_LASTFONT  0x329
#define TMT_FLATMENUS  0x3e9
#define TMT_FIRSTBOOL  0x3e9
#define TMT_LASTBOOL  0x3e9
#define TMT_SIZINGBORDERWIDTH  0x4b1
#define TMT_SCROLLBARWIDTH  0x4b2
#define TMT_SCROLLBARHEIGHT  0x4b3
#define TMT_CAPTIONBARWIDTH  0x4b4
#define TMT_CAPTIONBARHEIGHT  0x4b5
#define TMT_SMCAPTIONBARWIDTH  0x4b6
#define TMT_SMCAPTIONBARHEIGHT  0x4b7
#define TMT_MENUBARWIDTH  0x4b8
#define TMT_MENUBARHEIGHT  0x4b9
#define TMT_PADDEDBORDERWIDTH  0x4ba
#define TMT_FIRSTSIZE  0x4b1
#define TMT_LASTSIZE  0x4ba
#define TMT_MINCOLORDEPTH  0x515
#define TMT_FIRSTINT  0x515
#define TMT_LASTINT  0x515
#define TMT_CSSNAME  0x579
#define TMT_XMLNAME  0x57a
#define TMT_LASTUPDATED  0x57b
#define TMT_ALIAS  0x57c
#define TMT_FIRSTSTRING  0x579
#define TMT_LASTSTRING  0x57c
#define TMT_SCROLLBAR  0x641
#define TMT_BACKGROUND  0x642
#define TMT_ACTIVECAPTION  0x643
#define TMT_INACTIVECAPTION  0x644
#define TMT_MENU  0x645
#define TMT_WINDOW  0x646
#define TMT_WINDOWFRAME  0x647
#define TMT_MENUTEXT  0x648
#define TMT_WINDOWTEXT  0x649
#define TMT_CAPTIONTEXT  0x64a
#define TMT_ACTIVEBORDER  0x64b
#define TMT_INACTIVEBORDER  0x64c
#define TMT_APPWORKSPACE  0x64d
#define TMT_HIGHLIGHT  0x64e
#define TMT_HIGHLIGHTTEXT  0x64f
#define TMT_BTNFACE  0x650
#define TMT_BTNSHADOW  0x651
#define TMT_GRAYTEXT  0x652
#define TMT_BTNTEXT  0x653
#define TMT_INACTIVECAPTIONTEXT  0x654
#define TMT_BTNHIGHLIGHT  0x655
#define TMT_DKSHADOW3D  0x656
#define TMT_LIGHT3D  0x657
#define TMT_INFOTEXT  0x658
#define TMT_INFOBK  0x659
#define TMT_BUTTONALTERNATEFACE  0x65a
#define TMT_HOTTRACKING  0x65b
#define TMT_GRADIENTACTIVECAPTION  0x65c
#define TMT_GRADIENTINACTIVECAPTION  0x65d
#define TMT_MENUHILIGHT  0x65e
#define TMT_MENUBAR  0x65f
#define TMT_FIRSTCOLOR  0x641
#define TMT_LASTCOLOR  0x65f
#define TMT_FROMHUE1  0x709
#define TMT_FROMHUE2  0x70a
#define TMT_FROMHUE3  0x70b
#define TMT_FROMHUE4  0x70c
#define TMT_FROMHUE5  0x70d
#define TMT_TOHUE1  0x70e
#define TMT_TOHUE2  0x70f
#define TMT_TOHUE3  0x710
#define TMT_TOHUE4  0x711
#define TMT_TOHUE5  0x712
#define TMT_FROMCOLOR1  0x7d1
#define TMT_FROMCOLOR2  0x7d2
#define TMT_FROMCOLOR3  0x7d3
#define TMT_FROMCOLOR4  0x7d4
#define TMT_FROMCOLOR5  0x7d5
#define TMT_TOCOLOR1  0x7d6
#define TMT_TOCOLOR2  0x7d7
#define TMT_TOCOLOR3  0x7d8
#define TMT_TOCOLOR4  0x7d9
#define TMT_TOCOLOR5  0x7da
#define TMT_TRANSPARENT  0x899
#define TMT_AUTOSIZE  0x89a
#define TMT_BORDERONLY  0x89b
#define TMT_COMPOSITED  0x89c
#define TMT_BGFILL  0x89d
#define TMT_GLYPHTRANSPARENT  0x89e
#define TMT_GLYPHONLY  0x89f
#define TMT_ALWAYSSHOWSIZINGBAR  0x8a0
#define TMT_MIRRORIMAGE  0x8a1
#define TMT_UNIFORMSIZING  0x8a2
#define TMT_INTEGRALSIZING  0x8a3
#define TMT_SOURCEGROW  0x8a4
#define TMT_SOURCESHRINK  0x8a5
#define TMT_DRAWBORDERS  0x8a6
#define TMT_NOETCHEDEFFECT  0x8a7
#define TMT_TEXTAPPLYOVERLAY  0x8a8
#define TMT_TEXTGLOW  0x8a9
#define TMT_TEXTITALIC  0x8aa
#define TMT_COMPOSITEDOPAQUE  0x8ab
#define TMT_LOCALIZEDMIRRORIMAGE  0x8ac
#define TMT_IMAGECOUNT  0x961
#define TMT_ALPHALEVEL  0x962
#define TMT_BORDERSIZE  0x963
#define TMT_ROUNDCORNERWIDTH  0x964
#define TMT_ROUNDCORNERHEIGHT  0x965
#define TMT_GRADIENTRATIO1  0x966
#define TMT_GRADIENTRATIO2  0x967
#define TMT_GRADIENTRATIO3  0x968
#define TMT_GRADIENTRATIO4  0x969
#define TMT_GRADIENTRATIO5  0x96a
#define TMT_PROGRESSCHUNKSIZE  0x96b
#define TMT_PROGRESSSPACESIZE  0x96c
#define TMT_SATURATION  0x96d
#define TMT_TEXTBORDERSIZE  0x96e
#define TMT_ALPHATHRESHOLD  0x96f
#define TMT_WIDTH  0x970
#define TMT_HEIGHT  0x971
#define TMT_GLYPHINDEX  0x972
#define TMT_TRUESIZESTRETCHMARK  0x973
#define TMT_MINDPI1  0x974
#define TMT_MINDPI2  0x975
#define TMT_MINDPI3  0x976
#define TMT_MINDPI4  0x977
#define TMT_MINDPI5  0x978
#define TMT_TEXTGLOWSIZE  0x979
#define TMT_FRAMESPERSECOND  0x97a
#define TMT_PIXELSPERFRAME  0x97b
#define TMT_ANIMATIONDELAY  0x97c
#define TMT_GLOWINTENSITY  0x97d
#define TMT_OPACITY  0x97e
#define TMT_COLORIZATIONCOLOR  0x97f
#define TMT_COLORIZATIONOPACITY  0x980
#define TMT_MINDPI6  0x981
#define TMT_MINDPI7  0x982
#define TMT_GLYPHFONT  0xa29
#define TMT_IMAGEFILE  0xbb9
#define TMT_IMAGEFILE1  0xbba
#define TMT_IMAGEFILE2  0xbbb
#define TMT_IMAGEFILE3  0xbbc
#define TMT_IMAGEFILE4  0xbbd
#define TMT_IMAGEFILE5  0xbbe
#define TMT_GLYPHIMAGEFILE  0xbc0
#define TMT_IMAGEFILE6  0xbc1
#define TMT_IMAGEFILE7  0xbc2
#define TMT_TEXT  0xc81
#define TMT_CLASSICVALUE  0xc82
#define TMT_OFFSET  0xd49
#define TMT_TEXTSHADOWOFFSET  0xd4a
#define TMT_MINSIZE  0xd4b
#define TMT_MINSIZE1  0xd4c
#define TMT_MINSIZE2  0xd4d
#define TMT_MINSIZE3  0xd4e
#define TMT_MINSIZE4  0xd4f
#define TMT_MINSIZE5  0xd50
#define TMT_NORMALSIZE  0xd51
#define TMT_MINSIZE6  0xd52
#define TMT_MINSIZE7  0xd53
#define TMT_SIZINGMARGINS  0xe11
#define TMT_CONTENTMARGINS  0xe12
#define TMT_CAPTIONMARGINS  0xe13
#define TMT_BORDERCOLOR  0xed9
#define TMT_FILLCOLOR  0xeda
#define TMT_TEXTCOLOR  0xedb
#define TMT_EDGELIGHTCOLOR  0xedc
#define TMT_EDGEHIGHLIGHTCOLOR  0xedd
#define TMT_EDGESHADOWCOLOR  0xede
#define TMT_EDGEDKSHADOWCOLOR  0xedf
#define TMT_EDGEFILLCOLOR  0xee0
#define TMT_TRANSPARENTCOLOR  0xee1
#define TMT_GRADIENTCOLOR1  0xee2
#define TMT_GRADIENTCOLOR2  0xee3
#define TMT_GRADIENTCOLOR3  0xee4
#define TMT_GRADIENTCOLOR4  0xee5
#define TMT_GRADIENTCOLOR5  0xee6
#define TMT_SHADOWCOLOR  0xee7
#define TMT_GLOWCOLOR  0xee8
#define TMT_TEXTBORDERCOLOR  0xee9
#define TMT_TEXTSHADOWCOLOR  0xeea
#define TMT_GLYPHTEXTCOLOR  0xeeb
#define TMT_GLYPHTRANSPARENTCOLOR  0xeec
#define TMT_FILLCOLORHINT  0xeed
#define TMT_BORDERCOLORHINT  0xeee
#define TMT_ACCENTCOLORHINT  0xeef
#define TMT_TEXTCOLORHINT  0xef0
#define TMT_HEADING1TEXTCOLOR  0xef1
#define TMT_HEADING2TEXTCOLOR  0xef2
#define TMT_BODYTEXTCOLOR  0xef3
#define TMT_BGTYPE  0xfa1
#define TMT_BORDERTYPE  0xfa2
#define TMT_FILLTYPE  0xfa3
#define TMT_SIZINGTYPE  0xfa4
#define TMT_HALIGN  0xfa5
#define TMT_CONTENTALIGNMENT  0xfa6
#define TMT_VALIGN  0xfa7
#define TMT_OFFSETTYPE  0xfa8
#define TMT_ICONEFFECT  0xfa9
#define TMT_TEXTSHADOWTYPE  0xfaa
#define TMT_IMAGELAYOUT  0xfab
#define TMT_GLYPHTYPE  0xfac
#define TMT_IMAGESELECTTYPE  0xfad
#define TMT_GLYPHFONTSIZINGTYPE  0xfae
#define TMT_TRUESIZESCALINGTYPE  0xfaf
#define TMT_USERPICTURE  0x1389
#define TMT_DEFAULTPANESIZE  0x138a
#define TMT_BLENDCOLOR  0x138b
#define TMT_CUSTOMSPLITRECT  0x138c
#define TMT_ANIMATIONBUTTONRECT  0x138d
#define TMT_ANIMATIONDURATION  0x138e
#define TMT_TRANSITIONDURATIONS  0x1770
#define TMT_SCALEDBACKGROUND  0x1b59
#define TMT_ATLASIMAGE  0x1f40
#define TMT_ATLASINPUTIMAGE  0x1f41
#define TMT_ATLASRECT  0x1f42

; THEMESIZE
#define TS_MIN  0x0
#define TS_TRUE  0x1
#define TS_DRAW  0x2

; THREAD_ACCESS_RIGHTS
#define THREAD_TERMINATE  0x1
#define THREAD_SUSPEND_RESUME  0x2
#define THREAD_GET_CONTEXT  0x8
#define THREAD_SET_CONTEXT  0x10
#define THREAD_SET_INFORMATION  0x20
#define THREAD_QUERY_INFORMATION  0x40
#define THREAD_SET_THREAD_TOKEN  0x80
#define THREAD_IMPERSONATE  0x100
#define THREAD_DIRECT_IMPERSONATION  0x200
#define THREAD_SET_LIMITED_INFORMATION  0x400
#define THREAD_QUERY_LIMITED_INFORMATION  0x800
#define THREAD_RESUME  0x1000
#define THREAD_ALL_ACCESS  0x1fffff
#define THREAD_DELETE  0x10000
#define THREAD_READ_CONTROL  0x20000
#define THREAD_WRITE_DAC  0x40000
#define THREAD_WRITE_OWNER  0x80000
#define THREAD_SYNCHRONIZE  0x100000
#define THREAD_STANDARD_RIGHTS_REQUIRED  0xf0000

; THREAD_CREATION_FLAGS
#define THREAD_CREATE_RUN_IMMEDIATELY  0x0
#define THREAD_CREATE_SUSPENDED  0x4
#define STACK_SIZE_PARAM_IS_A_RESERVATION  0x10000

; THREAD_ERROR_MODE
#define SEM_ALL_ERRORS  0x0
#define SEM_FAILCRITICALERRORS  0x1
#define SEM_NOGPFAULTERRORBOX  0x2
#define SEM_NOOPENFILEERRORBOX  0x8000
#define SEM_NOALIGNMENTFAULTEXCEPT  0x4

; THREAD_INFORMATION_CLASS
#define ThreadMemoryPriority  0x0
#define ThreadAbsoluteCpuPriority  0x1
#define ThreadDynamicCodePolicy  0x2
#define ThreadPowerThrottling  0x3
#define ThreadInformationClassMax  0x4

; THREAD_PRIORITY
#define THREAD_MODE_BACKGROUND_BEGIN  0x10000
#define THREAD_MODE_BACKGROUND_END  0x20000
#define THREAD_PRIORITY_ABOVE_NORMAL  0x1
#define THREAD_PRIORITY_BELOW_NORMAL  -1
#define THREAD_PRIORITY_HIGHEST  0x2
#define THREAD_PRIORITY_IDLE  -15
#define THREAD_PRIORITY_MIN  -2
#define THREAD_PRIORITY_LOWEST  -2
#define THREAD_PRIORITY_NORMAL  0x0
#define THREAD_PRIORITY_TIME_CRITICAL  0xf

; TILE_WINDOWS_HOW
#define MDITILE_HORIZONTAL  0x1
#define MDITILE_VERTICAL  0x0

; TIME_FORMAT_FLAGS
#define TIME_NOMINUTESORSECONDS  0x1
#define TIME_NOSECONDS  0x2
#define TIME_NOTIMEMARKER  0x4
#define TIME_FORCE24HOURFORMAT  0x8

; TMPF_FLAGS
#define TMPF_FIXED_PITCH  0x1
#define TMPF_VECTOR  0x2
#define TMPF_DEVICE  0x8
#define TMPF_TRUETYPE  0x4

; TOKEN_ACCESS_MASK
#define TOKEN_DELETE  0x10000
#define TOKEN_READ_CONTROL  0x20000
#define TOKEN_WRITE_DAC  0x40000
#define TOKEN_WRITE_OWNER  0x80000
#define TOKEN_ACCESS_SYSTEM_SECURITY  0x1000000
#define TOKEN_ASSIGN_PRIMARY  0x1
#define TOKEN_DUPLICATE  0x2
#define TOKEN_IMPERSONATE  0x4
#define TOKEN_QUERY  0x8
#define TOKEN_QUERY_SOURCE  0x10
#define TOKEN_ADJUST_PRIVILEGES  0x20
#define TOKEN_ADJUST_GROUPS  0x40
#define TOKEN_ADJUST_DEFAULT  0x80
#define TOKEN_ADJUST_SESSIONID  0x100
#define TOKEN_READ  0x20008
#define TOKEN_WRITE  0x200e0
#define TOKEN_EXECUTE  0x20000
#define TOKEN_TRUST_CONSTRAINT_MASK  0x20018
#define TOKEN_ACCESS_PSEUDO_HANDLE_WIN8  0x18
#define TOKEN_ACCESS_PSEUDO_HANDLE  0x18
#define TOKEN_ALL_ACCESS  0xf01ff

; TOKEN_INFORMATION_CLASS
#define TokenUser  0x1
#define TokenGroups  0x2
#define TokenPrivileges  0x3
#define TokenOwner  0x4
#define TokenPrimaryGroup  0x5
#define TokenDefaultDacl  0x6
#define TokenSource  0x7
#define TokenType  0x8
#define TokenImpersonationLevel  0x9
#define TokenStatistics  0xa
#define TokenRestrictedSids  0xb
#define TokenSessionId  0xc
#define TokenGroupsAndPrivileges  0xd
#define TokenSessionReference  0xe
#define TokenSandBoxInert  0xf
#define TokenAuditPolicy  0x10
#define TokenOrigin  0x11
#define TokenElevationType  0x12
#define TokenLinkedToken  0x13
#define TokenElevation  0x14
#define TokenHasRestrictions  0x15
#define TokenAccessInformation  0x16
#define TokenVirtualizationAllowed  0x17
#define TokenVirtualizationEnabled  0x18
#define TokenIntegrityLevel  0x19
#define TokenUIAccess  0x1a
#define TokenMandatoryPolicy  0x1b
#define TokenLogonSid  0x1c
#define TokenIsAppContainer  0x1d
#define TokenCapabilities  0x1e
#define TokenAppContainerSid  0x1f
#define TokenAppContainerNumber  0x20
#define TokenUserClaimAttributes  0x21
#define TokenDeviceClaimAttributes  0x22
#define TokenRestrictedUserClaimAttributes  0x23
#define TokenRestrictedDeviceClaimAttributes  0x24
#define TokenDeviceGroups  0x25
#define TokenRestrictedDeviceGroups  0x26
#define TokenSecurityAttributes  0x27
#define TokenIsRestricted  0x28
#define TokenProcessTrustLevel  0x29
#define TokenPrivateNameSpace  0x2a
#define TokenSingletonAttributes  0x2b
#define TokenBnoIsolation  0x2c
#define TokenChildProcessFlags  0x2d
#define TokenIsLessPrivilegedAppContainer  0x2e
#define TokenIsSandboxed  0x2f
#define TokenIsAppSilo  0x30
#define MaxTokenInfoClass  0x31

; TOKEN_PRIVILEGES_ATTRIBUTES
#define SE_PRIVILEGE_ENABLED  0x2
#define SE_PRIVILEGE_ENABLED_BY_DEFAULT  0x1
#define SE_PRIVILEGE_REMOVED  0x4
#define SE_PRIVILEGE_USED_FOR_ACCESS  0x80000000

; TOKEN_TYPE
#define TokenPrimary  0x1
#define TokenImpersonation  0x2

; TOUCH_FEEDBACK_MODE
#define TOUCH_FEEDBACK_DEFAULT  0x1
#define TOUCH_FEEDBACK_INDIRECT  0x2
#define TOUCH_FEEDBACK_NONE  0x3

; TOUCHEVENTF_FLAGS
#define TOUCHEVENTF_MOVE  0x1
#define TOUCHEVENTF_DOWN  0x2
#define TOUCHEVENTF_UP  0x4
#define TOUCHEVENTF_INRANGE  0x8
#define TOUCHEVENTF_PRIMARY  0x10
#define TOUCHEVENTF_NOCOALESCE  0x20
#define TOUCHEVENTF_PEN  0x40
#define TOUCHEVENTF_PALM  0x80

; TOUCHINPUTMASKF_MASK
#define TOUCHINPUTMASKF_TIMEFROMSYSTEM  0x1
#define TOUCHINPUTMASKF_EXTRAINFO  0x2
#define TOUCHINPUTMASKF_CONTACTAREA  0x4

; TP_CALLBACK_PRIORITY
#define TP_CALLBACK_PRIORITY_HIGH  0x0
#define TP_CALLBACK_PRIORITY_NORMAL  0x1
#define TP_CALLBACK_PRIORITY_LOW  0x2
#define TP_CALLBACK_PRIORITY_INVALID  0x3
#define TP_CALLBACK_PRIORITY_COUNT  0x3

; TRACE_QUERY_INFO_CLASS
#define TraceGuidQueryList  0x0
#define TraceGuidQueryInfo  0x1
#define TraceGuidQueryProcess  0x2
#define TraceStackTracingInfo  0x3
#define TraceSystemTraceEnableFlagsInfo  0x4
#define TraceSampledProfileIntervalInfo  0x5
#define TraceProfileSourceConfigInfo  0x6
#define TraceProfileSourceListInfo  0x7
#define TracePmcEventListInfo  0x8
#define TracePmcCounterListInfo  0x9
#define TraceSetDisallowList  0xa
#define TraceVersionInfo  0xb
#define TraceGroupQueryList  0xc
#define TraceGroupQueryInfo  0xd
#define TraceDisallowListQuery  0xe
#define TraceInfoReserved15  0xf
#define TracePeriodicCaptureStateListInfo  0x10
#define TracePeriodicCaptureStateInfo  0x11
#define TraceProviderBinaryTracking  0x12
#define TraceMaxLoggersQuery  0x13
#define TraceLbrConfigurationInfo  0x14
#define TraceLbrEventListInfo  0x15
#define TraceMaxPmcCounterQuery  0x16
#define TraceStreamCount  0x17
#define TraceStackCachingInfo  0x18
#define TracePmcCounterOwners  0x19
#define TraceUnifiedStackCachingInfo  0x1a
#define TracePmcSessionInformation  0x1b
#define MaxTraceSetInfoClass  0x1c

; TRACK_POPUP_MENU_FLAGS
#define TPM_LEFTBUTTON  0x0
#define TPM_RIGHTBUTTON  0x2
#define TPM_LEFTALIGN  0x0
#define TPM_CENTERALIGN  0x4
#define TPM_RIGHTALIGN  0x8
#define TPM_TOPALIGN  0x0
#define TPM_VCENTERALIGN  0x10
#define TPM_BOTTOMALIGN  0x20
#define TPM_HORIZONTAL  0x0
#define TPM_VERTICAL  0x40
#define TPM_NONOTIFY  0x80
#define TPM_RETURNCMD  0x100
#define TPM_RECURSE  0x1
#define TPM_HORPOSANIMATION  0x400
#define TPM_HORNEGANIMATION  0x800
#define TPM_VERPOSANIMATION  0x1000
#define TPM_VERNEGANIMATION  0x2000
#define TPM_NOANIMATION  0x4000
#define TPM_LAYOUTRTL  0x8000
#define TPM_WORKAREA  0x10000

; TRACKMOUSEEVENT_FLAGS
#define TME_CANCEL  0x80000000
#define TME_HOVER  0x1
#define TME_LEAVE  0x2
#define TME_NONCLIENT  0x10
#define TME_QUERY  0x40000000

; TRANSLATE_CHARSET_INFO_FLAGS
#define TCI_SRCCHARSET  0x1
#define TCI_SRCCODEPAGE  0x2
#define TCI_SRCFONTSIG  0x3
#define TCI_SRCLOCALE  0x1000

; TREE_SEC_INFO
#define TREE_SEC_INFO_SET  0x1
#define TREE_SEC_INFO_RESET  0x2
#define TREE_SEC_INFO_RESET_KEEP_EXPLICIT  0x3

; TRUSTED_DOMAIN_TRUST_ATTRIBUTES
#define TRUST_ATTRIBUTE_NON_TRANSITIVE  0x1
#define TRUST_ATTRIBUTE_UPLEVEL_ONLY  0x2
#define TRUST_ATTRIBUTE_FILTER_SIDS  0x4
#define TRUST_ATTRIBUTE_FOREST_TRANSITIVE  0x8
#define TRUST_ATTRIBUTE_CROSS_ORGANIZATION  0x10
#define TRUST_ATTRIBUTE_TREAT_AS_EXTERNAL  0x40
#define TRUST_ATTRIBUTE_WITHIN_FOREST  0x20

; TRUSTED_DOMAIN_TRUST_DIRECTION
#define TRUST_DIRECTION_DISABLED  0x0
#define TRUST_DIRECTION_INBOUND  0x1
#define TRUST_DIRECTION_OUTBOUND  0x2
#define TRUST_DIRECTION_BIDIRECTIONAL  0x3

; TRUSTED_DOMAIN_TRUST_TYPE
#define TRUST_TYPE_DOWNLEVEL  0x1
#define TRUST_TYPE_UPLEVEL  0x2
#define TRUST_TYPE_MIT  0x3
#define TRUST_TYPE_DCE  0x4

; TRUSTED_INFORMATION_CLASS
#define TrustedDomainNameInformation  0x1
#define TrustedControllersInformation  0x2
#define TrustedPosixOffsetInformation  0x3
#define TrustedPasswordInformation  0x4
#define TrustedDomainInformationBasic  0x5
#define TrustedDomainInformationEx  0x6
#define TrustedDomainAuthInformation  0x7
#define TrustedDomainFullInformation  0x8
#define TrustedDomainAuthInformationInternal  0x9
#define TrustedDomainFullInformationInternal  0xa
#define TrustedDomainInformationEx2Internal  0xb
#define TrustedDomainFullInformation2Internal  0xc
#define TrustedDomainSupportedEncryptionTypes  0xd
#define TrustedDomainAuthInformationInternalAes  0xe
#define TrustedDomainFullInformationInternalAes  0xf

; TRUSTEE_FORM
#define TRUSTEE_IS_SID  0x0
#define TRUSTEE_IS_NAME  0x1
#define TRUSTEE_BAD_FORM  0x2
#define TRUSTEE_IS_OBJECTS_AND_SID  0x3
#define TRUSTEE_IS_OBJECTS_AND_NAME  0x4

; TRUSTEE_TYPE
#define TRUSTEE_IS_UNKNOWN  0x0
#define TRUSTEE_IS_USER  0x1
#define TRUSTEE_IS_GROUP  0x2
#define TRUSTEE_IS_DOMAIN  0x3
#define TRUSTEE_IS_ALIAS  0x4
#define TRUSTEE_IS_WELL_KNOWN_GROUP  0x5
#define TRUSTEE_IS_DELETED  0x6
#define TRUSTEE_IS_INVALID  0x7
#define TRUSTEE_IS_COMPUTER  0x8

; TrustLevel
#define BaseTrust  0x0
#define PartialTrust  0x1
#define FullTrust  0x2

; TUNNEL_TYPE
#define TUNNEL_TYPE_NONE  0x0
#define TUNNEL_TYPE_OTHER  0x1
#define TUNNEL_TYPE_DIRECT  0x2
#define TUNNEL_TYPE_6TO4  0xb
#define TUNNEL_TYPE_ISATAP  0xd
#define TUNNEL_TYPE_TEREDO  0xe
#define TUNNEL_TYPE_IPHTTPS  0xf

; TXFS_MINIVERSION
#define TXFS_MINIVERSION_COMMITTED_VIEW  0x0
#define TXFS_MINIVERSION_DIRTY_VIEW  0xffff
#define TXFS_MINIVERSION_DEFAULT_VIEW  0xfffe

; TYMED
#define TYMED_HGLOBAL  0x1
#define TYMED_FILE  0x2
#define TYMED_ISTREAM  0x4
#define TYMED_ISTORAGE  0x8
#define TYMED_GDI  0x10
#define TYMED_MFPICT  0x20
#define TYMED_ENHMF  0x40
#define TYMED_NULL  0x0

; TYPEKIND
#define TKIND_ENUM  0x0
#define TKIND_RECORD  0x1
#define TKIND_MODULE  0x2
#define TKIND_INTERFACE  0x3
#define TKIND_DISPATCH  0x4
#define TKIND_COCLASS  0x5
#define TKIND_ALIAS  0x6
#define TKIND_UNION  0x7
#define TKIND_MAX  0x8

; UDP_TABLE_CLASS
#define UDP_TABLE_BASIC  0x0
#define UDP_TABLE_OWNER_PID  0x1
#define UDP_TABLE_OWNER_MODULE  0x2

; UMS_THREAD_INFO_CLASS
#define UmsThreadInvalidInfoClass  0x0
#define UmsThreadUserContext  0x1
#define UmsThreadPriority  0x2
#define UmsThreadAffinity  0x3
#define UmsThreadTeb  0x4
#define UmsThreadIsSuspended  0x5
#define UmsThreadIsTerminated  0x6
#define UmsThreadMaxInfoClass  0x7

; Unit
#define UnitWorld  0x0
#define UnitDisplay  0x1
#define UnitPixel  0x2
#define UnitPoint  0x3
#define UnitInch  0x4
#define UnitDocument  0x5
#define UnitMillimeter  0x6

; UPDATE_LAYERED_WINDOW_FLAGS
#define ULW_ALPHA  0x2
#define ULW_COLORKEY  0x1
#define ULW_OPAQUE  0x4
#define ULW_EX_NORESIZE  0x8

; URI_CREATE_FLAGS
#define Uri_CREATE_ALLOW_RELATIVE  0x1
#define Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME  0x2
#define Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME  0x4
#define Uri_CREATE_NOFRAG  0x8
#define Uri_CREATE_NO_CANONICALIZE  0x10
#define Uri_CREATE_CANONICALIZE  0x100
#define Uri_CREATE_FILE_USE_DOS_PATH  0x20
#define Uri_CREATE_DECODE_EXTRA_INFO  0x40
#define Uri_CREATE_NO_DECODE_EXTRA_INFO  0x80
#define Uri_CREATE_CRACK_UNKNOWN_SCHEMES  0x200
#define Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES  0x400
#define Uri_CREATE_PRE_PROCESS_HTML_URI  0x800
#define Uri_CREATE_NO_PRE_PROCESS_HTML_URI  0x1000
#define Uri_CREATE_IE_SETTINGS  0x2000
#define Uri_CREATE_NO_IE_SETTINGS  0x4000
#define Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS  0x8000
#define Uri_CREATE_NORMALIZE_INTL_CHARACTERS  0x10000
#define Uri_CREATE_CANONICALIZE_ABSOLUTE  0x20000

; Uri_PROPERTY
#define Uri_PROPERTY_ABSOLUTE_URI  0x0
#define Uri_PROPERTY_STRING_START  0x0
#define Uri_PROPERTY_AUTHORITY  0x1
#define Uri_PROPERTY_DISPLAY_URI  0x2
#define Uri_PROPERTY_DOMAIN  0x3
#define Uri_PROPERTY_EXTENSION  0x4
#define Uri_PROPERTY_FRAGMENT  0x5
#define Uri_PROPERTY_HOST  0x6
#define Uri_PROPERTY_PASSWORD  0x7
#define Uri_PROPERTY_PATH  0x8
#define Uri_PROPERTY_PATH_AND_QUERY  0x9
#define Uri_PROPERTY_QUERY  0xa
#define Uri_PROPERTY_RAW_URI  0xb
#define Uri_PROPERTY_SCHEME_NAME  0xc
#define Uri_PROPERTY_USER_INFO  0xd
#define Uri_PROPERTY_USER_NAME  0xe
#define Uri_PROPERTY_STRING_LAST  0xe
#define Uri_PROPERTY_HOST_TYPE  0xf
#define Uri_PROPERTY_DWORD_START  0xf
#define Uri_PROPERTY_PORT  0x10
#define Uri_PROPERTY_SCHEME  0x11
#define Uri_PROPERTY_ZONE  0x12
#define Uri_PROPERTY_DWORD_LAST  0x12

; URL_CACHE_LIMIT_TYPE
#define UrlCacheLimitTypeIE  0x0
#define UrlCacheLimitTypeIETotal  0x1
#define UrlCacheLimitTypeAppContainer  0x2
#define UrlCacheLimitTypeAppContainerTotal  0x3
#define UrlCacheLimitTypeNum  0x4

; URLZONEREG
#define URLZONEREG_DEFAULT  0x0
#define URLZONEREG_HKLM  0x1
#define URLZONEREG_HKCU  0x2

; USER_OBJECT_INFORMATION_INDEX
#define UOI_FLAGS  0x1
#define UOI_HEAPSIZE  0x5
#define UOI_IO  0x6
#define UOI_NAME  0x2
#define UOI_TYPE  0x3
#define UOI_USER_SID  0x4

; USERCLASSTYPE
#define USERCLASSTYPE_FULL  0x1
#define USERCLASSTYPE_SHORT  0x2
#define USERCLASSTYPE_APPNAME  0x3

; VALIDATEUNC_OPTION
#define VALIDATEUNC_CONNECT  0x1
#define VALIDATEUNC_NOUI  0x2
#define VALIDATEUNC_PRINT  0x4
#define VALIDATEUNC_PERSIST  0x8
#define VALIDATEUNC_VALID  0xf

; VAR_CHANGE_FLAGS
#define VARIANT_NOVALUEPROP  0x1
#define VARIANT_ALPHABOOL  0x2
#define VARIANT_NOUSEROVERRIDE  0x4
#define VARIANT_CALENDAR_HIJRI  0x8
#define VARIANT_LOCALBOOL  0x10
#define VARIANT_CALENDAR_THAI  0x20
#define VARIANT_CALENDAR_GREGORIAN  0x40
#define VARIANT_USE_NLS  0x80

; VARCMP
#define VARCMP_LT  0x0
#define VARCMP_EQ  0x1
#define VARCMP_GT  0x2
#define VARCMP_NULL  0x3

; VARENUM
#define VT_EMPTY  0x0
#define VT_NULL  0x1
#define VT_I2  0x2
#define VT_I4  0x3
#define VT_R4  0x4
#define VT_R8  0x5
#define VT_CY  0x6
#define VT_DATE  0x7
#define VT_BSTR  0x8
#define VT_DISPATCH  0x9
#define VT_ERROR  0xa
#define VT_BOOL  0xb
#define VT_VARIANT  0xc
#define VT_UNKNOWN  0xd
#define VT_DECIMAL  0xe
#define VT_I1  0x10
#define VT_UI1  0x11
#define VT_UI2  0x12
#define VT_UI4  0x13
#define VT_I8  0x14
#define VT_UI8  0x15
#define VT_INT  0x16
#define VT_UINT  0x17
#define VT_VOID  0x18
#define VT_HRESULT  0x19
#define VT_PTR  0x1a
#define VT_SAFEARRAY  0x1b
#define VT_CARRAY  0x1c
#define VT_USERDEFINED  0x1d
#define VT_LPSTR  0x1e
#define VT_LPWSTR  0x1f
#define VT_RECORD  0x24
#define VT_INT_PTR  0x25
#define VT_UINT_PTR  0x26
#define VT_FILETIME  0x40
#define VT_BLOB  0x41
#define VT_STREAM  0x42
#define VT_STORAGE  0x43
#define VT_STREAMED_OBJECT  0x44
#define VT_STORED_OBJECT  0x45
#define VT_BLOB_OBJECT  0x46
#define VT_CF  0x47
#define VT_CLSID  0x48
#define VT_VERSIONED_STREAM  0x49
#define VT_BSTR_BLOB  0xfff
#define VT_VECTOR  0x1000
#define VT_ARRAY  0x2000
#define VT_BYREF  0x4000
#define VT_RESERVED  0x8000
#define VT_ILLEGAL  0xffff
#define VT_ILLEGALMASKED  0xfff
#define VT_TYPEMASK  0xfff

; VARFLAGS
#define VARFLAG_FREADONLY  0x1
#define VARFLAG_FSOURCE  0x2
#define VARFLAG_FBINDABLE  0x4
#define VARFLAG_FREQUESTEDIT  0x8
#define VARFLAG_FDISPLAYBIND  0x10
#define VARFLAG_FDEFAULTBIND  0x20
#define VARFLAG_FHIDDEN  0x40
#define VARFLAG_FRESTRICTED  0x80
#define VARFLAG_FDEFAULTCOLLELEM  0x100
#define VARFLAG_FUIDEFAULT  0x200
#define VARFLAG_FNONBROWSABLE  0x400
#define VARFLAG_FREPLACEABLE  0x800
#define VARFLAG_FIMMEDIATEBIND  0x1000

; VARFORMAT_FIRST_DAY
#define VARFORMAT_FIRST_DAY_SYSTEMDEFAULT  0x0
#define VARFORMAT_FIRST_DAY_MONDAY  0x1
#define VARFORMAT_FIRST_DAY_TUESDAY  0x2
#define VARFORMAT_FIRST_DAY_WEDNESDAY  0x3
#define VARFORMAT_FIRST_DAY_THURSDAY  0x4
#define VARFORMAT_FIRST_DAY_FRIDAY  0x5
#define VARFORMAT_FIRST_DAY_SATURDAY  0x6
#define VARFORMAT_FIRST_DAY_SUNDAY  0x7

; VARFORMAT_FIRST_WEEK
#define VARFORMAT_FIRST_WEEK_SYSTEMDEFAULT  0x0
#define VARFORMAT_FIRST_WEEK_CONTAINS_JANUARY_FIRST  0x1
#define VARFORMAT_FIRST_WEEK_LARGER_HALF_IN_CURRENT_YEAR  0x2
#define VARFORMAT_FIRST_WEEK_HAS_SEVEN_DAYS  0x3

; VARFORMAT_GROUP
#define VARFORMAT_GROUP_SYSTEMDEFAULT  -2
#define VARFORMAT_GROUP_THOUSANDS  -1
#define VARFORMAT_GROUP_NOTTHOUSANDS  0x0

; VARFORMAT_LEADING_DIGIT
#define VARFORMAT_LEADING_DIGIT_SYSTEMDEFAULT  -2
#define VARFORMAT_LEADING_DIGIT_INCLUDED  -1
#define VARFORMAT_LEADING_DIGIT_NOTINCLUDED  0x0

; VARFORMAT_NAMED_FORMAT
#define VARFORMAT_NAMED_FORMAT_GENERALDATE  0x0
#define VARFORMAT_NAMED_FORMAT_LONGDATE  0x1
#define VARFORMAT_NAMED_FORMAT_SHORTDATE  0x2
#define VARFORMAT_NAMED_FORMAT_LONGTIME  0x3
#define VARFORMAT_NAMED_FORMAT_SHORTTIME  0x4

; VARFORMAT_PARENTHESES
#define VARFORMAT_PARENTHESES_SYSTEMDEFAULT  -2
#define VARFORMAT_PARENTHESES_USED  -1
#define VARFORMAT_PARENTHESES_NOTUSED  0x0

; VARKIND
#define VAR_PERINSTANCE  0x0
#define VAR_STATIC  0x1
#define VAR_CONST  0x2
#define VAR_DISPATCH  0x3

; VER_FIND_FILE_FLAGS
#define VFFF_ISSHAREDFILE  0x1

; VER_FIND_FILE_STATUS
#define VFF_CURNEDEST  0x1
#define VFF_FILEINUSE  0x2
#define VFF_BUFFTOOSMALL  0x4

; VER_FLAGS
#define VER_MINORVERSION  0x1
#define VER_MAJORVERSION  0x2
#define VER_BUILDNUMBER  0x4
#define VER_PLATFORMID  0x8
#define VER_SERVICEPACKMINOR  0x10
#define VER_SERVICEPACKMAJOR  0x20
#define VER_SUITENAME  0x40
#define VER_PRODUCT_TYPE  0x80

; VER_INSTALL_FILE_FLAGS
#define VIFF_FORCEINSTALL  0x1
#define VIFF_DONTDELETEOLD  0x2

; VER_INSTALL_FILE_STATUS
#define VIF_TEMPFILE  0x1
#define VIF_MISMATCH  0x2
#define VIF_SRCOLD  0x4
#define VIF_DIFFLANG  0x8
#define VIF_DIFFCODEPG  0x10
#define VIF_DIFFTYPE  0x20
#define VIF_WRITEPROT  0x40
#define VIF_FILEINUSE  0x80
#define VIF_OUTOFSPACE  0x100
#define VIF_ACCESSVIOLATION  0x200
#define VIF_SHARINGVIOLATION  0x400
#define VIF_CANNOTCREATE  0x800
#define VIF_CANNOTDELETE  0x1000
#define VIF_CANNOTRENAME  0x2000
#define VIF_CANNOTDELETECUR  0x4000
#define VIF_OUTOFMEMORY  0x8000
#define VIF_CANNOTREADSRC  0x10000
#define VIF_CANNOTREADDST  0x20000
#define VIF_BUFFTOOSMALL  0x40000
#define VIF_CANNOTLOADLZ32  0x80000
#define VIF_CANNOTLOADCABINET  0x100000

; VIRTUAL_ALLOCATION_TYPE
#define MEM_COMMIT  0x1000
#define MEM_RESERVE  0x2000
#define MEM_RESET  0x80000
#define MEM_RESET_UNDO  0x1000000
#define MEM_REPLACE_PLACEHOLDER  0x4000
#define MEM_LARGE_PAGES  0x20000000
#define MEM_RESERVE_PLACEHOLDER  0x40000
#define MEM_FREE  0x10000

; VIRTUAL_FREE_TYPE
#define MEM_DECOMMIT  0x4000
#define MEM_RELEASE  0x8000

; VIRTUAL_KEY
#define VK_0  0x30
#define VK_1  0x31
#define VK_2  0x32
#define VK_3  0x33
#define VK_4  0x34
#define VK_5  0x35
#define VK_6  0x36
#define VK_7  0x37
#define VK_8  0x38
#define VK_9  0x39
#define VK_A  0x41
#define VK_B  0x42
#define VK_C  0x43
#define VK_D  0x44
#define VK_E  0x45
#define VK_F  0x46
#define VK_G  0x47
#define VK_H  0x48
#define VK_I  0x49
#define VK_J  0x4a
#define VK_K  0x4b
#define VK_L  0x4c
#define VK_M  0x4d
#define VK_N  0x4e
#define VK_O  0x4f
#define VK_P  0x50
#define VK_Q  0x51
#define VK_R  0x52
#define VK_S  0x53
#define VK_T  0x54
#define VK_U  0x55
#define VK_V  0x56
#define VK_W  0x57
#define VK_X  0x58
#define VK_Y  0x59
#define VK_Z  0x5a
#define VK_ABNT_C1  0xc1
#define VK_ABNT_C2  0xc2
#define VK_DBE_ALPHANUMERIC  0xf0
#define VK_DBE_CODEINPUT  0xfa
#define VK_DBE_DBCSCHAR  0xf4
#define VK_DBE_DETERMINESTRING  0xfc
#define VK_DBE_ENTERDLGCONVERSIONMODE  0xfd
#define VK_DBE_ENTERIMECONFIGMODE  0xf8
#define VK_DBE_ENTERWORDREGISTERMODE  0xf7
#define VK_DBE_FLUSHSTRING  0xf9
#define VK_DBE_HIRAGANA  0xf2
#define VK_DBE_KATAKANA  0xf1
#define VK_DBE_NOCODEINPUT  0xfb
#define VK_DBE_NOROMAN  0xf6
#define VK_DBE_ROMAN  0xf5
#define VK_DBE_SBCSCHAR  0xf3
#define VK__none_  0xff
#define VK_LBUTTON  0x1
#define VK_RBUTTON  0x2
#define VK_CANCEL  0x3
#define VK_MBUTTON  0x4
#define VK_XBUTTON1  0x5
#define VK_XBUTTON2  0x6
#define VK_BACK  0x8
#define VK_TAB  0x9
#define VK_CLEAR  0xc
#define VK_RETURN  0xd
#define VK_SHIFT  0x10
#define VK_CONTROL  0x11
#define VK_MENU  0x12
#define VK_PAUSE  0x13
#define VK_CAPITAL  0x14
#define VK_KANA  0x15
#define VK_HANGEUL  0x15
#define VK_HANGUL  0x15
#define VK_IME_ON  0x16
#define VK_JUNJA  0x17
#define VK_FINAL  0x18
#define VK_HANJA  0x19
#define VK_KANJI  0x19
#define VK_IME_OFF  0x1a
#define VK_ESCAPE  0x1b
#define VK_CONVERT  0x1c
#define VK_NONCONVERT  0x1d
#define VK_ACCEPT  0x1e
#define VK_MODECHANGE  0x1f
#define VK_SPACE  0x20
#define VK_PRIOR  0x21
#define VK_NEXT  0x22
#define VK_END  0x23
#define VK_HOME  0x24
#define VK_LEFT  0x25
#define VK_UP  0x26
#define VK_RIGHT  0x27
#define VK_DOWN  0x28
#define VK_SELECT  0x29
#define VK_PRINT  0x2a
#define VK_EXECUTE  0x2b
#define VK_SNAPSHOT  0x2c
#define VK_INSERT  0x2d
#define VK_DELETE  0x2e
#define VK_HELP  0x2f
#define VK_LWIN  0x5b
#define VK_RWIN  0x5c
#define VK_APPS  0x5d
#define VK_SLEEP  0x5f
#define VK_NUMPAD0  0x60
#define VK_NUMPAD1  0x61
#define VK_NUMPAD2  0x62
#define VK_NUMPAD3  0x63
#define VK_NUMPAD4  0x64
#define VK_NUMPAD5  0x65
#define VK_NUMPAD6  0x66
#define VK_NUMPAD7  0x67
#define VK_NUMPAD8  0x68
#define VK_NUMPAD9  0x69
#define VK_MULTIPLY  0x6a
#define VK_ADD  0x6b
#define VK_SEPARATOR  0x6c
#define VK_SUBTRACT  0x6d
#define VK_DECIMAL  0x6e
#define VK_DIVIDE  0x6f
#define VK_F1  0x70
#define VK_F2  0x71
#define VK_F3  0x72
#define VK_F4  0x73
#define VK_F5  0x74
#define VK_F6  0x75
#define VK_F7  0x76
#define VK_F8  0x77
#define VK_F9  0x78
#define VK_F10  0x79
#define VK_F11  0x7a
#define VK_F12  0x7b
#define VK_F13  0x7c
#define VK_F14  0x7d
#define VK_F15  0x7e
#define VK_F16  0x7f
#define VK_F17  0x80
#define VK_F18  0x81
#define VK_F19  0x82
#define VK_F20  0x83
#define VK_F21  0x84
#define VK_F22  0x85
#define VK_F23  0x86
#define VK_F24  0x87
#define VK_NAVIGATION_VIEW  0x88
#define VK_NAVIGATION_MENU  0x89
#define VK_NAVIGATION_UP  0x8a
#define VK_NAVIGATION_DOWN  0x8b
#define VK_NAVIGATION_LEFT  0x8c
#define VK_NAVIGATION_RIGHT  0x8d
#define VK_NAVIGATION_ACCEPT  0x8e
#define VK_NAVIGATION_CANCEL  0x8f
#define VK_NUMLOCK  0x90
#define VK_SCROLL  0x91
#define VK_OEM_NEC_EQUAL  0x92
#define VK_OEM_FJ_JISHO  0x92
#define VK_OEM_FJ_MASSHOU  0x93
#define VK_OEM_FJ_TOUROKU  0x94
#define VK_OEM_FJ_LOYA  0x95
#define VK_OEM_FJ_ROYA  0x96
#define VK_LSHIFT  0xa0
#define VK_RSHIFT  0xa1
#define VK_LCONTROL  0xa2
#define VK_RCONTROL  0xa3
#define VK_LMENU  0xa4
#define VK_RMENU  0xa5
#define VK_BROWSER_BACK  0xa6
#define VK_BROWSER_FORWARD  0xa7
#define VK_BROWSER_REFRESH  0xa8
#define VK_BROWSER_STOP  0xa9
#define VK_BROWSER_SEARCH  0xaa
#define VK_BROWSER_FAVORITES  0xab
#define VK_BROWSER_HOME  0xac
#define VK_VOLUME_MUTE  0xad
#define VK_VOLUME_DOWN  0xae
#define VK_VOLUME_UP  0xaf
#define VK_MEDIA_NEXT_TRACK  0xb0
#define VK_MEDIA_PREV_TRACK  0xb1
#define VK_MEDIA_STOP  0xb2
#define VK_MEDIA_PLAY_PAUSE  0xb3
#define VK_LAUNCH_MAIL  0xb4
#define VK_LAUNCH_MEDIA_SELECT  0xb5
#define VK_LAUNCH_APP1  0xb6
#define VK_LAUNCH_APP2  0xb7
#define VK_OEM_1  0xba
#define VK_OEM_PLUS  0xbb
#define VK_OEM_COMMA  0xbc
#define VK_OEM_MINUS  0xbd
#define VK_OEM_PERIOD  0xbe
#define VK_OEM_2  0xbf
#define VK_OEM_3  0xc0
#define VK_GAMEPAD_A  0xc3
#define VK_GAMEPAD_B  0xc4
#define VK_GAMEPAD_X  0xc5
#define VK_GAMEPAD_Y  0xc6
#define VK_GAMEPAD_RIGHT_SHOULDER  0xc7
#define VK_GAMEPAD_LEFT_SHOULDER  0xc8
#define VK_GAMEPAD_LEFT_TRIGGER  0xc9
#define VK_GAMEPAD_RIGHT_TRIGGER  0xca
#define VK_GAMEPAD_DPAD_UP  0xcb
#define VK_GAMEPAD_DPAD_DOWN  0xcc
#define VK_GAMEPAD_DPAD_LEFT  0xcd
#define VK_GAMEPAD_DPAD_RIGHT  0xce
#define VK_GAMEPAD_MENU  0xcf
#define VK_GAMEPAD_VIEW  0xd0
#define VK_GAMEPAD_LEFT_THUMBSTICK_BUTTON  0xd1
#define VK_GAMEPAD_RIGHT_THUMBSTICK_BUTTON  0xd2
#define VK_GAMEPAD_LEFT_THUMBSTICK_UP  0xd3
#define VK_GAMEPAD_LEFT_THUMBSTICK_DOWN  0xd4
#define VK_GAMEPAD_LEFT_THUMBSTICK_RIGHT  0xd5
#define VK_GAMEPAD_LEFT_THUMBSTICK_LEFT  0xd6
#define VK_GAMEPAD_RIGHT_THUMBSTICK_UP  0xd7
#define VK_GAMEPAD_RIGHT_THUMBSTICK_DOWN  0xd8
#define VK_GAMEPAD_RIGHT_THUMBSTICK_RIGHT  0xd9
#define VK_GAMEPAD_RIGHT_THUMBSTICK_LEFT  0xda
#define VK_OEM_4  0xdb
#define VK_OEM_5  0xdc
#define VK_OEM_6  0xdd
#define VK_OEM_7  0xde
#define VK_OEM_8  0xdf
#define VK_OEM_AX  0xe1
#define VK_OEM_102  0xe2
#define VK_ICO_HELP  0xe3
#define VK_ICO_00  0xe4
#define VK_PROCESSKEY  0xe5
#define VK_ICO_CLEAR  0xe6
#define VK_PACKET  0xe7
#define VK_OEM_RESET  0xe9
#define VK_OEM_JUMP  0xea
#define VK_OEM_PA1  0xeb
#define VK_OEM_PA2  0xec
#define VK_OEM_PA3  0xed
#define VK_OEM_WSCTRL  0xee
#define VK_OEM_CUSEL  0xef
#define VK_OEM_ATTN  0xf0
#define VK_OEM_FINISH  0xf1
#define VK_OEM_COPY  0xf2
#define VK_OEM_AUTO  0xf3
#define VK_OEM_ENLW  0xf4
#define VK_OEM_BACKTAB  0xf5
#define VK_ATTN  0xf6
#define VK_CRSEL  0xf7
#define VK_EXSEL  0xf8
#define VK_EREOF  0xf9
#define VK_PLAY  0xfa
#define VK_ZOOM  0xfb
#define VK_NONAME  0xfc
#define VK_PA1  0xfd
#define VK_OEM_CLEAR  0xfe

; WAIT_CHAIN_THREAD_OPTIONS
#define WCT_OUT_OF_PROC_COM_FLAG  0x2
#define WCT_OUT_OF_PROC_CS_FLAG  0x4
#define WCT_OUT_OF_PROC_FLAG  0x1

; WAIT_EVENT
#define WAIT_OBJECT_0  0x0
#define WAIT_ABANDONED  0x80
#define WAIT_ABANDONED_0  0x80
#define WAIT_IO_COMPLETION  0xc0
#define WAIT_TIMEOUT  0x102
#define WAIT_FAILED  0xffffffff

; WarpMode
#define WarpModePerspective  0x0
#define WarpModeBilinear  0x1

; WBEM_COMPARISON_FLAG
#define WBEM_COMPARISON_INCLUDE_ALL  0x0
#define WBEM_FLAG_IGNORE_QUALIFIERS  0x1
#define WBEM_FLAG_IGNORE_OBJECT_SOURCE  0x2
#define WBEM_FLAG_IGNORE_DEFAULT_VALUES  0x4
#define WBEM_FLAG_IGNORE_CLASS  0x8
#define WBEM_FLAG_IGNORE_CASE  0x10
#define WBEM_FLAG_IGNORE_FLAVOR  0x20

; WBEM_CONDITION_FLAG_TYPE
#define WBEM_FLAG_ALWAYS  0x0
#define WBEM_FLAG_ONLY_IF_TRUE  0x1
#define WBEM_FLAG_ONLY_IF_FALSE  0x2
#define WBEM_FLAG_ONLY_IF_IDENTICAL  0x3
#define WBEM_MASK_PRIMARY_CONDITION  0x3
#define WBEM_FLAG_KEYS_ONLY  0x4
#define WBEM_FLAG_REFS_ONLY  0x8
#define WBEM_FLAG_LOCAL_ONLY  0x10
#define WBEM_FLAG_PROPAGATED_ONLY  0x20
#define WBEM_FLAG_SYSTEM_ONLY  0x30
#define WBEM_FLAG_NONSYSTEM_ONLY  0x40
#define WBEM_MASK_CONDITION_ORIGIN  0x70
#define WBEM_FLAG_CLASS_OVERRIDES_ONLY  0x100
#define WBEM_FLAG_CLASS_LOCAL_AND_OVERRIDES  0x200
#define WBEM_MASK_CLASS_CONDITION  0x300

; WBEM_GENERIC_FLAG_TYPE
#define WBEM_FLAG_RETURN_IMMEDIATELY  0x10
#define WBEM_FLAG_RETURN_WBEM_COMPLETE  0x0
#define WBEM_FLAG_BIDIRECTIONAL  0x0
#define WBEM_FLAG_FORWARD_ONLY  0x20
#define WBEM_FLAG_NO_ERROR_OBJECT  0x40
#define WBEM_FLAG_RETURN_ERROR_OBJECT  0x0
#define WBEM_FLAG_SEND_STATUS  0x80
#define WBEM_FLAG_DONT_SEND_STATUS  0x0
#define WBEM_FLAG_ENSURE_LOCATABLE  0x100
#define WBEM_FLAG_DIRECT_READ  0x200
#define WBEM_FLAG_SEND_ONLY_SELECTED  0x0
#define WBEM_RETURN_WHEN_COMPLETE  0x0
#define WBEM_RETURN_IMMEDIATELY  0x10
#define WBEM_MASK_RESERVED_FLAGS  0x1f000
#define WBEM_FLAG_USE_AMENDED_QUALIFIERS  0x20000
#define WBEM_FLAG_STRONG_VALIDATION  0x100000

; WCT_OBJECT_STATUS
#define WctStatusNoAccess  0x1
#define WctStatusRunning  0x2
#define WctStatusBlocked  0x3
#define WctStatusPidOnly  0x4
#define WctStatusPidOnlyRpcss  0x5
#define WctStatusOwned  0x6
#define WctStatusNotOwned  0x7
#define WctStatusAbandoned  0x8
#define WctStatusUnknown  0x9
#define WctStatusError  0xa
#define WctStatusMax  0xb

; WCT_OBJECT_TYPE
#define WctCriticalSectionType  0x1
#define WctSendMessageType  0x2
#define WctMutexType  0x3
#define WctAlpcType  0x4
#define WctComType  0x5
#define WctThreadWaitType  0x6
#define WctProcessWaitType  0x7
#define WctThreadType  0x8
#define WctComActivationType  0x9
#define WctUnknownType  0xa
#define WctSocketIoType  0xb
#define WctSmbIoType  0xc
#define WctMaxType  0xd

; WELL_KNOWN_SID_TYPE
#define WinNullSid  0x0
#define WinWorldSid  0x1
#define WinLocalSid  0x2
#define WinCreatorOwnerSid  0x3
#define WinCreatorGroupSid  0x4
#define WinCreatorOwnerServerSid  0x5
#define WinCreatorGroupServerSid  0x6
#define WinNtAuthoritySid  0x7
#define WinDialupSid  0x8
#define WinNetworkSid  0x9
#define WinBatchSid  0xa
#define WinInteractiveSid  0xb
#define WinServiceSid  0xc
#define WinAnonymousSid  0xd
#define WinProxySid  0xe
#define WinEnterpriseControllersSid  0xf
#define WinSelfSid  0x10
#define WinAuthenticatedUserSid  0x11
#define WinRestrictedCodeSid  0x12
#define WinTerminalServerSid  0x13
#define WinRemoteLogonIdSid  0x14
#define WinLogonIdsSid  0x15
#define WinLocalSystemSid  0x16
#define WinLocalServiceSid  0x17
#define WinNetworkServiceSid  0x18
#define WinBuiltinDomainSid  0x19
#define WinBuiltinAdministratorsSid  0x1a
#define WinBuiltinUsersSid  0x1b
#define WinBuiltinGuestsSid  0x1c
#define WinBuiltinPowerUsersSid  0x1d
#define WinBuiltinAccountOperatorsSid  0x1e
#define WinBuiltinSystemOperatorsSid  0x1f
#define WinBuiltinPrintOperatorsSid  0x20
#define WinBuiltinBackupOperatorsSid  0x21
#define WinBuiltinReplicatorSid  0x22
#define WinBuiltinPreWindows2000CompatibleAccessSid  0x23
#define WinBuiltinRemoteDesktopUsersSid  0x24
#define WinBuiltinNetworkConfigurationOperatorsSid  0x25
#define WinAccountAdministratorSid  0x26
#define WinAccountGuestSid  0x27
#define WinAccountKrbtgtSid  0x28
#define WinAccountDomainAdminsSid  0x29
#define WinAccountDomainUsersSid  0x2a
#define WinAccountDomainGuestsSid  0x2b
#define WinAccountComputersSid  0x2c
#define WinAccountControllersSid  0x2d
#define WinAccountCertAdminsSid  0x2e
#define WinAccountSchemaAdminsSid  0x2f
#define WinAccountEnterpriseAdminsSid  0x30
#define WinAccountPolicyAdminsSid  0x31
#define WinAccountRasAndIasServersSid  0x32
#define WinNTLMAuthenticationSid  0x33
#define WinDigestAuthenticationSid  0x34
#define WinSChannelAuthenticationSid  0x35
#define WinThisOrganizationSid  0x36
#define WinOtherOrganizationSid  0x37
#define WinBuiltinIncomingForestTrustBuildersSid  0x38
#define WinBuiltinPerfMonitoringUsersSid  0x39
#define WinBuiltinPerfLoggingUsersSid  0x3a
#define WinBuiltinAuthorizationAccessSid  0x3b
#define WinBuiltinTerminalServerLicenseServersSid  0x3c
#define WinBuiltinDCOMUsersSid  0x3d
#define WinBuiltinIUsersSid  0x3e
#define WinIUserSid  0x3f
#define WinBuiltinCryptoOperatorsSid  0x40
#define WinUntrustedLabelSid  0x41
#define WinLowLabelSid  0x42
#define WinMediumLabelSid  0x43
#define WinHighLabelSid  0x44
#define WinSystemLabelSid  0x45
#define WinWriteRestrictedCodeSid  0x46
#define WinCreatorOwnerRightsSid  0x47
#define WinCacheablePrincipalsGroupSid  0x48
#define WinNonCacheablePrincipalsGroupSid  0x49
#define WinEnterpriseReadonlyControllersSid  0x4a
#define WinAccountReadonlyControllersSid  0x4b
#define WinBuiltinEventLogReadersGroup  0x4c
#define WinNewEnterpriseReadonlyControllersSid  0x4d
#define WinBuiltinCertSvcDComAccessGroup  0x4e
#define WinMediumPlusLabelSid  0x4f
#define WinLocalLogonSid  0x50
#define WinConsoleLogonSid  0x51
#define WinThisOrganizationCertificateSid  0x52
#define WinApplicationPackageAuthoritySid  0x53
#define WinBuiltinAnyPackageSid  0x54
#define WinCapabilityInternetClientSid  0x55
#define WinCapabilityInternetClientServerSid  0x56
#define WinCapabilityPrivateNetworkClientServerSid  0x57
#define WinCapabilityPicturesLibrarySid  0x58
#define WinCapabilityVideosLibrarySid  0x59
#define WinCapabilityMusicLibrarySid  0x5a
#define WinCapabilityDocumentsLibrarySid  0x5b
#define WinCapabilitySharedUserCertificatesSid  0x5c
#define WinCapabilityEnterpriseAuthenticationSid  0x5d
#define WinCapabilityRemovableStorageSid  0x5e
#define WinBuiltinRDSRemoteAccessServersSid  0x5f
#define WinBuiltinRDSEndpointServersSid  0x60
#define WinBuiltinRDSManagementServersSid  0x61
#define WinUserModeDriversSid  0x62
#define WinBuiltinHyperVAdminsSid  0x63
#define WinAccountCloneableControllersSid  0x64
#define WinBuiltinAccessControlAssistanceOperatorsSid  0x65
#define WinBuiltinRemoteManagementUsersSid  0x66
#define WinAuthenticationAuthorityAssertedSid  0x67
#define WinAuthenticationServiceAssertedSid  0x68
#define WinLocalAccountSid  0x69
#define WinLocalAccountAndAdministratorSid  0x6a
#define WinAccountProtectedUsersSid  0x6b
#define WinCapabilityAppointmentsSid  0x6c
#define WinCapabilityContactsSid  0x6d
#define WinAccountDefaultSystemManagedSid  0x6e
#define WinBuiltinDefaultSystemManagedGroupSid  0x6f
#define WinBuiltinStorageReplicaAdminsSid  0x70
#define WinAccountKeyAdminsSid  0x71
#define WinAccountEnterpriseKeyAdminsSid  0x72
#define WinAuthenticationKeyTrustSid  0x73
#define WinAuthenticationKeyPropertyMFASid  0x74
#define WinAuthenticationKeyPropertyAttestationSid  0x75
#define WinAuthenticationFreshKeyAuthSid  0x76
#define WinBuiltinDeviceOwnersSid  0x77

; WER_CONSENT
#define WerConsentNotAsked  0x1
#define WerConsentApproved  0x2
#define WerConsentDenied  0x3
#define WerConsentAlwaysPrompt  0x4
#define WerConsentMax  0x5

; WER_FAULT_REPORTING
#define WER_FAULT_REPORTING_FLAG_DISABLE_THREAD_SUSPENSION  0x4
#define WER_FAULT_REPORTING_FLAG_NOHEAP  0x1
#define WER_FAULT_REPORTING_FLAG_QUEUE  0x2
#define WER_FAULT_REPORTING_FLAG_QUEUE_UPLOAD  0x8
#define WER_FAULT_REPORTING_ALWAYS_SHOW_UI  0x10

; WER_FILE
#define WER_FILE_ANONYMOUS_DATA  0x2
#define WER_FILE_DELETE_WHEN_DONE  0x1

; WER_FILE_TYPE
#define WerFileTypeMicrodump  0x1
#define WerFileTypeMinidump  0x2
#define WerFileTypeHeapdump  0x3
#define WerFileTypeUserDocument  0x4
#define WerFileTypeOther  0x5
#define WerFileTypeTriagedump  0x6
#define WerFileTypeCustomDump  0x7
#define WerFileTypeAuxiliaryDump  0x8
#define WerFileTypeEtlTrace  0x9
#define WerFileTypeMax  0xa

; WER_REGISTER_FILE_TYPE
#define WerRegFileTypeUserDocument  0x1
#define WerRegFileTypeOther  0x2
#define WerRegFileTypeMax  0x3

; WER_REPORT_TYPE
#define WerReportNonCritical  0x0
#define WerReportCritical  0x1
#define WerReportApplicationCrash  0x2
#define WerReportApplicationHang  0x3
#define WerReportKernel  0x4
#define WerReportInvalid  0x5

; WER_REPORT_UI
#define WerUIAdditionalDataDlgHeader  0x1
#define WerUIIconFilePath  0x2
#define WerUIConsentDlgHeader  0x3
#define WerUIConsentDlgBody  0x4
#define WerUIOnlineSolutionCheckText  0x5
#define WerUIOfflineSolutionCheckText  0x6
#define WerUICloseText  0x7
#define WerUICloseDlgHeader  0x8
#define WerUICloseDlgBody  0x9
#define WerUICloseDlgButtonText  0xa
#define WerUIMax  0xb

; WER_SUBMIT_FLAGS
#define WER_SUBMIT_ADD_REGISTERED_DATA  0x10
#define WER_SUBMIT_HONOR_RECOVERY  0x1
#define WER_SUBMIT_HONOR_RESTART  0x2
#define WER_SUBMIT_NO_ARCHIVE  0x100
#define WER_SUBMIT_NO_CLOSE_UI  0x40
#define WER_SUBMIT_NO_QUEUE  0x80
#define WER_SUBMIT_OUTOFPROCESS  0x20
#define WER_SUBMIT_OUTOFPROCESS_ASYNC  0x400
#define WER_SUBMIT_QUEUE  0x4
#define WER_SUBMIT_SHOW_DEBUG  0x8
#define WER_SUBMIT_START_MINIMIZED  0x200
#define WER_SUBMIT_BYPASS_DATA_THROTTLING  0x800
#define WER_SUBMIT_ARCHIVE_PARAMETERS_ONLY  0x1000
#define WER_SUBMIT_REPORT_MACHINE_ID  0x2000

; WER_SUBMIT_RESULT
#define WerReportQueued  0x1
#define WerReportUploaded  0x2
#define WerReportDebug  0x3
#define WerReportFailed  0x4
#define WerDisabled  0x5
#define WerReportCancelled  0x6
#define WerDisabledQueue  0x7
#define WerReportAsync  0x8
#define WerCustomAction  0x9
#define WerThrottled  0xa
#define WerReportUploadedCab  0xb
#define WerStorageLocationNotFound  0xc
#define WerSubmitResultMax  0xd

; WICBitmapAlphaChannelOption
#define WICBitmapUseAlpha  0x0
#define WICBitmapUsePremultipliedAlpha  0x1
#define WICBitmapIgnoreAlpha  0x2

; WICBitmapCreateCacheOption
#define WICBitmapNoCache  0x0
#define WICBitmapCacheOnDemand  0x1
#define WICBitmapCacheOnLoad  0x2

; WICBitmapDitherType
#define WICBitmapDitherTypeNone  0x0
#define WICBitmapDitherTypeSolid  0x0
#define WICBitmapDitherTypeOrdered4x4  0x1
#define WICBitmapDitherTypeOrdered8x8  0x2
#define WICBitmapDitherTypeOrdered16x16  0x3
#define WICBitmapDitherTypeSpiral4x4  0x4
#define WICBitmapDitherTypeSpiral8x8  0x5
#define WICBitmapDitherTypeDualSpiral4x4  0x6
#define WICBitmapDitherTypeDualSpiral8x8  0x7
#define WICBitmapDitherTypeErrorDiffusion  0x8

; WICBitmapEncoderCacheOption
#define WICBitmapEncoderCacheInMemory  0x0
#define WICBitmapEncoderCacheTempFile  0x1
#define WICBitmapEncoderNoCache  0x2

; WICBitmapInterpolationMode
#define WICBitmapInterpolationModeNearestNeighbor  0x0
#define WICBitmapInterpolationModeLinear  0x1
#define WICBitmapInterpolationModeCubic  0x2
#define WICBitmapInterpolationModeFant  0x3
#define WICBitmapInterpolationModeHighQualityCubic  0x4

; WICBitmapPaletteType
#define WICBitmapPaletteTypeCustom  0x0
#define WICBitmapPaletteTypeMedianCut  0x1
#define WICBitmapPaletteTypeFixedBW  0x2
#define WICBitmapPaletteTypeFixedHalftone8  0x3
#define WICBitmapPaletteTypeFixedHalftone27  0x4
#define WICBitmapPaletteTypeFixedHalftone64  0x5
#define WICBitmapPaletteTypeFixedHalftone125  0x6
#define WICBitmapPaletteTypeFixedHalftone216  0x7
#define WICBitmapPaletteTypeFixedWebPalette  0x7
#define WICBitmapPaletteTypeFixedHalftone252  0x8
#define WICBitmapPaletteTypeFixedHalftone256  0x9
#define WICBitmapPaletteTypeFixedGray4  0xa
#define WICBitmapPaletteTypeFixedGray16  0xb
#define WICBitmapPaletteTypeFixedGray256  0xc

; WICBitmapTransformOptions
#define WICBitmapTransformRotate0  0x0
#define WICBitmapTransformRotate90  0x1
#define WICBitmapTransformRotate180  0x2
#define WICBitmapTransformRotate270  0x3
#define WICBitmapTransformFlipHorizontal  0x8
#define WICBitmapTransformFlipVertical  0x10

; WICColorContextType
#define WICColorContextUninitialized  0x0
#define WICColorContextProfile  0x1
#define WICColorContextExifColorSpace  0x2

; WICComponentType
#define WICDecoder  0x1
#define WICEncoder  0x2
#define WICPixelFormatConverter  0x4
#define WICMetadataReader  0x8
#define WICMetadataWriter  0x10
#define WICPixelFormat  0x20
#define WICAllComponents  0x3f

; WICDecodeOptions
#define WICDecodeMetadataCacheOnDemand  0x0
#define WICDecodeMetadataCacheOnLoad  0x1

; WICSectionAccessLevel
#define WICSectionAccessLevelRead  0x1
#define WICSectionAccessLevelReadWrite  0x3

; WIN32_ERROR
#define NO_ERROR  0x0
#define ERROR_EXPECTED_SECTION_NAME  0xe0000000
#define ERROR_BAD_SECTION_NAME_LINE  0xe0000001
#define ERROR_SECTION_NAME_TOO_LONG  0xe0000002
#define ERROR_GENERAL_SYNTAX  0xe0000003
#define ERROR_WRONG_INF_STYLE  0xe0000100
#define ERROR_SECTION_NOT_FOUND  0xe0000101
#define ERROR_LINE_NOT_FOUND  0xe0000102
#define ERROR_NO_BACKUP  0xe0000103
#define ERROR_NO_ASSOCIATED_CLASS  0xe0000200
#define ERROR_CLASS_MISMATCH  0xe0000201
#define ERROR_DUPLICATE_FOUND  0xe0000202
#define ERROR_NO_DRIVER_SELECTED  0xe0000203
#define ERROR_KEY_DOES_NOT_EXIST  0xe0000204
#define ERROR_INVALID_DEVINST_NAME  0xe0000205
#define ERROR_INVALID_CLASS  0xe0000206
#define ERROR_DEVINST_ALREADY_EXISTS  0xe0000207
#define ERROR_DEVINFO_NOT_REGISTERED  0xe0000208
#define ERROR_INVALID_REG_PROPERTY  0xe0000209
#define ERROR_NO_INF  0xe000020a
#define ERROR_NO_SUCH_DEVINST  0xe000020b
#define ERROR_CANT_LOAD_CLASS_ICON  0xe000020c
#define ERROR_INVALID_CLASS_INSTALLER  0xe000020d
#define ERROR_DI_DO_DEFAULT  0xe000020e
#define ERROR_DI_NOFILECOPY  0xe000020f
#define ERROR_INVALID_HWPROFILE  0xe0000210
#define ERROR_NO_DEVICE_SELECTED  0xe0000211
#define ERROR_DEVINFO_LIST_LOCKED  0xe0000212
#define ERROR_DEVINFO_DATA_LOCKED  0xe0000213
#define ERROR_DI_BAD_PATH  0xe0000214
#define ERROR_NO_CLASSINSTALL_PARAMS  0xe0000215
#define ERROR_FILEQUEUE_LOCKED  0xe0000216
#define ERROR_BAD_SERVICE_INSTALLSECT  0xe0000217
#define ERROR_NO_CLASS_DRIVER_LIST  0xe0000218
#define ERROR_NO_ASSOCIATED_SERVICE  0xe0000219
#define ERROR_NO_DEFAULT_DEVICE_INTERFACE  0xe000021a
#define ERROR_DEVICE_INTERFACE_ACTIVE  0xe000021b
#define ERROR_DEVICE_INTERFACE_REMOVED  0xe000021c
#define ERROR_BAD_INTERFACE_INSTALLSECT  0xe000021d
#define ERROR_NO_SUCH_INTERFACE_CLASS  0xe000021e
#define ERROR_INVALID_REFERENCE_STRING  0xe000021f
#define ERROR_INVALID_MACHINENAME  0xe0000220
#define ERROR_REMOTE_COMM_FAILURE  0xe0000221
#define ERROR_MACHINE_UNAVAILABLE  0xe0000222
#define ERROR_NO_CONFIGMGR_SERVICES  0xe0000223
#define ERROR_INVALID_PROPPAGE_PROVIDER  0xe0000224
#define ERROR_NO_SUCH_DEVICE_INTERFACE  0xe0000225
#define ERROR_DI_POSTPROCESSING_REQUIRED  0xe0000226
#define ERROR_INVALID_COINSTALLER  0xe0000227
#define ERROR_NO_COMPAT_DRIVERS  0xe0000228
#define ERROR_NO_DEVICE_ICON  0xe0000229
#define ERROR_INVALID_INF_LOGCONFIG  0xe000022a
#define ERROR_DI_DONT_INSTALL  0xe000022b
#define ERROR_INVALID_FILTER_DRIVER  0xe000022c
#define ERROR_NON_WINDOWS_NT_DRIVER  0xe000022d
#define ERROR_NON_WINDOWS_DRIVER  0xe000022e
#define ERROR_NO_CATALOG_FOR_OEM_INF  0xe000022f
#define ERROR_DEVINSTALL_QUEUE_NONNATIVE  0xe0000230
#define ERROR_NOT_DISABLEABLE  0xe0000231
#define ERROR_CANT_REMOVE_DEVINST  0xe0000232
#define ERROR_INVALID_TARGET  0xe0000233
#define ERROR_DRIVER_NONNATIVE  0xe0000234
#define ERROR_IN_WOW64  0xe0000235
#define ERROR_SET_SYSTEM_RESTORE_POINT  0xe0000236
#define ERROR_SCE_DISABLED  0xe0000238
#define ERROR_UNKNOWN_EXCEPTION  0xe0000239
#define ERROR_PNP_REGISTRY_ERROR  0xe000023a
#define ERROR_REMOTE_REQUEST_UNSUPPORTED  0xe000023b
#define ERROR_NOT_AN_INSTALLED_OEM_INF  0xe000023c
#define ERROR_INF_IN_USE_BY_DEVICES  0xe000023d
#define ERROR_DI_FUNCTION_OBSOLETE  0xe000023e
#define ERROR_NO_AUTHENTICODE_CATALOG  0xe000023f
#define ERROR_AUTHENTICODE_DISALLOWED  0xe0000240
#define ERROR_AUTHENTICODE_TRUSTED_PUBLISHER  0xe0000241
#define ERROR_AUTHENTICODE_TRUST_NOT_ESTABLISHED  0xe0000242
#define ERROR_AUTHENTICODE_PUBLISHER_NOT_TRUSTED  0xe0000243
#define ERROR_SIGNATURE_OSATTRIBUTE_MISMATCH  0xe0000244
#define ERROR_ONLY_VALIDATE_VIA_AUTHENTICODE  0xe0000245
#define ERROR_DEVICE_INSTALLER_NOT_READY  0xe0000246
#define ERROR_DRIVER_STORE_ADD_FAILED  0xe0000247
#define ERROR_DEVICE_INSTALL_BLOCKED  0xe0000248
#define ERROR_DRIVER_INSTALL_BLOCKED  0xe0000249
#define ERROR_WRONG_INF_TYPE  0xe000024a
#define ERROR_FILE_HASH_NOT_IN_CATALOG  0xe000024b
#define ERROR_DRIVER_STORE_DELETE_FAILED  0xe000024c
#define ERROR_UNRECOVERABLE_STACK_OVERFLOW  0xe0000300
#define ERROR_NO_DEFAULT_INTERFACE_DEVICE  0xe000021a
#define ERROR_INTERFACE_DEVICE_ACTIVE  0xe000021b
#define ERROR_INTERFACE_DEVICE_REMOVED  0xe000021c
#define ERROR_NO_SUCH_INTERFACE_DEVICE  0xe0000225
#define ERROR_NOT_INSTALLED  0xe0001000
#define ERROR_SUCCESS  0x0
#define ERROR_INVALID_FUNCTION  0x1
#define ERROR_FILE_NOT_FOUND  0x2
#define ERROR_PATH_NOT_FOUND  0x3
#define ERROR_TOO_MANY_OPEN_FILES  0x4
#define ERROR_ACCESS_DENIED  0x5
#define ERROR_INVALID_HANDLE  0x6
#define ERROR_ARENA_TRASHED  0x7
#define ERROR_NOT_ENOUGH_MEMORY  0x8
#define ERROR_INVALID_BLOCK  0x9
#define ERROR_BAD_ENVIRONMENT  0xa
#define ERROR_BAD_FORMAT  0xb
#define ERROR_INVALID_ACCESS  0xc
#define ERROR_INVALID_DATA  0xd
#define ERROR_OUTOFMEMORY  0xe
#define ERROR_INVALID_DRIVE  0xf
#define ERROR_CURRENT_DIRECTORY  0x10
#define ERROR_NOT_SAME_DEVICE  0x11
#define ERROR_NO_MORE_FILES  0x12
#define ERROR_WRITE_PROTECT  0x13
#define ERROR_BAD_UNIT  0x14
#define ERROR_NOT_READY  0x15
#define ERROR_BAD_COMMAND  0x16
#define ERROR_CRC  0x17
#define ERROR_BAD_LENGTH  0x18
#define ERROR_SEEK  0x19
#define ERROR_NOT_DOS_DISK  0x1a
#define ERROR_SECTOR_NOT_FOUND  0x1b
#define ERROR_OUT_OF_PAPER  0x1c
#define ERROR_WRITE_FAULT  0x1d
#define ERROR_READ_FAULT  0x1e
#define ERROR_GEN_FAILURE  0x1f
#define ERROR_SHARING_VIOLATION  0x20
#define ERROR_LOCK_VIOLATION  0x21
#define ERROR_WRONG_DISK  0x22
#define ERROR_SHARING_BUFFER_EXCEEDED  0x24
#define ERROR_HANDLE_EOF  0x26
#define ERROR_HANDLE_DISK_FULL  0x27
#define ERROR_NOT_SUPPORTED  0x32
#define ERROR_REM_NOT_LIST  0x33
#define ERROR_DUP_NAME  0x34
#define ERROR_BAD_NETPATH  0x35
#define ERROR_NETWORK_BUSY  0x36
#define ERROR_DEV_NOT_EXIST  0x37
#define ERROR_TOO_MANY_CMDS  0x38
#define ERROR_ADAP_HDW_ERR  0x39
#define ERROR_BAD_NET_RESP  0x3a
#define ERROR_UNEXP_NET_ERR  0x3b
#define ERROR_BAD_REM_ADAP  0x3c
#define ERROR_PRINTQ_FULL  0x3d
#define ERROR_NO_SPOOL_SPACE  0x3e
#define ERROR_PRINT_CANCELLED  0x3f
#define ERROR_NETNAME_DELETED  0x40
#define ERROR_NETWORK_ACCESS_DENIED  0x41
#define ERROR_BAD_DEV_TYPE  0x42
#define ERROR_BAD_NET_NAME  0x43
#define ERROR_TOO_MANY_NAMES  0x44
#define ERROR_TOO_MANY_SESS  0x45
#define ERROR_SHARING_PAUSED  0x46
#define ERROR_REQ_NOT_ACCEP  0x47
#define ERROR_REDIR_PAUSED  0x48
#define ERROR_FILE_EXISTS  0x50
#define ERROR_CANNOT_MAKE  0x52
#define ERROR_FAIL_I24  0x53
#define ERROR_OUT_OF_STRUCTURES  0x54
#define ERROR_ALREADY_ASSIGNED  0x55
#define ERROR_INVALID_PASSWORD  0x56
#define ERROR_INVALID_PARAMETER  0x57
#define ERROR_NET_WRITE_FAULT  0x58
#define ERROR_NO_PROC_SLOTS  0x59
#define ERROR_TOO_MANY_SEMAPHORES  0x64
#define ERROR_EXCL_SEM_ALREADY_OWNED  0x65
#define ERROR_SEM_IS_SET  0x66
#define ERROR_TOO_MANY_SEM_REQUESTS  0x67
#define ERROR_INVALID_AT_INTERRUPT_TIME  0x68
#define ERROR_SEM_OWNER_DIED  0x69
#define ERROR_SEM_USER_LIMIT  0x6a
#define ERROR_DISK_CHANGE  0x6b
#define ERROR_DRIVE_LOCKED  0x6c
#define ERROR_BROKEN_PIPE  0x6d
#define ERROR_OPEN_FAILED  0x6e
#define ERROR_BUFFER_OVERFLOW  0x6f
#define ERROR_DISK_FULL  0x70
#define ERROR_NO_MORE_SEARCH_HANDLES  0x71
#define ERROR_INVALID_TARGET_HANDLE  0x72
#define ERROR_INVALID_CATEGORY  0x75
#define ERROR_INVALID_VERIFY_SWITCH  0x76
#define ERROR_BAD_DRIVER_LEVEL  0x77
#define ERROR_CALL_NOT_IMPLEMENTED  0x78
#define ERROR_SEM_TIMEOUT  0x79
#define ERROR_INSUFFICIENT_BUFFER  0x7a
#define ERROR_INVALID_NAME  0x7b
#define ERROR_INVALID_LEVEL  0x7c
#define ERROR_NO_VOLUME_LABEL  0x7d
#define ERROR_MOD_NOT_FOUND  0x7e
#define ERROR_PROC_NOT_FOUND  0x7f
#define ERROR_WAIT_NO_CHILDREN  0x80
#define ERROR_CHILD_NOT_COMPLETE  0x81
#define ERROR_DIRECT_ACCESS_HANDLE  0x82
#define ERROR_NEGATIVE_SEEK  0x83
#define ERROR_SEEK_ON_DEVICE  0x84
#define ERROR_IS_JOIN_TARGET  0x85
#define ERROR_IS_JOINED  0x86
#define ERROR_IS_SUBSTED  0x87
#define ERROR_NOT_JOINED  0x88
#define ERROR_NOT_SUBSTED  0x89
#define ERROR_JOIN_TO_JOIN  0x8a
#define ERROR_SUBST_TO_SUBST  0x8b
#define ERROR_JOIN_TO_SUBST  0x8c
#define ERROR_SUBST_TO_JOIN  0x8d
#define ERROR_BUSY_DRIVE  0x8e
#define ERROR_SAME_DRIVE  0x8f
#define ERROR_DIR_NOT_ROOT  0x90
#define ERROR_DIR_NOT_EMPTY  0x91
#define ERROR_IS_SUBST_PATH  0x92
#define ERROR_IS_JOIN_PATH  0x93
#define ERROR_PATH_BUSY  0x94
#define ERROR_IS_SUBST_TARGET  0x95
#define ERROR_SYSTEM_TRACE  0x96
#define ERROR_INVALID_EVENT_COUNT  0x97
#define ERROR_TOO_MANY_MUXWAITERS  0x98
#define ERROR_INVALID_LIST_FORMAT  0x99
#define ERROR_LABEL_TOO_LONG  0x9a
#define ERROR_TOO_MANY_TCBS  0x9b
#define ERROR_SIGNAL_REFUSED  0x9c
#define ERROR_DISCARDED  0x9d
#define ERROR_NOT_LOCKED  0x9e
#define ERROR_BAD_THREADID_ADDR  0x9f
#define ERROR_BAD_ARGUMENTS  0xa0
#define ERROR_BAD_PATHNAME  0xa1
#define ERROR_SIGNAL_PENDING  0xa2
#define ERROR_MAX_THRDS_REACHED  0xa4
#define ERROR_LOCK_FAILED  0xa7
#define ERROR_BUSY  0xaa
#define ERROR_DEVICE_SUPPORT_IN_PROGRESS  0xab
#define ERROR_CANCEL_VIOLATION  0xad
#define ERROR_ATOMIC_LOCKS_NOT_SUPPORTED  0xae
#define ERROR_INVALID_SEGMENT_NUMBER  0xb4
#define ERROR_INVALID_ORDINAL  0xb6
#define ERROR_ALREADY_EXISTS  0xb7
#define ERROR_INVALID_FLAG_NUMBER  0xba
#define ERROR_SEM_NOT_FOUND  0xbb
#define ERROR_INVALID_STARTING_CODESEG  0xbc
#define ERROR_INVALID_STACKSEG  0xbd
#define ERROR_INVALID_MODULETYPE  0xbe
#define ERROR_INVALID_EXE_SIGNATURE  0xbf
#define ERROR_EXE_MARKED_INVALID  0xc0
#define ERROR_BAD_EXE_FORMAT  0xc1
#define ERROR_ITERATED_DATA_EXCEEDS_64k  0xc2
#define ERROR_INVALID_MINALLOCSIZE  0xc3
#define ERROR_DYNLINK_FROM_INVALID_RING  0xc4
#define ERROR_IOPL_NOT_ENABLED  0xc5
#define ERROR_INVALID_SEGDPL  0xc6
#define ERROR_AUTODATASEG_EXCEEDS_64k  0xc7
#define ERROR_RING2SEG_MUST_BE_MOVABLE  0xc8
#define ERROR_RELOC_CHAIN_XEEDS_SEGLIM  0xc9
#define ERROR_INFLOOP_IN_RELOC_CHAIN  0xca
#define ERROR_ENVVAR_NOT_FOUND  0xcb
#define ERROR_NO_SIGNAL_SENT  0xcd
#define ERROR_FILENAME_EXCED_RANGE  0xce
#define ERROR_RING2_STACK_IN_USE  0xcf
#define ERROR_META_EXPANSION_TOO_LONG  0xd0
#define ERROR_INVALID_SIGNAL_NUMBER  0xd1
#define ERROR_THREAD_1_INACTIVE  0xd2
#define ERROR_LOCKED  0xd4
#define ERROR_TOO_MANY_MODULES  0xd6
#define ERROR_NESTING_NOT_ALLOWED  0xd7
#define ERROR_EXE_MACHINE_TYPE_MISMATCH  0xd8
#define ERROR_EXE_CANNOT_MODIFY_SIGNED_BINARY  0xd9
#define ERROR_EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY  0xda
#define ERROR_FILE_CHECKED_OUT  0xdc
#define ERROR_CHECKOUT_REQUIRED  0xdd
#define ERROR_BAD_FILE_TYPE  0xde
#define ERROR_FILE_TOO_LARGE  0xdf
#define ERROR_FORMS_AUTH_REQUIRED  0xe0
#define ERROR_VIRUS_INFECTED  0xe1
#define ERROR_VIRUS_DELETED  0xe2
#define ERROR_PIPE_LOCAL  0xe5
#define ERROR_BAD_PIPE  0xe6
#define ERROR_PIPE_BUSY  0xe7
#define ERROR_NO_DATA  0xe8
#define ERROR_PIPE_NOT_CONNECTED  0xe9
#define ERROR_MORE_DATA  0xea
#define ERROR_NO_WORK_DONE  0xeb
#define ERROR_VC_DISCONNECTED  0xf0
#define ERROR_INVALID_EA_NAME  0xfe
#define ERROR_EA_LIST_INCONSISTENT  0xff
#define ERROR_NO_MORE_ITEMS  0x103
#define ERROR_CANNOT_COPY  0x10a
#define ERROR_DIRECTORY  0x10b
#define ERROR_EAS_DIDNT_FIT  0x113
#define ERROR_EA_FILE_CORRUPT  0x114
#define ERROR_EA_TABLE_FULL  0x115
#define ERROR_INVALID_EA_HANDLE  0x116
#define ERROR_EAS_NOT_SUPPORTED  0x11a
#define ERROR_NOT_OWNER  0x120
#define ERROR_TOO_MANY_POSTS  0x12a
#define ERROR_PARTIAL_COPY  0x12b
#define ERROR_OPLOCK_NOT_GRANTED  0x12c
#define ERROR_INVALID_OPLOCK_PROTOCOL  0x12d
#define ERROR_DISK_TOO_FRAGMENTED  0x12e
#define ERROR_DELETE_PENDING  0x12f
#define ERROR_INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING  0x130
#define ERROR_SHORT_NAMES_NOT_ENABLED_ON_VOLUME  0x131
#define ERROR_SECURITY_STREAM_IS_INCONSISTENT  0x132
#define ERROR_INVALID_LOCK_RANGE  0x133
#define ERROR_IMAGE_SUBSYSTEM_NOT_PRESENT  0x134
#define ERROR_NOTIFICATION_GUID_ALREADY_DEFINED  0x135
#define ERROR_INVALID_EXCEPTION_HANDLER  0x136
#define ERROR_DUPLICATE_PRIVILEGES  0x137
#define ERROR_NO_RANGES_PROCESSED  0x138
#define ERROR_NOT_ALLOWED_ON_SYSTEM_FILE  0x139
#define ERROR_DISK_RESOURCES_EXHAUSTED  0x13a
#define ERROR_INVALID_TOKEN  0x13b
#define ERROR_DEVICE_FEATURE_NOT_SUPPORTED  0x13c
#define ERROR_MR_MID_NOT_FOUND  0x13d
#define ERROR_SCOPE_NOT_FOUND  0x13e
#define ERROR_UNDEFINED_SCOPE  0x13f
#define ERROR_INVALID_CAP  0x140
#define ERROR_DEVICE_UNREACHABLE  0x141
#define ERROR_DEVICE_NO_RESOURCES  0x142
#define ERROR_DATA_CHECKSUM_ERROR  0x143
#define ERROR_INTERMIXED_KERNEL_EA_OPERATION  0x144
#define ERROR_FILE_LEVEL_TRIM_NOT_SUPPORTED  0x146
#define ERROR_OFFSET_ALIGNMENT_VIOLATION  0x147
#define ERROR_INVALID_FIELD_IN_PARAMETER_LIST  0x148
#define ERROR_OPERATION_IN_PROGRESS  0x149
#define ERROR_BAD_DEVICE_PATH  0x14a
#define ERROR_TOO_MANY_DESCRIPTORS  0x14b
#define ERROR_SCRUB_DATA_DISABLED  0x14c
#define ERROR_NOT_REDUNDANT_STORAGE  0x14d
#define ERROR_RESIDENT_FILE_NOT_SUPPORTED  0x14e
#define ERROR_COMPRESSED_FILE_NOT_SUPPORTED  0x14f
#define ERROR_DIRECTORY_NOT_SUPPORTED  0x150
#define ERROR_NOT_READ_FROM_COPY  0x151
#define ERROR_FT_WRITE_FAILURE  0x152
#define ERROR_FT_DI_SCAN_REQUIRED  0x153
#define ERROR_INVALID_KERNEL_INFO_VERSION  0x154
#define ERROR_INVALID_PEP_INFO_VERSION  0x155
#define ERROR_OBJECT_NOT_EXTERNALLY_BACKED  0x156
#define ERROR_EXTERNAL_BACKING_PROVIDER_UNKNOWN  0x157
#define ERROR_COMPRESSION_NOT_BENEFICIAL  0x158
#define ERROR_STORAGE_TOPOLOGY_ID_MISMATCH  0x159
#define ERROR_BLOCKED_BY_PARENTAL_CONTROLS  0x15a
#define ERROR_BLOCK_TOO_MANY_REFERENCES  0x15b
#define ERROR_MARKED_TO_DISALLOW_WRITES  0x15c
#define ERROR_ENCLAVE_FAILURE  0x15d
#define ERROR_FAIL_NOACTION_REBOOT  0x15e
#define ERROR_FAIL_SHUTDOWN  0x15f
#define ERROR_FAIL_RESTART  0x160
#define ERROR_MAX_SESSIONS_REACHED  0x161
#define ERROR_NETWORK_ACCESS_DENIED_EDP  0x162
#define ERROR_DEVICE_HINT_NAME_BUFFER_TOO_SMALL  0x163
#define ERROR_EDP_POLICY_DENIES_OPERATION  0x164
#define ERROR_EDP_DPL_POLICY_CANT_BE_SATISFIED  0x165
#define ERROR_CLOUD_FILE_SYNC_ROOT_METADATA_CORRUPT  0x166
#define ERROR_DEVICE_IN_MAINTENANCE  0x167
#define ERROR_NOT_SUPPORTED_ON_DAX  0x168
#define ERROR_DAX_MAPPING_EXISTS  0x169
#define ERROR_CLOUD_FILE_PROVIDER_NOT_RUNNING  0x16a
#define ERROR_CLOUD_FILE_METADATA_CORRUPT  0x16b
#define ERROR_CLOUD_FILE_METADATA_TOO_LARGE  0x16c
#define ERROR_CLOUD_FILE_PROPERTY_BLOB_TOO_LARGE  0x16d
#define ERROR_CLOUD_FILE_PROPERTY_BLOB_CHECKSUM_MISMATCH  0x16e
#define ERROR_CHILD_PROCESS_BLOCKED  0x16f
#define ERROR_STORAGE_LOST_DATA_PERSISTENCE  0x170
#define ERROR_FILE_SYSTEM_VIRTUALIZATION_UNAVAILABLE  0x171
#define ERROR_FILE_SYSTEM_VIRTUALIZATION_METADATA_CORRUPT  0x172
#define ERROR_FILE_SYSTEM_VIRTUALIZATION_BUSY  0x173
#define ERROR_FILE_SYSTEM_VIRTUALIZATION_PROVIDER_UNKNOWN  0x174
#define ERROR_GDI_HANDLE_LEAK  0x175
#define ERROR_CLOUD_FILE_TOO_MANY_PROPERTY_BLOBS  0x176
#define ERROR_CLOUD_FILE_PROPERTY_VERSION_NOT_SUPPORTED  0x177
#define ERROR_NOT_A_CLOUD_FILE  0x178
#define ERROR_CLOUD_FILE_NOT_IN_SYNC  0x179
#define ERROR_CLOUD_FILE_ALREADY_CONNECTED  0x17a
#define ERROR_CLOUD_FILE_NOT_SUPPORTED  0x17b
#define ERROR_CLOUD_FILE_INVALID_REQUEST  0x17c
#define ERROR_CLOUD_FILE_READ_ONLY_VOLUME  0x17d
#define ERROR_CLOUD_FILE_CONNECTED_PROVIDER_ONLY  0x17e
#define ERROR_CLOUD_FILE_VALIDATION_FAILED  0x17f
#define ERROR_SMB1_NOT_AVAILABLE  0x180
#define ERROR_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION  0x181
#define ERROR_CLOUD_FILE_AUTHENTICATION_FAILED  0x182
#define ERROR_CLOUD_FILE_INSUFFICIENT_RESOURCES  0x183
#define ERROR_CLOUD_FILE_NETWORK_UNAVAILABLE  0x184
#define ERROR_CLOUD_FILE_UNSUCCESSFUL  0x185
#define ERROR_CLOUD_FILE_NOT_UNDER_SYNC_ROOT  0x186
#define ERROR_CLOUD_FILE_IN_USE  0x187
#define ERROR_CLOUD_FILE_PINNED  0x188
#define ERROR_CLOUD_FILE_REQUEST_ABORTED  0x189
#define ERROR_CLOUD_FILE_PROPERTY_CORRUPT  0x18a
#define ERROR_CLOUD_FILE_ACCESS_DENIED  0x18b
#define ERROR_CLOUD_FILE_INCOMPATIBLE_HARDLINKS  0x18c
#define ERROR_CLOUD_FILE_PROPERTY_LOCK_CONFLICT  0x18d
#define ERROR_CLOUD_FILE_REQUEST_CANCELED  0x18e
#define ERROR_EXTERNAL_SYSKEY_NOT_SUPPORTED  0x18f
#define ERROR_THREAD_MODE_ALREADY_BACKGROUND  0x190
#define ERROR_THREAD_MODE_NOT_BACKGROUND  0x191
#define ERROR_PROCESS_MODE_ALREADY_BACKGROUND  0x192
#define ERROR_PROCESS_MODE_NOT_BACKGROUND  0x193
#define ERROR_CLOUD_FILE_PROVIDER_TERMINATED  0x194
#define ERROR_NOT_A_CLOUD_SYNC_ROOT  0x195
#define ERROR_FILE_PROTECTED_UNDER_DPL  0x196
#define ERROR_VOLUME_NOT_CLUSTER_ALIGNED  0x197
#define ERROR_NO_PHYSICALLY_ALIGNED_FREE_SPACE_FOUND  0x198
#define ERROR_APPX_FILE_NOT_ENCRYPTED  0x199
#define ERROR_RWRAW_ENCRYPTED_FILE_NOT_ENCRYPTED  0x19a
#define ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILEOFFSET  0x19b
#define ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILERANGE  0x19c
#define ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_PARAMETER  0x19d
#define ERROR_LINUX_SUBSYSTEM_NOT_PRESENT  0x19e
#define ERROR_FT_READ_FAILURE  0x19f
#define ERROR_STORAGE_RESERVE_ID_INVALID  0x1a0
#define ERROR_STORAGE_RESERVE_DOES_NOT_EXIST  0x1a1
#define ERROR_STORAGE_RESERVE_ALREADY_EXISTS  0x1a2
#define ERROR_STORAGE_RESERVE_NOT_EMPTY  0x1a3
#define ERROR_NOT_A_DAX_VOLUME  0x1a4
#define ERROR_NOT_DAX_MAPPABLE  0x1a5
#define ERROR_TIME_SENSITIVE_THREAD  0x1a6
#define ERROR_DPL_NOT_SUPPORTED_FOR_USER  0x1a7
#define ERROR_CASE_DIFFERING_NAMES_IN_DIR  0x1a8
#define ERROR_FILE_NOT_SUPPORTED  0x1a9
#define ERROR_CLOUD_FILE_REQUEST_TIMEOUT  0x1aa
#define ERROR_NO_TASK_QUEUE  0x1ab
#define ERROR_SRC_SRV_DLL_LOAD_FAILED  0x1ac
#define ERROR_NOT_SUPPORTED_WITH_BTT  0x1ad
#define ERROR_ENCRYPTION_DISABLED  0x1ae
#define ERROR_ENCRYPTING_METADATA_DISALLOWED  0x1af
#define ERROR_CANT_CLEAR_ENCRYPTION_FLAG  0x1b0
#define ERROR_NO_SUCH_DEVICE  0x1b1
#define ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED  0x1b2
#define ERROR_FILE_SNAP_IN_PROGRESS  0x1b3
#define ERROR_FILE_SNAP_USER_SECTION_NOT_SUPPORTED  0x1b4
#define ERROR_FILE_SNAP_MODIFY_NOT_SUPPORTED  0x1b5
#define ERROR_FILE_SNAP_IO_NOT_COORDINATED  0x1b6
#define ERROR_FILE_SNAP_UNEXPECTED_ERROR  0x1b7
#define ERROR_FILE_SNAP_INVALID_PARAMETER  0x1b8
#define ERROR_UNSATISFIED_DEPENDENCIES  0x1b9
#define ERROR_CASE_SENSITIVE_PATH  0x1ba
#define ERROR_UNEXPECTED_NTCACHEMANAGER_ERROR  0x1bb
#define ERROR_LINUX_SUBSYSTEM_UPDATE_REQUIRED  0x1bc
#define ERROR_DLP_POLICY_WARNS_AGAINST_OPERATION  0x1bd
#define ERROR_DLP_POLICY_DENIES_OPERATION  0x1be
#define ERROR_SECURITY_DENIES_OPERATION  0x1bf
#define ERROR_UNTRUSTED_MOUNT_POINT  0x1c0
#define ERROR_DLP_POLICY_SILENTLY_FAIL  0x1c1
#define ERROR_CAPAUTHZ_NOT_DEVUNLOCKED  0x1c2
#define ERROR_CAPAUTHZ_CHANGE_TYPE  0x1c3
#define ERROR_CAPAUTHZ_NOT_PROVISIONED  0x1c4
#define ERROR_CAPAUTHZ_NOT_AUTHORIZED  0x1c5
#define ERROR_CAPAUTHZ_NO_POLICY  0x1c6
#define ERROR_CAPAUTHZ_DB_CORRUPTED  0x1c7
#define ERROR_CAPAUTHZ_SCCD_INVALID_CATALOG  0x1c8
#define ERROR_CAPAUTHZ_SCCD_NO_AUTH_ENTITY  0x1c9
#define ERROR_CAPAUTHZ_SCCD_PARSE_ERROR  0x1ca
#define ERROR_CAPAUTHZ_SCCD_DEV_MODE_REQUIRED  0x1cb
#define ERROR_CAPAUTHZ_SCCD_NO_CAPABILITY_MATCH  0x1cc
#define ERROR_CIMFS_IMAGE_CORRUPT  0x1d6
#define ERROR_CIMFS_IMAGE_VERSION_NOT_SUPPORTED  0x1d7
#define ERROR_STORAGE_STACK_ACCESS_DENIED  0x1d8
#define ERROR_INSUFFICIENT_VIRTUAL_ADDR_RESOURCES  0x1d9
#define ERROR_INDEX_OUT_OF_BOUNDS  0x1da
#define ERROR_CLOUD_FILE_US_MESSAGE_TIMEOUT  0x1db
#define ERROR_NOT_A_DEV_VOLUME  0x1dc
#define ERROR_FS_GUID_MISMATCH  0x1dd
#define ERROR_CANT_ATTACH_TO_DEV_VOLUME  0x1de
#define ERROR_INVALID_CONFIG_VALUE  0x1df
#define ERROR_PNP_QUERY_REMOVE_DEVICE_TIMEOUT  0x1e0
#define ERROR_PNP_QUERY_REMOVE_RELATED_DEVICE_TIMEOUT  0x1e1
#define ERROR_PNP_QUERY_REMOVE_UNRELATED_DEVICE_TIMEOUT  0x1e2
#define ERROR_DEVICE_HARDWARE_ERROR  0x1e3
#define ERROR_INVALID_ADDRESS  0x1e7
#define ERROR_HAS_SYSTEM_CRITICAL_FILES  0x1e8
#define ERROR_ENCRYPTED_FILE_NOT_SUPPORTED  0x1e9
#define ERROR_SPARSE_FILE_NOT_SUPPORTED  0x1ea
#define ERROR_PAGEFILE_NOT_SUPPORTED  0x1eb
#define ERROR_VOLUME_NOT_SUPPORTED  0x1ec
#define ERROR_NOT_SUPPORTED_WITH_BYPASSIO  0x1ed
#define ERROR_NO_BYPASSIO_DRIVER_SUPPORT  0x1ee
#define ERROR_NOT_SUPPORTED_WITH_ENCRYPTION  0x1ef
#define ERROR_NOT_SUPPORTED_WITH_COMPRESSION  0x1f0
#define ERROR_NOT_SUPPORTED_WITH_REPLICATION  0x1f1
#define ERROR_NOT_SUPPORTED_WITH_DEDUPLICATION  0x1f2
#define ERROR_NOT_SUPPORTED_WITH_AUDITING  0x1f3
#define ERROR_USER_PROFILE_LOAD  0x1f4
#define ERROR_SESSION_KEY_TOO_SHORT  0x1f5
#define ERROR_ACCESS_DENIED_APPDATA  0x1f6
#define ERROR_NOT_SUPPORTED_WITH_MONITORING  0x1f7
#define ERROR_NOT_SUPPORTED_WITH_SNAPSHOT  0x1f8
#define ERROR_NOT_SUPPORTED_WITH_VIRTUALIZATION  0x1f9
#define ERROR_BYPASSIO_FLT_NOT_SUPPORTED  0x1fa
#define ERROR_DEVICE_RESET_REQUIRED  0x1fb
#define ERROR_VOLUME_WRITE_ACCESS_DENIED  0x1fc
#define ERROR_NOT_SUPPORTED_WITH_CACHED_HANDLE  0x1fd
#define ERROR_FS_METADATA_INCONSISTENT  0x1fe
#define ERROR_BLOCK_WEAK_REFERENCE_INVALID  0x1ff
#define ERROR_BLOCK_SOURCE_WEAK_REFERENCE_INVALID  0x200
#define ERROR_BLOCK_TARGET_WEAK_REFERENCE_INVALID  0x201
#define ERROR_BLOCK_SHARED  0x202
#define ERROR_VOLUME_UPGRADE_NOT_NEEDED  0x203
#define ERROR_VOLUME_UPGRADE_PENDING  0x204
#define ERROR_VOLUME_UPGRADE_DISABLED  0x205
#define ERROR_VOLUME_UPGRADE_DISABLED_TILL_OS_DOWNGRADE_EXPIRED  0x206
#define ERROR_ARITHMETIC_OVERFLOW  0x216
#define ERROR_PIPE_CONNECTED  0x217
#define ERROR_PIPE_LISTENING  0x218
#define ERROR_VERIFIER_STOP  0x219
#define ERROR_ABIOS_ERROR  0x21a
#define ERROR_WX86_WARNING  0x21b
#define ERROR_WX86_ERROR  0x21c
#define ERROR_TIMER_NOT_CANCELED  0x21d
#define ERROR_UNWIND  0x21e
#define ERROR_BAD_STACK  0x21f
#define ERROR_INVALID_UNWIND_TARGET  0x220
#define ERROR_INVALID_PORT_ATTRIBUTES  0x221
#define ERROR_PORT_MESSAGE_TOO_LONG  0x222
#define ERROR_INVALID_QUOTA_LOWER  0x223
#define ERROR_DEVICE_ALREADY_ATTACHED  0x224
#define ERROR_INSTRUCTION_MISALIGNMENT  0x225
#define ERROR_PROFILING_NOT_STARTED  0x226
#define ERROR_PROFILING_NOT_STOPPED  0x227
#define ERROR_COULD_NOT_INTERPRET  0x228
#define ERROR_PROFILING_AT_LIMIT  0x229
#define ERROR_CANT_WAIT  0x22a
#define ERROR_CANT_TERMINATE_SELF  0x22b
#define ERROR_UNEXPECTED_MM_CREATE_ERR  0x22c
#define ERROR_UNEXPECTED_MM_MAP_ERROR  0x22d
#define ERROR_UNEXPECTED_MM_EXTEND_ERR  0x22e
#define ERROR_BAD_FUNCTION_TABLE  0x22f
#define ERROR_NO_GUID_TRANSLATION  0x230
#define ERROR_INVALID_LDT_SIZE  0x231
#define ERROR_INVALID_LDT_OFFSET  0x233
#define ERROR_INVALID_LDT_DESCRIPTOR  0x234
#define ERROR_TOO_MANY_THREADS  0x235
#define ERROR_THREAD_NOT_IN_PROCESS  0x236
#define ERROR_PAGEFILE_QUOTA_EXCEEDED  0x237
#define ERROR_LOGON_SERVER_CONFLICT  0x238
#define ERROR_SYNCHRONIZATION_REQUIRED  0x239
#define ERROR_NET_OPEN_FAILED  0x23a
#define ERROR_IO_PRIVILEGE_FAILED  0x23b
#define ERROR_CONTROL_C_EXIT  0x23c
#define ERROR_MISSING_SYSTEMFILE  0x23d
#define ERROR_UNHANDLED_EXCEPTION  0x23e
#define ERROR_APP_INIT_FAILURE  0x23f
#define ERROR_PAGEFILE_CREATE_FAILED  0x240
#define ERROR_INVALID_IMAGE_HASH  0x241
#define ERROR_NO_PAGEFILE  0x242
#define ERROR_ILLEGAL_FLOAT_CONTEXT  0x243
#define ERROR_NO_EVENT_PAIR  0x244
#define ERROR_DOMAIN_CTRLR_CONFIG_ERROR  0x245
#define ERROR_ILLEGAL_CHARACTER  0x246
#define ERROR_UNDEFINED_CHARACTER  0x247
#define ERROR_FLOPPY_VOLUME  0x248
#define ERROR_BIOS_FAILED_TO_CONNECT_INTERRUPT  0x249
#define ERROR_BACKUP_CONTROLLER  0x24a
#define ERROR_MUTANT_LIMIT_EXCEEDED  0x24b
#define ERROR_FS_DRIVER_REQUIRED  0x24c
#define ERROR_CANNOT_LOAD_REGISTRY_FILE  0x24d
#define ERROR_DEBUG_ATTACH_FAILED  0x24e
#define ERROR_SYSTEM_PROCESS_TERMINATED  0x24f
#define ERROR_DATA_NOT_ACCEPTED  0x250
#define ERROR_VDM_HARD_ERROR  0x251
#define ERROR_DRIVER_CANCEL_TIMEOUT  0x252
#define ERROR_REPLY_MESSAGE_MISMATCH  0x253
#define ERROR_LOST_WRITEBEHIND_DATA  0x254
#define ERROR_CLIENT_SERVER_PARAMETERS_INVALID  0x255
#define ERROR_NOT_TINY_STREAM  0x256
#define ERROR_STACK_OVERFLOW_READ  0x257
#define ERROR_CONVERT_TO_LARGE  0x258
#define ERROR_FOUND_OUT_OF_SCOPE  0x259
#define ERROR_ALLOCATE_BUCKET  0x25a
#define ERROR_MARSHALL_OVERFLOW  0x25b
#define ERROR_INVALID_VARIANT  0x25c
#define ERROR_BAD_COMPRESSION_BUFFER  0x25d
#define ERROR_AUDIT_FAILED  0x25e
#define ERROR_TIMER_RESOLUTION_NOT_SET  0x25f
#define ERROR_INSUFFICIENT_LOGON_INFO  0x260
#define ERROR_BAD_DLL_ENTRYPOINT  0x261
#define ERROR_BAD_SERVICE_ENTRYPOINT  0x262
#define ERROR_IP_ADDRESS_CONFLICT1  0x263
#define ERROR_IP_ADDRESS_CONFLICT2  0x264
#define ERROR_REGISTRY_QUOTA_LIMIT  0x265
#define ERROR_NO_CALLBACK_ACTIVE  0x266
#define ERROR_PWD_TOO_SHORT  0x267
#define ERROR_PWD_TOO_RECENT  0x268
#define ERROR_PWD_HISTORY_CONFLICT  0x269
#define ERROR_UNSUPPORTED_COMPRESSION  0x26a
#define ERROR_INVALID_HW_PROFILE  0x26b
#define ERROR_INVALID_PLUGPLAY_DEVICE_PATH  0x26c
#define ERROR_QUOTA_LIST_INCONSISTENT  0x26d
#define ERROR_EVALUATION_EXPIRATION  0x26e
#define ERROR_ILLEGAL_DLL_RELOCATION  0x26f
#define ERROR_DLL_INIT_FAILED_LOGOFF  0x270
#define ERROR_VALIDATE_CONTINUE  0x271
#define ERROR_NO_MORE_MATCHES  0x272
#define ERROR_RANGE_LIST_CONFLICT  0x273
#define ERROR_SERVER_SID_MISMATCH  0x274
#define ERROR_CANT_ENABLE_DENY_ONLY  0x275
#define ERROR_FLOAT_MULTIPLE_FAULTS  0x276
#define ERROR_FLOAT_MULTIPLE_TRAPS  0x277
#define ERROR_NOINTERFACE  0x278
#define ERROR_DRIVER_FAILED_SLEEP  0x279
#define ERROR_CORRUPT_SYSTEM_FILE  0x27a
#define ERROR_COMMITMENT_MINIMUM  0x27b
#define ERROR_PNP_RESTART_ENUMERATION  0x27c
#define ERROR_SYSTEM_IMAGE_BAD_SIGNATURE  0x27d
#define ERROR_PNP_REBOOT_REQUIRED  0x27e
#define ERROR_INSUFFICIENT_POWER  0x27f
#define ERROR_MULTIPLE_FAULT_VIOLATION  0x280
#define ERROR_SYSTEM_SHUTDOWN  0x281
#define ERROR_PORT_NOT_SET  0x282
#define ERROR_DS_VERSION_CHECK_FAILURE  0x283
#define ERROR_RANGE_NOT_FOUND  0x284
#define ERROR_NOT_SAFE_MODE_DRIVER  0x286
#define ERROR_FAILED_DRIVER_ENTRY  0x287
#define ERROR_DEVICE_ENUMERATION_ERROR  0x288
#define ERROR_MOUNT_POINT_NOT_RESOLVED  0x289
#define ERROR_INVALID_DEVICE_OBJECT_PARAMETER  0x28a
#define ERROR_MCA_OCCURED  0x28b
#define ERROR_DRIVER_DATABASE_ERROR  0x28c
#define ERROR_SYSTEM_HIVE_TOO_LARGE  0x28d
#define ERROR_DRIVER_FAILED_PRIOR_UNLOAD  0x28e
#define ERROR_VOLSNAP_PREPARE_HIBERNATE  0x28f
#define ERROR_HIBERNATION_FAILURE  0x290
#define ERROR_PWD_TOO_LONG  0x291
#define ERROR_FILE_SYSTEM_LIMITATION  0x299
#define ERROR_ASSERTION_FAILURE  0x29c
#define ERROR_ACPI_ERROR  0x29d
#define ERROR_WOW_ASSERTION  0x29e
#define ERROR_PNP_BAD_MPS_TABLE  0x29f
#define ERROR_PNP_TRANSLATION_FAILED  0x2a0
#define ERROR_PNP_IRQ_TRANSLATION_FAILED  0x2a1
#define ERROR_PNP_INVALID_ID  0x2a2
#define ERROR_WAKE_SYSTEM_DEBUGGER  0x2a3
#define ERROR_HANDLES_CLOSED  0x2a4
#define ERROR_EXTRANEOUS_INFORMATION  0x2a5
#define ERROR_RXACT_COMMIT_NECESSARY  0x2a6
#define ERROR_MEDIA_CHECK  0x2a7
#define ERROR_GUID_SUBSTITUTION_MADE  0x2a8
#define ERROR_STOPPED_ON_SYMLINK  0x2a9
#define ERROR_LONGJUMP  0x2aa
#define ERROR_PLUGPLAY_QUERY_VETOED  0x2ab
#define ERROR_UNWIND_CONSOLIDATE  0x2ac
#define ERROR_REGISTRY_HIVE_RECOVERED  0x2ad
#define ERROR_DLL_MIGHT_BE_INSECURE  0x2ae
#define ERROR_DLL_MIGHT_BE_INCOMPATIBLE  0x2af
#define ERROR_DBG_EXCEPTION_NOT_HANDLED  0x2b0
#define ERROR_DBG_REPLY_LATER  0x2b1
#define ERROR_DBG_UNABLE_TO_PROVIDE_HANDLE  0x2b2
#define ERROR_DBG_TERMINATE_THREAD  0x2b3
#define ERROR_DBG_TERMINATE_PROCESS  0x2b4
#define ERROR_DBG_CONTROL_C  0x2b5
#define ERROR_DBG_PRINTEXCEPTION_C  0x2b6
#define ERROR_DBG_RIPEXCEPTION  0x2b7
#define ERROR_DBG_CONTROL_BREAK  0x2b8
#define ERROR_DBG_COMMAND_EXCEPTION  0x2b9
#define ERROR_OBJECT_NAME_EXISTS  0x2ba
#define ERROR_THREAD_WAS_SUSPENDED  0x2bb
#define ERROR_IMAGE_NOT_AT_BASE  0x2bc
#define ERROR_RXACT_STATE_CREATED  0x2bd
#define ERROR_SEGMENT_NOTIFICATION  0x2be
#define ERROR_BAD_CURRENT_DIRECTORY  0x2bf
#define ERROR_FT_READ_RECOVERY_FROM_BACKUP  0x2c0
#define ERROR_FT_WRITE_RECOVERY  0x2c1
#define ERROR_IMAGE_MACHINE_TYPE_MISMATCH  0x2c2
#define ERROR_RECEIVE_PARTIAL  0x2c3
#define ERROR_RECEIVE_EXPEDITED  0x2c4
#define ERROR_RECEIVE_PARTIAL_EXPEDITED  0x2c5
#define ERROR_EVENT_DONE  0x2c6
#define ERROR_EVENT_PENDING  0x2c7
#define ERROR_CHECKING_FILE_SYSTEM  0x2c8
#define ERROR_FATAL_APP_EXIT  0x2c9
#define ERROR_PREDEFINED_HANDLE  0x2ca
#define ERROR_WAS_UNLOCKED  0x2cb
#define ERROR_SERVICE_NOTIFICATION  0x2cc
#define ERROR_WAS_LOCKED  0x2cd
#define ERROR_LOG_HARD_ERROR  0x2ce
#define ERROR_ALREADY_WIN32  0x2cf
#define ERROR_IMAGE_MACHINE_TYPE_MISMATCH_EXE  0x2d0
#define ERROR_NO_YIELD_PERFORMED  0x2d1
#define ERROR_TIMER_RESUME_IGNORED  0x2d2
#define ERROR_ARBITRATION_UNHANDLED  0x2d3
#define ERROR_CARDBUS_NOT_SUPPORTED  0x2d4
#define ERROR_MP_PROCESSOR_MISMATCH  0x2d5
#define ERROR_HIBERNATED  0x2d6
#define ERROR_RESUME_HIBERNATION  0x2d7
#define ERROR_FIRMWARE_UPDATED  0x2d8
#define ERROR_DRIVERS_LEAKING_LOCKED_PAGES  0x2d9
#define ERROR_WAKE_SYSTEM  0x2da
#define ERROR_WAIT_1  0x2db
#define ERROR_WAIT_2  0x2dc
#define ERROR_WAIT_3  0x2dd
#define ERROR_WAIT_63  0x2de
#define ERROR_ABANDONED_WAIT_0  0x2df
#define ERROR_ABANDONED_WAIT_63  0x2e0
#define ERROR_USER_APC  0x2e1
#define ERROR_KERNEL_APC  0x2e2
#define ERROR_ALERTED  0x2e3
#define ERROR_ELEVATION_REQUIRED  0x2e4
#define ERROR_REPARSE  0x2e5
#define ERROR_OPLOCK_BREAK_IN_PROGRESS  0x2e6
#define ERROR_VOLUME_MOUNTED  0x2e7
#define ERROR_RXACT_COMMITTED  0x2e8
#define ERROR_NOTIFY_CLEANUP  0x2e9
#define ERROR_PRIMARY_TRANSPORT_CONNECT_FAILED  0x2ea
#define ERROR_PAGE_FAULT_TRANSITION  0x2eb
#define ERROR_PAGE_FAULT_DEMAND_ZERO  0x2ec
#define ERROR_PAGE_FAULT_COPY_ON_WRITE  0x2ed
#define ERROR_PAGE_FAULT_GUARD_PAGE  0x2ee
#define ERROR_PAGE_FAULT_PAGING_FILE  0x2ef
#define ERROR_CACHE_PAGE_LOCKED  0x2f0
#define ERROR_CRASH_DUMP  0x2f1
#define ERROR_BUFFER_ALL_ZEROS  0x2f2
#define ERROR_REPARSE_OBJECT  0x2f3
#define ERROR_RESOURCE_REQUIREMENTS_CHANGED  0x2f4
#define ERROR_TRANSLATION_COMPLETE  0x2f5
#define ERROR_NOTHING_TO_TERMINATE  0x2f6
#define ERROR_PROCESS_NOT_IN_JOB  0x2f7
#define ERROR_PROCESS_IN_JOB  0x2f8
#define ERROR_VOLSNAP_HIBERNATE_READY  0x2f9
#define ERROR_FSFILTER_OP_COMPLETED_SUCCESSFULLY  0x2fa
#define ERROR_INTERRUPT_VECTOR_ALREADY_CONNECTED  0x2fb
#define ERROR_INTERRUPT_STILL_CONNECTED  0x2fc
#define ERROR_WAIT_FOR_OPLOCK  0x2fd
#define ERROR_DBG_EXCEPTION_HANDLED  0x2fe
#define ERROR_DBG_CONTINUE  0x2ff
#define ERROR_CALLBACK_POP_STACK  0x300
#define ERROR_COMPRESSION_DISABLED  0x301
#define ERROR_CANTFETCHBACKWARDS  0x302
#define ERROR_CANTSCROLLBACKWARDS  0x303
#define ERROR_ROWSNOTRELEASED  0x304
#define ERROR_BAD_ACCESSOR_FLAGS  0x305
#define ERROR_ERRORS_ENCOUNTERED  0x306
#define ERROR_NOT_CAPABLE  0x307
#define ERROR_REQUEST_OUT_OF_SEQUENCE  0x308
#define ERROR_VERSION_PARSE_ERROR  0x309
#define ERROR_BADSTARTPOSITION  0x30a
#define ERROR_MEMORY_HARDWARE  0x30b
#define ERROR_DISK_REPAIR_DISABLED  0x30c
#define ERROR_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE  0x30d
#define ERROR_SYSTEM_POWERSTATE_TRANSITION  0x30e
#define ERROR_SYSTEM_POWERSTATE_COMPLEX_TRANSITION  0x30f
#define ERROR_MCA_EXCEPTION  0x310
#define ERROR_ACCESS_AUDIT_BY_POLICY  0x311
#define ERROR_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY  0x312
#define ERROR_ABANDON_HIBERFILE  0x313
#define ERROR_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED  0x314
#define ERROR_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR  0x315
#define ERROR_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR  0x316
#define ERROR_BAD_MCFG_TABLE  0x317
#define ERROR_DISK_REPAIR_REDIRECTED  0x318
#define ERROR_DISK_REPAIR_UNSUCCESSFUL  0x319
#define ERROR_CORRUPT_LOG_OVERFULL  0x31a
#define ERROR_CORRUPT_LOG_CORRUPTED  0x31b
#define ERROR_CORRUPT_LOG_UNAVAILABLE  0x31c
#define ERROR_CORRUPT_LOG_DELETED_FULL  0x31d
#define ERROR_CORRUPT_LOG_CLEARED  0x31e
#define ERROR_ORPHAN_NAME_EXHAUSTED  0x31f
#define ERROR_OPLOCK_SWITCHED_TO_NEW_HANDLE  0x320
#define ERROR_CANNOT_GRANT_REQUESTED_OPLOCK  0x321
#define ERROR_CANNOT_BREAK_OPLOCK  0x322
#define ERROR_OPLOCK_HANDLE_CLOSED  0x323
#define ERROR_NO_ACE_CONDITION  0x324
#define ERROR_INVALID_ACE_CONDITION  0x325
#define ERROR_FILE_HANDLE_REVOKED  0x326
#define ERROR_IMAGE_AT_DIFFERENT_BASE  0x327
#define ERROR_ENCRYPTED_IO_NOT_POSSIBLE  0x328
#define ERROR_FILE_METADATA_OPTIMIZATION_IN_PROGRESS  0x329
#define ERROR_QUOTA_ACTIVITY  0x32a
#define ERROR_HANDLE_REVOKED  0x32b
#define ERROR_CALLBACK_INVOKE_INLINE  0x32c
#define ERROR_CPU_SET_INVALID  0x32d
#define ERROR_ENCLAVE_NOT_TERMINATED  0x32e
#define ERROR_ENCLAVE_VIOLATION  0x32f
#define ERROR_SERVER_TRANSPORT_CONFLICT  0x330
#define ERROR_CERTIFICATE_VALIDATION_PREFERENCE_CONFLICT  0x331
#define ERROR_FT_READ_FROM_COPY_FAILURE  0x332
#define ERROR_SECTION_DIRECT_MAP_ONLY  0x333
#define ERROR_EA_ACCESS_DENIED  0x3e2
#define ERROR_OPERATION_ABORTED  0x3e3
#define ERROR_IO_INCOMPLETE  0x3e4
#define ERROR_IO_PENDING  0x3e5
#define ERROR_NOACCESS  0x3e6
#define ERROR_SWAPERROR  0x3e7
#define ERROR_STACK_OVERFLOW  0x3e9
#define ERROR_INVALID_MESSAGE  0x3ea
#define ERROR_CAN_NOT_COMPLETE  0x3eb
#define ERROR_INVALID_FLAGS  0x3ec
#define ERROR_UNRECOGNIZED_VOLUME  0x3ed
#define ERROR_FILE_INVALID  0x3ee
#define ERROR_FULLSCREEN_MODE  0x3ef
#define ERROR_NO_TOKEN  0x3f0
#define ERROR_BADDB  0x3f1
#define ERROR_BADKEY  0x3f2
#define ERROR_CANTOPEN  0x3f3
#define ERROR_CANTREAD  0x3f4
#define ERROR_CANTWRITE  0x3f5
#define ERROR_REGISTRY_RECOVERED  0x3f6
#define ERROR_REGISTRY_CORRUPT  0x3f7
#define ERROR_REGISTRY_IO_FAILED  0x3f8
#define ERROR_NOT_REGISTRY_FILE  0x3f9
#define ERROR_KEY_DELETED  0x3fa
#define ERROR_NO_LOG_SPACE  0x3fb
#define ERROR_KEY_HAS_CHILDREN  0x3fc
#define ERROR_CHILD_MUST_BE_VOLATILE  0x3fd
#define ERROR_NOTIFY_ENUM_DIR  0x3fe
#define ERROR_DEPENDENT_SERVICES_RUNNING  0x41b
#define ERROR_INVALID_SERVICE_CONTROL  0x41c
#define ERROR_SERVICE_REQUEST_TIMEOUT  0x41d
#define ERROR_SERVICE_NO_THREAD  0x41e
#define ERROR_SERVICE_DATABASE_LOCKED  0x41f
#define ERROR_SERVICE_ALREADY_RUNNING  0x420
#define ERROR_INVALID_SERVICE_ACCOUNT  0x421
#define ERROR_SERVICE_DISABLED  0x422
#define ERROR_CIRCULAR_DEPENDENCY  0x423
#define ERROR_SERVICE_DOES_NOT_EXIST  0x424
#define ERROR_SERVICE_CANNOT_ACCEPT_CTRL  0x425
#define ERROR_SERVICE_NOT_ACTIVE  0x426
#define ERROR_FAILED_SERVICE_CONTROLLER_CONNECT  0x427
#define ERROR_EXCEPTION_IN_SERVICE  0x428
#define ERROR_DATABASE_DOES_NOT_EXIST  0x429
#define ERROR_SERVICE_SPECIFIC_ERROR  0x42a
#define ERROR_PROCESS_ABORTED  0x42b
#define ERROR_SERVICE_DEPENDENCY_FAIL  0x42c
#define ERROR_SERVICE_LOGON_FAILED  0x42d
#define ERROR_SERVICE_START_HANG  0x42e
#define ERROR_INVALID_SERVICE_LOCK  0x42f
#define ERROR_SERVICE_MARKED_FOR_DELETE  0x430
#define ERROR_SERVICE_EXISTS  0x431
#define ERROR_ALREADY_RUNNING_LKG  0x432
#define ERROR_SERVICE_DEPENDENCY_DELETED  0x433
#define ERROR_BOOT_ALREADY_ACCEPTED  0x434
#define ERROR_SERVICE_NEVER_STARTED  0x435
#define ERROR_DUPLICATE_SERVICE_NAME  0x436
#define ERROR_DIFFERENT_SERVICE_ACCOUNT  0x437
#define ERROR_CANNOT_DETECT_DRIVER_FAILURE  0x438
#define ERROR_CANNOT_DETECT_PROCESS_ABORT  0x439
#define ERROR_NO_RECOVERY_PROGRAM  0x43a
#define ERROR_SERVICE_NOT_IN_EXE  0x43b
#define ERROR_NOT_SAFEBOOT_SERVICE  0x43c
#define ERROR_END_OF_MEDIA  0x44c
#define ERROR_FILEMARK_DETECTED  0x44d
#define ERROR_BEGINNING_OF_MEDIA  0x44e
#define ERROR_SETMARK_DETECTED  0x44f
#define ERROR_NO_DATA_DETECTED  0x450
#define ERROR_PARTITION_FAILURE  0x451
#define ERROR_INVALID_BLOCK_LENGTH  0x452
#define ERROR_DEVICE_NOT_PARTITIONED  0x453
#define ERROR_UNABLE_TO_LOCK_MEDIA  0x454
#define ERROR_UNABLE_TO_UNLOAD_MEDIA  0x455
#define ERROR_MEDIA_CHANGED  0x456
#define ERROR_BUS_RESET  0x457
#define ERROR_NO_MEDIA_IN_DRIVE  0x458
#define ERROR_NO_UNICODE_TRANSLATION  0x459
#define ERROR_DLL_INIT_FAILED  0x45a
#define ERROR_SHUTDOWN_IN_PROGRESS  0x45b
#define ERROR_NO_SHUTDOWN_IN_PROGRESS  0x45c
#define ERROR_IO_DEVICE  0x45d
#define ERROR_SERIAL_NO_DEVICE  0x45e
#define ERROR_IRQ_BUSY  0x45f
#define ERROR_MORE_WRITES  0x460
#define ERROR_COUNTER_TIMEOUT  0x461
#define ERROR_FLOPPY_ID_MARK_NOT_FOUND  0x462
#define ERROR_FLOPPY_WRONG_CYLINDER  0x463
#define ERROR_FLOPPY_UNKNOWN_ERROR  0x464
#define ERROR_FLOPPY_BAD_REGISTERS  0x465
#define ERROR_DISK_RECALIBRATE_FAILED  0x466
#define ERROR_DISK_OPERATION_FAILED  0x467
#define ERROR_DISK_RESET_FAILED  0x468
#define ERROR_EOM_OVERFLOW  0x469
#define ERROR_NOT_ENOUGH_SERVER_MEMORY  0x46a
#define ERROR_POSSIBLE_DEADLOCK  0x46b
#define ERROR_MAPPED_ALIGNMENT  0x46c
#define ERROR_SET_POWER_STATE_VETOED  0x474
#define ERROR_SET_POWER_STATE_FAILED  0x475
#define ERROR_TOO_MANY_LINKS  0x476
#define ERROR_OLD_WIN_VERSION  0x47e
#define ERROR_APP_WRONG_OS  0x47f
#define ERROR_SINGLE_INSTANCE_APP  0x480
#define ERROR_RMODE_APP  0x481
#define ERROR_INVALID_DLL  0x482
#define ERROR_NO_ASSOCIATION  0x483
#define ERROR_DDE_FAIL  0x484
#define ERROR_DLL_NOT_FOUND  0x485
#define ERROR_NO_MORE_USER_HANDLES  0x486
#define ERROR_MESSAGE_SYNC_ONLY  0x487
#define ERROR_SOURCE_ELEMENT_EMPTY  0x488
#define ERROR_DESTINATION_ELEMENT_FULL  0x489
#define ERROR_ILLEGAL_ELEMENT_ADDRESS  0x48a
#define ERROR_MAGAZINE_NOT_PRESENT  0x48b
#define ERROR_DEVICE_REINITIALIZATION_NEEDED  0x48c
#define ERROR_DEVICE_REQUIRES_CLEANING  0x48d
#define ERROR_DEVICE_DOOR_OPEN  0x48e
#define ERROR_DEVICE_NOT_CONNECTED  0x48f
#define ERROR_NOT_FOUND  0x490
#define ERROR_NO_MATCH  0x491
#define ERROR_SET_NOT_FOUND  0x492
#define ERROR_POINT_NOT_FOUND  0x493
#define ERROR_NO_TRACKING_SERVICE  0x494
#define ERROR_NO_VOLUME_ID  0x495
#define ERROR_UNABLE_TO_REMOVE_REPLACED  0x497
#define ERROR_UNABLE_TO_MOVE_REPLACEMENT  0x498
#define ERROR_UNABLE_TO_MOVE_REPLACEMENT_2  0x499
#define ERROR_JOURNAL_DELETE_IN_PROGRESS  0x49a
#define ERROR_JOURNAL_NOT_ACTIVE  0x49b
#define ERROR_POTENTIAL_FILE_FOUND  0x49c
#define ERROR_JOURNAL_ENTRY_DELETED  0x49d
#define ERROR_PARTITION_TERMINATING  0x4a0
#define ERROR_SHUTDOWN_IS_SCHEDULED  0x4a6
#define ERROR_SHUTDOWN_USERS_LOGGED_ON  0x4a7
#define ERROR_SHUTDOWN_DISKS_NOT_IN_MAINTENANCE_MODE  0x4a8
#define ERROR_BAD_DEVICE  0x4b0
#define ERROR_CONNECTION_UNAVAIL  0x4b1
#define ERROR_DEVICE_ALREADY_REMEMBERED  0x4b2
#define ERROR_NO_NET_OR_BAD_PATH  0x4b3
#define ERROR_BAD_PROVIDER  0x4b4
#define ERROR_CANNOT_OPEN_PROFILE  0x4b5
#define ERROR_BAD_PROFILE  0x4b6
#define ERROR_NOT_CONTAINER  0x4b7
#define ERROR_EXTENDED_ERROR  0x4b8
#define ERROR_INVALID_GROUPNAME  0x4b9
#define ERROR_INVALID_COMPUTERNAME  0x4ba
#define ERROR_INVALID_EVENTNAME  0x4bb
#define ERROR_INVALID_DOMAINNAME  0x4bc
#define ERROR_INVALID_SERVICENAME  0x4bd
#define ERROR_INVALID_NETNAME  0x4be
#define ERROR_INVALID_SHARENAME  0x4bf
#define ERROR_INVALID_PASSWORDNAME  0x4c0
#define ERROR_INVALID_MESSAGENAME  0x4c1
#define ERROR_INVALID_MESSAGEDEST  0x4c2
#define ERROR_SESSION_CREDENTIAL_CONFLICT  0x4c3
#define ERROR_REMOTE_SESSION_LIMIT_EXCEEDED  0x4c4
#define ERROR_DUP_DOMAINNAME  0x4c5
#define ERROR_NO_NETWORK  0x4c6
#define ERROR_CANCELLED  0x4c7
#define ERROR_USER_MAPPED_FILE  0x4c8
#define ERROR_CONNECTION_REFUSED  0x4c9
#define ERROR_GRACEFUL_DISCONNECT  0x4ca
#define ERROR_ADDRESS_ALREADY_ASSOCIATED  0x4cb
#define ERROR_ADDRESS_NOT_ASSOCIATED  0x4cc
#define ERROR_CONNECTION_INVALID  0x4cd
#define ERROR_CONNECTION_ACTIVE  0x4ce
#define ERROR_NETWORK_UNREACHABLE  0x4cf
#define ERROR_HOST_UNREACHABLE  0x4d0
#define ERROR_PROTOCOL_UNREACHABLE  0x4d1
#define ERROR_PORT_UNREACHABLE  0x4d2
#define ERROR_REQUEST_ABORTED  0x4d3
#define ERROR_CONNECTION_ABORTED  0x4d4
#define ERROR_RETRY  0x4d5
#define ERROR_CONNECTION_COUNT_LIMIT  0x4d6
#define ERROR_LOGIN_TIME_RESTRICTION  0x4d7
#define ERROR_LOGIN_WKSTA_RESTRICTION  0x4d8
#define ERROR_INCORRECT_ADDRESS  0x4d9
#define ERROR_ALREADY_REGISTERED  0x4da
#define ERROR_SERVICE_NOT_FOUND  0x4db
#define ERROR_NOT_AUTHENTICATED  0x4dc
#define ERROR_NOT_LOGGED_ON  0x4dd
#define ERROR_CONTINUE  0x4de
#define ERROR_ALREADY_INITIALIZED  0x4df
#define ERROR_NO_MORE_DEVICES  0x4e0
#define ERROR_NO_SUCH_SITE  0x4e1
#define ERROR_DOMAIN_CONTROLLER_EXISTS  0x4e2
#define ERROR_ONLY_IF_CONNECTED  0x4e3
#define ERROR_OVERRIDE_NOCHANGES  0x4e4
#define ERROR_BAD_USER_PROFILE  0x4e5
#define ERROR_NOT_SUPPORTED_ON_SBS  0x4e6
#define ERROR_SERVER_SHUTDOWN_IN_PROGRESS  0x4e7
#define ERROR_HOST_DOWN  0x4e8
#define ERROR_NON_ACCOUNT_SID  0x4e9
#define ERROR_NON_DOMAIN_SID  0x4ea
#define ERROR_APPHELP_BLOCK  0x4eb
#define ERROR_ACCESS_DISABLED_BY_POLICY  0x4ec
#define ERROR_REG_NAT_CONSUMPTION  0x4ed
#define ERROR_CSCSHARE_OFFLINE  0x4ee
#define ERROR_PKINIT_FAILURE  0x4ef
#define ERROR_SMARTCARD_SUBSYSTEM_FAILURE  0x4f0
#define ERROR_DOWNGRADE_DETECTED  0x4f1
#define ERROR_MACHINE_LOCKED  0x4f7
#define ERROR_SMB_GUEST_LOGON_BLOCKED  0x4f8
#define ERROR_CALLBACK_SUPPLIED_INVALID_DATA  0x4f9
#define ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED  0x4fa
#define ERROR_DRIVER_BLOCKED  0x4fb
#define ERROR_INVALID_IMPORT_OF_NON_DLL  0x4fc
#define ERROR_ACCESS_DISABLED_WEBBLADE  0x4fd
#define ERROR_ACCESS_DISABLED_WEBBLADE_TAMPER  0x4fe
#define ERROR_RECOVERY_FAILURE  0x4ff
#define ERROR_ALREADY_FIBER  0x500
#define ERROR_ALREADY_THREAD  0x501
#define ERROR_STACK_BUFFER_OVERRUN  0x502
#define ERROR_PARAMETER_QUOTA_EXCEEDED  0x503
#define ERROR_DEBUGGER_INACTIVE  0x504
#define ERROR_DELAY_LOAD_FAILED  0x505
#define ERROR_VDM_DISALLOWED  0x506
#define ERROR_UNIDENTIFIED_ERROR  0x507
#define ERROR_INVALID_CRUNTIME_PARAMETER  0x508
#define ERROR_BEYOND_VDL  0x509
#define ERROR_INCOMPATIBLE_SERVICE_SID_TYPE  0x50a
#define ERROR_DRIVER_PROCESS_TERMINATED  0x50b
#define ERROR_IMPLEMENTATION_LIMIT  0x50c
#define ERROR_PROCESS_IS_PROTECTED  0x50d
#define ERROR_SERVICE_NOTIFY_CLIENT_LAGGING  0x50e
#define ERROR_DISK_QUOTA_EXCEEDED  0x50f
#define ERROR_CONTENT_BLOCKED  0x510
#define ERROR_INCOMPATIBLE_SERVICE_PRIVILEGE  0x511
#define ERROR_APP_HANG  0x512
#define ERROR_INVALID_LABEL  0x513
#define ERROR_NOT_ALL_ASSIGNED  0x514
#define ERROR_SOME_NOT_MAPPED  0x515
#define ERROR_NO_QUOTAS_FOR_ACCOUNT  0x516
#define ERROR_LOCAL_USER_SESSION_KEY  0x517
#define ERROR_NULL_LM_PASSWORD  0x518
#define ERROR_UNKNOWN_REVISION  0x519
#define ERROR_REVISION_MISMATCH  0x51a
#define ERROR_INVALID_OWNER  0x51b
#define ERROR_INVALID_PRIMARY_GROUP  0x51c
#define ERROR_NO_IMPERSONATION_TOKEN  0x51d
#define ERROR_CANT_DISABLE_MANDATORY  0x51e
#define ERROR_NO_LOGON_SERVERS  0x51f
#define ERROR_NO_SUCH_LOGON_SESSION  0x520
#define ERROR_NO_SUCH_PRIVILEGE  0x521
#define ERROR_PRIVILEGE_NOT_HELD  0x522
#define ERROR_INVALID_ACCOUNT_NAME  0x523
#define ERROR_USER_EXISTS  0x524
#define ERROR_NO_SUCH_USER  0x525
#define ERROR_GROUP_EXISTS  0x526
#define ERROR_NO_SUCH_GROUP  0x527
#define ERROR_MEMBER_IN_GROUP  0x528
#define ERROR_MEMBER_NOT_IN_GROUP  0x529
#define ERROR_LAST_ADMIN  0x52a
#define ERROR_WRONG_PASSWORD  0x52b
#define ERROR_ILL_FORMED_PASSWORD  0x52c
#define ERROR_PASSWORD_RESTRICTION  0x52d
#define ERROR_LOGON_FAILURE  0x52e
#define ERROR_ACCOUNT_RESTRICTION  0x52f
#define ERROR_INVALID_LOGON_HOURS  0x530
#define ERROR_INVALID_WORKSTATION  0x531
#define ERROR_PASSWORD_EXPIRED  0x532
#define ERROR_ACCOUNT_DISABLED  0x533
#define ERROR_NONE_MAPPED  0x534
#define ERROR_TOO_MANY_LUIDS_REQUESTED  0x535
#define ERROR_LUIDS_EXHAUSTED  0x536
#define ERROR_INVALID_SUB_AUTHORITY  0x537
#define ERROR_INVALID_ACL  0x538
#define ERROR_INVALID_SID  0x539
#define ERROR_INVALID_SECURITY_DESCR  0x53a
#define ERROR_BAD_INHERITANCE_ACL  0x53c
#define ERROR_SERVER_DISABLED  0x53d
#define ERROR_SERVER_NOT_DISABLED  0x53e
#define ERROR_INVALID_ID_AUTHORITY  0x53f
#define ERROR_ALLOTTED_SPACE_EXCEEDED  0x540
#define ERROR_INVALID_GROUP_ATTRIBUTES  0x541
#define ERROR_BAD_IMPERSONATION_LEVEL  0x542
#define ERROR_CANT_OPEN_ANONYMOUS  0x543
#define ERROR_BAD_VALIDATION_CLASS  0x544
#define ERROR_BAD_TOKEN_TYPE  0x545
#define ERROR_NO_SECURITY_ON_OBJECT  0x546
#define ERROR_CANT_ACCESS_DOMAIN_INFO  0x547
#define ERROR_INVALID_SERVER_STATE  0x548
#define ERROR_INVALID_DOMAIN_STATE  0x549
#define ERROR_INVALID_DOMAIN_ROLE  0x54a
#define ERROR_NO_SUCH_DOMAIN  0x54b
#define ERROR_DOMAIN_EXISTS  0x54c
#define ERROR_DOMAIN_LIMIT_EXCEEDED  0x54d
#define ERROR_INTERNAL_DB_CORRUPTION  0x54e
#define ERROR_INTERNAL_ERROR  0x54f
#define ERROR_GENERIC_NOT_MAPPED  0x550
#define ERROR_BAD_DESCRIPTOR_FORMAT  0x551
#define ERROR_NOT_LOGON_PROCESS  0x552
#define ERROR_LOGON_SESSION_EXISTS  0x553
#define ERROR_NO_SUCH_PACKAGE  0x554
#define ERROR_BAD_LOGON_SESSION_STATE  0x555
#define ERROR_LOGON_SESSION_COLLISION  0x556
#define ERROR_INVALID_LOGON_TYPE  0x557
#define ERROR_CANNOT_IMPERSONATE  0x558
#define ERROR_RXACT_INVALID_STATE  0x559
#define ERROR_RXACT_COMMIT_FAILURE  0x55a
#define ERROR_SPECIAL_ACCOUNT  0x55b
#define ERROR_SPECIAL_GROUP  0x55c
#define ERROR_SPECIAL_USER  0x55d
#define ERROR_MEMBERS_PRIMARY_GROUP  0x55e
#define ERROR_TOKEN_ALREADY_IN_USE  0x55f
#define ERROR_NO_SUCH_ALIAS  0x560
#define ERROR_MEMBER_NOT_IN_ALIAS  0x561
#define ERROR_MEMBER_IN_ALIAS  0x562
#define ERROR_ALIAS_EXISTS  0x563
#define ERROR_LOGON_NOT_GRANTED  0x564
#define ERROR_TOO_MANY_SECRETS  0x565
#define ERROR_SECRET_TOO_LONG  0x566
#define ERROR_INTERNAL_DB_ERROR  0x567
#define ERROR_TOO_MANY_CONTEXT_IDS  0x568
#define ERROR_LOGON_TYPE_NOT_GRANTED  0x569
#define ERROR_NT_CROSS_ENCRYPTION_REQUIRED  0x56a
#define ERROR_NO_SUCH_MEMBER  0x56b
#define ERROR_INVALID_MEMBER  0x56c
#define ERROR_TOO_MANY_SIDS  0x56d
#define ERROR_LM_CROSS_ENCRYPTION_REQUIRED  0x56e
#define ERROR_NO_INHERITANCE  0x56f
#define ERROR_FILE_CORRUPT  0x570
#define ERROR_DISK_CORRUPT  0x571
#define ERROR_NO_USER_SESSION_KEY  0x572
#define ERROR_LICENSE_QUOTA_EXCEEDED  0x573
#define ERROR_WRONG_TARGET_NAME  0x574
#define ERROR_MUTUAL_AUTH_FAILED  0x575
#define ERROR_TIME_SKEW  0x576
#define ERROR_CURRENT_DOMAIN_NOT_ALLOWED  0x577
#define ERROR_INVALID_WINDOW_HANDLE  0x578
#define ERROR_INVALID_MENU_HANDLE  0x579
#define ERROR_INVALID_CURSOR_HANDLE  0x57a
#define ERROR_INVALID_ACCEL_HANDLE  0x57b
#define ERROR_INVALID_HOOK_HANDLE  0x57c
#define ERROR_INVALID_DWP_HANDLE  0x57d
#define ERROR_TLW_WITH_WSCHILD  0x57e
#define ERROR_CANNOT_FIND_WND_CLASS  0x57f
#define ERROR_WINDOW_OF_OTHER_THREAD  0x580
#define ERROR_HOTKEY_ALREADY_REGISTERED  0x581
#define ERROR_CLASS_ALREADY_EXISTS  0x582
#define ERROR_CLASS_DOES_NOT_EXIST  0x583
#define ERROR_CLASS_HAS_WINDOWS  0x584
#define ERROR_INVALID_INDEX  0x585
#define ERROR_INVALID_ICON_HANDLE  0x586
#define ERROR_PRIVATE_DIALOG_INDEX  0x587
#define ERROR_LISTBOX_ID_NOT_FOUND  0x588
#define ERROR_NO_WILDCARD_CHARACTERS  0x589
#define ERROR_CLIPBOARD_NOT_OPEN  0x58a
#define ERROR_HOTKEY_NOT_REGISTERED  0x58b
#define ERROR_WINDOW_NOT_DIALOG  0x58c
#define ERROR_CONTROL_ID_NOT_FOUND  0x58d
#define ERROR_INVALID_COMBOBOX_MESSAGE  0x58e
#define ERROR_WINDOW_NOT_COMBOBOX  0x58f
#define ERROR_INVALID_EDIT_HEIGHT  0x590
#define ERROR_DC_NOT_FOUND  0x591
#define ERROR_INVALID_HOOK_FILTER  0x592
#define ERROR_INVALID_FILTER_PROC  0x593
#define ERROR_HOOK_NEEDS_HMOD  0x594
#define ERROR_GLOBAL_ONLY_HOOK  0x595
#define ERROR_JOURNAL_HOOK_SET  0x596
#define ERROR_HOOK_NOT_INSTALLED  0x597
#define ERROR_INVALID_LB_MESSAGE  0x598
#define ERROR_SETCOUNT_ON_BAD_LB  0x599
#define ERROR_LB_WITHOUT_TABSTOPS  0x59a
#define ERROR_DESTROY_OBJECT_OF_OTHER_THREAD  0x59b
#define ERROR_CHILD_WINDOW_MENU  0x59c
#define ERROR_NO_SYSTEM_MENU  0x59d
#define ERROR_INVALID_MSGBOX_STYLE  0x59e
#define ERROR_INVALID_SPI_VALUE  0x59f
#define ERROR_SCREEN_ALREADY_LOCKED  0x5a0
#define ERROR_HWNDS_HAVE_DIFF_PARENT  0x5a1
#define ERROR_NOT_CHILD_WINDOW  0x5a2
#define ERROR_INVALID_GW_COMMAND  0x5a3
#define ERROR_INVALID_THREAD_ID  0x5a4
#define ERROR_NON_MDICHILD_WINDOW  0x5a5
#define ERROR_POPUP_ALREADY_ACTIVE  0x5a6
#define ERROR_NO_SCROLLBARS  0x5a7
#define ERROR_INVALID_SCROLLBAR_RANGE  0x5a8
#define ERROR_INVALID_SHOWWIN_COMMAND  0x5a9
#define ERROR_NO_SYSTEM_RESOURCES  0x5aa
#define ERROR_NONPAGED_SYSTEM_RESOURCES  0x5ab
#define ERROR_PAGED_SYSTEM_RESOURCES  0x5ac
#define ERROR_WORKING_SET_QUOTA  0x5ad
#define ERROR_PAGEFILE_QUOTA  0x5ae
#define ERROR_COMMITMENT_LIMIT  0x5af
#define ERROR_MENU_ITEM_NOT_FOUND  0x5b0
#define ERROR_INVALID_KEYBOARD_HANDLE  0x5b1
#define ERROR_HOOK_TYPE_NOT_ALLOWED  0x5b2
#define ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION  0x5b3
#define ERROR_TIMEOUT  0x5b4
#define ERROR_INVALID_MONITOR_HANDLE  0x5b5
#define ERROR_INCORRECT_SIZE  0x5b6
#define ERROR_SYMLINK_CLASS_DISABLED  0x5b7
#define ERROR_SYMLINK_NOT_SUPPORTED  0x5b8
#define ERROR_XML_PARSE_ERROR  0x5b9
#define ERROR_XMLDSIG_ERROR  0x5ba
#define ERROR_RESTART_APPLICATION  0x5bb
#define ERROR_WRONG_COMPARTMENT  0x5bc
#define ERROR_AUTHIP_FAILURE  0x5bd
#define ERROR_NO_NVRAM_RESOURCES  0x5be
#define ERROR_NOT_GUI_PROCESS  0x5bf
#define ERROR_EVENTLOG_FILE_CORRUPT  0x5dc
#define ERROR_EVENTLOG_CANT_START  0x5dd
#define ERROR_LOG_FILE_FULL  0x5de
#define ERROR_EVENTLOG_FILE_CHANGED  0x5df
#define ERROR_CONTAINER_ASSIGNED  0x5e0
#define ERROR_JOB_NO_CONTAINER  0x5e1
#define ERROR_INVALID_TASK_NAME  0x60e
#define ERROR_INVALID_TASK_INDEX  0x60f
#define ERROR_THREAD_ALREADY_IN_TASK  0x610
#define ERROR_INSTALL_SERVICE_FAILURE  0x641
#define ERROR_INSTALL_USEREXIT  0x642
#define ERROR_INSTALL_FAILURE  0x643
#define ERROR_INSTALL_SUSPEND  0x644
#define ERROR_UNKNOWN_PRODUCT  0x645
#define ERROR_UNKNOWN_FEATURE  0x646
#define ERROR_UNKNOWN_COMPONENT  0x647
#define ERROR_UNKNOWN_PROPERTY  0x648
#define ERROR_INVALID_HANDLE_STATE  0x649
#define ERROR_BAD_CONFIGURATION  0x64a
#define ERROR_INDEX_ABSENT  0x64b
#define ERROR_INSTALL_SOURCE_ABSENT  0x64c
#define ERROR_INSTALL_PACKAGE_VERSION  0x64d
#define ERROR_PRODUCT_UNINSTALLED  0x64e
#define ERROR_BAD_QUERY_SYNTAX  0x64f
#define ERROR_INVALID_FIELD  0x650
#define ERROR_DEVICE_REMOVED  0x651
#define ERROR_INSTALL_ALREADY_RUNNING  0x652
#define ERROR_INSTALL_PACKAGE_OPEN_FAILED  0x653
#define ERROR_INSTALL_PACKAGE_INVALID  0x654
#define ERROR_INSTALL_UI_FAILURE  0x655
#define ERROR_INSTALL_LOG_FAILURE  0x656
#define ERROR_INSTALL_LANGUAGE_UNSUPPORTED  0x657
#define ERROR_INSTALL_TRANSFORM_FAILURE  0x658
#define ERROR_INSTALL_PACKAGE_REJECTED  0x659
#define ERROR_FUNCTION_NOT_CALLED  0x65a
#define ERROR_FUNCTION_FAILED  0x65b
#define ERROR_INVALID_TABLE  0x65c
#define ERROR_DATATYPE_MISMATCH  0x65d
#define ERROR_UNSUPPORTED_TYPE  0x65e
#define ERROR_CREATE_FAILED  0x65f
#define ERROR_INSTALL_TEMP_UNWRITABLE  0x660
#define ERROR_INSTALL_PLATFORM_UNSUPPORTED  0x661
#define ERROR_INSTALL_NOTUSED  0x662
#define ERROR_PATCH_PACKAGE_OPEN_FAILED  0x663
#define ERROR_PATCH_PACKAGE_INVALID  0x664
#define ERROR_PATCH_PACKAGE_UNSUPPORTED  0x665
#define ERROR_PRODUCT_VERSION  0x666
#define ERROR_INVALID_COMMAND_LINE  0x667
#define ERROR_INSTALL_REMOTE_DISALLOWED  0x668
#define ERROR_SUCCESS_REBOOT_INITIATED  0x669
#define ERROR_PATCH_TARGET_NOT_FOUND  0x66a
#define ERROR_PATCH_PACKAGE_REJECTED  0x66b
#define ERROR_INSTALL_TRANSFORM_REJECTED  0x66c
#define ERROR_INSTALL_REMOTE_PROHIBITED  0x66d
#define ERROR_PATCH_REMOVAL_UNSUPPORTED  0x66e
#define ERROR_UNKNOWN_PATCH  0x66f
#define ERROR_PATCH_NO_SEQUENCE  0x670
#define ERROR_PATCH_REMOVAL_DISALLOWED  0x671
#define ERROR_INVALID_PATCH_XML  0x672
#define ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT  0x673
#define ERROR_INSTALL_SERVICE_SAFEBOOT  0x674
#define ERROR_FAIL_FAST_EXCEPTION  0x675
#define ERROR_INSTALL_REJECTED  0x676
#define ERROR_DYNAMIC_CODE_BLOCKED  0x677
#define ERROR_NOT_SAME_OBJECT  0x678
#define ERROR_STRICT_CFG_VIOLATION  0x679
#define ERROR_SET_CONTEXT_DENIED  0x67c
#define ERROR_CROSS_PARTITION_VIOLATION  0x67d
#define ERROR_RETURN_ADDRESS_HIJACK_ATTEMPT  0x67e
#define ERROR_INVALID_USER_BUFFER  0x6f8
#define ERROR_UNRECOGNIZED_MEDIA  0x6f9
#define ERROR_NO_TRUST_LSA_SECRET  0x6fa
#define ERROR_NO_TRUST_SAM_ACCOUNT  0x6fb
#define ERROR_TRUSTED_DOMAIN_FAILURE  0x6fc
#define ERROR_TRUSTED_RELATIONSHIP_FAILURE  0x6fd
#define ERROR_TRUST_FAILURE  0x6fe
#define ERROR_NETLOGON_NOT_STARTED  0x700
#define ERROR_ACCOUNT_EXPIRED  0x701
#define ERROR_REDIRECTOR_HAS_OPEN_HANDLES  0x702
#define ERROR_PRINTER_DRIVER_ALREADY_INSTALLED  0x703
#define ERROR_UNKNOWN_PORT  0x704
#define ERROR_UNKNOWN_PRINTER_DRIVER  0x705
#define ERROR_UNKNOWN_PRINTPROCESSOR  0x706
#define ERROR_INVALID_SEPARATOR_FILE  0x707
#define ERROR_INVALID_PRIORITY  0x708
#define ERROR_INVALID_PRINTER_NAME  0x709
#define ERROR_PRINTER_ALREADY_EXISTS  0x70a
#define ERROR_INVALID_PRINTER_COMMAND  0x70b
#define ERROR_INVALID_DATATYPE  0x70c
#define ERROR_INVALID_ENVIRONMENT  0x70d
#define ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT  0x70f
#define ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT  0x710
#define ERROR_NOLOGON_SERVER_TRUST_ACCOUNT  0x711
#define ERROR_DOMAIN_TRUST_INCONSISTENT  0x712
#define ERROR_SERVER_HAS_OPEN_HANDLES  0x713
#define ERROR_RESOURCE_DATA_NOT_FOUND  0x714
#define ERROR_RESOURCE_TYPE_NOT_FOUND  0x715
#define ERROR_RESOURCE_NAME_NOT_FOUND  0x716
#define ERROR_RESOURCE_LANG_NOT_FOUND  0x717
#define ERROR_NOT_ENOUGH_QUOTA  0x718
#define ERROR_INVALID_TIME  0x76d
#define ERROR_INVALID_FORM_NAME  0x76e
#define ERROR_INVALID_FORM_SIZE  0x76f
#define ERROR_ALREADY_WAITING  0x770
#define ERROR_PRINTER_DELETED  0x771
#define ERROR_INVALID_PRINTER_STATE  0x772
#define ERROR_PASSWORD_MUST_CHANGE  0x773
#define ERROR_DOMAIN_CONTROLLER_NOT_FOUND  0x774
#define ERROR_ACCOUNT_LOCKED_OUT  0x775
#define ERROR_NO_SITENAME  0x77f
#define ERROR_CANT_ACCESS_FILE  0x780
#define ERROR_CANT_RESOLVE_FILENAME  0x781
#define ERROR_KM_DRIVER_BLOCKED  0x78a
#define ERROR_CONTEXT_EXPIRED  0x78b
#define ERROR_PER_USER_TRUST_QUOTA_EXCEEDED  0x78c
#define ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED  0x78d
#define ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED  0x78e
#define ERROR_AUTHENTICATION_FIREWALL_FAILED  0x78f
#define ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED  0x790
#define ERROR_NTLM_BLOCKED  0x791
#define ERROR_PASSWORD_CHANGE_REQUIRED  0x792
#define ERROR_LOST_MODE_LOGON_RESTRICTION  0x793
#define ERROR_INVALID_PIXEL_FORMAT  0x7d0
#define ERROR_BAD_DRIVER  0x7d1
#define ERROR_INVALID_WINDOW_STYLE  0x7d2
#define ERROR_METAFILE_NOT_SUPPORTED  0x7d3
#define ERROR_TRANSFORM_NOT_SUPPORTED  0x7d4
#define ERROR_CLIPPING_NOT_SUPPORTED  0x7d5
#define ERROR_INVALID_CMM  0x7da
#define ERROR_INVALID_PROFILE  0x7db
#define ERROR_TAG_NOT_FOUND  0x7dc
#define ERROR_TAG_NOT_PRESENT  0x7dd
#define ERROR_DUPLICATE_TAG  0x7de
#define ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE  0x7df
#define ERROR_PROFILE_NOT_FOUND  0x7e0
#define ERROR_INVALID_COLORSPACE  0x7e1
#define ERROR_ICM_NOT_ENABLED  0x7e2
#define ERROR_DELETING_ICM_XFORM  0x7e3
#define ERROR_INVALID_TRANSFORM  0x7e4
#define ERROR_COLORSPACE_MISMATCH  0x7e5
#define ERROR_INVALID_COLORINDEX  0x7e6
#define ERROR_PROFILE_DOES_NOT_MATCH_DEVICE  0x7e7
#define ERROR_CONNECTED_OTHER_PASSWORD  0x83c
#define ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT  0x83d
#define ERROR_BAD_USERNAME  0x89a
#define ERROR_NOT_CONNECTED  0x8ca
#define ERROR_OPEN_FILES  0x961
#define ERROR_ACTIVE_CONNECTIONS  0x962
#define ERROR_DEVICE_IN_USE  0x964
#define ERROR_UNKNOWN_PRINT_MONITOR  0xbb8
#define ERROR_PRINTER_DRIVER_IN_USE  0xbb9
#define ERROR_SPOOL_FILE_NOT_FOUND  0xbba
#define ERROR_SPL_NO_STARTDOC  0xbbb
#define ERROR_SPL_NO_ADDJOB  0xbbc
#define ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED  0xbbd
#define ERROR_PRINT_MONITOR_ALREADY_INSTALLED  0xbbe
#define ERROR_INVALID_PRINT_MONITOR  0xbbf
#define ERROR_PRINT_MONITOR_IN_USE  0xbc0
#define ERROR_PRINTER_HAS_JOBS_QUEUED  0xbc1
#define ERROR_SUCCESS_REBOOT_REQUIRED  0xbc2
#define ERROR_SUCCESS_RESTART_REQUIRED  0xbc3
#define ERROR_PRINTER_NOT_FOUND  0xbc4
#define ERROR_PRINTER_DRIVER_WARNED  0xbc5
#define ERROR_PRINTER_DRIVER_BLOCKED  0xbc6
#define ERROR_PRINTER_DRIVER_PACKAGE_IN_USE  0xbc7
#define ERROR_CORE_DRIVER_PACKAGE_NOT_FOUND  0xbc8
#define ERROR_FAIL_REBOOT_REQUIRED  0xbc9
#define ERROR_FAIL_REBOOT_INITIATED  0xbca
#define ERROR_PRINTER_DRIVER_DOWNLOAD_NEEDED  0xbcb
#define ERROR_PRINT_JOB_RESTART_REQUIRED  0xbcc
#define ERROR_INVALID_PRINTER_DRIVER_MANIFEST  0xbcd
#define ERROR_PRINTER_NOT_SHAREABLE  0xbce
#define ERROR_SERVER_SERVICE_CALL_REQUIRES_SMB1  0xbcf
#define ERROR_NETWORK_AUTHENTICATION_PROMPT_CANCELED  0xbd0
#define ERROR_REQUEST_PAUSED  0xbea
#define ERROR_APPEXEC_CONDITION_NOT_SATISFIED  0xbf4
#define ERROR_APPEXEC_HANDLE_INVALIDATED  0xbf5
#define ERROR_APPEXEC_INVALID_HOST_GENERATION  0xbf6
#define ERROR_APPEXEC_UNEXPECTED_PROCESS_REGISTRATION  0xbf7
#define ERROR_APPEXEC_INVALID_HOST_STATE  0xbf8
#define ERROR_APPEXEC_NO_DONOR  0xbf9
#define ERROR_APPEXEC_HOST_ID_MISMATCH  0xbfa
#define ERROR_APPEXEC_UNKNOWN_USER  0xbfb
#define ERROR_APPEXEC_APP_COMPAT_BLOCK  0xbfc
#define ERROR_APPEXEC_CALLER_WAIT_TIMEOUT  0xbfd
#define ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_TERMINATION  0xbfe
#define ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_LICENSING  0xbff
#define ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_RESOURCES  0xc00
#define ERROR_VRF_VOLATILE_CFG_AND_IO_ENABLED  0xc08
#define ERROR_VRF_VOLATILE_NOT_STOPPABLE  0xc09
#define ERROR_VRF_VOLATILE_SAFE_MODE  0xc0a
#define ERROR_VRF_VOLATILE_NOT_RUNNABLE_SYSTEM  0xc0b
#define ERROR_VRF_VOLATILE_NOT_SUPPORTED_RULECLASS  0xc0c
#define ERROR_VRF_VOLATILE_PROTECTED_DRIVER  0xc0d
#define ERROR_VRF_VOLATILE_NMI_REGISTERED  0xc0e
#define ERROR_VRF_VOLATILE_SETTINGS_CONFLICT  0xc0f
#define ERROR_DIF_IOCALLBACK_NOT_REPLACED  0xc76
#define ERROR_DIF_LIVEDUMP_LIMIT_EXCEEDED  0xc77
#define ERROR_DIF_VOLATILE_SECTION_NOT_LOCKED  0xc78
#define ERROR_DIF_VOLATILE_DRIVER_HOTPATCHED  0xc79
#define ERROR_DIF_VOLATILE_INVALID_INFO  0xc7a
#define ERROR_DIF_VOLATILE_DRIVER_IS_NOT_RUNNING  0xc7b
#define ERROR_DIF_VOLATILE_PLUGIN_IS_NOT_RUNNING  0xc7c
#define ERROR_DIF_VOLATILE_PLUGIN_CHANGE_NOT_ALLOWED  0xc7d
#define ERROR_DIF_VOLATILE_NOT_ALLOWED  0xc7e
#define ERROR_DIF_BINDING_API_NOT_FOUND  0xc7f
#define ERROR_IO_REISSUE_AS_CACHED  0xf6e
#define ERROR_WINS_INTERNAL  0xfa0
#define ERROR_CAN_NOT_DEL_LOCAL_WINS  0xfa1
#define ERROR_STATIC_INIT  0xfa2
#define ERROR_INC_BACKUP  0xfa3
#define ERROR_FULL_BACKUP  0xfa4
#define ERROR_REC_NON_EXISTENT  0xfa5
#define ERROR_RPL_NOT_ALLOWED  0xfa6
#define ERROR_DHCP_ADDRESS_CONFLICT  0x1004
#define ERROR_WMI_GUID_NOT_FOUND  0x1068
#define ERROR_WMI_INSTANCE_NOT_FOUND  0x1069
#define ERROR_WMI_ITEMID_NOT_FOUND  0x106a
#define ERROR_WMI_TRY_AGAIN  0x106b
#define ERROR_WMI_DP_NOT_FOUND  0x106c
#define ERROR_WMI_UNRESOLVED_INSTANCE_REF  0x106d
#define ERROR_WMI_ALREADY_ENABLED  0x106e
#define ERROR_WMI_GUID_DISCONNECTED  0x106f
#define ERROR_WMI_SERVER_UNAVAILABLE  0x1070
#define ERROR_WMI_DP_FAILED  0x1071
#define ERROR_WMI_INVALID_MOF  0x1072
#define ERROR_WMI_INVALID_REGINFO  0x1073
#define ERROR_WMI_ALREADY_DISABLED  0x1074
#define ERROR_WMI_READ_ONLY  0x1075
#define ERROR_WMI_SET_FAILURE  0x1076
#define ERROR_NOT_APPCONTAINER  0x109a
#define ERROR_APPCONTAINER_REQUIRED  0x109b
#define ERROR_NOT_SUPPORTED_IN_APPCONTAINER  0x109c
#define ERROR_INVALID_PACKAGE_SID_LENGTH  0x109d
#define ERROR_INVALID_MEDIA  0x10cc
#define ERROR_INVALID_LIBRARY  0x10cd
#define ERROR_INVALID_MEDIA_POOL  0x10ce
#define ERROR_DRIVE_MEDIA_MISMATCH  0x10cf
#define ERROR_MEDIA_OFFLINE  0x10d0
#define ERROR_LIBRARY_OFFLINE  0x10d1
#define ERROR_EMPTY  0x10d2
#define ERROR_NOT_EMPTY  0x10d3
#define ERROR_MEDIA_UNAVAILABLE  0x10d4
#define ERROR_RESOURCE_DISABLED  0x10d5
#define ERROR_INVALID_CLEANER  0x10d6
#define ERROR_UNABLE_TO_CLEAN  0x10d7
#define ERROR_OBJECT_NOT_FOUND  0x10d8
#define ERROR_DATABASE_FAILURE  0x10d9
#define ERROR_DATABASE_FULL  0x10da
#define ERROR_MEDIA_INCOMPATIBLE  0x10db
#define ERROR_RESOURCE_NOT_PRESENT  0x10dc
#define ERROR_INVALID_OPERATION  0x10dd
#define ERROR_MEDIA_NOT_AVAILABLE  0x10de
#define ERROR_DEVICE_NOT_AVAILABLE  0x10df
#define ERROR_REQUEST_REFUSED  0x10e0
#define ERROR_INVALID_DRIVE_OBJECT  0x10e1
#define ERROR_LIBRARY_FULL  0x10e2
#define ERROR_MEDIUM_NOT_ACCESSIBLE  0x10e3
#define ERROR_UNABLE_TO_LOAD_MEDIUM  0x10e4
#define ERROR_UNABLE_TO_INVENTORY_DRIVE  0x10e5
#define ERROR_UNABLE_TO_INVENTORY_SLOT  0x10e6
#define ERROR_UNABLE_TO_INVENTORY_TRANSPORT  0x10e7
#define ERROR_TRANSPORT_FULL  0x10e8
#define ERROR_CONTROLLING_IEPORT  0x10e9
#define ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA  0x10ea
#define ERROR_CLEANER_SLOT_SET  0x10eb
#define ERROR_CLEANER_SLOT_NOT_SET  0x10ec
#define ERROR_CLEANER_CARTRIDGE_SPENT  0x10ed
#define ERROR_UNEXPECTED_OMID  0x10ee
#define ERROR_CANT_DELETE_LAST_ITEM  0x10ef
#define ERROR_MESSAGE_EXCEEDS_MAX_SIZE  0x10f0
#define ERROR_VOLUME_CONTAINS_SYS_FILES  0x10f1
#define ERROR_INDIGENOUS_TYPE  0x10f2
#define ERROR_NO_SUPPORTING_DRIVES  0x10f3
#define ERROR_CLEANER_CARTRIDGE_INSTALLED  0x10f4
#define ERROR_IEPORT_FULL  0x10f5
#define ERROR_FILE_OFFLINE  0x10fe
#define ERROR_REMOTE_STORAGE_NOT_ACTIVE  0x10ff
#define ERROR_REMOTE_STORAGE_MEDIA_ERROR  0x1100
#define ERROR_NOT_A_REPARSE_POINT  0x1126
#define ERROR_REPARSE_ATTRIBUTE_CONFLICT  0x1127
#define ERROR_INVALID_REPARSE_DATA  0x1128
#define ERROR_REPARSE_TAG_INVALID  0x1129
#define ERROR_REPARSE_TAG_MISMATCH  0x112a
#define ERROR_REPARSE_POINT_ENCOUNTERED  0x112b
#define ERROR_APP_DATA_NOT_FOUND  0x1130
#define ERROR_APP_DATA_EXPIRED  0x1131
#define ERROR_APP_DATA_CORRUPT  0x1132
#define ERROR_APP_DATA_LIMIT_EXCEEDED  0x1133
#define ERROR_APP_DATA_REBOOT_REQUIRED  0x1134
#define ERROR_SECUREBOOT_ROLLBACK_DETECTED  0x1144
#define ERROR_SECUREBOOT_POLICY_VIOLATION  0x1145
#define ERROR_SECUREBOOT_INVALID_POLICY  0x1146
#define ERROR_SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND  0x1147
#define ERROR_SECUREBOOT_POLICY_NOT_SIGNED  0x1148
#define ERROR_SECUREBOOT_NOT_ENABLED  0x1149
#define ERROR_SECUREBOOT_FILE_REPLACED  0x114a
#define ERROR_SECUREBOOT_POLICY_NOT_AUTHORIZED  0x114b
#define ERROR_SECUREBOOT_POLICY_UNKNOWN  0x114c
#define ERROR_SECUREBOOT_POLICY_MISSING_ANTIROLLBACKVERSION  0x114d
#define ERROR_SECUREBOOT_PLATFORM_ID_MISMATCH  0x114e
#define ERROR_SECUREBOOT_POLICY_ROLLBACK_DETECTED  0x114f
#define ERROR_SECUREBOOT_POLICY_UPGRADE_MISMATCH  0x1150
#define ERROR_SECUREBOOT_REQUIRED_POLICY_FILE_MISSING  0x1151
#define ERROR_SECUREBOOT_NOT_BASE_POLICY  0x1152
#define ERROR_SECUREBOOT_NOT_SUPPLEMENTAL_POLICY  0x1153
#define ERROR_OFFLOAD_READ_FLT_NOT_SUPPORTED  0x1158
#define ERROR_OFFLOAD_WRITE_FLT_NOT_SUPPORTED  0x1159
#define ERROR_OFFLOAD_READ_FILE_NOT_SUPPORTED  0x115a
#define ERROR_OFFLOAD_WRITE_FILE_NOT_SUPPORTED  0x115b
#define ERROR_ALREADY_HAS_STREAM_ID  0x115c
#define ERROR_SMR_GARBAGE_COLLECTION_REQUIRED  0x115d
#define ERROR_WOF_WIM_HEADER_CORRUPT  0x115e
#define ERROR_WOF_WIM_RESOURCE_TABLE_CORRUPT  0x115f
#define ERROR_WOF_FILE_RESOURCE_TABLE_CORRUPT  0x1160
#define ERROR_OBJECT_IS_IMMUTABLE  0x1161
#define ERROR_VOLUME_NOT_SIS_ENABLED  0x1194
#define ERROR_SYSTEM_INTEGRITY_ROLLBACK_DETECTED  0x11c6
#define ERROR_SYSTEM_INTEGRITY_POLICY_VIOLATION  0x11c7
#define ERROR_SYSTEM_INTEGRITY_INVALID_POLICY  0x11c8
#define ERROR_SYSTEM_INTEGRITY_POLICY_NOT_SIGNED  0x11c9
#define ERROR_SYSTEM_INTEGRITY_TOO_MANY_POLICIES  0x11ca
#define ERROR_SYSTEM_INTEGRITY_SUPPLEMENTAL_POLICY_NOT_AUTHORIZED  0x11cb
#define ERROR_SYSTEM_INTEGRITY_REPUTATION_MALICIOUS  0x11cc
#define ERROR_SYSTEM_INTEGRITY_REPUTATION_PUA  0x11cd
#define ERROR_SYSTEM_INTEGRITY_REPUTATION_DANGEROUS_EXT  0x11ce
#define ERROR_SYSTEM_INTEGRITY_REPUTATION_OFFLINE  0x11cf
#define ERROR_VSM_NOT_INITIALIZED  0x11d0
#define ERROR_VSM_DMA_PROTECTION_NOT_IN_USE  0x11d1
#define ERROR_PLATFORM_MANIFEST_NOT_AUTHORIZED  0x11da
#define ERROR_PLATFORM_MANIFEST_INVALID  0x11db
#define ERROR_PLATFORM_MANIFEST_FILE_NOT_AUTHORIZED  0x11dc
#define ERROR_PLATFORM_MANIFEST_CATALOG_NOT_AUTHORIZED  0x11dd
#define ERROR_PLATFORM_MANIFEST_BINARY_ID_NOT_FOUND  0x11de
#define ERROR_PLATFORM_MANIFEST_NOT_ACTIVE  0x11df
#define ERROR_PLATFORM_MANIFEST_NOT_SIGNED  0x11e0
#define ERROR_SYSTEM_INTEGRITY_REPUTATION_UNFRIENDLY_FILE  0x11e4
#define ERROR_SYSTEM_INTEGRITY_REPUTATION_UNATTAINABLE  0x11e5
#define ERROR_SYSTEM_INTEGRITY_REPUTATION_EXPLICIT_DENY_FILE  0x11e6
#define ERROR_DEPENDENT_RESOURCE_EXISTS  0x1389
#define ERROR_DEPENDENCY_NOT_FOUND  0x138a
#define ERROR_DEPENDENCY_ALREADY_EXISTS  0x138b
#define ERROR_RESOURCE_NOT_ONLINE  0x138c
#define ERROR_HOST_NODE_NOT_AVAILABLE  0x138d
#define ERROR_RESOURCE_NOT_AVAILABLE  0x138e
#define ERROR_RESOURCE_NOT_FOUND  0x138f
#define ERROR_SHUTDOWN_CLUSTER  0x1390
#define ERROR_CANT_EVICT_ACTIVE_NODE  0x1391
#define ERROR_OBJECT_ALREADY_EXISTS  0x1392
#define ERROR_OBJECT_IN_LIST  0x1393
#define ERROR_GROUP_NOT_AVAILABLE  0x1394
#define ERROR_GROUP_NOT_FOUND  0x1395
#define ERROR_GROUP_NOT_ONLINE  0x1396
#define ERROR_HOST_NODE_NOT_RESOURCE_OWNER  0x1397
#define ERROR_HOST_NODE_NOT_GROUP_OWNER  0x1398
#define ERROR_RESMON_CREATE_FAILED  0x1399
#define ERROR_RESMON_ONLINE_FAILED  0x139a
#define ERROR_RESOURCE_ONLINE  0x139b
#define ERROR_QUORUM_RESOURCE  0x139c
#define ERROR_NOT_QUORUM_CAPABLE  0x139d
#define ERROR_CLUSTER_SHUTTING_DOWN  0x139e
#define ERROR_INVALID_STATE  0x139f
#define ERROR_RESOURCE_PROPERTIES_STORED  0x13a0
#define ERROR_NOT_QUORUM_CLASS  0x13a1
#define ERROR_CORE_RESOURCE  0x13a2
#define ERROR_QUORUM_RESOURCE_ONLINE_FAILED  0x13a3
#define ERROR_QUORUMLOG_OPEN_FAILED  0x13a4
#define ERROR_CLUSTERLOG_CORRUPT  0x13a5
#define ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE  0x13a6
#define ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE  0x13a7
#define ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND  0x13a8
#define ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE  0x13a9
#define ERROR_QUORUM_OWNER_ALIVE  0x13aa
#define ERROR_NETWORK_NOT_AVAILABLE  0x13ab
#define ERROR_NODE_NOT_AVAILABLE  0x13ac
#define ERROR_ALL_NODES_NOT_AVAILABLE  0x13ad
#define ERROR_RESOURCE_FAILED  0x13ae
#define ERROR_CLUSTER_INVALID_NODE  0x13af
#define ERROR_CLUSTER_NODE_EXISTS  0x13b0
#define ERROR_CLUSTER_JOIN_IN_PROGRESS  0x13b1
#define ERROR_CLUSTER_NODE_NOT_FOUND  0x13b2
#define ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND  0x13b3
#define ERROR_CLUSTER_NETWORK_EXISTS  0x13b4
#define ERROR_CLUSTER_NETWORK_NOT_FOUND  0x13b5
#define ERROR_CLUSTER_NETINTERFACE_EXISTS  0x13b6
#define ERROR_CLUSTER_NETINTERFACE_NOT_FOUND  0x13b7
#define ERROR_CLUSTER_INVALID_REQUEST  0x13b8
#define ERROR_CLUSTER_INVALID_NETWORK_PROVIDER  0x13b9
#define ERROR_CLUSTER_NODE_DOWN  0x13ba
#define ERROR_CLUSTER_NODE_UNREACHABLE  0x13bb
#define ERROR_CLUSTER_NODE_NOT_MEMBER  0x13bc
#define ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS  0x13bd
#define ERROR_CLUSTER_INVALID_NETWORK  0x13be
#define ERROR_CLUSTER_NODE_UP  0x13c0
#define ERROR_CLUSTER_IPADDR_IN_USE  0x13c1
#define ERROR_CLUSTER_NODE_NOT_PAUSED  0x13c2
#define ERROR_CLUSTER_NO_SECURITY_CONTEXT  0x13c3
#define ERROR_CLUSTER_NETWORK_NOT_INTERNAL  0x13c4
#define ERROR_CLUSTER_NODE_ALREADY_UP  0x13c5
#define ERROR_CLUSTER_NODE_ALREADY_DOWN  0x13c6
#define ERROR_CLUSTER_NETWORK_ALREADY_ONLINE  0x13c7
#define ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE  0x13c8
#define ERROR_CLUSTER_NODE_ALREADY_MEMBER  0x13c9
#define ERROR_CLUSTER_LAST_INTERNAL_NETWORK  0x13ca
#define ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS  0x13cb
#define ERROR_INVALID_OPERATION_ON_QUORUM  0x13cc
#define ERROR_DEPENDENCY_NOT_ALLOWED  0x13cd
#define ERROR_CLUSTER_NODE_PAUSED  0x13ce
#define ERROR_NODE_CANT_HOST_RESOURCE  0x13cf
#define ERROR_CLUSTER_NODE_NOT_READY  0x13d0
#define ERROR_CLUSTER_NODE_SHUTTING_DOWN  0x13d1
#define ERROR_CLUSTER_JOIN_ABORTED  0x13d2
#define ERROR_CLUSTER_INCOMPATIBLE_VERSIONS  0x13d3
#define ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED  0x13d4
#define ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED  0x13d5
#define ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND  0x13d6
#define ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED  0x13d7
#define ERROR_CLUSTER_RESNAME_NOT_FOUND  0x13d8
#define ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED  0x13d9
#define ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST  0x13da
#define ERROR_CLUSTER_DATABASE_SEQMISMATCH  0x13db
#define ERROR_RESMON_INVALID_STATE  0x13dc
#define ERROR_CLUSTER_GUM_NOT_LOCKER  0x13dd
#define ERROR_QUORUM_DISK_NOT_FOUND  0x13de
#define ERROR_DATABASE_BACKUP_CORRUPT  0x13df
#define ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT  0x13e0
#define ERROR_RESOURCE_PROPERTY_UNCHANGEABLE  0x13e1
#define ERROR_NO_ADMIN_ACCESS_POINT  0x13e2
#define ERROR_CLUSTER_MEMBERSHIP_INVALID_STATE  0x1702
#define ERROR_CLUSTER_QUORUMLOG_NOT_FOUND  0x1703
#define ERROR_CLUSTER_MEMBERSHIP_HALT  0x1704
#define ERROR_CLUSTER_INSTANCE_ID_MISMATCH  0x1705
#define ERROR_CLUSTER_NETWORK_NOT_FOUND_FOR_IP  0x1706
#define ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH  0x1707
#define ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP  0x1708
#define ERROR_CLUSTER_PARAMETER_MISMATCH  0x1709
#define ERROR_NODE_CANNOT_BE_CLUSTERED  0x170a
#define ERROR_CLUSTER_WRONG_OS_VERSION  0x170b
#define ERROR_CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME  0x170c
#define ERROR_CLUSCFG_ALREADY_COMMITTED  0x170d
#define ERROR_CLUSCFG_ROLLBACK_FAILED  0x170e
#define ERROR_CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT  0x170f
#define ERROR_CLUSTER_OLD_VERSION  0x1710
#define ERROR_CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME  0x1711
#define ERROR_CLUSTER_NO_NET_ADAPTERS  0x1712
#define ERROR_CLUSTER_POISONED  0x1713
#define ERROR_CLUSTER_GROUP_MOVING  0x1714
#define ERROR_CLUSTER_RESOURCE_TYPE_BUSY  0x1715
#define ERROR_RESOURCE_CALL_TIMED_OUT  0x1716
#define ERROR_INVALID_CLUSTER_IPV6_ADDRESS  0x1717
#define ERROR_CLUSTER_INTERNAL_INVALID_FUNCTION  0x1718
#define ERROR_CLUSTER_PARAMETER_OUT_OF_BOUNDS  0x1719
#define ERROR_CLUSTER_PARTIAL_SEND  0x171a
#define ERROR_CLUSTER_REGISTRY_INVALID_FUNCTION  0x171b
#define ERROR_CLUSTER_INVALID_STRING_TERMINATION  0x171c
#define ERROR_CLUSTER_INVALID_STRING_FORMAT  0x171d
#define ERROR_CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS  0x171e
#define ERROR_CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS  0x171f
#define ERROR_CLUSTER_NULL_DATA  0x1720
#define ERROR_CLUSTER_PARTIAL_READ  0x1721
#define ERROR_CLUSTER_PARTIAL_WRITE  0x1722
#define ERROR_CLUSTER_CANT_DESERIALIZE_DATA  0x1723
#define ERROR_DEPENDENT_RESOURCE_PROPERTY_CONFLICT  0x1724
#define ERROR_CLUSTER_NO_QUORUM  0x1725
#define ERROR_CLUSTER_INVALID_IPV6_NETWORK  0x1726
#define ERROR_CLUSTER_INVALID_IPV6_TUNNEL_NETWORK  0x1727
#define ERROR_QUORUM_NOT_ALLOWED_IN_THIS_GROUP  0x1728
#define ERROR_DEPENDENCY_TREE_TOO_COMPLEX  0x1729
#define ERROR_EXCEPTION_IN_RESOURCE_CALL  0x172a
#define ERROR_CLUSTER_RHS_FAILED_INITIALIZATION  0x172b
#define ERROR_CLUSTER_NOT_INSTALLED  0x172c
#define ERROR_CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE  0x172d
#define ERROR_CLUSTER_MAX_NODES_IN_CLUSTER  0x172e
#define ERROR_CLUSTER_TOO_MANY_NODES  0x172f
#define ERROR_CLUSTER_OBJECT_ALREADY_USED  0x1730
#define ERROR_NONCORE_GROUPS_FOUND  0x1731
#define ERROR_FILE_SHARE_RESOURCE_CONFLICT  0x1732
#define ERROR_CLUSTER_EVICT_INVALID_REQUEST  0x1733
#define ERROR_CLUSTER_SINGLETON_RESOURCE  0x1734
#define ERROR_CLUSTER_GROUP_SINGLETON_RESOURCE  0x1735
#define ERROR_CLUSTER_RESOURCE_PROVIDER_FAILED  0x1736
#define ERROR_CLUSTER_RESOURCE_CONFIGURATION_ERROR  0x1737
#define ERROR_CLUSTER_GROUP_BUSY  0x1738
#define ERROR_CLUSTER_NOT_SHARED_VOLUME  0x1739
#define ERROR_CLUSTER_INVALID_SECURITY_DESCRIPTOR  0x173a
#define ERROR_CLUSTER_SHARED_VOLUMES_IN_USE  0x173b
#define ERROR_CLUSTER_USE_SHARED_VOLUMES_API  0x173c
#define ERROR_CLUSTER_BACKUP_IN_PROGRESS  0x173d
#define ERROR_NON_CSV_PATH  0x173e
#define ERROR_CSV_VOLUME_NOT_LOCAL  0x173f
#define ERROR_CLUSTER_WATCHDOG_TERMINATING  0x1740
#define ERROR_CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES  0x1741
#define ERROR_CLUSTER_INVALID_NODE_WEIGHT  0x1742
#define ERROR_CLUSTER_RESOURCE_VETOED_CALL  0x1743
#define ERROR_RESMON_SYSTEM_RESOURCES_LACKING  0x1744
#define ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION  0x1745
#define ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE  0x1746
#define ERROR_CLUSTER_GROUP_QUEUED  0x1747
#define ERROR_CLUSTER_RESOURCE_LOCKED_STATUS  0x1748
#define ERROR_CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED  0x1749
#define ERROR_CLUSTER_NODE_DRAIN_IN_PROGRESS  0x174a
#define ERROR_CLUSTER_DISK_NOT_CONNECTED  0x174b
#define ERROR_DISK_NOT_CSV_CAPABLE  0x174c
#define ERROR_RESOURCE_NOT_IN_AVAILABLE_STORAGE  0x174d
#define ERROR_CLUSTER_SHARED_VOLUME_REDIRECTED  0x174e
#define ERROR_CLUSTER_SHARED_VOLUME_NOT_REDIRECTED  0x174f
#define ERROR_CLUSTER_CANNOT_RETURN_PROPERTIES  0x1750
#define ERROR_CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES  0x1751
#define ERROR_CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE  0x1752
#define ERROR_CLUSTER_AFFINITY_CONFLICT  0x1753
#define ERROR_CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE  0x1754
#define ERROR_CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS  0x1755
#define ERROR_CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED  0x1756
#define ERROR_CLUSTER_UPGRADE_RESTART_REQUIRED  0x1757
#define ERROR_CLUSTER_UPGRADE_IN_PROGRESS  0x1758
#define ERROR_CLUSTER_UPGRADE_INCOMPLETE  0x1759
#define ERROR_CLUSTER_NODE_IN_GRACE_PERIOD  0x175a
#define ERROR_CLUSTER_CSV_IO_PAUSE_TIMEOUT  0x175b
#define ERROR_NODE_NOT_ACTIVE_CLUSTER_MEMBER  0x175c
#define ERROR_CLUSTER_RESOURCE_NOT_MONITORED  0x175d
#define ERROR_CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED  0x175e
#define ERROR_CLUSTER_RESOURCE_IS_REPLICATED  0x175f
#define ERROR_CLUSTER_NODE_ISOLATED  0x1760
#define ERROR_CLUSTER_NODE_QUARANTINED  0x1761
#define ERROR_CLUSTER_DATABASE_UPDATE_CONDITION_FAILED  0x1762
#define ERROR_CLUSTER_SPACE_DEGRADED  0x1763
#define ERROR_CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED  0x1764
#define ERROR_CLUSTER_CSV_INVALID_HANDLE  0x1765
#define ERROR_CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR  0x1766
#define ERROR_GROUPSET_NOT_AVAILABLE  0x1767
#define ERROR_GROUPSET_NOT_FOUND  0x1768
#define ERROR_GROUPSET_CANT_PROVIDE  0x1769
#define ERROR_CLUSTER_FAULT_DOMAIN_PARENT_NOT_FOUND  0x176a
#define ERROR_CLUSTER_FAULT_DOMAIN_INVALID_HIERARCHY  0x176b
#define ERROR_CLUSTER_FAULT_DOMAIN_FAILED_S2D_VALIDATION  0x176c
#define ERROR_CLUSTER_FAULT_DOMAIN_S2D_CONNECTIVITY_LOSS  0x176d
#define ERROR_CLUSTER_INVALID_INFRASTRUCTURE_FILESERVER_NAME  0x176e
#define ERROR_CLUSTERSET_MANAGEMENT_CLUSTER_UNREACHABLE  0x176f
#define ERROR_ENCRYPTION_FAILED  0x1770
#define ERROR_DECRYPTION_FAILED  0x1771
#define ERROR_FILE_ENCRYPTED  0x1772
#define ERROR_NO_RECOVERY_POLICY  0x1773
#define ERROR_NO_EFS  0x1774
#define ERROR_WRONG_EFS  0x1775
#define ERROR_NO_USER_KEYS  0x1776
#define ERROR_FILE_NOT_ENCRYPTED  0x1777
#define ERROR_NOT_EXPORT_FORMAT  0x1778
#define ERROR_FILE_READ_ONLY  0x1779
#define ERROR_DIR_EFS_DISALLOWED  0x177a
#define ERROR_EFS_SERVER_NOT_TRUSTED  0x177b
#define ERROR_BAD_RECOVERY_POLICY  0x177c
#define ERROR_EFS_ALG_BLOB_TOO_BIG  0x177d
#define ERROR_VOLUME_NOT_SUPPORT_EFS  0x177e
#define ERROR_EFS_DISABLED  0x177f
#define ERROR_EFS_VERSION_NOT_SUPPORT  0x1780
#define ERROR_CS_ENCRYPTION_INVALID_SERVER_RESPONSE  0x1781
#define ERROR_CS_ENCRYPTION_UNSUPPORTED_SERVER  0x1782
#define ERROR_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE  0x1783
#define ERROR_CS_ENCRYPTION_NEW_ENCRYPTED_FILE  0x1784
#define ERROR_CS_ENCRYPTION_FILE_NOT_CSE  0x1785
#define ERROR_ENCRYPTION_POLICY_DENIES_OPERATION  0x1786
#define ERROR_WIP_ENCRYPTION_FAILED  0x1787
#define ERROR_NO_BROWSER_SERVERS_FOUND  0x17e6
#define ERROR_CLUSTER_OBJECT_IS_CLUSTER_SET_VM  0x186a
#define ERROR_LOG_SECTOR_INVALID  0x19c8
#define ERROR_LOG_SECTOR_PARITY_INVALID  0x19c9
#define ERROR_LOG_SECTOR_REMAPPED  0x19ca
#define ERROR_LOG_BLOCK_INCOMPLETE  0x19cb
#define ERROR_LOG_INVALID_RANGE  0x19cc
#define ERROR_LOG_BLOCKS_EXHAUSTED  0x19cd
#define ERROR_LOG_READ_CONTEXT_INVALID  0x19ce
#define ERROR_LOG_RESTART_INVALID  0x19cf
#define ERROR_LOG_BLOCK_VERSION  0x19d0
#define ERROR_LOG_BLOCK_INVALID  0x19d1
#define ERROR_LOG_READ_MODE_INVALID  0x19d2
#define ERROR_LOG_NO_RESTART  0x19d3
#define ERROR_LOG_METADATA_CORRUPT  0x19d4
#define ERROR_LOG_METADATA_INVALID  0x19d5
#define ERROR_LOG_METADATA_INCONSISTENT  0x19d6
#define ERROR_LOG_RESERVATION_INVALID  0x19d7
#define ERROR_LOG_CANT_DELETE  0x19d8
#define ERROR_LOG_CONTAINER_LIMIT_EXCEEDED  0x19d9
#define ERROR_LOG_START_OF_LOG  0x19da
#define ERROR_LOG_POLICY_ALREADY_INSTALLED  0x19db
#define ERROR_LOG_POLICY_NOT_INSTALLED  0x19dc
#define ERROR_LOG_POLICY_INVALID  0x19dd
#define ERROR_LOG_POLICY_CONFLICT  0x19de
#define ERROR_LOG_PINNED_ARCHIVE_TAIL  0x19df
#define ERROR_LOG_RECORD_NONEXISTENT  0x19e0
#define ERROR_LOG_RECORDS_RESERVED_INVALID  0x19e1
#define ERROR_LOG_SPACE_RESERVED_INVALID  0x19e2
#define ERROR_LOG_TAIL_INVALID  0x19e3
#define ERROR_LOG_FULL  0x19e4
#define ERROR_COULD_NOT_RESIZE_LOG  0x19e5
#define ERROR_LOG_MULTIPLEXED  0x19e6
#define ERROR_LOG_DEDICATED  0x19e7
#define ERROR_LOG_ARCHIVE_NOT_IN_PROGRESS  0x19e8
#define ERROR_LOG_ARCHIVE_IN_PROGRESS  0x19e9
#define ERROR_LOG_EPHEMERAL  0x19ea
#define ERROR_LOG_NOT_ENOUGH_CONTAINERS  0x19eb
#define ERROR_LOG_CLIENT_ALREADY_REGISTERED  0x19ec
#define ERROR_LOG_CLIENT_NOT_REGISTERED  0x19ed
#define ERROR_LOG_FULL_HANDLER_IN_PROGRESS  0x19ee
#define ERROR_LOG_CONTAINER_READ_FAILED  0x19ef
#define ERROR_LOG_CONTAINER_WRITE_FAILED  0x19f0
#define ERROR_LOG_CONTAINER_OPEN_FAILED  0x19f1
#define ERROR_LOG_CONTAINER_STATE_INVALID  0x19f2
#define ERROR_LOG_STATE_INVALID  0x19f3
#define ERROR_LOG_PINNED  0x19f4
#define ERROR_LOG_METADATA_FLUSH_FAILED  0x19f5
#define ERROR_LOG_INCONSISTENT_SECURITY  0x19f6
#define ERROR_LOG_APPENDED_FLUSH_FAILED  0x19f7
#define ERROR_LOG_PINNED_RESERVATION  0x19f8
#define ERROR_INVALID_TRANSACTION  0x1a2c
#define ERROR_TRANSACTION_NOT_ACTIVE  0x1a2d
#define ERROR_TRANSACTION_REQUEST_NOT_VALID  0x1a2e
#define ERROR_TRANSACTION_NOT_REQUESTED  0x1a2f
#define ERROR_TRANSACTION_ALREADY_ABORTED  0x1a30
#define ERROR_TRANSACTION_ALREADY_COMMITTED  0x1a31
#define ERROR_TM_INITIALIZATION_FAILED  0x1a32
#define ERROR_RESOURCEMANAGER_READ_ONLY  0x1a33
#define ERROR_TRANSACTION_NOT_JOINED  0x1a34
#define ERROR_TRANSACTION_SUPERIOR_EXISTS  0x1a35
#define ERROR_CRM_PROTOCOL_ALREADY_EXISTS  0x1a36
#define ERROR_TRANSACTION_PROPAGATION_FAILED  0x1a37
#define ERROR_CRM_PROTOCOL_NOT_FOUND  0x1a38
#define ERROR_TRANSACTION_INVALID_MARSHALL_BUFFER  0x1a39
#define ERROR_CURRENT_TRANSACTION_NOT_VALID  0x1a3a
#define ERROR_TRANSACTION_NOT_FOUND  0x1a3b
#define ERROR_RESOURCEMANAGER_NOT_FOUND  0x1a3c
#define ERROR_ENLISTMENT_NOT_FOUND  0x1a3d
#define ERROR_TRANSACTIONMANAGER_NOT_FOUND  0x1a3e
#define ERROR_TRANSACTIONMANAGER_NOT_ONLINE  0x1a3f
#define ERROR_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION  0x1a40
#define ERROR_TRANSACTION_NOT_ROOT  0x1a41
#define ERROR_TRANSACTION_OBJECT_EXPIRED  0x1a42
#define ERROR_TRANSACTION_RESPONSE_NOT_ENLISTED  0x1a43
#define ERROR_TRANSACTION_RECORD_TOO_LONG  0x1a44
#define ERROR_IMPLICIT_TRANSACTION_NOT_SUPPORTED  0x1a45
#define ERROR_TRANSACTION_INTEGRITY_VIOLATED  0x1a46
#define ERROR_TRANSACTIONMANAGER_IDENTITY_MISMATCH  0x1a47
#define ERROR_RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT  0x1a48
#define ERROR_TRANSACTION_MUST_WRITETHROUGH  0x1a49
#define ERROR_TRANSACTION_NO_SUPERIOR  0x1a4a
#define ERROR_HEURISTIC_DAMAGE_POSSIBLE  0x1a4b
#define ERROR_TRANSACTIONAL_CONFLICT  0x1a90
#define ERROR_RM_NOT_ACTIVE  0x1a91
#define ERROR_RM_METADATA_CORRUPT  0x1a92
#define ERROR_DIRECTORY_NOT_RM  0x1a93
#define ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE  0x1a95
#define ERROR_LOG_RESIZE_INVALID_SIZE  0x1a96
#define ERROR_OBJECT_NO_LONGER_EXISTS  0x1a97
#define ERROR_STREAM_MINIVERSION_NOT_FOUND  0x1a98
#define ERROR_STREAM_MINIVERSION_NOT_VALID  0x1a99
#define ERROR_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION  0x1a9a
#define ERROR_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT  0x1a9b
#define ERROR_CANT_CREATE_MORE_STREAM_MINIVERSIONS  0x1a9c
#define ERROR_REMOTE_FILE_VERSION_MISMATCH  0x1a9e
#define ERROR_HANDLE_NO_LONGER_VALID  0x1a9f
#define ERROR_NO_TXF_METADATA  0x1aa0
#define ERROR_LOG_CORRUPTION_DETECTED  0x1aa1
#define ERROR_CANT_RECOVER_WITH_HANDLE_OPEN  0x1aa2
#define ERROR_RM_DISCONNECTED  0x1aa3
#define ERROR_ENLISTMENT_NOT_SUPERIOR  0x1aa4
#define ERROR_RECOVERY_NOT_NEEDED  0x1aa5
#define ERROR_RM_ALREADY_STARTED  0x1aa6
#define ERROR_FILE_IDENTITY_NOT_PERSISTENT  0x1aa7
#define ERROR_CANT_BREAK_TRANSACTIONAL_DEPENDENCY  0x1aa8
#define ERROR_CANT_CROSS_RM_BOUNDARY  0x1aa9
#define ERROR_TXF_DIR_NOT_EMPTY  0x1aaa
#define ERROR_INDOUBT_TRANSACTIONS_EXIST  0x1aab
#define ERROR_TM_VOLATILE  0x1aac
#define ERROR_ROLLBACK_TIMER_EXPIRED  0x1aad
#define ERROR_TXF_ATTRIBUTE_CORRUPT  0x1aae
#define ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION  0x1aaf
#define ERROR_TRANSACTIONAL_OPEN_NOT_ALLOWED  0x1ab0
#define ERROR_LOG_GROWTH_FAILED  0x1ab1
#define ERROR_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE  0x1ab2
#define ERROR_TXF_METADATA_ALREADY_PRESENT  0x1ab3
#define ERROR_TRANSACTION_SCOPE_CALLBACKS_NOT_SET  0x1ab4
#define ERROR_TRANSACTION_REQUIRED_PROMOTION  0x1ab5
#define ERROR_CANNOT_EXECUTE_FILE_IN_TRANSACTION  0x1ab6
#define ERROR_TRANSACTIONS_NOT_FROZEN  0x1ab7
#define ERROR_TRANSACTION_FREEZE_IN_PROGRESS  0x1ab8
#define ERROR_NOT_SNAPSHOT_VOLUME  0x1ab9
#define ERROR_NO_SAVEPOINT_WITH_OPEN_FILES  0x1aba
#define ERROR_DATA_LOST_REPAIR  0x1abb
#define ERROR_SPARSE_NOT_ALLOWED_IN_TRANSACTION  0x1abc
#define ERROR_TM_IDENTITY_MISMATCH  0x1abd
#define ERROR_FLOATED_SECTION  0x1abe
#define ERROR_CANNOT_ACCEPT_TRANSACTED_WORK  0x1abf
#define ERROR_CANNOT_ABORT_TRANSACTIONS  0x1ac0
#define ERROR_BAD_CLUSTERS  0x1ac1
#define ERROR_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION  0x1ac2
#define ERROR_VOLUME_DIRTY  0x1ac3
#define ERROR_NO_LINK_TRACKING_IN_TRANSACTION  0x1ac4
#define ERROR_OPERATION_NOT_SUPPORTED_IN_TRANSACTION  0x1ac5
#define ERROR_EXPIRED_HANDLE  0x1ac6
#define ERROR_TRANSACTION_NOT_ENLISTED  0x1ac7
#define ERROR_CTX_WINSTATION_NAME_INVALID  0x1b59
#define ERROR_CTX_INVALID_PD  0x1b5a
#define ERROR_CTX_PD_NOT_FOUND  0x1b5b
#define ERROR_CTX_WD_NOT_FOUND  0x1b5c
#define ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY  0x1b5d
#define ERROR_CTX_SERVICE_NAME_COLLISION  0x1b5e
#define ERROR_CTX_CLOSE_PENDING  0x1b5f
#define ERROR_CTX_NO_OUTBUF  0x1b60
#define ERROR_CTX_MODEM_INF_NOT_FOUND  0x1b61
#define ERROR_CTX_INVALID_MODEMNAME  0x1b62
#define ERROR_CTX_MODEM_RESPONSE_ERROR  0x1b63
#define ERROR_CTX_MODEM_RESPONSE_TIMEOUT  0x1b64
#define ERROR_CTX_MODEM_RESPONSE_NO_CARRIER  0x1b65
#define ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE  0x1b66
#define ERROR_CTX_MODEM_RESPONSE_BUSY  0x1b67
#define ERROR_CTX_MODEM_RESPONSE_VOICE  0x1b68
#define ERROR_CTX_TD_ERROR  0x1b69
#define ERROR_CTX_WINSTATION_NOT_FOUND  0x1b6e
#define ERROR_CTX_WINSTATION_ALREADY_EXISTS  0x1b6f
#define ERROR_CTX_WINSTATION_BUSY  0x1b70
#define ERROR_CTX_BAD_VIDEO_MODE  0x1b71
#define ERROR_CTX_GRAPHICS_INVALID  0x1b7b
#define ERROR_CTX_LOGON_DISABLED  0x1b7d
#define ERROR_CTX_NOT_CONSOLE  0x1b7e
#define ERROR_CTX_CLIENT_QUERY_TIMEOUT  0x1b80
#define ERROR_CTX_CONSOLE_DISCONNECT  0x1b81
#define ERROR_CTX_CONSOLE_CONNECT  0x1b82
#define ERROR_CTX_SHADOW_DENIED  0x1b84
#define ERROR_CTX_WINSTATION_ACCESS_DENIED  0x1b85
#define ERROR_CTX_INVALID_WD  0x1b89
#define ERROR_CTX_SHADOW_INVALID  0x1b8a
#define ERROR_CTX_SHADOW_DISABLED  0x1b8b
#define ERROR_CTX_CLIENT_LICENSE_IN_USE  0x1b8c
#define ERROR_CTX_CLIENT_LICENSE_NOT_SET  0x1b8d
#define ERROR_CTX_LICENSE_NOT_AVAILABLE  0x1b8e
#define ERROR_CTX_LICENSE_CLIENT_INVALID  0x1b8f
#define ERROR_CTX_LICENSE_EXPIRED  0x1b90
#define ERROR_CTX_SHADOW_NOT_RUNNING  0x1b91
#define ERROR_CTX_SHADOW_ENDED_BY_MODE_CHANGE  0x1b92
#define ERROR_ACTIVATION_COUNT_EXCEEDED  0x1b93
#define ERROR_CTX_WINSTATIONS_DISABLED  0x1b94
#define ERROR_CTX_ENCRYPTION_LEVEL_REQUIRED  0x1b95
#define ERROR_CTX_SESSION_IN_USE  0x1b96
#define ERROR_CTX_NO_FORCE_LOGOFF  0x1b97
#define ERROR_CTX_ACCOUNT_RESTRICTION  0x1b98
#define ERROR_RDP_PROTOCOL_ERROR  0x1b99
#define ERROR_CTX_CDM_CONNECT  0x1b9a
#define ERROR_CTX_CDM_DISCONNECT  0x1b9b
#define ERROR_CTX_SECURITY_LAYER_ERROR  0x1b9c
#define ERROR_TS_INCOMPATIBLE_SESSIONS  0x1b9d
#define ERROR_TS_VIDEO_SUBSYSTEM_ERROR  0x1b9e
#define ERROR_DS_NOT_INSTALLED  0x2008
#define ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY  0x2009
#define ERROR_DS_NO_ATTRIBUTE_OR_VALUE  0x200a
#define ERROR_DS_INVALID_ATTRIBUTE_SYNTAX  0x200b
#define ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED  0x200c
#define ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS  0x200d
#define ERROR_DS_BUSY  0x200e
#define ERROR_DS_UNAVAILABLE  0x200f
#define ERROR_DS_NO_RIDS_ALLOCATED  0x2010
#define ERROR_DS_NO_MORE_RIDS  0x2011
#define ERROR_DS_INCORRECT_ROLE_OWNER  0x2012
#define ERROR_DS_RIDMGR_INIT_ERROR  0x2013
#define ERROR_DS_OBJ_CLASS_VIOLATION  0x2014
#define ERROR_DS_CANT_ON_NON_LEAF  0x2015
#define ERROR_DS_CANT_ON_RDN  0x2016
#define ERROR_DS_CANT_MOD_OBJ_CLASS  0x2017
#define ERROR_DS_CROSS_DOM_MOVE_ERROR  0x2018
#define ERROR_DS_GC_NOT_AVAILABLE  0x2019
#define ERROR_SHARED_POLICY  0x201a
#define ERROR_POLICY_OBJECT_NOT_FOUND  0x201b
#define ERROR_POLICY_ONLY_IN_DS  0x201c
#define ERROR_PROMOTION_ACTIVE  0x201d
#define ERROR_NO_PROMOTION_ACTIVE  0x201e
#define ERROR_DS_OPERATIONS_ERROR  0x2020
#define ERROR_DS_PROTOCOL_ERROR  0x2021
#define ERROR_DS_TIMELIMIT_EXCEEDED  0x2022
#define ERROR_DS_SIZELIMIT_EXCEEDED  0x2023
#define ERROR_DS_ADMIN_LIMIT_EXCEEDED  0x2024
#define ERROR_DS_COMPARE_FALSE  0x2025
#define ERROR_DS_COMPARE_TRUE  0x2026
#define ERROR_DS_AUTH_METHOD_NOT_SUPPORTED  0x2027
#define ERROR_DS_STRONG_AUTH_REQUIRED  0x2028
#define ERROR_DS_INAPPROPRIATE_AUTH  0x2029
#define ERROR_DS_AUTH_UNKNOWN  0x202a
#define ERROR_DS_REFERRAL  0x202b
#define ERROR_DS_UNAVAILABLE_CRIT_EXTENSION  0x202c
#define ERROR_DS_CONFIDENTIALITY_REQUIRED  0x202d
#define ERROR_DS_INAPPROPRIATE_MATCHING  0x202e
#define ERROR_DS_CONSTRAINT_VIOLATION  0x202f
#define ERROR_DS_NO_SUCH_OBJECT  0x2030
#define ERROR_DS_ALIAS_PROBLEM  0x2031
#define ERROR_DS_INVALID_DN_SYNTAX  0x2032
#define ERROR_DS_IS_LEAF  0x2033
#define ERROR_DS_ALIAS_DEREF_PROBLEM  0x2034
#define ERROR_DS_UNWILLING_TO_PERFORM  0x2035
#define ERROR_DS_LOOP_DETECT  0x2036
#define ERROR_DS_NAMING_VIOLATION  0x2037
#define ERROR_DS_OBJECT_RESULTS_TOO_LARGE  0x2038
#define ERROR_DS_AFFECTS_MULTIPLE_DSAS  0x2039
#define ERROR_DS_SERVER_DOWN  0x203a
#define ERROR_DS_LOCAL_ERROR  0x203b
#define ERROR_DS_ENCODING_ERROR  0x203c
#define ERROR_DS_DECODING_ERROR  0x203d
#define ERROR_DS_FILTER_UNKNOWN  0x203e
#define ERROR_DS_PARAM_ERROR  0x203f
#define ERROR_DS_NOT_SUPPORTED  0x2040
#define ERROR_DS_NO_RESULTS_RETURNED  0x2041
#define ERROR_DS_CONTROL_NOT_FOUND  0x2042
#define ERROR_DS_CLIENT_LOOP  0x2043
#define ERROR_DS_REFERRAL_LIMIT_EXCEEDED  0x2044
#define ERROR_DS_SORT_CONTROL_MISSING  0x2045
#define ERROR_DS_OFFSET_RANGE_ERROR  0x2046
#define ERROR_DS_RIDMGR_DISABLED  0x2047
#define ERROR_DS_ROOT_MUST_BE_NC  0x206d
#define ERROR_DS_ADD_REPLICA_INHIBITED  0x206e
#define ERROR_DS_ATT_NOT_DEF_IN_SCHEMA  0x206f
#define ERROR_DS_MAX_OBJ_SIZE_EXCEEDED  0x2070
#define ERROR_DS_OBJ_STRING_NAME_EXISTS  0x2071
#define ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA  0x2072
#define ERROR_DS_RDN_DOESNT_MATCH_SCHEMA  0x2073
#define ERROR_DS_NO_REQUESTED_ATTS_FOUND  0x2074
#define ERROR_DS_USER_BUFFER_TO_SMALL  0x2075
#define ERROR_DS_ATT_IS_NOT_ON_OBJ  0x2076
#define ERROR_DS_ILLEGAL_MOD_OPERATION  0x2077
#define ERROR_DS_OBJ_TOO_LARGE  0x2078
#define ERROR_DS_BAD_INSTANCE_TYPE  0x2079
#define ERROR_DS_MASTERDSA_REQUIRED  0x207a
#define ERROR_DS_OBJECT_CLASS_REQUIRED  0x207b
#define ERROR_DS_MISSING_REQUIRED_ATT  0x207c
#define ERROR_DS_ATT_NOT_DEF_FOR_CLASS  0x207d
#define ERROR_DS_ATT_ALREADY_EXISTS  0x207e
#define ERROR_DS_CANT_ADD_ATT_VALUES  0x2080
#define ERROR_DS_SINGLE_VALUE_CONSTRAINT  0x2081
#define ERROR_DS_RANGE_CONSTRAINT  0x2082
#define ERROR_DS_ATT_VAL_ALREADY_EXISTS  0x2083
#define ERROR_DS_CANT_REM_MISSING_ATT  0x2084
#define ERROR_DS_CANT_REM_MISSING_ATT_VAL  0x2085
#define ERROR_DS_ROOT_CANT_BE_SUBREF  0x2086
#define ERROR_DS_NO_CHAINING  0x2087
#define ERROR_DS_NO_CHAINED_EVAL  0x2088
#define ERROR_DS_NO_PARENT_OBJECT  0x2089
#define ERROR_DS_PARENT_IS_AN_ALIAS  0x208a
#define ERROR_DS_CANT_MIX_MASTER_AND_REPS  0x208b
#define ERROR_DS_CHILDREN_EXIST  0x208c
#define ERROR_DS_OBJ_NOT_FOUND  0x208d
#define ERROR_DS_ALIASED_OBJ_MISSING  0x208e
#define ERROR_DS_BAD_NAME_SYNTAX  0x208f
#define ERROR_DS_ALIAS_POINTS_TO_ALIAS  0x2090
#define ERROR_DS_CANT_DEREF_ALIAS  0x2091
#define ERROR_DS_OUT_OF_SCOPE  0x2092
#define ERROR_DS_OBJECT_BEING_REMOVED  0x2093
#define ERROR_DS_CANT_DELETE_DSA_OBJ  0x2094
#define ERROR_DS_GENERIC_ERROR  0x2095
#define ERROR_DS_DSA_MUST_BE_INT_MASTER  0x2096
#define ERROR_DS_CLASS_NOT_DSA  0x2097
#define ERROR_DS_INSUFF_ACCESS_RIGHTS  0x2098
#define ERROR_DS_ILLEGAL_SUPERIOR  0x2099
#define ERROR_DS_ATTRIBUTE_OWNED_BY_SAM  0x209a
#define ERROR_DS_NAME_TOO_MANY_PARTS  0x209b
#define ERROR_DS_NAME_TOO_LONG  0x209c
#define ERROR_DS_NAME_VALUE_TOO_LONG  0x209d
#define ERROR_DS_NAME_UNPARSEABLE  0x209e
#define ERROR_DS_NAME_TYPE_UNKNOWN  0x209f
#define ERROR_DS_NOT_AN_OBJECT  0x20a0
#define ERROR_DS_SEC_DESC_TOO_SHORT  0x20a1
#define ERROR_DS_SEC_DESC_INVALID  0x20a2
#define ERROR_DS_NO_DELETED_NAME  0x20a3
#define ERROR_DS_SUBREF_MUST_HAVE_PARENT  0x20a4
#define ERROR_DS_NCNAME_MUST_BE_NC  0x20a5
#define ERROR_DS_CANT_ADD_SYSTEM_ONLY  0x20a6
#define ERROR_DS_CLASS_MUST_BE_CONCRETE  0x20a7
#define ERROR_DS_INVALID_DMD  0x20a8
#define ERROR_DS_OBJ_GUID_EXISTS  0x20a9
#define ERROR_DS_NOT_ON_BACKLINK  0x20aa
#define ERROR_DS_NO_CROSSREF_FOR_NC  0x20ab
#define ERROR_DS_SHUTTING_DOWN  0x20ac
#define ERROR_DS_UNKNOWN_OPERATION  0x20ad
#define ERROR_DS_INVALID_ROLE_OWNER  0x20ae
#define ERROR_DS_COULDNT_CONTACT_FSMO  0x20af
#define ERROR_DS_CROSS_NC_DN_RENAME  0x20b0
#define ERROR_DS_CANT_MOD_SYSTEM_ONLY  0x20b1
#define ERROR_DS_REPLICATOR_ONLY  0x20b2
#define ERROR_DS_OBJ_CLASS_NOT_DEFINED  0x20b3
#define ERROR_DS_OBJ_CLASS_NOT_SUBCLASS  0x20b4
#define ERROR_DS_NAME_REFERENCE_INVALID  0x20b5
#define ERROR_DS_CROSS_REF_EXISTS  0x20b6
#define ERROR_DS_CANT_DEL_MASTER_CROSSREF  0x20b7
#define ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD  0x20b8
#define ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX  0x20b9
#define ERROR_DS_DUP_RDN  0x20ba
#define ERROR_DS_DUP_OID  0x20bb
#define ERROR_DS_DUP_MAPI_ID  0x20bc
#define ERROR_DS_DUP_SCHEMA_ID_GUID  0x20bd
#define ERROR_DS_DUP_LDAP_DISPLAY_NAME  0x20be
#define ERROR_DS_SEMANTIC_ATT_TEST  0x20bf
#define ERROR_DS_SYNTAX_MISMATCH  0x20c0
#define ERROR_DS_EXISTS_IN_MUST_HAVE  0x20c1
#define ERROR_DS_EXISTS_IN_MAY_HAVE  0x20c2
#define ERROR_DS_NONEXISTENT_MAY_HAVE  0x20c3
#define ERROR_DS_NONEXISTENT_MUST_HAVE  0x20c4
#define ERROR_DS_AUX_CLS_TEST_FAIL  0x20c5
#define ERROR_DS_NONEXISTENT_POSS_SUP  0x20c6
#define ERROR_DS_SUB_CLS_TEST_FAIL  0x20c7
#define ERROR_DS_BAD_RDN_ATT_ID_SYNTAX  0x20c8
#define ERROR_DS_EXISTS_IN_AUX_CLS  0x20c9
#define ERROR_DS_EXISTS_IN_SUB_CLS  0x20ca
#define ERROR_DS_EXISTS_IN_POSS_SUP  0x20cb
#define ERROR_DS_RECALCSCHEMA_FAILED  0x20cc
#define ERROR_DS_TREE_DELETE_NOT_FINISHED  0x20cd
#define ERROR_DS_CANT_DELETE  0x20ce
#define ERROR_DS_ATT_SCHEMA_REQ_ID  0x20cf
#define ERROR_DS_BAD_ATT_SCHEMA_SYNTAX  0x20d0
#define ERROR_DS_CANT_CACHE_ATT  0x20d1
#define ERROR_DS_CANT_CACHE_CLASS  0x20d2
#define ERROR_DS_CANT_REMOVE_ATT_CACHE  0x20d3
#define ERROR_DS_CANT_REMOVE_CLASS_CACHE  0x20d4
#define ERROR_DS_CANT_RETRIEVE_DN  0x20d5
#define ERROR_DS_MISSING_SUPREF  0x20d6
#define ERROR_DS_CANT_RETRIEVE_INSTANCE  0x20d7
#define ERROR_DS_CODE_INCONSISTENCY  0x20d8
#define ERROR_DS_DATABASE_ERROR  0x20d9
#define ERROR_DS_GOVERNSID_MISSING  0x20da
#define ERROR_DS_MISSING_EXPECTED_ATT  0x20db
#define ERROR_DS_NCNAME_MISSING_CR_REF  0x20dc
#define ERROR_DS_SECURITY_CHECKING_ERROR  0x20dd
#define ERROR_DS_SCHEMA_NOT_LOADED  0x20de
#define ERROR_DS_SCHEMA_ALLOC_FAILED  0x20df
#define ERROR_DS_ATT_SCHEMA_REQ_SYNTAX  0x20e0
#define ERROR_DS_GCVERIFY_ERROR  0x20e1
#define ERROR_DS_DRA_SCHEMA_MISMATCH  0x20e2
#define ERROR_DS_CANT_FIND_DSA_OBJ  0x20e3
#define ERROR_DS_CANT_FIND_EXPECTED_NC  0x20e4
#define ERROR_DS_CANT_FIND_NC_IN_CACHE  0x20e5
#define ERROR_DS_CANT_RETRIEVE_CHILD  0x20e6
#define ERROR_DS_SECURITY_ILLEGAL_MODIFY  0x20e7
#define ERROR_DS_CANT_REPLACE_HIDDEN_REC  0x20e8
#define ERROR_DS_BAD_HIERARCHY_FILE  0x20e9
#define ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED  0x20ea
#define ERROR_DS_CONFIG_PARAM_MISSING  0x20eb
#define ERROR_DS_COUNTING_AB_INDICES_FAILED  0x20ec
#define ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED  0x20ed
#define ERROR_DS_INTERNAL_FAILURE  0x20ee
#define ERROR_DS_UNKNOWN_ERROR  0x20ef
#define ERROR_DS_ROOT_REQUIRES_CLASS_TOP  0x20f0
#define ERROR_DS_REFUSING_FSMO_ROLES  0x20f1
#define ERROR_DS_MISSING_FSMO_SETTINGS  0x20f2
#define ERROR_DS_UNABLE_TO_SURRENDER_ROLES  0x20f3
#define ERROR_DS_DRA_GENERIC  0x20f4
#define ERROR_DS_DRA_INVALID_PARAMETER  0x20f5
#define ERROR_DS_DRA_BUSY  0x20f6
#define ERROR_DS_DRA_BAD_DN  0x20f7
#define ERROR_DS_DRA_BAD_NC  0x20f8
#define ERROR_DS_DRA_DN_EXISTS  0x20f9
#define ERROR_DS_DRA_INTERNAL_ERROR  0x20fa
#define ERROR_DS_DRA_INCONSISTENT_DIT  0x20fb
#define ERROR_DS_DRA_CONNECTION_FAILED  0x20fc
#define ERROR_DS_DRA_BAD_INSTANCE_TYPE  0x20fd
#define ERROR_DS_DRA_OUT_OF_MEM  0x20fe
#define ERROR_DS_DRA_MAIL_PROBLEM  0x20ff
#define ERROR_DS_DRA_REF_ALREADY_EXISTS  0x2100
#define ERROR_DS_DRA_REF_NOT_FOUND  0x2101
#define ERROR_DS_DRA_OBJ_IS_REP_SOURCE  0x2102
#define ERROR_DS_DRA_DB_ERROR  0x2103
#define ERROR_DS_DRA_NO_REPLICA  0x2104
#define ERROR_DS_DRA_ACCESS_DENIED  0x2105
#define ERROR_DS_DRA_NOT_SUPPORTED  0x2106
#define ERROR_DS_DRA_RPC_CANCELLED  0x2107
#define ERROR_DS_DRA_SOURCE_DISABLED  0x2108
#define ERROR_DS_DRA_SINK_DISABLED  0x2109
#define ERROR_DS_DRA_NAME_COLLISION  0x210a
#define ERROR_DS_DRA_SOURCE_REINSTALLED  0x210b
#define ERROR_DS_DRA_MISSING_PARENT  0x210c
#define ERROR_DS_DRA_PREEMPTED  0x210d
#define ERROR_DS_DRA_ABANDON_SYNC  0x210e
#define ERROR_DS_DRA_SHUTDOWN  0x210f
#define ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET  0x2110
#define ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA  0x2111
#define ERROR_DS_DRA_EXTN_CONNECTION_FAILED  0x2112
#define ERROR_DS_INSTALL_SCHEMA_MISMATCH  0x2113
#define ERROR_DS_DUP_LINK_ID  0x2114
#define ERROR_DS_NAME_ERROR_RESOLVING  0x2115
#define ERROR_DS_NAME_ERROR_NOT_FOUND  0x2116
#define ERROR_DS_NAME_ERROR_NOT_UNIQUE  0x2117
#define ERROR_DS_NAME_ERROR_NO_MAPPING  0x2118
#define ERROR_DS_NAME_ERROR_DOMAIN_ONLY  0x2119
#define ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING  0x211a
#define ERROR_DS_CONSTRUCTED_ATT_MOD  0x211b
#define ERROR_DS_WRONG_OM_OBJ_CLASS  0x211c
#define ERROR_DS_DRA_REPL_PENDING  0x211d
#define ERROR_DS_DS_REQUIRED  0x211e
#define ERROR_DS_INVALID_LDAP_DISPLAY_NAME  0x211f
#define ERROR_DS_NON_BASE_SEARCH  0x2120
#define ERROR_DS_CANT_RETRIEVE_ATTS  0x2121
#define ERROR_DS_BACKLINK_WITHOUT_LINK  0x2122
#define ERROR_DS_EPOCH_MISMATCH  0x2123
#define ERROR_DS_SRC_NAME_MISMATCH  0x2124
#define ERROR_DS_SRC_AND_DST_NC_IDENTICAL  0x2125
#define ERROR_DS_DST_NC_MISMATCH  0x2126
#define ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC  0x2127
#define ERROR_DS_SRC_GUID_MISMATCH  0x2128
#define ERROR_DS_CANT_MOVE_DELETED_OBJECT  0x2129
#define ERROR_DS_PDC_OPERATION_IN_PROGRESS  0x212a
#define ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD  0x212b
#define ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION  0x212c
#define ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS  0x212d
#define ERROR_DS_NC_MUST_HAVE_NC_PARENT  0x212e
#define ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE  0x212f
#define ERROR_DS_DST_DOMAIN_NOT_NATIVE  0x2130
#define ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER  0x2131
#define ERROR_DS_CANT_MOVE_ACCOUNT_GROUP  0x2132
#define ERROR_DS_CANT_MOVE_RESOURCE_GROUP  0x2133
#define ERROR_DS_INVALID_SEARCH_FLAG  0x2134
#define ERROR_DS_NO_TREE_DELETE_ABOVE_NC  0x2135
#define ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE  0x2136
#define ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE  0x2137
#define ERROR_DS_SAM_INIT_FAILURE  0x2138
#define ERROR_DS_SENSITIVE_GROUP_VIOLATION  0x2139
#define ERROR_DS_CANT_MOD_PRIMARYGROUPID  0x213a
#define ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD  0x213b
#define ERROR_DS_NONSAFE_SCHEMA_CHANGE  0x213c
#define ERROR_DS_SCHEMA_UPDATE_DISALLOWED  0x213d
#define ERROR_DS_CANT_CREATE_UNDER_SCHEMA  0x213e
#define ERROR_DS_INSTALL_NO_SRC_SCH_VERSION  0x213f
#define ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE  0x2140
#define ERROR_DS_INVALID_GROUP_TYPE  0x2141
#define ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN  0x2142
#define ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN  0x2143
#define ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER  0x2144
#define ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER  0x2145
#define ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER  0x2146
#define ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER  0x2147
#define ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER  0x2148
#define ERROR_DS_HAVE_PRIMARY_MEMBERS  0x2149
#define ERROR_DS_STRING_SD_CONVERSION_FAILED  0x214a
#define ERROR_DS_NAMING_MASTER_GC  0x214b
#define ERROR_DS_DNS_LOOKUP_FAILURE  0x214c
#define ERROR_DS_COULDNT_UPDATE_SPNS  0x214d
#define ERROR_DS_CANT_RETRIEVE_SD  0x214e
#define ERROR_DS_KEY_NOT_UNIQUE  0x214f
#define ERROR_DS_WRONG_LINKED_ATT_SYNTAX  0x2150
#define ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD  0x2151
#define ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY  0x2152
#define ERROR_DS_CANT_START  0x2153
#define ERROR_DS_INIT_FAILURE  0x2154
#define ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION  0x2155
#define ERROR_DS_SOURCE_DOMAIN_IN_FOREST  0x2156
#define ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST  0x2157
#define ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED  0x2158
#define ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN  0x2159
#define ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER  0x215a
#define ERROR_DS_SRC_SID_EXISTS_IN_FOREST  0x215b
#define ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH  0x215c
#define ERROR_SAM_INIT_FAILURE  0x215d
#define ERROR_DS_DRA_SCHEMA_INFO_SHIP  0x215e
#define ERROR_DS_DRA_SCHEMA_CONFLICT  0x215f
#define ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT  0x2160
#define ERROR_DS_DRA_OBJ_NC_MISMATCH  0x2161
#define ERROR_DS_NC_STILL_HAS_DSAS  0x2162
#define ERROR_DS_GC_REQUIRED  0x2163
#define ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY  0x2164
#define ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS  0x2165
#define ERROR_DS_CANT_ADD_TO_GC  0x2166
#define ERROR_DS_NO_CHECKPOINT_WITH_PDC  0x2167
#define ERROR_DS_SOURCE_AUDITING_NOT_ENABLED  0x2168
#define ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC  0x2169
#define ERROR_DS_INVALID_NAME_FOR_SPN  0x216a
#define ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS  0x216b
#define ERROR_DS_UNICODEPWD_NOT_IN_QUOTES  0x216c
#define ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED  0x216d
#define ERROR_DS_MUST_BE_RUN_ON_DST_DC  0x216e
#define ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER  0x216f
#define ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ  0x2170
#define ERROR_DS_INIT_FAILURE_CONSOLE  0x2171
#define ERROR_DS_SAM_INIT_FAILURE_CONSOLE  0x2172
#define ERROR_DS_FOREST_VERSION_TOO_HIGH  0x2173
#define ERROR_DS_DOMAIN_VERSION_TOO_HIGH  0x2174
#define ERROR_DS_FOREST_VERSION_TOO_LOW  0x2175
#define ERROR_DS_DOMAIN_VERSION_TOO_LOW  0x2176
#define ERROR_DS_INCOMPATIBLE_VERSION  0x2177
#define ERROR_DS_LOW_DSA_VERSION  0x2178
#define ERROR_DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN  0x2179
#define ERROR_DS_NOT_SUPPORTED_SORT_ORDER  0x217a
#define ERROR_DS_NAME_NOT_UNIQUE  0x217b
#define ERROR_DS_MACHINE_ACCOUNT_CREATED_PRENT4  0x217c
#define ERROR_DS_OUT_OF_VERSION_STORE  0x217d
#define ERROR_DS_INCOMPATIBLE_CONTROLS_USED  0x217e
#define ERROR_DS_NO_REF_DOMAIN  0x217f
#define ERROR_DS_RESERVED_LINK_ID  0x2180
#define ERROR_DS_LINK_ID_NOT_AVAILABLE  0x2181
#define ERROR_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER  0x2182
#define ERROR_DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE  0x2183
#define ERROR_DS_NO_OBJECT_MOVE_IN_SCHEMA_NC  0x2184
#define ERROR_DS_MODIFYDN_DISALLOWED_BY_FLAG  0x2185
#define ERROR_DS_MODIFYDN_WRONG_GRANDPARENT  0x2186
#define ERROR_DS_NAME_ERROR_TRUST_REFERRAL  0x2187
#define ERROR_NOT_SUPPORTED_ON_STANDARD_SERVER  0x2188
#define ERROR_DS_CANT_ACCESS_REMOTE_PART_OF_AD  0x2189
#define ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE_V2  0x218a
#define ERROR_DS_THREAD_LIMIT_EXCEEDED  0x218b
#define ERROR_DS_NOT_CLOSEST  0x218c
#define ERROR_DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF  0x218d
#define ERROR_DS_SINGLE_USER_MODE_FAILED  0x218e
#define ERROR_DS_NTDSCRIPT_SYNTAX_ERROR  0x218f
#define ERROR_DS_NTDSCRIPT_PROCESS_ERROR  0x2190
#define ERROR_DS_DIFFERENT_REPL_EPOCHS  0x2191
#define ERROR_DS_DRS_EXTENSIONS_CHANGED  0x2192
#define ERROR_DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR  0x2193
#define ERROR_DS_NO_MSDS_INTID  0x2194
#define ERROR_DS_DUP_MSDS_INTID  0x2195
#define ERROR_DS_EXISTS_IN_RDNATTID  0x2196
#define ERROR_DS_AUTHORIZATION_FAILED  0x2197
#define ERROR_DS_INVALID_SCRIPT  0x2198
#define ERROR_DS_REMOTE_CROSSREF_OP_FAILED  0x2199
#define ERROR_DS_CROSS_REF_BUSY  0x219a
#define ERROR_DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN  0x219b
#define ERROR_DS_CANT_DEMOTE_WITH_WRITEABLE_NC  0x219c
#define ERROR_DS_DUPLICATE_ID_FOUND  0x219d
#define ERROR_DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT  0x219e
#define ERROR_DS_GROUP_CONVERSION_ERROR  0x219f
#define ERROR_DS_CANT_MOVE_APP_BASIC_GROUP  0x21a0
#define ERROR_DS_CANT_MOVE_APP_QUERY_GROUP  0x21a1
#define ERROR_DS_ROLE_NOT_VERIFIED  0x21a2
#define ERROR_DS_WKO_CONTAINER_CANNOT_BE_SPECIAL  0x21a3
#define ERROR_DS_DOMAIN_RENAME_IN_PROGRESS  0x21a4
#define ERROR_DS_EXISTING_AD_CHILD_NC  0x21a5
#define ERROR_DS_REPL_LIFETIME_EXCEEDED  0x21a6
#define ERROR_DS_DISALLOWED_IN_SYSTEM_CONTAINER  0x21a7
#define ERROR_DS_LDAP_SEND_QUEUE_FULL  0x21a8
#define ERROR_DS_DRA_OUT_SCHEDULE_WINDOW  0x21a9
#define ERROR_DS_POLICY_NOT_KNOWN  0x21aa
#define ERROR_NO_SITE_SETTINGS_OBJECT  0x21ab
#define ERROR_NO_SECRETS  0x21ac
#define ERROR_NO_WRITABLE_DC_FOUND  0x21ad
#define ERROR_DS_NO_SERVER_OBJECT  0x21ae
#define ERROR_DS_NO_NTDSA_OBJECT  0x21af
#define ERROR_DS_NON_ASQ_SEARCH  0x21b0
#define ERROR_DS_AUDIT_FAILURE  0x21b1
#define ERROR_DS_INVALID_SEARCH_FLAG_SUBTREE  0x21b2
#define ERROR_DS_INVALID_SEARCH_FLAG_TUPLE  0x21b3
#define ERROR_DS_HIERARCHY_TABLE_TOO_DEEP  0x21b4
#define ERROR_DS_DRA_CORRUPT_UTD_VECTOR  0x21b5
#define ERROR_DS_DRA_SECRETS_DENIED  0x21b6
#define ERROR_DS_RESERVED_MAPI_ID  0x21b7
#define ERROR_DS_MAPI_ID_NOT_AVAILABLE  0x21b8
#define ERROR_DS_DRA_MISSING_KRBTGT_SECRET  0x21b9
#define ERROR_DS_DOMAIN_NAME_EXISTS_IN_FOREST  0x21ba
#define ERROR_DS_FLAT_NAME_EXISTS_IN_FOREST  0x21bb
#define ERROR_INVALID_USER_PRINCIPAL_NAME  0x21bc
#define ERROR_DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS  0x21bd
#define ERROR_DS_OID_NOT_FOUND  0x21be
#define ERROR_DS_DRA_RECYCLED_TARGET  0x21bf
#define ERROR_DS_DISALLOWED_NC_REDIRECT  0x21c0
#define ERROR_DS_HIGH_ADLDS_FFL  0x21c1
#define ERROR_DS_HIGH_DSA_VERSION  0x21c2
#define ERROR_DS_LOW_ADLDS_FFL  0x21c3
#define ERROR_DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION  0x21c4
#define ERROR_DS_UNDELETE_SAM_VALIDATION_FAILED  0x21c5
#define ERROR_INCORRECT_ACCOUNT_TYPE  0x21c6
#define ERROR_DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST  0x21c7
#define ERROR_DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST  0x21c8
#define ERROR_DS_MISSING_FOREST_TRUST  0x21c9
#define ERROR_DS_VALUE_KEY_NOT_UNIQUE  0x21ca
#define ERROR_WEAK_WHFBKEY_BLOCKED  0x21cb
#define ERROR_DS_PER_ATTRIBUTE_AUTHZ_FAILED_DURING_ADD  0x21cc
#define ERROR_LOCAL_POLICY_MODIFICATION_NOT_SUPPORTED  0x21cd
#define ERROR_POLICY_CONTROLLED_ACCOUNT  0x21ce
#define ERROR_LAPS_LEGACY_SCHEMA_MISSING  0x21cf
#define ERROR_LAPS_SCHEMA_MISSING  0x21d0
#define ERROR_LAPS_ENCRYPTION_REQUIRES_2016_DFL  0x21d1
#define DNS_ERROR_RESPONSE_CODES_BASE  0x2328
#define DNS_ERROR_RCODE_NO_ERROR  0x0
#define DNS_ERROR_MASK  0x2328
#define DNS_ERROR_RCODE_FORMAT_ERROR  0x2329
#define DNS_ERROR_RCODE_SERVER_FAILURE  0x232a
#define DNS_ERROR_RCODE_NAME_ERROR  0x232b
#define DNS_ERROR_RCODE_NOT_IMPLEMENTED  0x232c
#define DNS_ERROR_RCODE_REFUSED  0x232d
#define DNS_ERROR_RCODE_YXDOMAIN  0x232e
#define DNS_ERROR_RCODE_YXRRSET  0x232f
#define DNS_ERROR_RCODE_NXRRSET  0x2330
#define DNS_ERROR_RCODE_NOTAUTH  0x2331
#define DNS_ERROR_RCODE_NOTZONE  0x2332
#define DNS_ERROR_RCODE_BADSIG  0x2338
#define DNS_ERROR_RCODE_BADKEY  0x2339
#define DNS_ERROR_RCODE_BADTIME  0x233a
#define DNS_ERROR_RCODE_LAST  0x233a
#define DNS_ERROR_DNSSEC_BASE  0x238c
#define DNS_ERROR_KEYMASTER_REQUIRED  0x238d
#define DNS_ERROR_NOT_ALLOWED_ON_SIGNED_ZONE  0x238e
#define DNS_ERROR_NSEC3_INCOMPATIBLE_WITH_RSA_SHA1  0x238f
#define DNS_ERROR_NOT_ENOUGH_SIGNING_KEY_DESCRIPTORS  0x2390
#define DNS_ERROR_UNSUPPORTED_ALGORITHM  0x2391
#define DNS_ERROR_INVALID_KEY_SIZE  0x2392
#define DNS_ERROR_SIGNING_KEY_NOT_ACCESSIBLE  0x2393
#define DNS_ERROR_KSP_DOES_NOT_SUPPORT_PROTECTION  0x2394
#define DNS_ERROR_UNEXPECTED_DATA_PROTECTION_ERROR  0x2395
#define DNS_ERROR_UNEXPECTED_CNG_ERROR  0x2396
#define DNS_ERROR_UNKNOWN_SIGNING_PARAMETER_VERSION  0x2397
#define DNS_ERROR_KSP_NOT_ACCESSIBLE  0x2398
#define DNS_ERROR_TOO_MANY_SKDS  0x2399
#define DNS_ERROR_INVALID_ROLLOVER_PERIOD  0x239a
#define DNS_ERROR_INVALID_INITIAL_ROLLOVER_OFFSET  0x239b
#define DNS_ERROR_ROLLOVER_IN_PROGRESS  0x239c
#define DNS_ERROR_STANDBY_KEY_NOT_PRESENT  0x239d
#define DNS_ERROR_NOT_ALLOWED_ON_ZSK  0x239e
#define DNS_ERROR_NOT_ALLOWED_ON_ACTIVE_SKD  0x239f
#define DNS_ERROR_ROLLOVER_ALREADY_QUEUED  0x23a0
#define DNS_ERROR_NOT_ALLOWED_ON_UNSIGNED_ZONE  0x23a1
#define DNS_ERROR_BAD_KEYMASTER  0x23a2
#define DNS_ERROR_INVALID_SIGNATURE_VALIDITY_PERIOD  0x23a3
#define DNS_ERROR_INVALID_NSEC3_ITERATION_COUNT  0x23a4
#define DNS_ERROR_DNSSEC_IS_DISABLED  0x23a5
#define DNS_ERROR_INVALID_XML  0x23a6
#define DNS_ERROR_NO_VALID_TRUST_ANCHORS  0x23a7
#define DNS_ERROR_ROLLOVER_NOT_POKEABLE  0x23a8
#define DNS_ERROR_NSEC3_NAME_COLLISION  0x23a9
#define DNS_ERROR_NSEC_INCOMPATIBLE_WITH_NSEC3_RSA_SHA1  0x23aa
#define DNS_ERROR_PACKET_FMT_BASE  0x251c
#define DNS_ERROR_BAD_PACKET  0x251e
#define DNS_ERROR_NO_PACKET  0x251f
#define DNS_ERROR_RCODE  0x2520
#define DNS_ERROR_UNSECURE_PACKET  0x2521
#define DNS_ERROR_NO_MEMORY  0xe
#define DNS_ERROR_INVALID_NAME  0x7b
#define DNS_ERROR_INVALID_DATA  0xd
#define DNS_ERROR_GENERAL_API_BASE  0x254e
#define DNS_ERROR_INVALID_TYPE  0x254f
#define DNS_ERROR_INVALID_IP_ADDRESS  0x2550
#define DNS_ERROR_INVALID_PROPERTY  0x2551
#define DNS_ERROR_TRY_AGAIN_LATER  0x2552
#define DNS_ERROR_NOT_UNIQUE  0x2553
#define DNS_ERROR_NON_RFC_NAME  0x2554
#define DNS_ERROR_INVALID_NAME_CHAR  0x2558
#define DNS_ERROR_NUMERIC_NAME  0x2559
#define DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER  0x255a
#define DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION  0x255b
#define DNS_ERROR_CANNOT_FIND_ROOT_HINTS  0x255c
#define DNS_ERROR_INCONSISTENT_ROOT_HINTS  0x255d
#define DNS_ERROR_DWORD_VALUE_TOO_SMALL  0x255e
#define DNS_ERROR_DWORD_VALUE_TOO_LARGE  0x255f
#define DNS_ERROR_BACKGROUND_LOADING  0x2560
#define DNS_ERROR_NOT_ALLOWED_ON_RODC  0x2561
#define DNS_ERROR_NOT_ALLOWED_UNDER_DNAME  0x2562
#define DNS_ERROR_DELEGATION_REQUIRED  0x2563
#define DNS_ERROR_INVALID_POLICY_TABLE  0x2564
#define DNS_ERROR_ADDRESS_REQUIRED  0x2565
#define DNS_ERROR_ZONE_BASE  0x2580
#define DNS_ERROR_ZONE_DOES_NOT_EXIST  0x2581
#define DNS_ERROR_NO_ZONE_INFO  0x2582
#define DNS_ERROR_INVALID_ZONE_OPERATION  0x2583
#define DNS_ERROR_ZONE_CONFIGURATION_ERROR  0x2584
#define DNS_ERROR_ZONE_HAS_NO_SOA_RECORD  0x2585
#define DNS_ERROR_ZONE_HAS_NO_NS_RECORDS  0x2586
#define DNS_ERROR_ZONE_LOCKED  0x2587
#define DNS_ERROR_ZONE_CREATION_FAILED  0x2588
#define DNS_ERROR_ZONE_ALREADY_EXISTS  0x2589
#define DNS_ERROR_AUTOZONE_ALREADY_EXISTS  0x258a
#define DNS_ERROR_INVALID_ZONE_TYPE  0x258b
#define DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP  0x258c
#define DNS_ERROR_ZONE_NOT_SECONDARY  0x258d
#define DNS_ERROR_NEED_SECONDARY_ADDRESSES  0x258e
#define DNS_ERROR_WINS_INIT_FAILED  0x258f
#define DNS_ERROR_NEED_WINS_SERVERS  0x2590
#define DNS_ERROR_NBSTAT_INIT_FAILED  0x2591
#define DNS_ERROR_SOA_DELETE_INVALID  0x2592
#define DNS_ERROR_FORWARDER_ALREADY_EXISTS  0x2593
#define DNS_ERROR_ZONE_REQUIRES_MASTER_IP  0x2594
#define DNS_ERROR_ZONE_IS_SHUTDOWN  0x2595
#define DNS_ERROR_ZONE_LOCKED_FOR_SIGNING  0x2596
#define DNS_ERROR_DATAFILE_BASE  0x25b2
#define DNS_ERROR_PRIMARY_REQUIRES_DATAFILE  0x25b3
#define DNS_ERROR_INVALID_DATAFILE_NAME  0x25b4
#define DNS_ERROR_DATAFILE_OPEN_FAILURE  0x25b5
#define DNS_ERROR_FILE_WRITEBACK_FAILED  0x25b6
#define DNS_ERROR_DATAFILE_PARSING  0x25b7
#define DNS_ERROR_DATABASE_BASE  0x25e4
#define DNS_ERROR_RECORD_DOES_NOT_EXIST  0x25e5
#define DNS_ERROR_RECORD_FORMAT  0x25e6
#define DNS_ERROR_NODE_CREATION_FAILED  0x25e7
#define DNS_ERROR_UNKNOWN_RECORD_TYPE  0x25e8
#define DNS_ERROR_RECORD_TIMED_OUT  0x25e9
#define DNS_ERROR_NAME_NOT_IN_ZONE  0x25ea
#define DNS_ERROR_CNAME_LOOP  0x25eb
#define DNS_ERROR_NODE_IS_CNAME  0x25ec
#define DNS_ERROR_CNAME_COLLISION  0x25ed
#define DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT  0x25ee
#define DNS_ERROR_RECORD_ALREADY_EXISTS  0x25ef
#define DNS_ERROR_SECONDARY_DATA  0x25f0
#define DNS_ERROR_NO_CREATE_CACHE_DATA  0x25f1
#define DNS_ERROR_NAME_DOES_NOT_EXIST  0x25f2
#define DNS_ERROR_DS_UNAVAILABLE  0x25f5
#define DNS_ERROR_DS_ZONE_ALREADY_EXISTS  0x25f6
#define DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE  0x25f7
#define DNS_ERROR_NODE_IS_DNAME  0x25f8
#define DNS_ERROR_DNAME_COLLISION  0x25f9
#define DNS_ERROR_ALIAS_LOOP  0x25fa
#define DNS_ERROR_OPERATION_BASE  0x2616
#define DNS_ERROR_AXFR  0x2618
#define DNS_ERROR_SECURE_BASE  0x2648
#define DNS_ERROR_SETUP_BASE  0x267a
#define DNS_ERROR_NO_TCPIP  0x267b
#define DNS_ERROR_NO_DNS_SERVERS  0x267c
#define DNS_ERROR_DP_BASE  0x26ac
#define DNS_ERROR_DP_DOES_NOT_EXIST  0x26ad
#define DNS_ERROR_DP_ALREADY_EXISTS  0x26ae
#define DNS_ERROR_DP_NOT_ENLISTED  0x26af
#define DNS_ERROR_DP_ALREADY_ENLISTED  0x26b0
#define DNS_ERROR_DP_NOT_AVAILABLE  0x26b1
#define DNS_ERROR_DP_FSMO_ERROR  0x26b2
#define DNS_ERROR_RRL_NOT_ENABLED  0x26b7
#define DNS_ERROR_RRL_INVALID_WINDOW_SIZE  0x26b8
#define DNS_ERROR_RRL_INVALID_IPV4_PREFIX  0x26b9
#define DNS_ERROR_RRL_INVALID_IPV6_PREFIX  0x26ba
#define DNS_ERROR_RRL_INVALID_TC_RATE  0x26bb
#define DNS_ERROR_RRL_INVALID_LEAK_RATE  0x26bc
#define DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE  0x26bd
#define DNS_ERROR_VIRTUALIZATION_INSTANCE_ALREADY_EXISTS  0x26c1
#define DNS_ERROR_VIRTUALIZATION_INSTANCE_DOES_NOT_EXIST  0x26c2
#define DNS_ERROR_VIRTUALIZATION_TREE_LOCKED  0x26c3
#define DNS_ERROR_INVAILD_VIRTUALIZATION_INSTANCE_NAME  0x26c4
#define DNS_ERROR_DEFAULT_VIRTUALIZATION_INSTANCE  0x26c5
#define DNS_ERROR_ZONESCOPE_ALREADY_EXISTS  0x26df
#define DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST  0x26e0
#define DNS_ERROR_DEFAULT_ZONESCOPE  0x26e1
#define DNS_ERROR_INVALID_ZONESCOPE_NAME  0x26e2
#define DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES  0x26e3
#define DNS_ERROR_LOAD_ZONESCOPE_FAILED  0x26e4
#define DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED  0x26e5
#define DNS_ERROR_INVALID_SCOPE_NAME  0x26e6
#define DNS_ERROR_SCOPE_DOES_NOT_EXIST  0x26e7
#define DNS_ERROR_DEFAULT_SCOPE  0x26e8
#define DNS_ERROR_INVALID_SCOPE_OPERATION  0x26e9
#define DNS_ERROR_SCOPE_LOCKED  0x26ea
#define DNS_ERROR_SCOPE_ALREADY_EXISTS  0x26eb
#define DNS_ERROR_POLICY_ALREADY_EXISTS  0x26f3
#define DNS_ERROR_POLICY_DOES_NOT_EXIST  0x26f4
#define DNS_ERROR_POLICY_INVALID_CRITERIA  0x26f5
#define DNS_ERROR_POLICY_INVALID_SETTINGS  0x26f6
#define DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED  0x26f7
#define DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST  0x26f8
#define DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS  0x26f9
#define DNS_ERROR_SUBNET_DOES_NOT_EXIST  0x26fa
#define DNS_ERROR_SUBNET_ALREADY_EXISTS  0x26fb
#define DNS_ERROR_POLICY_LOCKED  0x26fc
#define DNS_ERROR_POLICY_INVALID_WEIGHT  0x26fd
#define DNS_ERROR_POLICY_INVALID_NAME  0x26fe
#define DNS_ERROR_POLICY_MISSING_CRITERIA  0x26ff
#define DNS_ERROR_INVALID_CLIENT_SUBNET_NAME  0x2700
#define DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID  0x2701
#define DNS_ERROR_POLICY_SCOPE_MISSING  0x2702
#define DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED  0x2703
#define DNS_ERROR_SERVERSCOPE_IS_REFERENCED  0x2704
#define DNS_ERROR_ZONESCOPE_IS_REFERENCED  0x2705
#define DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET  0x2706
#define DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL  0x2707
#define DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL  0x2708
#define DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE  0x2709
#define DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN  0x270a
#define DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE  0x270b
#define DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY  0x270c
#define ERROR_IPSEC_QM_POLICY_EXISTS  0x32c8
#define ERROR_IPSEC_QM_POLICY_NOT_FOUND  0x32c9
#define ERROR_IPSEC_QM_POLICY_IN_USE  0x32ca
#define ERROR_IPSEC_MM_POLICY_EXISTS  0x32cb
#define ERROR_IPSEC_MM_POLICY_NOT_FOUND  0x32cc
#define ERROR_IPSEC_MM_POLICY_IN_USE  0x32cd
#define ERROR_IPSEC_MM_FILTER_EXISTS  0x32ce
#define ERROR_IPSEC_MM_FILTER_NOT_FOUND  0x32cf
#define ERROR_IPSEC_TRANSPORT_FILTER_EXISTS  0x32d0
#define ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND  0x32d1
#define ERROR_IPSEC_MM_AUTH_EXISTS  0x32d2
#define ERROR_IPSEC_MM_AUTH_NOT_FOUND  0x32d3
#define ERROR_IPSEC_MM_AUTH_IN_USE  0x32d4
#define ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND  0x32d5
#define ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND  0x32d6
#define ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND  0x32d7
#define ERROR_IPSEC_TUNNEL_FILTER_EXISTS  0x32d8
#define ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND  0x32d9
#define ERROR_IPSEC_MM_FILTER_PENDING_DELETION  0x32da
#define ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION  0x32db
#define ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION  0x32dc
#define ERROR_IPSEC_MM_POLICY_PENDING_DELETION  0x32dd
#define ERROR_IPSEC_MM_AUTH_PENDING_DELETION  0x32de
#define ERROR_IPSEC_QM_POLICY_PENDING_DELETION  0x32df
#define ERROR_IPSEC_IKE_NEG_STATUS_BEGIN  0x35e8
#define ERROR_IPSEC_IKE_AUTH_FAIL  0x35e9
#define ERROR_IPSEC_IKE_ATTRIB_FAIL  0x35ea
#define ERROR_IPSEC_IKE_NEGOTIATION_PENDING  0x35eb
#define ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR  0x35ec
#define ERROR_IPSEC_IKE_TIMED_OUT  0x35ed
#define ERROR_IPSEC_IKE_NO_CERT  0x35ee
#define ERROR_IPSEC_IKE_SA_DELETED  0x35ef
#define ERROR_IPSEC_IKE_SA_REAPED  0x35f0
#define ERROR_IPSEC_IKE_MM_ACQUIRE_DROP  0x35f1
#define ERROR_IPSEC_IKE_QM_ACQUIRE_DROP  0x35f2
#define ERROR_IPSEC_IKE_QUEUE_DROP_MM  0x35f3
#define ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM  0x35f4
#define ERROR_IPSEC_IKE_DROP_NO_RESPONSE  0x35f5
#define ERROR_IPSEC_IKE_MM_DELAY_DROP  0x35f6
#define ERROR_IPSEC_IKE_QM_DELAY_DROP  0x35f7
#define ERROR_IPSEC_IKE_ERROR  0x35f8
#define ERROR_IPSEC_IKE_CRL_FAILED  0x35f9
#define ERROR_IPSEC_IKE_INVALID_KEY_USAGE  0x35fa
#define ERROR_IPSEC_IKE_INVALID_CERT_TYPE  0x35fb
#define ERROR_IPSEC_IKE_NO_PRIVATE_KEY  0x35fc
#define ERROR_IPSEC_IKE_SIMULTANEOUS_REKEY  0x35fd
#define ERROR_IPSEC_IKE_DH_FAIL  0x35fe
#define ERROR_IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED  0x35ff
#define ERROR_IPSEC_IKE_INVALID_HEADER  0x3600
#define ERROR_IPSEC_IKE_NO_POLICY  0x3601
#define ERROR_IPSEC_IKE_INVALID_SIGNATURE  0x3602
#define ERROR_IPSEC_IKE_KERBEROS_ERROR  0x3603
#define ERROR_IPSEC_IKE_NO_PUBLIC_KEY  0x3604
#define ERROR_IPSEC_IKE_PROCESS_ERR  0x3605
#define ERROR_IPSEC_IKE_PROCESS_ERR_SA  0x3606
#define ERROR_IPSEC_IKE_PROCESS_ERR_PROP  0x3607
#define ERROR_IPSEC_IKE_PROCESS_ERR_TRANS  0x3608
#define ERROR_IPSEC_IKE_PROCESS_ERR_KE  0x3609
#define ERROR_IPSEC_IKE_PROCESS_ERR_ID  0x360a
#define ERROR_IPSEC_IKE_PROCESS_ERR_CERT  0x360b
#define ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ  0x360c
#define ERROR_IPSEC_IKE_PROCESS_ERR_HASH  0x360d
#define ERROR_IPSEC_IKE_PROCESS_ERR_SIG  0x360e
#define ERROR_IPSEC_IKE_PROCESS_ERR_NONCE  0x360f
#define ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY  0x3610
#define ERROR_IPSEC_IKE_PROCESS_ERR_DELETE  0x3611
#define ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR  0x3612
#define ERROR_IPSEC_IKE_INVALID_PAYLOAD  0x3613
#define ERROR_IPSEC_IKE_LOAD_SOFT_SA  0x3614
#define ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN  0x3615
#define ERROR_IPSEC_IKE_INVALID_COOKIE  0x3616
#define ERROR_IPSEC_IKE_NO_PEER_CERT  0x3617
#define ERROR_IPSEC_IKE_PEER_CRL_FAILED  0x3618
#define ERROR_IPSEC_IKE_POLICY_CHANGE  0x3619
#define ERROR_IPSEC_IKE_NO_MM_POLICY  0x361a
#define ERROR_IPSEC_IKE_NOTCBPRIV  0x361b
#define ERROR_IPSEC_IKE_SECLOADFAIL  0x361c
#define ERROR_IPSEC_IKE_FAILSSPINIT  0x361d
#define ERROR_IPSEC_IKE_FAILQUERYSSP  0x361e
#define ERROR_IPSEC_IKE_SRVACQFAIL  0x361f
#define ERROR_IPSEC_IKE_SRVQUERYCRED  0x3620
#define ERROR_IPSEC_IKE_GETSPIFAIL  0x3621
#define ERROR_IPSEC_IKE_INVALID_FILTER  0x3622
#define ERROR_IPSEC_IKE_OUT_OF_MEMORY  0x3623
#define ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED  0x3624
#define ERROR_IPSEC_IKE_INVALID_POLICY  0x3625
#define ERROR_IPSEC_IKE_UNKNOWN_DOI  0x3626
#define ERROR_IPSEC_IKE_INVALID_SITUATION  0x3627
#define ERROR_IPSEC_IKE_DH_FAILURE  0x3628
#define ERROR_IPSEC_IKE_INVALID_GROUP  0x3629
#define ERROR_IPSEC_IKE_ENCRYPT  0x362a
#define ERROR_IPSEC_IKE_DECRYPT  0x362b
#define ERROR_IPSEC_IKE_POLICY_MATCH  0x362c
#define ERROR_IPSEC_IKE_UNSUPPORTED_ID  0x362d
#define ERROR_IPSEC_IKE_INVALID_HASH  0x362e
#define ERROR_IPSEC_IKE_INVALID_HASH_ALG  0x362f
#define ERROR_IPSEC_IKE_INVALID_HASH_SIZE  0x3630
#define ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG  0x3631
#define ERROR_IPSEC_IKE_INVALID_AUTH_ALG  0x3632
#define ERROR_IPSEC_IKE_INVALID_SIG  0x3633
#define ERROR_IPSEC_IKE_LOAD_FAILED  0x3634
#define ERROR_IPSEC_IKE_RPC_DELETE  0x3635
#define ERROR_IPSEC_IKE_BENIGN_REINIT  0x3636
#define ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY  0x3637
#define ERROR_IPSEC_IKE_INVALID_MAJOR_VERSION  0x3638
#define ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN  0x3639
#define ERROR_IPSEC_IKE_MM_LIMIT  0x363a
#define ERROR_IPSEC_IKE_NEGOTIATION_DISABLED  0x363b
#define ERROR_IPSEC_IKE_QM_LIMIT  0x363c
#define ERROR_IPSEC_IKE_MM_EXPIRED  0x363d
#define ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID  0x363e
#define ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH  0x363f
#define ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID  0x3640
#define ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD  0x3641
#define ERROR_IPSEC_IKE_DOS_COOKIE_SENT  0x3642
#define ERROR_IPSEC_IKE_SHUTTING_DOWN  0x3643
#define ERROR_IPSEC_IKE_CGA_AUTH_FAILED  0x3644
#define ERROR_IPSEC_IKE_PROCESS_ERR_NATOA  0x3645
#define ERROR_IPSEC_IKE_INVALID_MM_FOR_QM  0x3646
#define ERROR_IPSEC_IKE_QM_EXPIRED  0x3647
#define ERROR_IPSEC_IKE_TOO_MANY_FILTERS  0x3648
#define ERROR_IPSEC_IKE_NEG_STATUS_END  0x3649
#define ERROR_IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL  0x364a
#define ERROR_IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE  0x364b
#define ERROR_IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING  0x364c
#define ERROR_IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING  0x364d
#define ERROR_IPSEC_IKE_COEXISTENCE_SUPPRESS  0x364e
#define ERROR_IPSEC_IKE_RATELIMIT_DROP  0x364f
#define ERROR_IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE  0x3650
#define ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE  0x3651
#define ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE  0x3652
#define ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY  0x3653
#define ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE  0x3654
#define ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END  0x3655
#define ERROR_IPSEC_BAD_SPI  0x3656
#define ERROR_IPSEC_SA_LIFETIME_EXPIRED  0x3657
#define ERROR_IPSEC_WRONG_SA  0x3658
#define ERROR_IPSEC_REPLAY_CHECK_FAILED  0x3659
#define ERROR_IPSEC_INVALID_PACKET  0x365a
#define ERROR_IPSEC_INTEGRITY_CHECK_FAILED  0x365b
#define ERROR_IPSEC_CLEAR_TEXT_DROP  0x365c
#define ERROR_IPSEC_AUTH_FIREWALL_DROP  0x365d
#define ERROR_IPSEC_THROTTLE_DROP  0x365e
#define ERROR_IPSEC_DOSP_BLOCK  0x3665
#define ERROR_IPSEC_DOSP_RECEIVED_MULTICAST  0x3666
#define ERROR_IPSEC_DOSP_INVALID_PACKET  0x3667
#define ERROR_IPSEC_DOSP_STATE_LOOKUP_FAILED  0x3668
#define ERROR_IPSEC_DOSP_MAX_ENTRIES  0x3669
#define ERROR_IPSEC_DOSP_KEYMOD_NOT_ALLOWED  0x366a
#define ERROR_IPSEC_DOSP_NOT_INSTALLED  0x366b
#define ERROR_IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES  0x366c
#define ERROR_SXS_SECTION_NOT_FOUND  0x36b0
#define ERROR_SXS_CANT_GEN_ACTCTX  0x36b1
#define ERROR_SXS_INVALID_ACTCTXDATA_FORMAT  0x36b2
#define ERROR_SXS_ASSEMBLY_NOT_FOUND  0x36b3
#define ERROR_SXS_MANIFEST_FORMAT_ERROR  0x36b4
#define ERROR_SXS_MANIFEST_PARSE_ERROR  0x36b5
#define ERROR_SXS_ACTIVATION_CONTEXT_DISABLED  0x36b6
#define ERROR_SXS_KEY_NOT_FOUND  0x36b7
#define ERROR_SXS_VERSION_CONFLICT  0x36b8
#define ERROR_SXS_WRONG_SECTION_TYPE  0x36b9
#define ERROR_SXS_THREAD_QUERIES_DISABLED  0x36ba
#define ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET  0x36bb
#define ERROR_SXS_UNKNOWN_ENCODING_GROUP  0x36bc
#define ERROR_SXS_UNKNOWN_ENCODING  0x36bd
#define ERROR_SXS_INVALID_XML_NAMESPACE_URI  0x36be
#define ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED  0x36bf
#define ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED  0x36c0
#define ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE  0x36c1
#define ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE  0x36c2
#define ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE  0x36c3
#define ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT  0x36c4
#define ERROR_SXS_DUPLICATE_DLL_NAME  0x36c5
#define ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME  0x36c6
#define ERROR_SXS_DUPLICATE_CLSID  0x36c7
#define ERROR_SXS_DUPLICATE_IID  0x36c8
#define ERROR_SXS_DUPLICATE_TLBID  0x36c9
#define ERROR_SXS_DUPLICATE_PROGID  0x36ca
#define ERROR_SXS_DUPLICATE_ASSEMBLY_NAME  0x36cb
#define ERROR_SXS_FILE_HASH_MISMATCH  0x36cc
#define ERROR_SXS_POLICY_PARSE_ERROR  0x36cd
#define ERROR_SXS_XML_E_MISSINGQUOTE  0x36ce
#define ERROR_SXS_XML_E_COMMENTSYNTAX  0x36cf
#define ERROR_SXS_XML_E_BADSTARTNAMECHAR  0x36d0
#define ERROR_SXS_XML_E_BADNAMECHAR  0x36d1
#define ERROR_SXS_XML_E_BADCHARINSTRING  0x36d2
#define ERROR_SXS_XML_E_XMLDECLSYNTAX  0x36d3
#define ERROR_SXS_XML_E_BADCHARDATA  0x36d4
#define ERROR_SXS_XML_E_MISSINGWHITESPACE  0x36d5
#define ERROR_SXS_XML_E_EXPECTINGTAGEND  0x36d6
#define ERROR_SXS_XML_E_MISSINGSEMICOLON  0x36d7
#define ERROR_SXS_XML_E_UNBALANCEDPAREN  0x36d8
#define ERROR_SXS_XML_E_INTERNALERROR  0x36d9
#define ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE  0x36da
#define ERROR_SXS_XML_E_INCOMPLETE_ENCODING  0x36db
#define ERROR_SXS_XML_E_MISSING_PAREN  0x36dc
#define ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE  0x36dd
#define ERROR_SXS_XML_E_MULTIPLE_COLONS  0x36de
#define ERROR_SXS_XML_E_INVALID_DECIMAL  0x36df
#define ERROR_SXS_XML_E_INVALID_HEXIDECIMAL  0x36e0
#define ERROR_SXS_XML_E_INVALID_UNICODE  0x36e1
#define ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK  0x36e2
#define ERROR_SXS_XML_E_UNEXPECTEDENDTAG  0x36e3
#define ERROR_SXS_XML_E_UNCLOSEDTAG  0x36e4
#define ERROR_SXS_XML_E_DUPLICATEATTRIBUTE  0x36e5
#define ERROR_SXS_XML_E_MULTIPLEROOTS  0x36e6
#define ERROR_SXS_XML_E_INVALIDATROOTLEVEL  0x36e7
#define ERROR_SXS_XML_E_BADXMLDECL  0x36e8
#define ERROR_SXS_XML_E_MISSINGROOT  0x36e9
#define ERROR_SXS_XML_E_UNEXPECTEDEOF  0x36ea
#define ERROR_SXS_XML_E_BADPEREFINSUBSET  0x36eb
#define ERROR_SXS_XML_E_UNCLOSEDSTARTTAG  0x36ec
#define ERROR_SXS_XML_E_UNCLOSEDENDTAG  0x36ed
#define ERROR_SXS_XML_E_UNCLOSEDSTRING  0x36ee
#define ERROR_SXS_XML_E_UNCLOSEDCOMMENT  0x36ef
#define ERROR_SXS_XML_E_UNCLOSEDDECL  0x36f0
#define ERROR_SXS_XML_E_UNCLOSEDCDATA  0x36f1
#define ERROR_SXS_XML_E_RESERVEDNAMESPACE  0x36f2
#define ERROR_SXS_XML_E_INVALIDENCODING  0x36f3
#define ERROR_SXS_XML_E_INVALIDSWITCH  0x36f4
#define ERROR_SXS_XML_E_BADXMLCASE  0x36f5
#define ERROR_SXS_XML_E_INVALID_STANDALONE  0x36f6
#define ERROR_SXS_XML_E_UNEXPECTED_STANDALONE  0x36f7
#define ERROR_SXS_XML_E_INVALID_VERSION  0x36f8
#define ERROR_SXS_XML_E_MISSINGEQUALS  0x36f9
#define ERROR_SXS_PROTECTION_RECOVERY_FAILED  0x36fa
#define ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT  0x36fb
#define ERROR_SXS_PROTECTION_CATALOG_NOT_VALID  0x36fc
#define ERROR_SXS_UNTRANSLATABLE_HRESULT  0x36fd
#define ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING  0x36fe
#define ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE  0x36ff
#define ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME  0x3700
#define ERROR_SXS_ASSEMBLY_MISSING  0x3701
#define ERROR_SXS_CORRUPT_ACTIVATION_STACK  0x3702
#define ERROR_SXS_CORRUPTION  0x3703
#define ERROR_SXS_EARLY_DEACTIVATION  0x3704
#define ERROR_SXS_INVALID_DEACTIVATION  0x3705
#define ERROR_SXS_MULTIPLE_DEACTIVATION  0x3706
#define ERROR_SXS_PROCESS_TERMINATION_REQUESTED  0x3707
#define ERROR_SXS_RELEASE_ACTIVATION_CONTEXT  0x3708
#define ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY  0x3709
#define ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE  0x370a
#define ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME  0x370b
#define ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE  0x370c
#define ERROR_SXS_IDENTITY_PARSE_ERROR  0x370d
#define ERROR_MALFORMED_SUBSTITUTION_STRING  0x370e
#define ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN  0x370f
#define ERROR_UNMAPPED_SUBSTITUTION_STRING  0x3710
#define ERROR_SXS_ASSEMBLY_NOT_LOCKED  0x3711
#define ERROR_SXS_COMPONENT_STORE_CORRUPT  0x3712
#define ERROR_ADVANCED_INSTALLER_FAILED  0x3713
#define ERROR_XML_ENCODING_MISMATCH  0x3714
#define ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT  0x3715
#define ERROR_SXS_IDENTITIES_DIFFERENT  0x3716
#define ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT  0x3717
#define ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY  0x3718
#define ERROR_SXS_MANIFEST_TOO_BIG  0x3719
#define ERROR_SXS_SETTING_NOT_REGISTERED  0x371a
#define ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE  0x371b
#define ERROR_SMI_PRIMITIVE_INSTALLER_FAILED  0x371c
#define ERROR_GENERIC_COMMAND_FAILED  0x371d
#define ERROR_SXS_FILE_HASH_MISSING  0x371e
#define ERROR_SXS_DUPLICATE_ACTIVATABLE_CLASS  0x371f
#define ERROR_EVT_INVALID_CHANNEL_PATH  0x3a98
#define ERROR_EVT_INVALID_QUERY  0x3a99
#define ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND  0x3a9a
#define ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND  0x3a9b
#define ERROR_EVT_INVALID_PUBLISHER_NAME  0x3a9c
#define ERROR_EVT_INVALID_EVENT_DATA  0x3a9d
#define ERROR_EVT_CHANNEL_NOT_FOUND  0x3a9f
#define ERROR_EVT_MALFORMED_XML_TEXT  0x3aa0
#define ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL  0x3aa1
#define ERROR_EVT_CONFIGURATION_ERROR  0x3aa2
#define ERROR_EVT_QUERY_RESULT_STALE  0x3aa3
#define ERROR_EVT_QUERY_RESULT_INVALID_POSITION  0x3aa4
#define ERROR_EVT_NON_VALIDATING_MSXML  0x3aa5
#define ERROR_EVT_FILTER_ALREADYSCOPED  0x3aa6
#define ERROR_EVT_FILTER_NOTELTSET  0x3aa7
#define ERROR_EVT_FILTER_INVARG  0x3aa8
#define ERROR_EVT_FILTER_INVTEST  0x3aa9
#define ERROR_EVT_FILTER_INVTYPE  0x3aaa
#define ERROR_EVT_FILTER_PARSEERR  0x3aab
#define ERROR_EVT_FILTER_UNSUPPORTEDOP  0x3aac
#define ERROR_EVT_FILTER_UNEXPECTEDTOKEN  0x3aad
#define ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL  0x3aae
#define ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE  0x3aaf
#define ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE  0x3ab0
#define ERROR_EVT_CHANNEL_CANNOT_ACTIVATE  0x3ab1
#define ERROR_EVT_FILTER_TOO_COMPLEX  0x3ab2
#define ERROR_EVT_MESSAGE_NOT_FOUND  0x3ab3
#define ERROR_EVT_MESSAGE_ID_NOT_FOUND  0x3ab4
#define ERROR_EVT_UNRESOLVED_VALUE_INSERT  0x3ab5
#define ERROR_EVT_UNRESOLVED_PARAMETER_INSERT  0x3ab6
#define ERROR_EVT_MAX_INSERTS_REACHED  0x3ab7
#define ERROR_EVT_EVENT_DEFINITION_NOT_FOUND  0x3ab8
#define ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND  0x3ab9
#define ERROR_EVT_VERSION_TOO_OLD  0x3aba
#define ERROR_EVT_VERSION_TOO_NEW  0x3abb
#define ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY  0x3abc
#define ERROR_EVT_PUBLISHER_DISABLED  0x3abd
#define ERROR_EVT_FILTER_OUT_OF_RANGE  0x3abe
#define ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE  0x3ae8
#define ERROR_EC_LOG_DISABLED  0x3ae9
#define ERROR_EC_CIRCULAR_FORWARDING  0x3aea
#define ERROR_EC_CREDSTORE_FULL  0x3aeb
#define ERROR_EC_CRED_NOT_FOUND  0x3aec
#define ERROR_EC_NO_ACTIVE_CHANNEL  0x3aed
#define ERROR_MUI_FILE_NOT_FOUND  0x3afc
#define ERROR_MUI_INVALID_FILE  0x3afd
#define ERROR_MUI_INVALID_RC_CONFIG  0x3afe
#define ERROR_MUI_INVALID_LOCALE_NAME  0x3aff
#define ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME  0x3b00
#define ERROR_MUI_FILE_NOT_LOADED  0x3b01
#define ERROR_RESOURCE_ENUM_USER_STOP  0x3b02
#define ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED  0x3b03
#define ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME  0x3b04
#define ERROR_MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE  0x3b06
#define ERROR_MRM_INVALID_PRICONFIG  0x3b07
#define ERROR_MRM_INVALID_FILE_TYPE  0x3b08
#define ERROR_MRM_UNKNOWN_QUALIFIER  0x3b09
#define ERROR_MRM_INVALID_QUALIFIER_VALUE  0x3b0a
#define ERROR_MRM_NO_CANDIDATE  0x3b0b
#define ERROR_MRM_NO_MATCH_OR_DEFAULT_CANDIDATE  0x3b0c
#define ERROR_MRM_RESOURCE_TYPE_MISMATCH  0x3b0d
#define ERROR_MRM_DUPLICATE_MAP_NAME  0x3b0e
#define ERROR_MRM_DUPLICATE_ENTRY  0x3b0f
#define ERROR_MRM_INVALID_RESOURCE_IDENTIFIER  0x3b10
#define ERROR_MRM_FILEPATH_TOO_LONG  0x3b11
#define ERROR_MRM_UNSUPPORTED_DIRECTORY_TYPE  0x3b12
#define ERROR_MRM_INVALID_PRI_FILE  0x3b16
#define ERROR_MRM_NAMED_RESOURCE_NOT_FOUND  0x3b17
#define ERROR_MRM_MAP_NOT_FOUND  0x3b1f
#define ERROR_MRM_UNSUPPORTED_PROFILE_TYPE  0x3b20
#define ERROR_MRM_INVALID_QUALIFIER_OPERATOR  0x3b21
#define ERROR_MRM_INDETERMINATE_QUALIFIER_VALUE  0x3b22
#define ERROR_MRM_AUTOMERGE_ENABLED  0x3b23
#define ERROR_MRM_TOO_MANY_RESOURCES  0x3b24
#define ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE  0x3b25
#define ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE  0x3b26
#define ERROR_MRM_NO_CURRENT_VIEW_ON_THREAD  0x3b27
#define ERROR_DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST  0x3b28
#define ERROR_OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT  0x3b29
#define ERROR_MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE  0x3b2a
#define ERROR_MRM_GENERATION_COUNT_MISMATCH  0x3b2b
#define ERROR_PRI_MERGE_VERSION_MISMATCH  0x3b2c
#define ERROR_PRI_MERGE_MISSING_SCHEMA  0x3b2d
#define ERROR_PRI_MERGE_LOAD_FILE_FAILED  0x3b2e
#define ERROR_PRI_MERGE_ADD_FILE_FAILED  0x3b2f
#define ERROR_PRI_MERGE_WRITE_FILE_FAILED  0x3b30
#define ERROR_PRI_MERGE_MULTIPLE_PACKAGE_FAMILIES_NOT_ALLOWED  0x3b31
#define ERROR_PRI_MERGE_MULTIPLE_MAIN_PACKAGES_NOT_ALLOWED  0x3b32
#define ERROR_PRI_MERGE_BUNDLE_PACKAGES_NOT_ALLOWED  0x3b33
#define ERROR_PRI_MERGE_MAIN_PACKAGE_REQUIRED  0x3b34
#define ERROR_PRI_MERGE_RESOURCE_PACKAGE_REQUIRED  0x3b35
#define ERROR_PRI_MERGE_INVALID_FILE_NAME  0x3b36
#define ERROR_MRM_PACKAGE_NOT_FOUND  0x3b37
#define ERROR_MRM_MISSING_DEFAULT_LANGUAGE  0x3b38
#define ERROR_MRM_SCOPE_ITEM_CONFLICT  0x3b39
#define ERROR_MCA_INVALID_CAPABILITIES_STRING  0x3b60
#define ERROR_MCA_INVALID_VCP_VERSION  0x3b61
#define ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION  0x3b62
#define ERROR_MCA_MCCS_VERSION_MISMATCH  0x3b63
#define ERROR_MCA_UNSUPPORTED_MCCS_VERSION  0x3b64
#define ERROR_MCA_INTERNAL_ERROR  0x3b65
#define ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED  0x3b66
#define ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE  0x3b67
#define ERROR_AMBIGUOUS_SYSTEM_DEVICE  0x3b92
#define ERROR_SYSTEM_DEVICE_NOT_FOUND  0x3bc3
#define ERROR_HASH_NOT_SUPPORTED  0x3bc4
#define ERROR_HASH_NOT_PRESENT  0x3bc5
#define ERROR_SECONDARY_IC_PROVIDER_NOT_REGISTERED  0x3bd9
#define ERROR_GPIO_CLIENT_INFORMATION_INVALID  0x3bda
#define ERROR_GPIO_VERSION_NOT_SUPPORTED  0x3bdb
#define ERROR_GPIO_INVALID_REGISTRATION_PACKET  0x3bdc
#define ERROR_GPIO_OPERATION_DENIED  0x3bdd
#define ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE  0x3bde
#define ERROR_GPIO_INTERRUPT_ALREADY_UNMASKED  0x3bdf
#define ERROR_CANNOT_SWITCH_RUNLEVEL  0x3c28
#define ERROR_INVALID_RUNLEVEL_SETTING  0x3c29
#define ERROR_RUNLEVEL_SWITCH_TIMEOUT  0x3c2a
#define ERROR_RUNLEVEL_SWITCH_AGENT_TIMEOUT  0x3c2b
#define ERROR_RUNLEVEL_SWITCH_IN_PROGRESS  0x3c2c
#define ERROR_SERVICES_FAILED_AUTOSTART  0x3c2d
#define ERROR_COM_TASK_STOP_PENDING  0x3c8d
#define ERROR_INSTALL_OPEN_PACKAGE_FAILED  0x3cf0
#define ERROR_INSTALL_PACKAGE_NOT_FOUND  0x3cf1
#define ERROR_INSTALL_INVALID_PACKAGE  0x3cf2
#define ERROR_INSTALL_RESOLVE_DEPENDENCY_FAILED  0x3cf3
#define ERROR_INSTALL_OUT_OF_DISK_SPACE  0x3cf4
#define ERROR_INSTALL_NETWORK_FAILURE  0x3cf5
#define ERROR_INSTALL_REGISTRATION_FAILURE  0x3cf6
#define ERROR_INSTALL_DEREGISTRATION_FAILURE  0x3cf7
#define ERROR_INSTALL_CANCEL  0x3cf8
#define ERROR_INSTALL_FAILED  0x3cf9
#define ERROR_REMOVE_FAILED  0x3cfa
#define ERROR_PACKAGE_ALREADY_EXISTS  0x3cfb
#define ERROR_NEEDS_REMEDIATION  0x3cfc
#define ERROR_INSTALL_PREREQUISITE_FAILED  0x3cfd
#define ERROR_PACKAGE_REPOSITORY_CORRUPTED  0x3cfe
#define ERROR_INSTALL_POLICY_FAILURE  0x3cff
#define ERROR_PACKAGE_UPDATING  0x3d00
#define ERROR_DEPLOYMENT_BLOCKED_BY_POLICY  0x3d01
#define ERROR_PACKAGES_IN_USE  0x3d02
#define ERROR_RECOVERY_FILE_CORRUPT  0x3d03
#define ERROR_INVALID_STAGED_SIGNATURE  0x3d04
#define ERROR_DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED  0x3d05
#define ERROR_INSTALL_PACKAGE_DOWNGRADE  0x3d06
#define ERROR_SYSTEM_NEEDS_REMEDIATION  0x3d07
#define ERROR_APPX_INTEGRITY_FAILURE_CLR_NGEN  0x3d08
#define ERROR_RESILIENCY_FILE_CORRUPT  0x3d09
#define ERROR_INSTALL_FIREWALL_SERVICE_NOT_RUNNING  0x3d0a
#define ERROR_PACKAGE_MOVE_FAILED  0x3d0b
#define ERROR_INSTALL_VOLUME_NOT_EMPTY  0x3d0c
#define ERROR_INSTALL_VOLUME_OFFLINE  0x3d0d
#define ERROR_INSTALL_VOLUME_CORRUPT  0x3d0e
#define ERROR_NEEDS_REGISTRATION  0x3d0f
#define ERROR_INSTALL_WRONG_PROCESSOR_ARCHITECTURE  0x3d10
#define ERROR_DEV_SIDELOAD_LIMIT_EXCEEDED  0x3d11
#define ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE  0x3d12
#define ERROR_PACKAGE_NOT_SUPPORTED_ON_FILESYSTEM  0x3d13
#define ERROR_PACKAGE_MOVE_BLOCKED_BY_STREAMING  0x3d14
#define ERROR_INSTALL_OPTIONAL_PACKAGE_APPLICATIONID_NOT_UNIQUE  0x3d15
#define ERROR_PACKAGE_STAGING_ONHOLD  0x3d16
#define ERROR_INSTALL_INVALID_RELATED_SET_UPDATE  0x3d17
#define ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY  0x3d18
#define ERROR_DEPLOYMENT_BLOCKED_BY_USER_LOG_OFF  0x3d19
#define ERROR_PROVISION_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_PROVISIONED  0x3d1a
#define ERROR_PACKAGES_REPUTATION_CHECK_FAILED  0x3d1b
#define ERROR_PACKAGES_REPUTATION_CHECK_TIMEDOUT  0x3d1c
#define ERROR_DEPLOYMENT_OPTION_NOT_SUPPORTED  0x3d1d
#define ERROR_APPINSTALLER_ACTIVATION_BLOCKED  0x3d1e
#define ERROR_REGISTRATION_FROM_REMOTE_DRIVE_NOT_SUPPORTED  0x3d1f
#define ERROR_APPX_RAW_DATA_WRITE_FAILED  0x3d20
#define ERROR_DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_PACKAGE  0x3d21
#define ERROR_DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_MACHINE  0x3d22
#define ERROR_DEPLOYMENT_BLOCKED_BY_PROFILE_POLICY  0x3d23
#define ERROR_DEPLOYMENT_FAILED_CONFLICTING_MUTABLE_PACKAGE_DIRECTORY  0x3d24
#define ERROR_SINGLETON_RESOURCE_INSTALLED_IN_ACTIVE_USER  0x3d25
#define ERROR_DIFFERENT_VERSION_OF_PACKAGED_SERVICE_INSTALLED  0x3d26
#define ERROR_SERVICE_EXISTS_AS_NON_PACKAGED_SERVICE  0x3d27
#define ERROR_PACKAGED_SERVICE_REQUIRES_ADMIN_PRIVILEGES  0x3d28
#define ERROR_REDIRECTION_TO_DEFAULT_ACCOUNT_NOT_ALLOWED  0x3d29
#define ERROR_PACKAGE_LACKS_CAPABILITY_TO_DEPLOY_ON_HOST  0x3d2a
#define ERROR_UNSIGNED_PACKAGE_INVALID_CONTENT  0x3d2b
#define ERROR_UNSIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE  0x3d2c
#define ERROR_SIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE  0x3d2d
#define ERROR_PACKAGE_EXTERNAL_LOCATION_NOT_ALLOWED  0x3d2e
#define ERROR_INSTALL_FULLTRUST_HOSTRUNTIME_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY  0x3d2f
#define ERROR_PACKAGE_LACKS_CAPABILITY_FOR_MANDATORY_STARTUPTASKS  0x3d30
#define ERROR_INSTALL_RESOLVE_HOSTRUNTIME_DEPENDENCY_FAILED  0x3d31
#define ERROR_MACHINE_SCOPE_NOT_ALLOWED  0x3d32
#define ERROR_CLASSIC_COMPAT_MODE_NOT_ALLOWED  0x3d33
#define ERROR_STAGEFROMUPDATEAGENT_PACKAGE_NOT_APPLICABLE  0x3d34
#define ERROR_PACKAGE_NOT_REGISTERED_FOR_USER  0x3d35
#define ERROR_PACKAGE_NAME_MISMATCH  0x3d36
#define ERROR_APPINSTALLER_URI_IN_USE  0x3d37
#define ERROR_APPINSTALLER_IS_MANAGED_BY_SYSTEM  0x3d38
#define APPMODEL_ERROR_NO_PACKAGE  0x3d54
#define APPMODEL_ERROR_PACKAGE_RUNTIME_CORRUPT  0x3d55
#define APPMODEL_ERROR_PACKAGE_IDENTITY_CORRUPT  0x3d56
#define APPMODEL_ERROR_NO_APPLICATION  0x3d57
#define APPMODEL_ERROR_DYNAMIC_PROPERTY_READ_FAILED  0x3d58
#define APPMODEL_ERROR_DYNAMIC_PROPERTY_INVALID  0x3d59
#define APPMODEL_ERROR_PACKAGE_NOT_AVAILABLE  0x3d5a
#define APPMODEL_ERROR_NO_MUTABLE_DIRECTORY  0x3d5b
#define ERROR_STATE_LOAD_STORE_FAILED  0x3db8
#define ERROR_STATE_GET_VERSION_FAILED  0x3db9
#define ERROR_STATE_SET_VERSION_FAILED  0x3dba
#define ERROR_STATE_STRUCTURED_RESET_FAILED  0x3dbb
#define ERROR_STATE_OPEN_CONTAINER_FAILED  0x3dbc
#define ERROR_STATE_CREATE_CONTAINER_FAILED  0x3dbd
#define ERROR_STATE_DELETE_CONTAINER_FAILED  0x3dbe
#define ERROR_STATE_READ_SETTING_FAILED  0x3dbf
#define ERROR_STATE_WRITE_SETTING_FAILED  0x3dc0
#define ERROR_STATE_DELETE_SETTING_FAILED  0x3dc1
#define ERROR_STATE_QUERY_SETTING_FAILED  0x3dc2
#define ERROR_STATE_READ_COMPOSITE_SETTING_FAILED  0x3dc3
#define ERROR_STATE_WRITE_COMPOSITE_SETTING_FAILED  0x3dc4
#define ERROR_STATE_ENUMERATE_CONTAINER_FAILED  0x3dc5
#define ERROR_STATE_ENUMERATE_SETTINGS_FAILED  0x3dc6
#define ERROR_STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED  0x3dc7
#define ERROR_STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED  0x3dc8
#define ERROR_STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED  0x3dc9
#define ERROR_STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED  0x3dca
#define ERROR_API_UNAVAILABLE  0x3de1
#define ERROR_NDIS_INTERFACE_CLOSING  0x80340002
#define ERROR_NDIS_BAD_VERSION  0x80340004
#define ERROR_NDIS_BAD_CHARACTERISTICS  0x80340005
#define ERROR_NDIS_ADAPTER_NOT_FOUND  0x80340006
#define ERROR_NDIS_OPEN_FAILED  0x80340007
#define ERROR_NDIS_DEVICE_FAILED  0x80340008
#define ERROR_NDIS_MULTICAST_FULL  0x80340009
#define ERROR_NDIS_MULTICAST_EXISTS  0x8034000a
#define ERROR_NDIS_MULTICAST_NOT_FOUND  0x8034000b
#define ERROR_NDIS_REQUEST_ABORTED  0x8034000c
#define ERROR_NDIS_RESET_IN_PROGRESS  0x8034000d
#define ERROR_NDIS_NOT_SUPPORTED  0x803400bb
#define ERROR_NDIS_INVALID_PACKET  0x8034000f
#define ERROR_NDIS_ADAPTER_NOT_READY  0x80340011
#define ERROR_NDIS_INVALID_LENGTH  0x80340014
#define ERROR_NDIS_INVALID_DATA  0x80340015
#define ERROR_NDIS_BUFFER_TOO_SHORT  0x80340016
#define ERROR_NDIS_INVALID_OID  0x80340017
#define ERROR_NDIS_ADAPTER_REMOVED  0x80340018
#define ERROR_NDIS_UNSUPPORTED_MEDIA  0x80340019
#define ERROR_NDIS_GROUP_ADDRESS_IN_USE  0x8034001a
#define ERROR_NDIS_FILE_NOT_FOUND  0x8034001b
#define ERROR_NDIS_ERROR_READING_FILE  0x8034001c
#define ERROR_NDIS_ALREADY_MAPPED  0x8034001d
#define ERROR_NDIS_RESOURCE_CONFLICT  0x8034001e
#define ERROR_NDIS_MEDIA_DISCONNECTED  0x8034001f
#define ERROR_NDIS_INVALID_ADDRESS  0x80340022
#define ERROR_NDIS_INVALID_DEVICE_REQUEST  0x80340010
#define ERROR_NDIS_PAUSED  0x8034002a
#define ERROR_NDIS_INTERFACE_NOT_FOUND  0x8034002b
#define ERROR_NDIS_UNSUPPORTED_REVISION  0x8034002c
#define ERROR_NDIS_INVALID_PORT  0x8034002d
#define ERROR_NDIS_INVALID_PORT_STATE  0x8034002e
#define ERROR_NDIS_LOW_POWER_STATE  0x8034002f
#define ERROR_NDIS_REINIT_REQUIRED  0x80340030
#define ERROR_NDIS_NO_QUEUES  0x80340031
#define ERROR_NDIS_DOT11_AUTO_CONFIG_ENABLED  0x80342000
#define ERROR_NDIS_DOT11_MEDIA_IN_USE  0x80342001
#define ERROR_NDIS_DOT11_POWER_STATE_INVALID  0x80342002
#define ERROR_NDIS_PM_WOL_PATTERN_LIST_FULL  0x80342003
#define ERROR_NDIS_PM_PROTOCOL_OFFLOAD_LIST_FULL  0x80342004
#define ERROR_NDIS_DOT11_AP_CHANNEL_CURRENTLY_NOT_AVAILABLE  0x80342005
#define ERROR_NDIS_DOT11_AP_BAND_CURRENTLY_NOT_AVAILABLE  0x80342006
#define ERROR_NDIS_DOT11_AP_CHANNEL_NOT_ALLOWED  0x80342007
#define ERROR_NDIS_DOT11_AP_BAND_NOT_ALLOWED  0x80342008
#define ERROR_NDIS_INDICATION_REQUIRED  0x340001
#define ERROR_NDIS_OFFLOAD_POLICY  0xc034100f
#define ERROR_NDIS_OFFLOAD_CONNECTION_REJECTED  0xc0341012
#define ERROR_NDIS_OFFLOAD_PATH_REJECTED  0xc0341013
#define ERROR_HV_INVALID_HYPERCALL_CODE  0xc0350002
#define ERROR_HV_INVALID_HYPERCALL_INPUT  0xc0350003
#define ERROR_HV_INVALID_ALIGNMENT  0xc0350004
#define ERROR_HV_INVALID_PARAMETER  0xc0350005
#define ERROR_HV_ACCESS_DENIED  0xc0350006
#define ERROR_HV_INVALID_PARTITION_STATE  0xc0350007
#define ERROR_HV_OPERATION_DENIED  0xc0350008
#define ERROR_HV_UNKNOWN_PROPERTY  0xc0350009
#define ERROR_HV_PROPERTY_VALUE_OUT_OF_RANGE  0xc035000a
#define ERROR_HV_INSUFFICIENT_MEMORY  0xc035000b
#define ERROR_HV_PARTITION_TOO_DEEP  0xc035000c
#define ERROR_HV_INVALID_PARTITION_ID  0xc035000d
#define ERROR_HV_INVALID_VP_INDEX  0xc035000e
#define ERROR_HV_INVALID_PORT_ID  0xc0350011
#define ERROR_HV_INVALID_CONNECTION_ID  0xc0350012
#define ERROR_HV_INSUFFICIENT_BUFFERS  0xc0350013
#define ERROR_HV_NOT_ACKNOWLEDGED  0xc0350014
#define ERROR_HV_INVALID_VP_STATE  0xc0350015
#define ERROR_HV_ACKNOWLEDGED  0xc0350016
#define ERROR_HV_INVALID_SAVE_RESTORE_STATE  0xc0350017
#define ERROR_HV_INVALID_SYNIC_STATE  0xc0350018
#define ERROR_HV_OBJECT_IN_USE  0xc0350019
#define ERROR_HV_INVALID_PROXIMITY_DOMAIN_INFO  0xc035001a
#define ERROR_HV_NO_DATA  0xc035001b
#define ERROR_HV_INACTIVE  0xc035001c
#define ERROR_HV_NO_RESOURCES  0xc035001d
#define ERROR_HV_FEATURE_UNAVAILABLE  0xc035001e
#define ERROR_HV_INSUFFICIENT_BUFFER  0xc0350033
#define ERROR_HV_INSUFFICIENT_DEVICE_DOMAINS  0xc0350038
#define ERROR_HV_CPUID_FEATURE_VALIDATION  0xc035003c
#define ERROR_HV_CPUID_XSAVE_FEATURE_VALIDATION  0xc035003d
#define ERROR_HV_PROCESSOR_STARTUP_TIMEOUT  0xc035003e
#define ERROR_HV_SMX_ENABLED  0xc035003f
#define ERROR_HV_INVALID_LP_INDEX  0xc0350041
#define ERROR_HV_INVALID_REGISTER_VALUE  0xc0350050
#define ERROR_HV_INVALID_VTL_STATE  0xc0350051
#define ERROR_HV_NX_NOT_DETECTED  0xc0350055
#define ERROR_HV_INVALID_DEVICE_ID  0xc0350057
#define ERROR_HV_INVALID_DEVICE_STATE  0xc0350058
#define ERROR_HV_PENDING_PAGE_REQUESTS  0x350059
#define ERROR_HV_PAGE_REQUEST_INVALID  0xc0350060
#define ERROR_HV_INVALID_CPU_GROUP_ID  0xc035006f
#define ERROR_HV_INVALID_CPU_GROUP_STATE  0xc0350070
#define ERROR_HV_OPERATION_FAILED  0xc0350071
#define ERROR_HV_NOT_ALLOWED_WITH_NESTED_VIRT_ACTIVE  0xc0350072
#define ERROR_HV_INSUFFICIENT_ROOT_MEMORY  0xc0350073
#define ERROR_HV_EVENT_BUFFER_ALREADY_FREED  0xc0350074
#define ERROR_HV_INSUFFICIENT_CONTIGUOUS_MEMORY  0xc0350075
#define ERROR_HV_DEVICE_NOT_IN_DOMAIN  0xc0350076
#define ERROR_HV_NESTED_VM_EXIT  0xc0350077
#define ERROR_HV_MSR_ACCESS_FAILED  0xc0350080
#define ERROR_HV_INSUFFICIENT_MEMORY_MIRRORING  0xc0350081
#define ERROR_HV_INSUFFICIENT_CONTIGUOUS_MEMORY_MIRRORING  0xc0350082
#define ERROR_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY  0xc0350083
#define ERROR_HV_INSUFFICIENT_ROOT_MEMORY_MIRRORING  0xc0350084
#define ERROR_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY_MIRRORING  0xc0350085
#define ERROR_HV_NOT_PRESENT  0xc0351000
#define ERROR_VID_DUPLICATE_HANDLER  0xc0370001
#define ERROR_VID_TOO_MANY_HANDLERS  0xc0370002
#define ERROR_VID_QUEUE_FULL  0xc0370003
#define ERROR_VID_HANDLER_NOT_PRESENT  0xc0370004
#define ERROR_VID_INVALID_OBJECT_NAME  0xc0370005
#define ERROR_VID_PARTITION_NAME_TOO_LONG  0xc0370006
#define ERROR_VID_MESSAGE_QUEUE_NAME_TOO_LONG  0xc0370007
#define ERROR_VID_PARTITION_ALREADY_EXISTS  0xc0370008
#define ERROR_VID_PARTITION_DOES_NOT_EXIST  0xc0370009
#define ERROR_VID_PARTITION_NAME_NOT_FOUND  0xc037000a
#define ERROR_VID_MESSAGE_QUEUE_ALREADY_EXISTS  0xc037000b
#define ERROR_VID_EXCEEDED_MBP_ENTRY_MAP_LIMIT  0xc037000c
#define ERROR_VID_MB_STILL_REFERENCED  0xc037000d
#define ERROR_VID_CHILD_GPA_PAGE_SET_CORRUPTED  0xc037000e
#define ERROR_VID_INVALID_NUMA_SETTINGS  0xc037000f
#define ERROR_VID_INVALID_NUMA_NODE_INDEX  0xc0370010
#define ERROR_VID_NOTIFICATION_QUEUE_ALREADY_ASSOCIATED  0xc0370011
#define ERROR_VID_INVALID_MEMORY_BLOCK_HANDLE  0xc0370012
#define ERROR_VID_PAGE_RANGE_OVERFLOW  0xc0370013
#define ERROR_VID_INVALID_MESSAGE_QUEUE_HANDLE  0xc0370014
#define ERROR_VID_INVALID_GPA_RANGE_HANDLE  0xc0370015
#define ERROR_VID_NO_MEMORY_BLOCK_NOTIFICATION_QUEUE  0xc0370016
#define ERROR_VID_MEMORY_BLOCK_LOCK_COUNT_EXCEEDED  0xc0370017
#define ERROR_VID_INVALID_PPM_HANDLE  0xc0370018
#define ERROR_VID_MBPS_ARE_LOCKED  0xc0370019
#define ERROR_VID_MESSAGE_QUEUE_CLOSED  0xc037001a
#define ERROR_VID_VIRTUAL_PROCESSOR_LIMIT_EXCEEDED  0xc037001b
#define ERROR_VID_STOP_PENDING  0xc037001c
#define ERROR_VID_INVALID_PROCESSOR_STATE  0xc037001d
#define ERROR_VID_EXCEEDED_KM_CONTEXT_COUNT_LIMIT  0xc037001e
#define ERROR_VID_KM_INTERFACE_ALREADY_INITIALIZED  0xc037001f
#define ERROR_VID_MB_PROPERTY_ALREADY_SET_RESET  0xc0370020
#define ERROR_VID_MMIO_RANGE_DESTROYED  0xc0370021
#define ERROR_VID_INVALID_CHILD_GPA_PAGE_SET  0xc0370022
#define ERROR_VID_RESERVE_PAGE_SET_IS_BEING_USED  0xc0370023
#define ERROR_VID_RESERVE_PAGE_SET_TOO_SMALL  0xc0370024
#define ERROR_VID_MBP_ALREADY_LOCKED_USING_RESERVED_PAGE  0xc0370025
#define ERROR_VID_MBP_COUNT_EXCEEDED_LIMIT  0xc0370026
#define ERROR_VID_SAVED_STATE_CORRUPT  0xc0370027
#define ERROR_VID_SAVED_STATE_UNRECOGNIZED_ITEM  0xc0370028
#define ERROR_VID_SAVED_STATE_INCOMPATIBLE  0xc0370029
#define ERROR_VID_VTL_ACCESS_DENIED  0xc037002a
#define ERROR_VID_INSUFFICIENT_RESOURCES_RESERVE  0xc037002b
#define ERROR_VID_INSUFFICIENT_RESOURCES_PHYSICAL_BUFFER  0xc037002c
#define ERROR_VID_INSUFFICIENT_RESOURCES_HV_DEPOSIT  0xc037002d
#define ERROR_VID_MEMORY_TYPE_NOT_SUPPORTED  0xc037002e
#define ERROR_VID_INSUFFICIENT_RESOURCES_WITHDRAW  0xc037002f
#define ERROR_VID_PROCESS_ALREADY_SET  0xc0370030
#define ERROR_VMCOMPUTE_TERMINATED_DURING_START  0xc0370100
#define ERROR_VMCOMPUTE_IMAGE_MISMATCH  0xc0370101
#define ERROR_VMCOMPUTE_HYPERV_NOT_INSTALLED  0xc0370102
#define ERROR_VMCOMPUTE_OPERATION_PENDING  0xc0370103
#define ERROR_VMCOMPUTE_TOO_MANY_NOTIFICATIONS  0xc0370104
#define ERROR_VMCOMPUTE_INVALID_STATE  0xc0370105
#define ERROR_VMCOMPUTE_UNEXPECTED_EXIT  0xc0370106
#define ERROR_VMCOMPUTE_TERMINATED  0xc0370107
#define ERROR_VMCOMPUTE_CONNECT_FAILED  0xc0370108
#define ERROR_VMCOMPUTE_TIMEOUT  0xc0370109
#define ERROR_VMCOMPUTE_CONNECTION_CLOSED  0xc037010a
#define ERROR_VMCOMPUTE_UNKNOWN_MESSAGE  0xc037010b
#define ERROR_VMCOMPUTE_UNSUPPORTED_PROTOCOL_VERSION  0xc037010c
#define ERROR_VMCOMPUTE_INVALID_JSON  0xc037010d
#define ERROR_VMCOMPUTE_SYSTEM_NOT_FOUND  0xc037010e
#define ERROR_VMCOMPUTE_SYSTEM_ALREADY_EXISTS  0xc037010f
#define ERROR_VMCOMPUTE_SYSTEM_ALREADY_STOPPED  0xc0370110
#define ERROR_VMCOMPUTE_PROTOCOL_ERROR  0xc0370111
#define ERROR_VMCOMPUTE_INVALID_LAYER  0xc0370112
#define ERROR_VMCOMPUTE_WINDOWS_INSIDER_REQUIRED  0xc0370113
#define ERROR_VNET_VIRTUAL_SWITCH_NAME_NOT_FOUND  0xc0370200
#define ERROR_VID_REMOTE_NODE_PARENT_GPA_PAGES_USED  0x80370001
#define ERROR_VSMB_SAVED_STATE_FILE_NOT_FOUND  0xc0370400
#define ERROR_VSMB_SAVED_STATE_CORRUPT  0xc0370401
#define ERROR_VOLMGR_INCOMPLETE_REGENERATION  0x80380001
#define ERROR_VOLMGR_INCOMPLETE_DISK_MIGRATION  0x80380002
#define ERROR_VOLMGR_DATABASE_FULL  0xc0380001
#define ERROR_VOLMGR_DISK_CONFIGURATION_CORRUPTED  0xc0380002
#define ERROR_VOLMGR_DISK_CONFIGURATION_NOT_IN_SYNC  0xc0380003
#define ERROR_VOLMGR_PACK_CONFIG_UPDATE_FAILED  0xc0380004
#define ERROR_VOLMGR_DISK_CONTAINS_NON_SIMPLE_VOLUME  0xc0380005
#define ERROR_VOLMGR_DISK_DUPLICATE  0xc0380006
#define ERROR_VOLMGR_DISK_DYNAMIC  0xc0380007
#define ERROR_VOLMGR_DISK_ID_INVALID  0xc0380008
#define ERROR_VOLMGR_DISK_INVALID  0xc0380009
#define ERROR_VOLMGR_DISK_LAST_VOTER  0xc038000a
#define ERROR_VOLMGR_DISK_LAYOUT_INVALID  0xc038000b
#define ERROR_VOLMGR_DISK_LAYOUT_NON_BASIC_BETWEEN_BASIC_PARTITIONS  0xc038000c
#define ERROR_VOLMGR_DISK_LAYOUT_NOT_CYLINDER_ALIGNED  0xc038000d
#define ERROR_VOLMGR_DISK_LAYOUT_PARTITIONS_TOO_SMALL  0xc038000e
#define ERROR_VOLMGR_DISK_LAYOUT_PRIMARY_BETWEEN_LOGICAL_PARTITIONS  0xc038000f
#define ERROR_VOLMGR_DISK_LAYOUT_TOO_MANY_PARTITIONS  0xc0380010
#define ERROR_VOLMGR_DISK_MISSING  0xc0380011
#define ERROR_VOLMGR_DISK_NOT_EMPTY  0xc0380012
#define ERROR_VOLMGR_DISK_NOT_ENOUGH_SPACE  0xc0380013
#define ERROR_VOLMGR_DISK_REVECTORING_FAILED  0xc0380014
#define ERROR_VOLMGR_DISK_SECTOR_SIZE_INVALID  0xc0380015
#define ERROR_VOLMGR_DISK_SET_NOT_CONTAINED  0xc0380016
#define ERROR_VOLMGR_DISK_USED_BY_MULTIPLE_MEMBERS  0xc0380017
#define ERROR_VOLMGR_DISK_USED_BY_MULTIPLE_PLEXES  0xc0380018
#define ERROR_VOLMGR_DYNAMIC_DISK_NOT_SUPPORTED  0xc0380019
#define ERROR_VOLMGR_EXTENT_ALREADY_USED  0xc038001a
#define ERROR_VOLMGR_EXTENT_NOT_CONTIGUOUS  0xc038001b
#define ERROR_VOLMGR_EXTENT_NOT_IN_PUBLIC_REGION  0xc038001c
#define ERROR_VOLMGR_EXTENT_NOT_SECTOR_ALIGNED  0xc038001d
#define ERROR_VOLMGR_EXTENT_OVERLAPS_EBR_PARTITION  0xc038001e
#define ERROR_VOLMGR_EXTENT_VOLUME_LENGTHS_DO_NOT_MATCH  0xc038001f
#define ERROR_VOLMGR_FAULT_TOLERANT_NOT_SUPPORTED  0xc0380020
#define ERROR_VOLMGR_INTERLEAVE_LENGTH_INVALID  0xc0380021
#define ERROR_VOLMGR_MAXIMUM_REGISTERED_USERS  0xc0380022
#define ERROR_VOLMGR_MEMBER_IN_SYNC  0xc0380023
#define ERROR_VOLMGR_MEMBER_INDEX_DUPLICATE  0xc0380024
#define ERROR_VOLMGR_MEMBER_INDEX_INVALID  0xc0380025
#define ERROR_VOLMGR_MEMBER_MISSING  0xc0380026
#define ERROR_VOLMGR_MEMBER_NOT_DETACHED  0xc0380027
#define ERROR_VOLMGR_MEMBER_REGENERATING  0xc0380028
#define ERROR_VOLMGR_ALL_DISKS_FAILED  0xc0380029
#define ERROR_VOLMGR_NO_REGISTERED_USERS  0xc038002a
#define ERROR_VOLMGR_NO_SUCH_USER  0xc038002b
#define ERROR_VOLMGR_NOTIFICATION_RESET  0xc038002c
#define ERROR_VOLMGR_NUMBER_OF_MEMBERS_INVALID  0xc038002d
#define ERROR_VOLMGR_NUMBER_OF_PLEXES_INVALID  0xc038002e
#define ERROR_VOLMGR_PACK_DUPLICATE  0xc038002f
#define ERROR_VOLMGR_PACK_ID_INVALID  0xc0380030
#define ERROR_VOLMGR_PACK_INVALID  0xc0380031
#define ERROR_VOLMGR_PACK_NAME_INVALID  0xc0380032
#define ERROR_VOLMGR_PACK_OFFLINE  0xc0380033
#define ERROR_VOLMGR_PACK_HAS_QUORUM  0xc0380034
#define ERROR_VOLMGR_PACK_WITHOUT_QUORUM  0xc0380035
#define ERROR_VOLMGR_PARTITION_STYLE_INVALID  0xc0380036
#define ERROR_VOLMGR_PARTITION_UPDATE_FAILED  0xc0380037
#define ERROR_VOLMGR_PLEX_IN_SYNC  0xc0380038
#define ERROR_VOLMGR_PLEX_INDEX_DUPLICATE  0xc0380039
#define ERROR_VOLMGR_PLEX_INDEX_INVALID  0xc038003a
#define ERROR_VOLMGR_PLEX_LAST_ACTIVE  0xc038003b
#define ERROR_VOLMGR_PLEX_MISSING  0xc038003c
#define ERROR_VOLMGR_PLEX_REGENERATING  0xc038003d
#define ERROR_VOLMGR_PLEX_TYPE_INVALID  0xc038003e
#define ERROR_VOLMGR_PLEX_NOT_RAID5  0xc038003f
#define ERROR_VOLMGR_PLEX_NOT_SIMPLE  0xc0380040
#define ERROR_VOLMGR_STRUCTURE_SIZE_INVALID  0xc0380041
#define ERROR_VOLMGR_TOO_MANY_NOTIFICATION_REQUESTS  0xc0380042
#define ERROR_VOLMGR_TRANSACTION_IN_PROGRESS  0xc0380043
#define ERROR_VOLMGR_UNEXPECTED_DISK_LAYOUT_CHANGE  0xc0380044
#define ERROR_VOLMGR_VOLUME_CONTAINS_MISSING_DISK  0xc0380045
#define ERROR_VOLMGR_VOLUME_ID_INVALID  0xc0380046
#define ERROR_VOLMGR_VOLUME_LENGTH_INVALID  0xc0380047
#define ERROR_VOLMGR_VOLUME_LENGTH_NOT_SECTOR_SIZE_MULTIPLE  0xc0380048
#define ERROR_VOLMGR_VOLUME_NOT_MIRRORED  0xc0380049
#define ERROR_VOLMGR_VOLUME_NOT_RETAINED  0xc038004a
#define ERROR_VOLMGR_VOLUME_OFFLINE  0xc038004b
#define ERROR_VOLMGR_VOLUME_RETAINED  0xc038004c
#define ERROR_VOLMGR_NUMBER_OF_EXTENTS_INVALID  0xc038004d
#define ERROR_VOLMGR_DIFFERENT_SECTOR_SIZE  0xc038004e
#define ERROR_VOLMGR_BAD_BOOT_DISK  0xc038004f
#define ERROR_VOLMGR_PACK_CONFIG_OFFLINE  0xc0380050
#define ERROR_VOLMGR_PACK_CONFIG_ONLINE  0xc0380051
#define ERROR_VOLMGR_NOT_PRIMARY_PACK  0xc0380052
#define ERROR_VOLMGR_PACK_LOG_UPDATE_FAILED  0xc0380053
#define ERROR_VOLMGR_NUMBER_OF_DISKS_IN_PLEX_INVALID  0xc0380054
#define ERROR_VOLMGR_NUMBER_OF_DISKS_IN_MEMBER_INVALID  0xc0380055
#define ERROR_VOLMGR_VOLUME_MIRRORED  0xc0380056
#define ERROR_VOLMGR_PLEX_NOT_SIMPLE_SPANNED  0xc0380057
#define ERROR_VOLMGR_NO_VALID_LOG_COPIES  0xc0380058
#define ERROR_VOLMGR_PRIMARY_PACK_PRESENT  0xc0380059
#define ERROR_VOLMGR_NUMBER_OF_DISKS_INVALID  0xc038005a
#define ERROR_VOLMGR_MIRROR_NOT_SUPPORTED  0xc038005b
#define ERROR_VOLMGR_RAID5_NOT_SUPPORTED  0xc038005c
#define ERROR_BCD_NOT_ALL_ENTRIES_IMPORTED  0x80390001
#define ERROR_BCD_TOO_MANY_ELEMENTS  0xc0390002
#define ERROR_BCD_NOT_ALL_ENTRIES_SYNCHRONIZED  0x80390003
#define ERROR_VHD_DRIVE_FOOTER_MISSING  0xc03a0001
#define ERROR_VHD_DRIVE_FOOTER_CHECKSUM_MISMATCH  0xc03a0002
#define ERROR_VHD_DRIVE_FOOTER_CORRUPT  0xc03a0003
#define ERROR_VHD_FORMAT_UNKNOWN  0xc03a0004
#define ERROR_VHD_FORMAT_UNSUPPORTED_VERSION  0xc03a0005
#define ERROR_VHD_SPARSE_HEADER_CHECKSUM_MISMATCH  0xc03a0006
#define ERROR_VHD_SPARSE_HEADER_UNSUPPORTED_VERSION  0xc03a0007
#define ERROR_VHD_SPARSE_HEADER_CORRUPT  0xc03a0008
#define ERROR_VHD_BLOCK_ALLOCATION_FAILURE  0xc03a0009
#define ERROR_VHD_BLOCK_ALLOCATION_TABLE_CORRUPT  0xc03a000a
#define ERROR_VHD_INVALID_BLOCK_SIZE  0xc03a000b
#define ERROR_VHD_BITMAP_MISMATCH  0xc03a000c
#define ERROR_VHD_PARENT_VHD_NOT_FOUND  0xc03a000d
#define ERROR_VHD_CHILD_PARENT_ID_MISMATCH  0xc03a000e
#define ERROR_VHD_CHILD_PARENT_TIMESTAMP_MISMATCH  0xc03a000f
#define ERROR_VHD_METADATA_READ_FAILURE  0xc03a0010
#define ERROR_VHD_METADATA_WRITE_FAILURE  0xc03a0011
#define ERROR_VHD_INVALID_SIZE  0xc03a0012
#define ERROR_VHD_INVALID_FILE_SIZE  0xc03a0013
#define ERROR_VIRTDISK_PROVIDER_NOT_FOUND  0xc03a0014
#define ERROR_VIRTDISK_NOT_VIRTUAL_DISK  0xc03a0015
#define ERROR_VHD_PARENT_VHD_ACCESS_DENIED  0xc03a0016
#define ERROR_VHD_CHILD_PARENT_SIZE_MISMATCH  0xc03a0017
#define ERROR_VHD_DIFFERENCING_CHAIN_CYCLE_DETECTED  0xc03a0018
#define ERROR_VHD_DIFFERENCING_CHAIN_ERROR_IN_PARENT  0xc03a0019
#define ERROR_VIRTUAL_DISK_LIMITATION  0xc03a001a
#define ERROR_VHD_INVALID_TYPE  0xc03a001b
#define ERROR_VHD_INVALID_STATE  0xc03a001c
#define ERROR_VIRTDISK_UNSUPPORTED_DISK_SECTOR_SIZE  0xc03a001d
#define ERROR_VIRTDISK_DISK_ALREADY_OWNED  0xc03a001e
#define ERROR_VIRTDISK_DISK_ONLINE_AND_WRITABLE  0xc03a001f
#define ERROR_CTLOG_TRACKING_NOT_INITIALIZED  0xc03a0020
#define ERROR_CTLOG_LOGFILE_SIZE_EXCEEDED_MAXSIZE  0xc03a0021
#define ERROR_CTLOG_VHD_CHANGED_OFFLINE  0xc03a0022
#define ERROR_CTLOG_INVALID_TRACKING_STATE  0xc03a0023
#define ERROR_CTLOG_INCONSISTENT_TRACKING_FILE  0xc03a0024
#define ERROR_VHD_RESIZE_WOULD_TRUNCATE_DATA  0xc03a0025
#define ERROR_VHD_COULD_NOT_COMPUTE_MINIMUM_VIRTUAL_SIZE  0xc03a0026
#define ERROR_VHD_ALREADY_AT_OR_BELOW_MINIMUM_VIRTUAL_SIZE  0xc03a0027
#define ERROR_VHD_METADATA_FULL  0xc03a0028
#define ERROR_VHD_INVALID_CHANGE_TRACKING_ID  0xc03a0029
#define ERROR_VHD_CHANGE_TRACKING_DISABLED  0xc03a002a
#define ERROR_VHD_MISSING_CHANGE_TRACKING_INFORMATION  0xc03a0030
#define ERROR_VHD_UNEXPECTED_ID  0xc03a0034
#define ERROR_QUERY_STORAGE_ERROR  0x803a0001

; WIN_HTTP_CREATE_URL_FLAGS
#define ICU_ESCAPE  0x80000000
#define ICU_REJECT_USERPWD  0x4000
#define ICU_DECODE  0x10000000

; WINDOW_DISPLAY_AFFINITY
#define WDA_NONE  0x0
#define WDA_MONITOR  0x1
#define WDA_EXCLUDEFROMCAPTURE  0x11

; WINDOW_EX_STYLE
#define WS_EX_DLGMODALFRAME  0x1
#define WS_EX_NOPARENTNOTIFY  0x4
#define WS_EX_TOPMOST  0x8
#define WS_EX_ACCEPTFILES  0x10
#define WS_EX_TRANSPARENT  0x20
#define WS_EX_MDICHILD  0x40
#define WS_EX_TOOLWINDOW  0x80
#define WS_EX_WINDOWEDGE  0x100
#define WS_EX_CLIENTEDGE  0x200
#define WS_EX_CONTEXTHELP  0x400
#define WS_EX_RIGHT  0x1000
#define WS_EX_LEFT  0x0
#define WS_EX_RTLREADING  0x2000
#define WS_EX_LTRREADING  0x0
#define WS_EX_LEFTSCROLLBAR  0x4000
#define WS_EX_RIGHTSCROLLBAR  0x0
#define WS_EX_CONTROLPARENT  0x10000
#define WS_EX_STATICEDGE  0x20000
#define WS_EX_APPWINDOW  0x40000
#define WS_EX_OVERLAPPEDWINDOW  0x300
#define WS_EX_PALETTEWINDOW  0x188
#define WS_EX_LAYERED  0x80000
#define WS_EX_NOINHERITLAYOUT  0x100000
#define WS_EX_NOREDIRECTIONBITMAP  0x200000
#define WS_EX_LAYOUTRTL  0x400000
#define WS_EX_COMPOSITED  0x2000000
#define WS_EX_NOACTIVATE  0x8000000

; WINDOW_LONG_PTR_INDEX
#define GWL_EXSTYLE  -20
#define GWLP_HINSTANCE  -6
#define GWLP_HWNDPARENT  -8
#define GWLP_ID  -12
#define GWL_STYLE  -16
#define GWLP_USERDATA  -21
#define GWLP_WNDPROC  -4
#define GWL_HINSTANCE  -6
#define GWL_ID  -12
#define GWL_USERDATA  -21
#define GWL_WNDPROC  -4
#define GWL_HWNDPARENT  -8

; WINDOW_MESSAGE_FILTER_ACTION
#define MSGFLT_ALLOW  0x1
#define MSGFLT_DISALLOW  0x2
#define MSGFLT_RESET  0x0

; WINDOW_STYLE
#define WS_OVERLAPPED  0x0
#define WS_POPUP  0x80000000
#define WS_CHILD  0x40000000
#define WS_MINIMIZE  0x20000000
#define WS_VISIBLE  0x10000000
#define WS_DISABLED  0x8000000
#define WS_CLIPSIBLINGS  0x4000000
#define WS_CLIPCHILDREN  0x2000000
#define WS_MAXIMIZE  0x1000000
#define WS_CAPTION  0xc00000
#define WS_BORDER  0x800000
#define WS_DLGFRAME  0x400000
#define WS_VSCROLL  0x200000
#define WS_HSCROLL  0x100000
#define WS_SYSMENU  0x80000
#define WS_THICKFRAME  0x40000
#define WS_GROUP  0x20000
#define WS_TABSTOP  0x10000
#define WS_MINIMIZEBOX  0x20000
#define WS_MAXIMIZEBOX  0x10000
#define WS_TILED  0x0
#define WS_ICONIC  0x20000000
#define WS_SIZEBOX  0x40000
#define WS_TILEDWINDOW  0xcf0000
#define WS_OVERLAPPEDWINDOW  0xcf0000
#define WS_POPUPWINDOW  0x80880000
#define WS_CHILDWINDOW  0x40000000
#define WS_ACTIVECAPTION  0x1

; WINDOWPLACEMENT_FLAGS
#define WPF_ASYNCWINDOWPLACEMENT  0x4
#define WPF_RESTORETOMAXIMIZED  0x2
#define WPF_SETMINPOSITION  0x1

; WINDOWS_HOOK_ID
#define WH_CALLWNDPROC  0x4
#define WH_CALLWNDPROCRET  0xc
#define WH_CBT  0x5
#define WH_DEBUG  0x9
#define WH_FOREGROUNDIDLE  0xb
#define WH_GETMESSAGE  0x3
#define WH_JOURNALPLAYBACK  0x1
#define WH_JOURNALRECORD  0x0
#define WH_KEYBOARD  0x2
#define WH_KEYBOARD_LL  0xd
#define WH_MOUSE  0x7
#define WH_MOUSE_LL  0xe
#define WH_MSGFILTER  -1
#define WH_SHELL  0xa
#define WH_SYSMSGFILTER  0x6

; WINDOWTHEMEATTRIBUTETYPE
#define WTA_NONCLIENT  0x1

; WINHTTP_ACCESS_TYPE
#define WINHTTP_ACCESS_TYPE_NO_PROXY  0x1
#define WINHTTP_ACCESS_TYPE_DEFAULT_PROXY  0x0
#define WINHTTP_ACCESS_TYPE_NAMED_PROXY  0x3
#define WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY  0x4

; WINHTTP_INTERNET_SCHEME
#define WINHTTP_INTERNET_SCHEME_HTTP  0x1
#define WINHTTP_INTERNET_SCHEME_HTTPS  0x2
#define WINHTTP_INTERNET_SCHEME_FTP  0x3
#define WINHTTP_INTERNET_SCHEME_SOCKS  0x4

; WINHTTP_OPEN_REQUEST_FLAGS
#define WINHTTP_FLAG_BYPASS_PROXY_CACHE  0x100
#define WINHTTP_FLAG_ESCAPE_DISABLE  0x40
#define WINHTTP_FLAG_ESCAPE_DISABLE_QUERY  0x80
#define WINHTTP_FLAG_ESCAPE_PERCENT  0x4
#define WINHTTP_FLAG_NULL_CODEPAGE  0x8
#define WINHTTP_FLAG_REFRESH  0x100
#define WINHTTP_FLAG_SECURE  0x800000

; WINHTTP_WEB_SOCKET_BUFFER_TYPE
#define WINHTTP_WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE  0x0
#define WINHTTP_WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE  0x1
#define WINHTTP_WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE  0x2
#define WINHTTP_WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE  0x3
#define WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE  0x4

; WLAN_AUTOCONF_OPCODE
#define wlan_autoconf_opcode_start  0x0
#define wlan_autoconf_opcode_show_denied_networks  0x1
#define wlan_autoconf_opcode_power_setting  0x2
#define wlan_autoconf_opcode_only_use_gp_profiles_for_allowed_networks  0x3
#define wlan_autoconf_opcode_allow_explicit_creds  0x4
#define wlan_autoconf_opcode_block_period  0x5
#define wlan_autoconf_opcode_allow_virtual_station_extensibility  0x6
#define wlan_autoconf_opcode_end  0x7

; WLAN_CONNECTION_MODE
#define wlan_connection_mode_profile  0x0
#define wlan_connection_mode_temporary_profile  0x1
#define wlan_connection_mode_discovery_secure  0x2
#define wlan_connection_mode_discovery_unsecure  0x3
#define wlan_connection_mode_auto  0x4
#define wlan_connection_mode_invalid  0x5

; WLAN_FILTER_LIST_TYPE
#define wlan_filter_list_type_gp_permit  0x0
#define wlan_filter_list_type_gp_deny  0x1
#define wlan_filter_list_type_user_permit  0x2
#define wlan_filter_list_type_user_deny  0x3

; WLAN_HOSTED_NETWORK_OPCODE
#define wlan_hosted_network_opcode_connection_settings  0x0
#define wlan_hosted_network_opcode_security_settings  0x1
#define wlan_hosted_network_opcode_station_profile  0x2
#define wlan_hosted_network_opcode_enable  0x3

; WLAN_HOSTED_NETWORK_PEER_AUTH_STATE
#define wlan_hosted_network_peer_state_invalid  0x0
#define wlan_hosted_network_peer_state_authenticated  0x1

; WLAN_HOSTED_NETWORK_REASON
#define wlan_hosted_network_reason_success  0x0
#define wlan_hosted_network_reason_unspecified  0x1
#define wlan_hosted_network_reason_bad_parameters  0x2
#define wlan_hosted_network_reason_service_shutting_down  0x3
#define wlan_hosted_network_reason_insufficient_resources  0x4
#define wlan_hosted_network_reason_elevation_required  0x5
#define wlan_hosted_network_reason_read_only  0x6
#define wlan_hosted_network_reason_persistence_failed  0x7
#define wlan_hosted_network_reason_crypt_error  0x8
#define wlan_hosted_network_reason_impersonation  0x9
#define wlan_hosted_network_reason_stop_before_start  0xa
#define wlan_hosted_network_reason_interface_available  0xb
#define wlan_hosted_network_reason_interface_unavailable  0xc
#define wlan_hosted_network_reason_miniport_stopped  0xd
#define wlan_hosted_network_reason_miniport_started  0xe
#define wlan_hosted_network_reason_incompatible_connection_started  0xf
#define wlan_hosted_network_reason_incompatible_connection_stopped  0x10
#define wlan_hosted_network_reason_user_action  0x11
#define wlan_hosted_network_reason_client_abort  0x12
#define wlan_hosted_network_reason_ap_start_failed  0x13
#define wlan_hosted_network_reason_peer_arrived  0x14
#define wlan_hosted_network_reason_peer_departed  0x15
#define wlan_hosted_network_reason_peer_timeout  0x16
#define wlan_hosted_network_reason_gp_denied  0x17
#define wlan_hosted_network_reason_service_unavailable  0x18
#define wlan_hosted_network_reason_device_change  0x19
#define wlan_hosted_network_reason_properties_change  0x1a
#define wlan_hosted_network_reason_virtual_station_blocking_use  0x1b
#define wlan_hosted_network_reason_service_available_on_virtual_station  0x1c

; WLAN_HOSTED_NETWORK_STATE
#define wlan_hosted_network_unavailable  0x0
#define wlan_hosted_network_idle  0x1
#define wlan_hosted_network_active  0x2

; WLAN_IHV_CONTROL_TYPE
#define wlan_ihv_control_type_service  0x0
#define wlan_ihv_control_type_driver  0x1

; WLAN_INTERFACE_STATE
#define wlan_interface_state_not_ready  0x0
#define wlan_interface_state_connected  0x1
#define wlan_interface_state_ad_hoc_network_formed  0x2
#define wlan_interface_state_disconnecting  0x3
#define wlan_interface_state_disconnected  0x4
#define wlan_interface_state_associating  0x5
#define wlan_interface_state_discovering  0x6
#define wlan_interface_state_authenticating  0x7

; WLAN_INTERFACE_TYPE
#define wlan_interface_type_emulated_802_11  0x0
#define wlan_interface_type_native_802_11  0x1
#define wlan_interface_type_invalid  0x2

; WLAN_INTF_OPCODE
#define wlan_intf_opcode_autoconf_start  0x0
#define wlan_intf_opcode_autoconf_enabled  0x1
#define wlan_intf_opcode_background_scan_enabled  0x2
#define wlan_intf_opcode_media_streaming_mode  0x3
#define wlan_intf_opcode_radio_state  0x4
#define wlan_intf_opcode_bss_type  0x5
#define wlan_intf_opcode_interface_state  0x6
#define wlan_intf_opcode_current_connection  0x7
#define wlan_intf_opcode_channel_number  0x8
#define wlan_intf_opcode_supported_infrastructure_auth_cipher_pairs  0x9
#define wlan_intf_opcode_supported_adhoc_auth_cipher_pairs  0xa
#define wlan_intf_opcode_supported_country_or_region_string_list  0xb
#define wlan_intf_opcode_current_operation_mode  0xc
#define wlan_intf_opcode_supported_safe_mode  0xd
#define wlan_intf_opcode_certified_safe_mode  0xe
#define wlan_intf_opcode_hosted_network_capable  0xf
#define wlan_intf_opcode_management_frame_protection_capable  0x10
#define wlan_intf_opcode_secondary_sta_interfaces  0x11
#define wlan_intf_opcode_secondary_sta_synchronized_connections  0x12
#define wlan_intf_opcode_autoconf_end  0xfffffff
#define wlan_intf_opcode_msm_start  0x10000100
#define wlan_intf_opcode_statistics  0x10000101
#define wlan_intf_opcode_rssi  0x10000102
#define wlan_intf_opcode_msm_end  0x1fffffff
#define wlan_intf_opcode_security_start  0x20010000
#define wlan_intf_opcode_security_end  0x2fffffff
#define wlan_intf_opcode_ihv_start  0x30000000
#define wlan_intf_opcode_ihv_end  0x3fffffff

; WLAN_NOTIFICATION_SOURCES
#define WLAN_NOTIFICATION_SOURCE_NONE  0x0
#define WLAN_NOTIFICATION_SOURCE_ALL  0xffff
#define WLAN_NOTIFICATION_SOURCE_ACM  0x8
#define WLAN_NOTIFICATION_SOURCE_MSM  0x10
#define WLAN_NOTIFICATION_SOURCE_SECURITY  0x20
#define WLAN_NOTIFICATION_SOURCE_IHV  0x40
#define WLAN_NOTIFICATION_SOURCE_HNWK  0x80
#define WLAN_NOTIFICATION_SOURCE_ONEX  0x4
#define WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE  0x800

; WLAN_OPCODE_VALUE_TYPE
#define wlan_opcode_value_type_query_only  0x0
#define wlan_opcode_value_type_set_by_group_policy  0x1
#define wlan_opcode_value_type_set_by_user  0x2
#define wlan_opcode_value_type_invalid  0x3

; WLAN_SECURABLE_OBJECT
#define wlan_secure_permit_list  0x0
#define wlan_secure_deny_list  0x1
#define wlan_secure_ac_enabled  0x2
#define wlan_secure_bc_scan_enabled  0x3
#define wlan_secure_bss_type  0x4
#define wlan_secure_show_denied  0x5
#define wlan_secure_interface_properties  0x6
#define wlan_secure_ihv_control  0x7
#define wlan_secure_all_user_profiles_order  0x8
#define wlan_secure_add_new_all_user_profiles  0x9
#define wlan_secure_add_new_per_user_profiles  0xa
#define wlan_secure_media_streaming_mode_enabled  0xb
#define wlan_secure_current_operation_mode  0xc
#define wlan_secure_get_plaintext_key  0xd
#define wlan_secure_hosted_network_elevated_access  0xe
#define wlan_secure_virtual_station_extensibility  0xf
#define wlan_secure_wfd_elevated_access  0x10
#define WLAN_SECURABLE_OBJECT_COUNT  0x11

; WLAN_SET_EAPHOST_FLAGS
#define WLAN_SET_EAPHOST_DATA_ALL_USERS  0x1

; WNDCLASS_STYLES
#define CS_VREDRAW  0x1
#define CS_HREDRAW  0x2
#define CS_DBLCLKS  0x8
#define CS_OWNDC  0x20
#define CS_CLASSDC  0x40
#define CS_PARENTDC  0x80
#define CS_NOCLOSE  0x200
#define CS_SAVEBITS  0x800
#define CS_BYTEALIGNCLIENT  0x1000
#define CS_BYTEALIGNWINDOW  0x2000
#define CS_GLOBALCLASS  0x4000
#define CS_IME  0x10000
#define CS_DROPSHADOW  0x20000

; WORKER_THREAD_FLAGS
#define WT_EXECUTEDEFAULT  0x0
#define WT_EXECUTEINIOTHREAD  0x1
#define WT_EXECUTEINPERSISTENTTHREAD  0x80
#define WT_EXECUTEINWAITTHREAD  0x4
#define WT_EXECUTELONGFUNCTION  0x10
#define WT_EXECUTEONLYONCE  0x8
#define WT_TRANSFER_IMPERSONATION  0x100
#define WT_EXECUTEINTIMERTHREAD  0x20

; WPAD_CACHE_DELETE
#define WPAD_CACHE_DELETE_CURRENT  0x0
#define WPAD_CACHE_DELETE_ALL  0x1

; WrapMode
#define WrapModeTile  0x0
#define WrapModeTileFlipX  0x1
#define WrapModeTileFlipY  0x2
#define WrapModeTileFlipXY  0x3
#define WrapModeClamp  0x4

; WSA_ERROR
#define WSA_IO_PENDING  0x3e5
#define WSA_IO_INCOMPLETE  0x3e4
#define WSA_INVALID_HANDLE  0x6
#define WSA_INVALID_PARAMETER  0x57
#define WSA_NOT_ENOUGH_MEMORY  0x8
#define WSA_OPERATION_ABORTED  0x3e3
#define WSA_WAIT_EVENT_0  0x0
#define WSA_WAIT_IO_COMPLETION  0xc0
#define WSABASEERR  0x2710
#define WSAEINTR  0x2714
#define WSAEBADF  0x2719
#define WSAEACCES  0x271d
#define WSAEFAULT  0x271e
#define WSAEINVAL  0x2726
#define WSAEMFILE  0x2728
#define WSAEWOULDBLOCK  0x2733
#define WSAEINPROGRESS  0x2734
#define WSAEALREADY  0x2735
#define WSAENOTSOCK  0x2736
#define WSAEDESTADDRREQ  0x2737
#define WSAEMSGSIZE  0x2738
#define WSAEPROTOTYPE  0x2739
#define WSAENOPROTOOPT  0x273a
#define WSAEPROTONOSUPPORT  0x273b
#define WSAESOCKTNOSUPPORT  0x273c
#define WSAEOPNOTSUPP  0x273d
#define WSAEPFNOSUPPORT  0x273e
#define WSAEAFNOSUPPORT  0x273f
#define WSAEADDRINUSE  0x2740
#define WSAEADDRNOTAVAIL  0x2741
#define WSAENETDOWN  0x2742
#define WSAENETUNREACH  0x2743
#define WSAENETRESET  0x2744
#define WSAECONNABORTED  0x2745
#define WSAECONNRESET  0x2746
#define WSAENOBUFS  0x2747
#define WSAEISCONN  0x2748
#define WSAENOTCONN  0x2749
#define WSAESHUTDOWN  0x274a
#define WSAETOOMANYREFS  0x274b
#define WSAETIMEDOUT  0x274c
#define WSAECONNREFUSED  0x274d
#define WSAELOOP  0x274e
#define WSAENAMETOOLONG  0x274f
#define WSAEHOSTDOWN  0x2750
#define WSAEHOSTUNREACH  0x2751
#define WSAENOTEMPTY  0x2752
#define WSAEPROCLIM  0x2753
#define WSAEUSERS  0x2754
#define WSAEDQUOT  0x2755
#define WSAESTALE  0x2756
#define WSAEREMOTE  0x2757
#define WSASYSNOTREADY  0x276b
#define WSAVERNOTSUPPORTED  0x276c
#define WSANOTINITIALISED  0x276d
#define WSAEDISCON  0x2775
#define WSAENOMORE  0x2776
#define WSAECANCELLED  0x2777
#define WSAEINVALIDPROCTABLE  0x2778
#define WSAEINVALIDPROVIDER  0x2779
#define WSAEPROVIDERFAILEDINIT  0x277a
#define WSASYSCALLFAILURE  0x277b
#define WSASERVICE_NOT_FOUND  0x277c
#define WSATYPE_NOT_FOUND  0x277d
#define WSA_E_NO_MORE  0x277e
#define WSA_E_CANCELLED  0x277f
#define WSAEREFUSED  0x2780
#define WSAHOST_NOT_FOUND  0x2af9
#define WSATRY_AGAIN  0x2afa
#define WSANO_RECOVERY  0x2afb
#define WSANO_DATA  0x2afc
#define WSA_QOS_RECEIVERS  0x2afd
#define WSA_QOS_SENDERS  0x2afe
#define WSA_QOS_NO_SENDERS  0x2aff
#define WSA_QOS_NO_RECEIVERS  0x2b00
#define WSA_QOS_REQUEST_CONFIRMED  0x2b01
#define WSA_QOS_ADMISSION_FAILURE  0x2b02
#define WSA_QOS_POLICY_FAILURE  0x2b03
#define WSA_QOS_BAD_STYLE  0x2b04
#define WSA_QOS_BAD_OBJECT  0x2b05
#define WSA_QOS_TRAFFIC_CTRL_ERROR  0x2b06
#define WSA_QOS_GENERIC_ERROR  0x2b07
#define WSA_QOS_ESERVICETYPE  0x2b08
#define WSA_QOS_EFLOWSPEC  0x2b09
#define WSA_QOS_EPROVSPECBUF  0x2b0a
#define WSA_QOS_EFILTERSTYLE  0x2b0b
#define WSA_QOS_EFILTERTYPE  0x2b0c
#define WSA_QOS_EFILTERCOUNT  0x2b0d
#define WSA_QOS_EOBJLENGTH  0x2b0e
#define WSA_QOS_EFLOWCOUNT  0x2b0f
#define WSA_QOS_EUNKOWNPSOBJ  0x2b10
#define WSA_QOS_EPOLICYOBJ  0x2b11
#define WSA_QOS_EFLOWDESC  0x2b12
#define WSA_QOS_EPSFLOWSPEC  0x2b13
#define WSA_QOS_EPSFILTERSPEC  0x2b14
#define WSA_QOS_ESDMODEOBJ  0x2b15
#define WSA_QOS_ESHAPERATEOBJ  0x2b16
#define WSA_QOS_RESERVED_PETYPE  0x2b17
#define WSA_SECURE_HOST_NOT_FOUND  0x2b18
#define WSA_IPSEC_NAME_POLICY_ERROR  0x2b19

; WSACOMPLETIONTYPE
#define NSP_NOTIFY_IMMEDIATELY  0x0
#define NSP_NOTIFY_HWND  0x1
#define NSP_NOTIFY_EVENT  0x2
#define NSP_NOTIFY_PORT  0x3
#define NSP_NOTIFY_APC  0x4

; WSAECOMPARATOR
#define COMP_EQUAL  0x0
#define COMP_NOTLESS  0x1

; WSAESETSERVICEOP
#define RNRSERVICE_REGISTER  0x0
#define RNRSERVICE_DEREGISTER  0x1
#define RNRSERVICE_DELETE  0x2

; WSAPOLL_EVENT_FLAGS
#define POLLRDNORM  0x100
#define POLLRDBAND  0x200
#define POLLIN  0x300
#define POLLPRI  0x400
#define POLLWRNORM  0x10
#define POLLOUT  0x10
#define POLLWRBAND  0x20
#define POLLERR  0x1
#define POLLHUP  0x2
#define POLLNVAL  0x4

; WSB_PROP
#define WSB_PROP_CXHSCROLL  0x2
#define WSB_PROP_CXHTHUMB  0x10
#define WSB_PROP_CXVSCROLL  0x8
#define WSB_PROP_CYHSCROLL  0x4
#define WSB_PROP_CYVSCROLL  0x1
#define WSB_PROP_CYVTHUMB  0x20
#define WSB_PROP_HBKGCOLOR  0x80
#define WSB_PROP_HSTYLE  0x200
#define WSB_PROP_PALETTE  0x800
#define WSB_PROP_VBKGCOLOR  0x40
#define WSB_PROP_VSTYLE  0x100
#define WSB_PROP_WINSTYLE  0x400

; WSC_PROVIDER_INFO_TYPE
#define ProviderInfoLspCategories  0x0
#define ProviderInfoAudit  0x1

; WTS_CONFIG_CLASS
#define WTSUserConfigInitialProgram  0x0
#define WTSUserConfigWorkingDirectory  0x1
#define WTSUserConfigfInheritInitialProgram  0x2
#define WTSUserConfigfAllowLogonTerminalServer  0x3
#define WTSUserConfigTimeoutSettingsConnections  0x4
#define WTSUserConfigTimeoutSettingsDisconnections  0x5
#define WTSUserConfigTimeoutSettingsIdle  0x6
#define WTSUserConfigfDeviceClientDrives  0x7
#define WTSUserConfigfDeviceClientPrinters  0x8
#define WTSUserConfigfDeviceClientDefaultPrinter  0x9
#define WTSUserConfigBrokenTimeoutSettings  0xa
#define WTSUserConfigReconnectSettings  0xb
#define WTSUserConfigModemCallbackSettings  0xc
#define WTSUserConfigModemCallbackPhoneNumber  0xd
#define WTSUserConfigShadowingSettings  0xe
#define WTSUserConfigTerminalServerProfilePath  0xf
#define WTSUserConfigTerminalServerHomeDir  0x10
#define WTSUserConfigTerminalServerHomeDirDrive  0x11
#define WTSUserConfigfTerminalServerRemoteHomeDir  0x12
#define WTSUserConfigUser  0x13

; WTS_CONNECTSTATE_CLASS
#define WTSActive  0x0
#define WTSConnected  0x1
#define WTSConnectQuery  0x2
#define WTSShadow  0x3
#define WTSDisconnected  0x4
#define WTSIdle  0x5
#define WTSListen  0x6
#define WTSReset  0x7
#define WTSDown  0x8
#define WTSInit  0x9

; WTS_INFO_CLASS
#define WTSInitialProgram  0x0
#define WTSApplicationName  0x1
#define WTSWorkingDirectory  0x2
#define WTSOEMId  0x3
#define WTSSessionId  0x4
#define WTSUserName  0x5
#define WTSWinStationName  0x6
#define WTSDomainName  0x7
#define WTSConnectState  0x8
#define WTSClientBuildNumber  0x9
#define WTSClientName  0xa
#define WTSClientDirectory  0xb
#define WTSClientProductId  0xc
#define WTSClientHardwareId  0xd
#define WTSClientAddress  0xe
#define WTSClientDisplay  0xf
#define WTSClientProtocolType  0x10
#define WTSIdleTime  0x11
#define WTSLogonTime  0x12
#define WTSIncomingBytes  0x13
#define WTSOutgoingBytes  0x14
#define WTSIncomingFrames  0x15
#define WTSOutgoingFrames  0x16
#define WTSClientInfo  0x17
#define WTSSessionInfo  0x18
#define WTSSessionInfoEx  0x19
#define WTSConfigInfo  0x1a
#define WTSValidationInfo  0x1b
#define WTSSessionAddressV4  0x1c
#define WTSIsRemoteSession  0x1d

; WTS_TYPE_CLASS
#define WTSTypeProcessInfoLevel0  0x0
#define WTSTypeProcessInfoLevel1  0x1
#define WTSTypeSessionInfoLevel1  0x2

; WTS_VIRTUAL_CLASS
#define WTSVirtualClientData  0x0
#define WTSVirtualFileHandle  0x1

; XAUDIO2_FILTER_TYPE
#define LowPassFilter  0x0
#define BandPassFilter  0x1
#define HighPassFilter  0x2
#define NotchFilter  0x3
#define LowPassOnePoleFilter  0x4
#define HighPassOnePoleFilter  0x5

#endif

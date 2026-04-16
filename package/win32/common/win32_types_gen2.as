; ============================================================
;   Auto-generated from CsWin32 / win32metadata
;   shared types: NSTRUCT / enum constants
;   tool: tools/cswin32_bridge/gen_from_cswin32.py
;
;   This file is included automatically by every <dll>_gen2.as.
;   Do not edit by hand ? regenerate via the python script.
; ============================================================

#ifndef __win32_types_gen2_as__
#define global __win32_types_gen2_as__

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

#defstruct W_Flags_e__Union
    #field var Anonymous
    #field int Value
    #field int _bitfield
#endstruct

#defstruct W_Anonymous_e__Struct
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

#defstruct W_Anonymous1_e__Union
    #field int64 HistoricalContext
    #field var Anonymous
    #field int Version
    #field int Linkage
#endstruct

#defstruct W_Anonymous2_e__Union
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

#defstruct W_Anonymous_e__Union
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

#defstruct W_Semaphore_e__Struct
    #field int MaxCount
    #field int InitialCount
#endstruct

#defstruct W_Reserved_e__Struct
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

#defstruct W_Token_e__Union
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

#defstruct W_Anonymous1_e__Struct
    #field int lMinimum
    #field int lMaximum
#endstruct

#defstruct W_Anonymous2_e__Struct
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

#defstruct AM_MEDIA_TYPE
    #field int bFixedSizeSamples
    #field int bTemporalCompression
    #field int lSampleSize
    #field var pUnk
    #field int cbFormat
    #field var pbFormat
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

#defstruct ASF_INDEX_IDENTIFIER
    #field int wStreamNumber
#endstruct

#defstruct ASF_MUX_STATISTICS
    #field int cFramesWritten
    #field int cFramesDropped
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

#defstruct W_Char_e__Union
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

#defstruct W_Values_e__Union
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

#defstruct W_Attribute_e__Union
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

#defstruct W_Info_e__Union
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

#defstruct W_ChunkStarted_e__Struct
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliChunkNumber
    #field int64 uliChunkSize
    #field int64 uliStreamSize
    #field int64 uliTotalFileSize
#endstruct

#defstruct W_ChunkFinished_e__Struct
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

#defstruct W_StreamStarted_e__Struct
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliStreamSize
    #field int64 uliTotalFileSize
#endstruct

#defstruct W_StreamFinished_e__Struct
    #field int dwStreamNumber
    #field int dwReserved
    #field intptr hSourceFile
    #field intptr hDestinationFile
    #field int64 uliStreamSize
    #field int64 uliStreamBytesTransferred
    #field int64 uliTotalFileSize
    #field int64 uliTotalBytesTransferred
#endstruct

#defstruct W_PollContinue_e__Struct
    #field int dwReserved
#endstruct

#defstruct W_Error_e__Struct
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

#defstruct D3D12_BLEND_DESC
    #field int AlphaToCoverageEnable
    #field int IndependentBlendEnable
    #field int RenderTarget
#endstruct

#defstruct D3D12_BOX
    #field int left
    #field int top
    #field int front
    #field int right
    #field int bottom
    #field int back
#endstruct

#defstruct D3D12_BUFFER_RTV
    #field int64 FirstElement
    #field int NumElements
#endstruct

#defstruct D3D12_BUFFER_SRV
    #field int64 FirstElement
    #field int NumElements
    #field int StructureByteStride
    #field int Flags
#endstruct

#defstruct D3D12_BUFFER_UAV
    #field int64 FirstElement
    #field int NumElements
    #field int StructureByteStride
    #field int64 CounterOffsetInBytes
    #field int Flags
#endstruct

#defstruct D3D12_CACHED_PIPELINE_STATE
    #field var pCachedBlob
    #field int CachedBlobSizeInBytes
#endstruct

#defstruct D3D12_CLEAR_VALUE
    #field int Format
    #field var Anonymous
    #field int Color
    #field int DepthStencil
#endstruct

#defstruct D3D12_COMMAND_QUEUE_DESC
    #field int Type
    #field int Priority
    #field int Flags
    #field int NodeMask
#endstruct

#defstruct D3D12_COMMAND_SIGNATURE_DESC
    #field int ByteStride
    #field int NumArgumentDescs
    #field var pArgumentDescs
    #field int NodeMask
#endstruct

#defstruct D3D12_COMPUTE_PIPELINE_STATE_DESC
    #field var pRootSignature
    #field int CS
    #field int NodeMask
    #field var CachedPSO
    #field int Flags
#endstruct

#defstruct D3D12_CONSTANT_BUFFER_VIEW_DESC
    #field int64 BufferLocation
    #field int SizeInBytes
#endstruct

#defstruct D3D12_CPU_DESCRIPTOR_HANDLE
    #field int ptr
#endstruct

#defstruct D3D12_DEPTH_STENCIL_DESC
    #field int DepthEnable
    #field int DepthWriteMask
    #field int DepthFunc
    #field int StencilEnable
    #field int StencilReadMask
    #field int StencilWriteMask
    #field int FrontFace
    #field int BackFace
#endstruct

#defstruct D3D12_DEPTH_STENCIL_VALUE
    #field float Depth
    #field int Stencil
#endstruct

#defstruct D3D12_DEPTH_STENCIL_VIEW_DESC
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

#defstruct D3D12_DEPTH_STENCILOP_DESC
    #field int StencilFailOp
    #field int StencilDepthFailOp
    #field int StencilPassOp
    #field int StencilFunc
#endstruct

#defstruct D3D12_DESCRIPTOR_HEAP_DESC
    #field int Type
    #field int NumDescriptors
    #field int Flags
    #field int NodeMask
#endstruct

#defstruct D3D12_GRAPHICS_PIPELINE_STATE_DESC
    #field var pRootSignature
    #field int VS
    #field int PS
    #field int DS
    #field int HS
    #field int GS
    #field int StreamOutput
    #field var BlendState
    #field int SampleMask
    #field int RasterizerState
    #field var DepthStencilState
    #field int InputLayout
    #field int IBStripCutValue
    #field int PrimitiveTopologyType
    #field int NumRenderTargets
    #field int RTVFormats
    #field int DSVFormat
    #field int SampleDesc
    #field int NodeMask
    #field var CachedPSO
    #field int Flags
#endstruct

#defstruct D3D12_HEAP_DESC
    #field int64 SizeInBytes
    #field int Properties
    #field int64 Alignment
    #field int Flags
#endstruct

#defstruct D3D12_HEAP_PROPERTIES
    #field int Type
    #field int CPUPageProperty
    #field int MemoryPoolPreference
    #field int CreationNodeMask
    #field int VisibleNodeMask
#endstruct

#defstruct D3D12_INDIRECT_ARGUMENT_DESC
    #field int Type
    #field var Anonymous
    #field int VertexBuffer
    #field int Constant
    #field int ConstantBufferView
    #field int ShaderResourceView
    #field int UnorderedAccessView
    #field int IncrementingConstant
    #field int Slot
    #field int RootParameterIndex
    #field int DestOffsetIn32BitValues
    #field int Num32BitValuesToSet
    #field int RootParameterIndex
    #field int RootParameterIndex
    #field int RootParameterIndex
    #field int RootParameterIndex
    #field int DestOffsetIn32BitValues
#endstruct

#defstruct W_VertexBuffer_e__Struct
    #field int Slot
#endstruct

#defstruct W_Constant_e__Struct
    #field int RootParameterIndex
    #field int DestOffsetIn32BitValues
    #field int Num32BitValuesToSet
#endstruct

#defstruct W_ConstantBufferView_e__Struct
    #field int RootParameterIndex
#endstruct

#defstruct W_ShaderResourceView_e__Struct
    #field int RootParameterIndex
#endstruct

#defstruct W_UnorderedAccessView_e__Struct
    #field int RootParameterIndex
#endstruct

#defstruct W_IncrementingConstant_e__Struct
    #field int RootParameterIndex
    #field int DestOffsetIn32BitValues
#endstruct

#defstruct D3D12_INPUT_ELEMENT_DESC
    #field str SemanticName
    #field int SemanticIndex
    #field int Format
    #field int InputSlot
    #field int AlignedByteOffset
    #field int InputSlotClass
    #field int InstanceDataStepRate
#endstruct

#defstruct D3D12_INPUT_LAYOUT_DESC
    #field var pInputElementDescs
    #field int NumElements
#endstruct

#defstruct D3D12_PACKED_MIP_INFO
    #field int NumStandardMips
    #field int NumPackedMips
    #field int NumTilesForPackedMips
    #field int StartTileIndexInOverallResource
#endstruct

#defstruct D3D12_PLACED_SUBRESOURCE_FOOTPRINT
    #field int64 Offset
    #field int Footprint
#endstruct

#defstruct D3D12_QUERY_HEAP_DESC
    #field int Type
    #field int Count
    #field int NodeMask
#endstruct

#defstruct D3D12_RANGE
    #field int Begin
    #field int End_
#endstruct

#defstruct D3D12_RASTERIZER_DESC
    #field int FillMode
    #field int CullMode
    #field int FrontCounterClockwise
    #field int DepthBias
    #field float DepthBiasClamp
    #field float SlopeScaledDepthBias
    #field int DepthClipEnable
    #field int MultisampleEnable
    #field int AntialiasedLineEnable
    #field int ForcedSampleCount
    #field int ConservativeRaster
#endstruct

#defstruct D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV
    #field int64 Location
#endstruct

#defstruct D3D12_RENDER_TARGET_BLEND_DESC
    #field int BlendEnable
    #field int LogicOpEnable
    #field int SrcBlend
    #field int DestBlend
    #field int BlendOp
    #field int SrcBlendAlpha
    #field int DestBlendAlpha
    #field int BlendOpAlpha
    #field int LogicOp
    #field int RenderTargetWriteMask
#endstruct

#defstruct D3D12_RENDER_TARGET_VIEW_DESC
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

#defstruct D3D12_RESOURCE_ALLOCATION_INFO
    #field int64 SizeInBytes
    #field int64 Alignment
#endstruct

#defstruct D3D12_RESOURCE_DESC
    #field int Dimension
    #field int64 Alignment
    #field int64 Width
    #field int Height
    #field int DepthOrArraySize
    #field int MipLevels
    #field int Format
    #field int SampleDesc
    #field int Layout
    #field int Flags
#endstruct

#defstruct D3D12_SAMPLER_DESC
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

#defstruct D3D12_SHADER_BYTECODE
    #field var pShaderBytecode
    #field int BytecodeLength
#endstruct

#defstruct D3D12_SHADER_RESOURCE_VIEW_DESC
    #field int Format
    #field int ViewDimension
    #field int Shader4ComponentMapping
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
    #field var RaytracingAccelerationStructure
#endstruct

#defstruct D3D12_SO_DECLARATION_ENTRY
    #field int Stream
    #field str SemanticName
    #field int SemanticIndex
    #field int StartComponent
    #field int ComponentCount
    #field int OutputSlot
#endstruct

#defstruct D3D12_STREAM_OUTPUT_DESC
    #field var pSODeclaration
    #field int NumEntries
    #field var pBufferStrides
    #field int NumStrides
    #field int RasterizedStream
#endstruct

#defstruct D3D12_SUBRESOURCE_FOOTPRINT
    #field int Format
    #field int Width
    #field int Height
    #field int Depth
    #field int RowPitch
#endstruct

#defstruct D3D12_SUBRESOURCE_TILING
    #field int WidthInTiles
    #field int HeightInTiles
    #field int DepthInTiles
    #field int StartTileIndexInOverallResource
#endstruct

#defstruct D3D12_TEX1D_ARRAY_DSV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D12_TEX1D_ARRAY_RTV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D12_TEX1D_ARRAY_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field int FirstArraySlice
    #field int ArraySize
    #field float ResourceMinLODClamp
#endstruct

#defstruct D3D12_TEX1D_ARRAY_UAV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D12_TEX1D_DSV
    #field int MipSlice
#endstruct

#defstruct D3D12_TEX1D_RTV
    #field int MipSlice
#endstruct

#defstruct D3D12_TEX1D_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field float ResourceMinLODClamp
#endstruct

#defstruct D3D12_TEX1D_UAV
    #field int MipSlice
#endstruct

#defstruct D3D12_TEX2D_ARRAY_DSV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D12_TEX2D_ARRAY_RTV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
    #field int PlaneSlice
#endstruct

#defstruct D3D12_TEX2D_ARRAY_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field int FirstArraySlice
    #field int ArraySize
    #field int PlaneSlice
    #field float ResourceMinLODClamp
#endstruct

#defstruct D3D12_TEX2D_ARRAY_UAV
    #field int MipSlice
    #field int FirstArraySlice
    #field int ArraySize
    #field int PlaneSlice
#endstruct

#defstruct D3D12_TEX2D_DSV
    #field int MipSlice
#endstruct

#defstruct D3D12_TEX2D_RTV
    #field int MipSlice
    #field int PlaneSlice
#endstruct

#defstruct D3D12_TEX2D_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field int PlaneSlice
    #field float ResourceMinLODClamp
#endstruct

#defstruct D3D12_TEX2D_UAV
    #field int MipSlice
    #field int PlaneSlice
#endstruct

#defstruct D3D12_TEX2DMS_ARRAY_DSV
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D12_TEX2DMS_ARRAY_RTV
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D12_TEX2DMS_ARRAY_SRV
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D12_TEX2DMS_ARRAY_UAV
    #field int FirstArraySlice
    #field int ArraySize
#endstruct

#defstruct D3D12_TEX2DMS_DSV
    #field int UnusedField_NothingToDefine
#endstruct

#defstruct D3D12_TEX2DMS_RTV
    #field int UnusedField_NothingToDefine
#endstruct

#defstruct D3D12_TEX2DMS_SRV
    #field int UnusedField_NothingToDefine
#endstruct

#defstruct D3D12_TEX2DMS_UAV
    #field int UnusedField_NothingToDefine
#endstruct

#defstruct D3D12_TEX3D_RTV
    #field int MipSlice
    #field int FirstWSlice
    #field int WSize
#endstruct

#defstruct D3D12_TEX3D_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field float ResourceMinLODClamp
#endstruct

#defstruct D3D12_TEX3D_UAV
    #field int MipSlice
    #field int FirstWSlice
    #field int WSize
#endstruct

#defstruct D3D12_TEXCUBE_ARRAY_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field int First2DArrayFace
    #field int NumCubes
    #field float ResourceMinLODClamp
#endstruct

#defstruct D3D12_TEXCUBE_SRV
    #field int MostDetailedMip
    #field int MipLevels
    #field float ResourceMinLODClamp
#endstruct

#defstruct D3D12_TILE_SHAPE
    #field int WidthInTexels
    #field int HeightInTexels
    #field int DepthInTexels
#endstruct

#defstruct D3D12_UNORDERED_ACCESS_VIEW_DESC
    #field int Format
    #field int ViewDimension
    #field var Anonymous
    #field var Buffer
    #field var Texture1D
    #field var Texture1DArray
    #field var Texture2D
    #field var Texture2DArray
    #field var Texture2DMS
    #field var Texture2DMSArray
    #field var Texture3D
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

#defstruct W_Anonymous3_e__Union
    #field intptr hbmHeader
    #field wstr pszbmHeader
#endstruct

#defstruct W_Anonymous4_e__Union
    #field intptr hbmWatermark
    #field wstr pszbmWatermark
#endstruct

#defstruct W_Anonymous5_e__Union
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

#defstruct W_MultiSampleCaps_e__Struct
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

#defstruct W_u_e__Union
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

#defstruct W_AdditionalSignalInfo_e__Struct
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

#defstruct W_Class_e__Struct
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

#defstruct W_AttributeType_e__Union
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

#defstruct W_FromMemory_e__Struct
    #field var pBuffer
    #field int BufferLength
#endstruct

#defstruct W_FromFileHandle_e__Struct
    #field var ByteRange
    #field intptr FileHandle
#endstruct

#defstruct W_FromFragmentCache_e__Struct
    #field int FragmentNameLength
    #field wstr pFragmentName
#endstruct

#defstruct W_FromFragmentCacheEx_e__Struct
    #field var ByteRange
    #field wstr pFragmentName
#endstruct

#defstruct W_Trailers_e__Struct
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

#defstruct W_Misc_e__Union
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

#defstruct W_S_un_e__Union
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

#defstruct W_S_un_b_e__Struct
    #field int s_b1
    #field int s_b2
    #field int s_b3
    #field int s_b4
#endstruct

#defstruct W_S_un_w_e__Struct
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

#defstruct W_Event_e__Union
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

#defstruct W_lfFont_e__Union
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

#defstruct W_AppName_e__Struct
    #field wstr Name
#endstruct

#defstruct W_COMClass_e__Struct
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
    #field var Next_
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
    #field var Next_
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
    #field var Next_
    #field int Address
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Flags
#endstruct

#defstruct IP_ADAPTER_DNS_SERVER_ADDRESS_XP
    #field var Anonymous
    #field var Next_
    #field int Address
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Reserved
#endstruct

#defstruct IP_ADAPTER_DNS_SUFFIX
    #field var Next_
    #field int String
#endstruct

#defstruct IP_ADAPTER_GATEWAY_ADDRESS_LH
    #field var Anonymous
    #field var Next_
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
    #field var Next_
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
    #field var Next_
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
    #field var Next_
    #field int Address
    #field int PrefixLength
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Flags
#endstruct

#defstruct IP_ADAPTER_UNICAST_ADDRESS_LH
    #field var Anonymous
    #field var Next_
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
    #field var Next_
    #field int Address
    #field int64 Alignment
    #field var Anonymous
    #field int Length
    #field int Reserved
#endstruct

#defstruct IP_ADDR_STRING
    #field var Next_
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

#defstruct W_uChar_e__Union
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

#defstruct W_HighWord_e__Union
    #field int Bytes
    #field int Bits
    #field int BaseMid
    #field int Flags1
    #field int Flags2
    #field int BaseHi
    #field int _bitfield
#endstruct

#defstruct W_Bytes_e__Struct
    #field int BaseMid
    #field int Flags1
    #field int Flags2
    #field int BaseHi
#endstruct

#defstruct W_Bits_e__Struct
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

#defstruct W_ForestTrustData_e__Union
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

#defstruct MF_SINK_WRITER_STATISTICS
    #field int cb
    #field int64 llLastTimestampReceived
    #field int64 llLastTimestampEncoded
    #field int64 llLastTimestampProcessed
    #field int64 llLastStreamTickReceived
    #field int64 llLastSinkSampleRequest
    #field int64 qwNumSamplesReceived
    #field int64 qwNumSamplesEncoded
    #field int64 qwNumSamplesProcessed
    #field int64 qwNumStreamTicksReceived
    #field int dwByteCountQueued
    #field int64 qwByteCountProcessed
    #field int dwNumOutstandingSinkSampleRequests
    #field int dwAverageSampleRateReceived
    #field int dwAverageSampleRateEncoded
    #field int dwAverageSampleRateProcessed
#endstruct

#defstruct MFARGB
    #field int rgbBlue
    #field int rgbGreen
    #field int rgbRed
    #field int rgbAlpha
#endstruct

#defstruct MFAYUVSample
    #field int bCrValue
    #field int bCbValue
    #field int bYValue
    #field int bSampleAlpha8
#endstruct

#defstruct MFCLOCK_PROPERTIES
    #field int64 qwCorrelationRate
    #field int dwClockFlags
    #field int64 qwClockFrequency
    #field int dwClockTolerance
    #field int dwClockJitter
#endstruct

#defstruct MFOffset
    #field int fract
    #field int value
#endstruct

#defstruct MFPaletteEntry
    #field var ARGB
    #field var AYCbCr
#endstruct

#defstruct MFRatio
    #field int Numerator
    #field int Denominator
#endstruct

#defstruct MFVideoArea
    #field var OffsetX
    #field var OffsetY
    #field int Area
#endstruct

#defstruct MFVideoCompressedInfo
    #field int64 AvgBitrate
    #field int64 AvgBitErrorRate
    #field int MaxKeyFrameSpacing
#endstruct

#defstruct MFVIDEOFORMAT
    #field int dwSize
    #field int videoInfo
    #field var compressedInfo
    #field int surfaceInfo
#endstruct

#defstruct MFVideoInfo
    #field int dwWidth
    #field int dwHeight
    #field var PixelAspectRatio
    #field int SourceChromaSubsampling
    #field int InterlaceMode
    #field int TransferFunction
    #field int ColorPrimaries
    #field int TransferMatrix
    #field int SourceLighting
    #field var FramesPerSecond
    #field int NominalRange
    #field var GeometricAperture
    #field var MinimumDisplayAperture
    #field var PanScanAperture
    #field int64 VideoFlags
#endstruct

#defstruct MFVideoSurfaceInfo
    #field int Format
    #field int PaletteEntries
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

#defstruct W_InterfaceAndOperStatusFlags_e__Struct
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

#defstruct W_ReachabilityTime_e__Union
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

#defstruct W_Bounds_e__Union
    #field var Anonymous1
    #field var Anonymous2
    #field int dwReserved
    #field int lMinimum
    #field int lMaximum
    #field int dwMinimum
    #field int dwMaximum
#endstruct

#defstruct W_Metrics_e__Union
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

#defstruct W_Target_e__Struct
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

#defstruct W_smpte_e__Struct
    #field int hour
    #field int min
    #field int sec
    #field int frame
    #field int fps
    #field int dummy
    #field int pad
#endstruct

#defstruct W_midi_e__Struct
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

#defstruct MPEG1VIDEOINFO
    #field int hdr
    #field int dwStartTimeCode
    #field int cbSequenceHeader
#endstruct

#defstruct MPEG2VIDEOINFO
    #field int hdr
    #field int dwStartTimeCode
    #field int cbSequenceHeader
    #field int dwProfile
    #field int dwLevel
    #field int dwFlags
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

#defstruct W_NamedAddress_e__Struct
    #field int Address
    #field int Port
#endstruct

#defstruct NET_LUID_LH
    #field int64 Value
    #field int Info
    #field int64 _bitfield
#endstruct

#defstruct W_Info_e__Struct
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

#defstruct W_bmp_e__Struct
    #field intptr hbitmap
    #field intptr hpal
#endstruct

#defstruct W_wmf_e__Struct
    #field intptr hmeta
    #field int xExt
    #field int yExt
#endstruct

#defstruct W_icon_e__Struct
    #field intptr hicon
#endstruct

#defstruct W_emf_e__Struct
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

#defstruct W_Block_e__Struct
    #field intptr hMem
    #field int dwReserved
#endstruct

#defstruct W_Region_e__Struct
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

#defstruct W_data_e__Union
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

#defstruct W_Reason_e__Union
    #field int Detailed
    #field wstr SimpleReasonString
    #field intptr LocalizedReasonModule
    #field int LocalizedReasonId
    #field int ReasonStringCount
    #field var ReasonStrings
#endstruct

#defstruct W_Detailed_e__Struct
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

#defstruct W_ProcessorCore_e__Struct
    #field int Flags
#endstruct

#defstruct W_NumaNode_e__Struct
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

#defstruct W_s_e__Struct
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

#defstruct W_VersionDetail_e__Struct
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

#defstruct W_tagged_union_e__Struct
    #field wstr pFileExt
    #field wstr pMimeType
    #field wstr pProgId
    #field wstr pFileName
    #field int ByName
    #field int ByObjectId
    #field wstr pPackageName
#endstruct

#defstruct W_ByName_e__Struct
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

#defstruct VIDEOINFOHEADER
    #field var rcSource
    #field var rcTarget
    #field int dwBitRate
    #field int dwBitErrorRate
    #field int64 AvgTimePerFrame
    #field var bmiHeader
#endstruct

#defstruct VIDEOINFOHEADER2
    #field var rcSource
    #field var rcTarget
    #field int dwBitRate
    #field int dwBitErrorRate
    #field int64 AvgTimePerFrame
    #field int dwInterlaceFlags
    #field int dwCopyProtectFlags
    #field int dwPictAspectRatioX
    #field int dwPictAspectRatioY
    #field var Anonymous
    #field int dwReserved2
    #field var bmiHeader
    #field int dwControlFlags
    #field int dwReserved1
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

#defstruct W_LockObject_e__Struct
    #field int ObjectName
    #field int64 Timeout
    #field int Alertable
#endstruct

#defstruct W_ThreadObject_e__Struct
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

#defstruct WM_MEDIA_TYPE
    #field int bFixedSizeSamples
    #field int bTemporalCompression
    #field int lSampleSize
    #field var pUnk
    #field int cbFormat
    #field var pbFormat
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

#defstruct W_Parameters_e__Union
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

#defstruct W_WindowMessage_e__Struct
    #field intptr hWnd
    #field int uMsg
    #field intptr context
#endstruct

#defstruct W_Port_e__Struct
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

#defstruct GdipColorMap
    #field var oldColor
    #field var newColor
#endstruct

#defstruct GdipRect
    #field int X
    #field int Y
    #field int Width
    #field int Height
#endstruct

;--- enums / constants ---
; D3DDDI_COLOR_SPACE_TYPE
#define global D3DDDI_COLOR_SPACE_RGB_FULL_G22_NONE_P709  0x0
#define global D3DDDI_COLOR_SPACE_RGB_FULL_G10_NONE_P709  0x1
#define global D3DDDI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709  0x2
#define global D3DDDI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020  0x3
#define global D3DDDI_COLOR_SPACE_RESERVED  0x4
#define global D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601  0x5
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601  0x6
#define global D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601  0x7
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709  0x8
#define global D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709  0x9
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020  0xa
#define global D3DDDI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020  0xb
#define global D3DDDI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020  0xc
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G2084_LEFT_P2020  0xd
#define global D3DDDI_COLOR_SPACE_RGB_STUDIO_G2084_NONE_P2020  0xe
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G22_TOPLEFT_P2020  0xf
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G2084_TOPLEFT_P2020  0x10
#define global D3DDDI_COLOR_SPACE_RGB_FULL_G22_NONE_P2020  0x11
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020  0x12
#define global D3DDDI_COLOR_SPACE_YCBCR_FULL_GHLG_TOPLEFT_P2020  0x13
#define global D3DDDI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P709  0x14
#define global D3DDDI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P2020  0x15
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P709  0x16
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P2020  0x17
#define global D3DDDI_COLOR_SPACE_YCBCR_STUDIO_G24_TOPLEFT_P2020  0x18
#define global D3DDDI_COLOR_SPACE_CUSTOM  -1

; D3DDDI_FLIPINTERVAL_TYPE
#define global D3DDDI_FLIPINTERVAL_IMMEDIATE  0x0
#define global D3DDDI_FLIPINTERVAL_ONE  0x1
#define global D3DDDI_FLIPINTERVAL_TWO  0x2
#define global D3DDDI_FLIPINTERVAL_THREE  0x3
#define global D3DDDI_FLIPINTERVAL_FOUR  0x4
#define global D3DDDI_FLIPINTERVAL_IMMEDIATE_ALLOW_TEARING  0x5

; D3DDDI_GAMMARAMP_TYPE
#define global D3DDDI_GAMMARAMP_UNINITIALIZED  0x0
#define global D3DDDI_GAMMARAMP_DEFAULT  0x1
#define global D3DDDI_GAMMARAMP_RGB256x3x16  0x2
#define global D3DDDI_GAMMARAMP_DXGI_1  0x3
#define global D3DDDI_GAMMARAMP_MATRIX_3x4  0x4
#define global D3DDDI_GAMMARAMP_MATRIX_V2  0x5

; D3DDDI_HDR_METADATA_TYPE
#define global D3DDDI_HDR_METADATA_TYPE_NONE  0x0
#define global D3DDDI_HDR_METADATA_TYPE_HDR10  0x1
#define global D3DDDI_HDR_METADATA_TYPE_HDR10PLUS  0x2

; D3DDDI_ROTATION
#define global D3DDDI_ROTATION_IDENTITY  0x1
#define global D3DDDI_ROTATION_90  0x2
#define global D3DDDI_ROTATION_180  0x3
#define global D3DDDI_ROTATION_270  0x4

; D3DDDI_SYNCHRONIZATIONOBJECT_TYPE
#define global D3DDDI_SYNCHRONIZATION_MUTEX  0x1
#define global D3DDDI_SEMAPHORE  0x2
#define global D3DDDI_FENCE  0x3
#define global D3DDDI_CPU_NOTIFICATION  0x4
#define global D3DDDI_MONITORED_FENCE  0x5
#define global D3DDDI_PERIODIC_MONITORED_FENCE  0x6
#define global D3DDDI_SYNCHRONIZATION_TYPE_LIMIT  0x7

; D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING
#define global D3DDDI_VSSLO_UNINITIALIZED  0x0
#define global D3DDDI_VSSLO_PROGRESSIVE  0x1
#define global D3DDDI_VSSLO_INTERLACED_UPPERFIELDFIRST  0x2
#define global D3DDDI_VSSLO_INTERLACED_LOWERFIELDFIRST  0x3
#define global D3DDDI_VSSLO_OTHER  0xff

; D3DDDIFORMAT
#define global D3DDDIFMT_UNKNOWN  0x0
#define global D3DDDIFMT_R8G8B8  0x14
#define global D3DDDIFMT_A8R8G8B8  0x15
#define global D3DDDIFMT_X8R8G8B8  0x16
#define global D3DDDIFMT_R5G6B5  0x17
#define global D3DDDIFMT_X1R5G5B5  0x18
#define global D3DDDIFMT_A1R5G5B5  0x19
#define global D3DDDIFMT_A4R4G4B4  0x1a
#define global D3DDDIFMT_R3G3B2  0x1b
#define global D3DDDIFMT_A8  0x1c
#define global D3DDDIFMT_A8R3G3B2  0x1d
#define global D3DDDIFMT_X4R4G4B4  0x1e
#define global D3DDDIFMT_A2B10G10R10  0x1f
#define global D3DDDIFMT_A8B8G8R8  0x20
#define global D3DDDIFMT_X8B8G8R8  0x21
#define global D3DDDIFMT_G16R16  0x22
#define global D3DDDIFMT_A2R10G10B10  0x23
#define global D3DDDIFMT_A16B16G16R16  0x24
#define global D3DDDIFMT_A8P8  0x28
#define global D3DDDIFMT_P8  0x29
#define global D3DDDIFMT_L8  0x32
#define global D3DDDIFMT_A8L8  0x33
#define global D3DDDIFMT_A4L4  0x34
#define global D3DDDIFMT_V8U8  0x3c
#define global D3DDDIFMT_L6V5U5  0x3d
#define global D3DDDIFMT_X8L8V8U8  0x3e
#define global D3DDDIFMT_Q8W8V8U8  0x3f
#define global D3DDDIFMT_V16U16  0x40
#define global D3DDDIFMT_W11V11U10  0x41
#define global D3DDDIFMT_A2W10V10U10  0x43
#define global D3DDDIFMT_UYVY  0x59565955
#define global D3DDDIFMT_R8G8_B8G8  0x47424752
#define global D3DDDIFMT_YUY2  0x32595559
#define global D3DDDIFMT_G8R8_G8B8  0x42475247
#define global D3DDDIFMT_DXT1  0x31545844
#define global D3DDDIFMT_DXT2  0x32545844
#define global D3DDDIFMT_DXT3  0x33545844
#define global D3DDDIFMT_DXT4  0x34545844
#define global D3DDDIFMT_DXT5  0x35545844
#define global D3DDDIFMT_D16_LOCKABLE  0x46
#define global D3DDDIFMT_D32  0x47
#define global D3DDDIFMT_D15S1  0x49
#define global D3DDDIFMT_D24S8  0x4b
#define global D3DDDIFMT_D24X8  0x4d
#define global D3DDDIFMT_D24X4S4  0x4f
#define global D3DDDIFMT_D16  0x50
#define global D3DDDIFMT_D32F_LOCKABLE  0x52
#define global D3DDDIFMT_D24FS8  0x53
#define global D3DDDIFMT_D32_LOCKABLE  0x54
#define global D3DDDIFMT_S8_LOCKABLE  0x55
#define global D3DDDIFMT_S1D15  0x48
#define global D3DDDIFMT_S8D24  0x4a
#define global D3DDDIFMT_X8D24  0x4c
#define global D3DDDIFMT_X4S4D24  0x4e
#define global D3DDDIFMT_L16  0x51
#define global D3DDDIFMT_G8R8  0x5b
#define global D3DDDIFMT_R8  0x5c
#define global D3DDDIFMT_VERTEXDATA  0x64
#define global D3DDDIFMT_INDEX16  0x65
#define global D3DDDIFMT_INDEX32  0x66
#define global D3DDDIFMT_Q16W16V16U16  0x6e
#define global D3DDDIFMT_MULTI2_ARGB8  0x3154454d
#define global D3DDDIFMT_R16F  0x6f
#define global D3DDDIFMT_G16R16F  0x70
#define global D3DDDIFMT_A16B16G16R16F  0x71
#define global D3DDDIFMT_R32F  0x72
#define global D3DDDIFMT_G32R32F  0x73
#define global D3DDDIFMT_A32B32G32R32F  0x74
#define global D3DDDIFMT_CxV8U8  0x75
#define global D3DDDIFMT_A1  0x76
#define global D3DDDIFMT_A2B10G10R10_XR_BIAS  0x77
#define global D3DDDIFMT_DXVACOMPBUFFER_BASE  0x96
#define global D3DDDIFMT_PICTUREPARAMSDATA  0x96
#define global D3DDDIFMT_MACROBLOCKDATA  0x97
#define global D3DDDIFMT_RESIDUALDIFFERENCEDATA  0x98
#define global D3DDDIFMT_DEBLOCKINGDATA  0x99
#define global D3DDDIFMT_INVERSEQUANTIZATIONDATA  0x9a
#define global D3DDDIFMT_SLICECONTROLDATA  0x9b
#define global D3DDDIFMT_BITSTREAMDATA  0x9c
#define global D3DDDIFMT_MOTIONVECTORBUFFER  0x9d
#define global D3DDDIFMT_FILMGRAINBUFFER  0x9e
#define global D3DDDIFMT_DXVA_RESERVED9  0x9f
#define global D3DDDIFMT_DXVA_RESERVED10  0xa0
#define global D3DDDIFMT_DXVA_RESERVED11  0xa1
#define global D3DDDIFMT_DXVA_RESERVED12  0xa2
#define global D3DDDIFMT_DXVA_RESERVED13  0xa3
#define global D3DDDIFMT_DXVA_RESERVED14  0xa4
#define global D3DDDIFMT_DXVA_RESERVED15  0xa5
#define global D3DDDIFMT_DXVA_RESERVED16  0xa6
#define global D3DDDIFMT_DXVA_RESERVED17  0xa7
#define global D3DDDIFMT_DXVA_RESERVED18  0xa8
#define global D3DDDIFMT_DXVA_RESERVED19  0xa9
#define global D3DDDIFMT_DXVA_RESERVED20  0xaa
#define global D3DDDIFMT_DXVA_RESERVED21  0xab
#define global D3DDDIFMT_DXVA_RESERVED22  0xac
#define global D3DDDIFMT_DXVA_RESERVED23  0xad
#define global D3DDDIFMT_DXVA_RESERVED24  0xae
#define global D3DDDIFMT_DXVA_RESERVED25  0xaf
#define global D3DDDIFMT_DXVA_RESERVED26  0xb0
#define global D3DDDIFMT_DXVA_RESERVED27  0xb1
#define global D3DDDIFMT_DXVA_RESERVED28  0xb2
#define global D3DDDIFMT_DXVA_RESERVED29  0xb3
#define global D3DDDIFMT_DXVA_RESERVED30  0xb4
#define global D3DDDIFMT_DXVA_RESERVED31  0xb5
#define global D3DDDIFMT_DXVACOMPBUFFER_MAX  0xb5
#define global D3DDDIFMT_BINARYBUFFER  0xc7

; D3DKMT_ALLOCATIONRESIDENCYSTATUS
#define global D3DKMT_ALLOCATIONRESIDENCYSTATUS_RESIDENTINGPUMEMORY  0x1
#define global D3DKMT_ALLOCATIONRESIDENCYSTATUS_RESIDENTINSHAREDMEMORY  0x2
#define global D3DKMT_ALLOCATIONRESIDENCYSTATUS_NOTRESIDENT  0x3

; D3DKMT_CLIENTHINT
#define global D3DKMT_CLIENTHINT_UNKNOWN  0x0
#define global D3DKMT_CLIENTHINT_OPENGL  0x1
#define global D3DKMT_CLIENTHINT_CDD  0x2
#define global D3DKMT_CLIENTHINT_OPENCL  0x3
#define global D3DKMT_CLIENTHINT_VULKAN  0x4
#define global D3DKMT_CLIENTHINT_CUDA  0x5
#define global D3DKMT_CLIENTHINT_RESERVED  0x6
#define global D3DKMT_CLIENTHINT_DX7  0x7
#define global D3DKMT_CLIENTHINT_DX8  0x8
#define global D3DKMT_CLIENTHINT_DX9  0x9
#define global D3DKMT_CLIENTHINT_DX10  0xa
#define global D3DKMT_CLIENTHINT_DX11  0xb
#define global D3DKMT_CLIENTHINT_DX12  0xc
#define global D3DKMT_CLIENTHINT_9ON12  0xd
#define global D3DKMT_CLIENTHINT_11ON12  0xe
#define global D3DKMT_CLIENTHINT_MFT_ENCODE  0xf
#define global D3DKMT_CLIENTHINT_GLON12  0x10
#define global D3DKMT_CLIENTHINT_CLON12  0x11
#define global D3DKMT_CLIENTHINT_DML_TENSORFLOW  0x12
#define global D3DKMT_CLIENTHINT_ONEAPI_LEVEL0  0x13
#define global D3DKMT_CLIENTHINT_DML_PYTORCH  0x14
#define global D3DKMT_CLIENTHINT_MAX  0x15

; D3DKMT_DEVICEEXECUTION_STATE
#define global D3DKMT_DEVICEEXECUTION_ACTIVE  0x1
#define global D3DKMT_DEVICEEXECUTION_RESET  0x2
#define global D3DKMT_DEVICEEXECUTION_HUNG  0x3
#define global D3DKMT_DEVICEEXECUTION_STOPPED  0x4
#define global D3DKMT_DEVICEEXECUTION_ERROR_OUTOFMEMORY  0x5
#define global D3DKMT_DEVICEEXECUTION_ERROR_DMAFAULT  0x6
#define global D3DKMT_DEVICEEXECUTION_ERROR_DMAPAGEFAULT  0x7

; D3DKMT_DEVICESTATE_TYPE
#define global D3DKMT_DEVICESTATE_EXECUTION  0x1
#define global D3DKMT_DEVICESTATE_PRESENT  0x2
#define global D3DKMT_DEVICESTATE_RESET  0x3
#define global D3DKMT_DEVICESTATE_PRESENT_DWM  0x4
#define global D3DKMT_DEVICESTATE_PAGE_FAULT  0x5
#define global D3DKMT_DEVICESTATE_PRESENT_QUEUE  0x6

; D3DKMT_ESCAPETYPE
#define global D3DKMT_ESCAPE_DRIVERPRIVATE  0x0
#define global D3DKMT_ESCAPE_VIDMM  0x1
#define global D3DKMT_ESCAPE_TDRDBGCTRL  0x2
#define global D3DKMT_ESCAPE_VIDSCH  0x3
#define global D3DKMT_ESCAPE_DEVICE  0x4
#define global D3DKMT_ESCAPE_DMM  0x5
#define global D3DKMT_ESCAPE_DEBUG_SNAPSHOT  0x6
#define global D3DKMT_ESCAPE_DRT_TEST  0x8
#define global D3DKMT_ESCAPE_DIAGNOSTICS  0x9
#define global D3DKMT_ESCAPE_OUTPUTDUPL_SNAPSHOT  0xa
#define global D3DKMT_ESCAPE_OUTPUTDUPL_DIAGNOSTICS  0xb
#define global D3DKMT_ESCAPE_BDD_PNP  0xc
#define global D3DKMT_ESCAPE_BDD_FALLBACK  0xd
#define global D3DKMT_ESCAPE_ACTIVATE_SPECIFIC_DIAG  0xe
#define global D3DKMT_ESCAPE_MODES_PRUNED_OUT  0xf
#define global D3DKMT_ESCAPE_WHQL_INFO  0x10
#define global D3DKMT_ESCAPE_BRIGHTNESS  0x11
#define global D3DKMT_ESCAPE_EDID_CACHE  0x12
#define global D3DKMT_ESCAPE_MIRACAST_DISPLAY_REQUEST  0x14
#define global D3DKMT_ESCAPE_HISTORY_BUFFER_STATUS  0x15
#define global D3DKMT_ESCAPE_MIRACAST_ADAPTER_DIAG_INFO  0x17
#define global D3DKMT_ESCAPE_FORCE_BDDFALLBACK_HEADLESS  0x18
#define global D3DKMT_ESCAPE_REQUEST_MACHINE_CRASH  0x19
#define global D3DKMT_ESCAPE_SOFTGPU_ENABLE_DISABLE_HMD  0x1b
#define global D3DKMT_ESCAPE_PROCESS_VERIFIER_OPTION  0x1c
#define global D3DKMT_ESCAPE_ADAPTER_VERIFIER_OPTION  0x1d
#define global D3DKMT_ESCAPE_IDD_REQUEST  0x1e
#define global D3DKMT_ESCAPE_DOD_SET_DIRTYRECT_MODE  0x1f
#define global D3DKMT_ESCAPE_LOG_CODEPOINT_PACKET  0x20
#define global D3DKMT_ESCAPE_LOG_USERMODE_DAIG_PACKET  0x21
#define global D3DKMT_ESCAPE_GET_EXTERNAL_DIAGNOSTICS  0x22
#define global D3DKMT_ESCAPE_GET_DISPLAY_CONFIGURATIONS  0x24
#define global D3DKMT_ESCAPE_QUERY_IOMMU_STATUS  0x25
#define global D3DKMT_ESCAPE_CCD_DATABASE  0x26
#define global D3DKMT_ESCAPE_QUERY_DMA_REMAPPING_STATUS  0x27
#define global D3DKMT_ESCAPE_WIN32K_START  0x400
#define global D3DKMT_ESCAPE_WIN32K_HIP_DEVICE_INFO  0x400
#define global D3DKMT_ESCAPE_WIN32K_QUERY_CD_ROTATION_BLOCK  0x401
#define global D3DKMT_ESCAPE_WIN32K_DPI_INFO  0x402
#define global D3DKMT_ESCAPE_WIN32K_PRESENTER_VIEW_INFO  0x403
#define global D3DKMT_ESCAPE_WIN32K_SYSTEM_DPI  0x404
#define global D3DKMT_ESCAPE_WIN32K_BDD_FALLBACK  0x405
#define global D3DKMT_ESCAPE_WIN32K_DDA_TEST_CTL  0x406
#define global D3DKMT_ESCAPE_WIN32K_USER_DETECTED_BLACK_SCREEN  0x407
#define global D3DKMT_ESCAPE_WIN32K_DISPBROKER_TEST  0x40b
#define global D3DKMT_ESCAPE_WIN32K_COLOR_PROFILE_INFO  0x40c
#define global D3DKMT_ESCAPE_WIN32K_SET_DIMMED_STATE  0x40d
#define global D3DKMT_ESCAPE_WIN32K_SPECIALIZED_DISPLAY_TEST  0x40e

; D3DKMT_PRESENT_MODEL
#define global D3DKMT_PM_UNINITIALIZED  0x0
#define global D3DKMT_PM_REDIRECTED_GDI  0x1
#define global D3DKMT_PM_REDIRECTED_FLIP  0x2
#define global D3DKMT_PM_REDIRECTED_BLT  0x3
#define global D3DKMT_PM_REDIRECTED_VISTABLT  0x4
#define global D3DKMT_PM_SCREENCAPTUREFENCE  0x5
#define global D3DKMT_PM_REDIRECTED_GDI_SYSMEM  0x6
#define global D3DKMT_PM_REDIRECTED_COMPOSITION  0x7
#define global D3DKMT_PM_SURFACECOMPLETE  0x8
#define global D3DKMT_PM_FLIPMANAGER  0x9

; D3DKMT_STANDARDALLOCATIONTYPE
#define global D3DKMT_STANDARDALLOCATIONTYPE_EXISTINGHEAP  0x1
#define global D3DKMT_STANDARDALLOCATIONTYPE_INTERNALBACKINGSTORE  0x2
#define global D3DKMT_STANDARDALLOCATIONTYPE_MAX  0x3

; D3DKMT_VIDPNSOURCEOWNER_TYPE
#define global D3DKMT_VIDPNSOURCEOWNER_UNOWNED  0x0
#define global D3DKMT_VIDPNSOURCEOWNER_SHARED  0x1
#define global D3DKMT_VIDPNSOURCEOWNER_EXCLUSIVE  0x2
#define global D3DKMT_VIDPNSOURCEOWNER_EXCLUSIVEGDI  0x3
#define global D3DKMT_VIDPNSOURCEOWNER_EMULATED  0x4

; DXGK_PAGE_FAULT_FLAGS
#define global DXGK_PAGE_FAULT_WRITE  0x1
#define global DXGK_PAGE_FAULT_FENCE_INVALID  0x2
#define global DXGK_PAGE_FAULT_ADAPTER_RESET_REQUIRED  0x4
#define global DXGK_PAGE_FAULT_ENGINE_RESET_REQUIRED  0x8
#define global DXGK_PAGE_FAULT_FATAL_HARDWARE_ERROR  0x10
#define global DXGK_PAGE_FAULT_IOMMU  0x20
#define global DXGK_PAGE_FAULT_HW_CONTEXT_VALID  0x40
#define global DXGK_PAGE_FAULT_PROCESS_HANDLE_VALID  0x80

; DXGK_RENDER_PIPELINE_STAGE
#define global DXGK_RENDER_PIPELINE_STAGE_UNKNOWN  0x0
#define global DXGK_RENDER_PIPELINE_STAGE_INPUT_ASSEMBLER  0x1
#define global DXGK_RENDER_PIPELINE_STAGE_VERTEX_SHADER  0x2
#define global DXGK_RENDER_PIPELINE_STAGE_GEOMETRY_SHADER  0x3
#define global DXGK_RENDER_PIPELINE_STAGE_STREAM_OUTPUT  0x4
#define global DXGK_RENDER_PIPELINE_STAGE_RASTERIZER  0x5
#define global DXGK_RENDER_PIPELINE_STAGE_PIXEL_SHADER  0x6
#define global DXGK_RENDER_PIPELINE_STAGE_OUTPUT_MERGER  0x7

; KMTQUERYADAPTERINFOTYPE
#define global KMTQAITYPE_UMDRIVERPRIVATE  0x0
#define global KMTQAITYPE_UMDRIVERNAME  0x1
#define global KMTQAITYPE_UMOPENGLINFO  0x2
#define global KMTQAITYPE_GETSEGMENTSIZE  0x3
#define global KMTQAITYPE_ADAPTERGUID  0x4
#define global KMTQAITYPE_FLIPQUEUEINFO  0x5
#define global KMTQAITYPE_ADAPTERADDRESS  0x6
#define global KMTQAITYPE_SETWORKINGSETINFO  0x7
#define global KMTQAITYPE_ADAPTERREGISTRYINFO  0x8
#define global KMTQAITYPE_CURRENTDISPLAYMODE  0x9
#define global KMTQAITYPE_MODELIST  0xa
#define global KMTQAITYPE_CHECKDRIVERUPDATESTATUS  0xb
#define global KMTQAITYPE_VIRTUALADDRESSINFO  0xc
#define global KMTQAITYPE_DRIVERVERSION  0xd
#define global KMTQAITYPE_ADAPTERTYPE  0xf
#define global KMTQAITYPE_OUTPUTDUPLCONTEXTSCOUNT  0x10
#define global KMTQAITYPE_WDDM_1_2_CAPS  0x11
#define global KMTQAITYPE_UMD_DRIVER_VERSION  0x12
#define global KMTQAITYPE_DIRECTFLIP_SUPPORT  0x13
#define global KMTQAITYPE_MULTIPLANEOVERLAY_SUPPORT  0x14
#define global KMTQAITYPE_DLIST_DRIVER_NAME  0x15
#define global KMTQAITYPE_WDDM_1_3_CAPS  0x16
#define global KMTQAITYPE_MULTIPLANEOVERLAY_HUD_SUPPORT  0x17
#define global KMTQAITYPE_WDDM_2_0_CAPS  0x18
#define global KMTQAITYPE_NODEMETADATA  0x19
#define global KMTQAITYPE_CPDRIVERNAME  0x1a
#define global KMTQAITYPE_XBOX  0x1b
#define global KMTQAITYPE_INDEPENDENTFLIP_SUPPORT  0x1c
#define global KMTQAITYPE_MIRACASTCOMPANIONDRIVERNAME  0x1d
#define global KMTQAITYPE_PHYSICALADAPTERCOUNT  0x1e
#define global KMTQAITYPE_PHYSICALADAPTERDEVICEIDS  0x1f
#define global KMTQAITYPE_DRIVERCAPS_EXT  0x20
#define global KMTQAITYPE_QUERY_MIRACAST_DRIVER_TYPE  0x21
#define global KMTQAITYPE_QUERY_GPUMMU_CAPS  0x22
#define global KMTQAITYPE_QUERY_MULTIPLANEOVERLAY_DECODE_SUPPORT  0x23
#define global KMTQAITYPE_QUERY_HW_PROTECTION_TEARDOWN_COUNT  0x24
#define global KMTQAITYPE_QUERY_ISBADDRIVERFORHWPROTECTIONDISABLED  0x25
#define global KMTQAITYPE_MULTIPLANEOVERLAY_SECONDARY_SUPPORT  0x26
#define global KMTQAITYPE_INDEPENDENTFLIP_SECONDARY_SUPPORT  0x27
#define global KMTQAITYPE_PANELFITTER_SUPPORT  0x28
#define global KMTQAITYPE_PHYSICALADAPTERPNPKEY  0x29
#define global KMTQAITYPE_GETSEGMENTGROUPSIZE  0x2a
#define global KMTQAITYPE_MPO3DDI_SUPPORT  0x2b
#define global KMTQAITYPE_HWDRM_SUPPORT  0x2c
#define global KMTQAITYPE_MPOKERNELCAPS_SUPPORT  0x2d
#define global KMTQAITYPE_MULTIPLANEOVERLAY_STRETCH_SUPPORT  0x2e
#define global KMTQAITYPE_GET_DEVICE_VIDPN_OWNERSHIP_INFO  0x2f
#define global KMTQAITYPE_QUERYREGISTRY  0x30
#define global KMTQAITYPE_KMD_DRIVER_VERSION  0x31
#define global KMTQAITYPE_BLOCKLIST_KERNEL  0x32
#define global KMTQAITYPE_BLOCKLIST_RUNTIME  0x33
#define global KMTQAITYPE_ADAPTERGUID_RENDER  0x34
#define global KMTQAITYPE_ADAPTERADDRESS_RENDER  0x35
#define global KMTQAITYPE_ADAPTERREGISTRYINFO_RENDER  0x36
#define global KMTQAITYPE_CHECKDRIVERUPDATESTATUS_RENDER  0x37
#define global KMTQAITYPE_DRIVERVERSION_RENDER  0x38
#define global KMTQAITYPE_ADAPTERTYPE_RENDER  0x39
#define global KMTQAITYPE_WDDM_1_2_CAPS_RENDER  0x3a
#define global KMTQAITYPE_WDDM_1_3_CAPS_RENDER  0x3b
#define global KMTQAITYPE_QUERY_ADAPTER_UNIQUE_GUID  0x3c
#define global KMTQAITYPE_NODEPERFDATA  0x3d
#define global KMTQAITYPE_ADAPTERPERFDATA  0x3e
#define global KMTQAITYPE_ADAPTERPERFDATA_CAPS  0x3f
#define global KMTQUITYPE_GPUVERSION  0x40
#define global KMTQAITYPE_DRIVER_DESCRIPTION  0x41
#define global KMTQAITYPE_DRIVER_DESCRIPTION_RENDER  0x42
#define global KMTQAITYPE_SCANOUT_CAPS  0x43
#define global KMTQAITYPE_DISPLAY_UMDRIVERNAME  0x47
#define global KMTQAITYPE_PARAVIRTUALIZATION_RENDER  0x44
#define global KMTQAITYPE_SERVICENAME  0x45
#define global KMTQAITYPE_WDDM_2_7_CAPS  0x46
#define global KMTQAITYPE_TRACKEDWORKLOAD_SUPPORT  0x48
#define global KMTQAITYPE_HYBRID_DLIST_DLL_SUPPORT  0x49
#define global KMTQAITYPE_DISPLAY_CAPS  0x4a
#define global KMTQAITYPE_WDDM_2_9_CAPS  0x4b
#define global KMTQAITYPE_CROSSADAPTERRESOURCE_SUPPORT  0x4c
#define global KMTQAITYPE_WDDM_3_0_CAPS  0x4d
#define global KMTQAITYPE_WSAUMDIMAGENAME  0x4e
#define global KMTQAITYPE_VGPUINTERFACEID  0x4f
#define global KMTQAITYPE_WDDM_3_1_CAPS  0x50

; ACCEL_VIRT_FLAGS
#define global FVIRTKEY  0x1
#define global FNOINVERT  0x2
#define global FSHIFT  0x4
#define global FCONTROL  0x8
#define global FALT  0x10

; ACCESS_MODE
#define global NOT_USED_ACCESS  0x0
#define global GRANT_ACCESS  0x1
#define global SET_ACCESS  0x2
#define global DENY_ACCESS  0x3
#define global REVOKE_ACCESS  0x4
#define global SET_AUDIT_SUCCESS  0x5
#define global SET_AUDIT_FAILURE  0x6

; ACE_FLAGS
#define global CONTAINER_INHERIT_ACE  0x2
#define global FAILED_ACCESS_ACE_FLAG  0x80
#define global INHERIT_ONLY_ACE  0x8
#define global INHERITED_ACE  0x10
#define global NO_PROPAGATE_INHERIT_ACE  0x4
#define global OBJECT_INHERIT_ACE  0x1
#define global SUCCESSFUL_ACCESS_ACE_FLAG  0x40
#define global SUB_CONTAINERS_AND_OBJECTS_INHERIT  0x3
#define global SUB_CONTAINERS_ONLY_INHERIT  0x2
#define global SUB_OBJECTS_ONLY_INHERIT  0x1
#define global INHERIT_NO_PROPAGATE  0x4
#define global INHERIT_ONLY  0x8
#define global NO_INHERITANCE  0x0

; ACE_REVISION
#define global ACL_REVISION  0x2
#define global ACL_REVISION_DS  0x4

; ACL_INFORMATION_CLASS
#define global AclRevisionInformation  0x1
#define global AclSizeInformation  0x2

; ACTIVATE_KEYBOARD_LAYOUT_FLAGS
#define global KLF_REORDER  0x8
#define global KLF_RESET  0x40000000
#define global KLF_SETFORPROCESS  0x100
#define global KLF_SHIFTLOCK  0x10000
#define global KLF_ACTIVATE  0x1
#define global KLF_NOTELLSHELL  0x80
#define global KLF_REPLACELANG  0x10
#define global KLF_SUBSTITUTE_OK  0x2

; ACTIVEOBJECT_FLAGS
#define global ACTIVEOBJECT_STRONG  0x0
#define global ACTIVEOBJECT_WEAK  0x1

; ADDRESS_FAMILY
#define global AF_INET  0x2
#define global AF_INET6  0x17
#define global AF_UNSPEC  0x0

; ADDRESS_MODE
#define global AddrMode1616  0x0
#define global AddrMode1632  0x1
#define global AddrModeReal  0x2
#define global AddrModeFlat  0x3

; ADVANCED_FEATURE_FLAGS
#define global FADF_AUTO  0x1
#define global FADF_STATIC  0x2
#define global FADF_EMBEDDED  0x4
#define global FADF_FIXEDSIZE  0x10
#define global FADF_RECORD  0x20
#define global FADF_HAVEIID  0x40
#define global FADF_HAVEVARTYPE  0x80
#define global FADF_BSTR  0x100
#define global FADF_UNKNOWN  0x200
#define global FADF_DISPATCH  0x400
#define global FADF_VARIANT  0x800
#define global FADF_RESERVED  0xf008

; ALG_ID
#define global CALG_MD2  0x8001
#define global CALG_MD4  0x8002
#define global CALG_MD5  0x8003
#define global CALG_SHA  0x8004
#define global CALG_SHA1  0x8004
#define global CALG_MAC  0x8005
#define global CALG_RSA_SIGN  0x2400
#define global CALG_DSS_SIGN  0x2200
#define global CALG_NO_SIGN  0x2000
#define global CALG_RSA_KEYX  0xa400
#define global CALG_DES  0x6601
#define global CALG_3DES_112  0x6609
#define global CALG_3DES  0x6603
#define global CALG_DESX  0x6604
#define global CALG_RC2  0x6602
#define global CALG_RC4  0x6801
#define global CALG_SEAL  0x6802
#define global CALG_DH_SF  0xaa01
#define global CALG_DH_EPHEM  0xaa02
#define global CALG_AGREEDKEY_ANY  0xaa03
#define global CALG_KEA_KEYX  0xaa04
#define global CALG_HUGHES_MD5  0xa003
#define global CALG_SKIPJACK  0x660a
#define global CALG_TEK  0x660b
#define global CALG_CYLINK_MEK  0x660c
#define global CALG_SSL3_SHAMD5  0x8008
#define global CALG_SSL3_MASTER  0x4c01
#define global CALG_SCHANNEL_MASTER_HASH  0x4c02
#define global CALG_SCHANNEL_MAC_KEY  0x4c03
#define global CALG_SCHANNEL_ENC_KEY  0x4c07
#define global CALG_PCT1_MASTER  0x4c04
#define global CALG_SSL2_MASTER  0x4c05
#define global CALG_TLS1_MASTER  0x4c06
#define global CALG_RC5  0x660d
#define global CALG_HMAC  0x8009
#define global CALG_TLS1PRF  0x800a
#define global CALG_HASH_REPLACE_OWF  0x800b
#define global CALG_AES_128  0x660e
#define global CALG_AES_192  0x660f
#define global CALG_AES_256  0x6610
#define global CALG_AES  0x6611
#define global CALG_SHA_256  0x800c
#define global CALG_SHA_384  0x800d
#define global CALG_SHA_512  0x800e
#define global CALG_ECDH  0xaa05
#define global CALG_ECDH_EPHEM  0xae06
#define global CALG_ECMQV  0xa001
#define global CALG_ECDSA  0x2203
#define global CALG_NULLCIPHER  0x6000
#define global CALG_THIRDPARTY_KEY_EXCHANGE  0xb000
#define global CALG_THIRDPARTY_SIGNATURE  0x3000
#define global CALG_THIRDPARTY_CIPHER  0x7000
#define global CALG_THIRDPARTY_HASH  0x9000

; ANIMATE_WINDOW_FLAGS
#define global AW_ACTIVATE  0x20000
#define global AW_BLEND  0x80000
#define global AW_CENTER  0x10
#define global AW_HIDE  0x10000
#define global AW_HOR_POSITIVE  0x1
#define global AW_HOR_NEGATIVE  0x2
#define global AW_SLIDE  0x40000
#define global AW_VER_POSITIVE  0x4
#define global AW_VER_NEGATIVE  0x8

; APP_CACHE_FINALIZE_STATE
#define global AppCacheFinalizeStateIncomplete  0x0
#define global AppCacheFinalizeStateManifestChange  0x1
#define global AppCacheFinalizeStateComplete  0x2

; APP_CACHE_STATE
#define global AppCacheStateNoUpdateNeeded  0x0
#define global AppCacheStateUpdateNeeded  0x1
#define global AppCacheStateUpdateNeededNew  0x2
#define global AppCacheStateUpdateNeededMasterOnly  0x3

; AR_STATE
#define global AR_ENABLED  0x0
#define global AR_DISABLED  0x1
#define global AR_SUPPRESSED  0x2
#define global AR_REMOTESESSION  0x4
#define global AR_MULTIMON  0x8
#define global AR_NOSENSOR  0x10
#define global AR_NOT_SUPPORTED  0x20
#define global AR_DOCKED  0x40
#define global AR_LAPTOP  0x80

; ARC_DIRECTION
#define global AD_COUNTERCLOCKWISE  0x1
#define global AD_CLOCKWISE  0x2

; ASF_SELECTION_STATUS
#define global ASF_STATUS_NOTSELECTED  0x0
#define global ASF_STATUS_CLEANPOINTSONLY  0x1
#define global ASF_STATUS_ALLDATAUNITS  0x2

; ASF_STATUSFLAGS
#define global ASF_STATUSFLAGS_INCOMPLETE  0x1
#define global ASF_STATUSFLAGS_NONFATAL_ERROR  0x2

; ASSOC_FILTER
#define global ASSOC_FILTER_NONE  0x0
#define global ASSOC_FILTER_RECOMMENDED  0x1

; AUDIO_STREAM_CATEGORY
#define global AudioCategory_Other  0x0
#define global AudioCategory_ForegroundOnlyMedia  0x1
#define global AudioCategory_Communications  0x3
#define global AudioCategory_Alerts  0x4
#define global AudioCategory_SoundEffects  0x5
#define global AudioCategory_GameEffects  0x6
#define global AudioCategory_GameMedia  0x7
#define global AudioCategory_GameChat  0x8
#define global AudioCategory_Speech  0x9
#define global AudioCategory_Movie  0xa
#define global AudioCategory_Media  0xb
#define global AudioCategory_FarFieldSpeech  0xc
#define global AudioCategory_UniformSpeech  0xd
#define global AudioCategory_VoiceTyping  0xe

; AUDIT_EVENT_TYPE
#define global AuditEventObjectAccess  0x0
#define global AuditEventDirectoryServiceAccess  0x1

; AVRT_PRIORITY
#define global AVRT_PRIORITY_VERYLOW  -2
#define global AVRT_PRIORITY_LOW  -1
#define global AVRT_PRIORITY_NORMAL  0x0
#define global AVRT_PRIORITY_HIGH  0x1
#define global AVRT_PRIORITY_CRITICAL  0x2

; BACKGROUND_MODE
#define global OPAQUE  0x2
#define global TRANSPARENT  0x1

; BCRYPT_FLAGS
#define global BCRYPT_BLOCK_PADDING  0x1
#define global BCRYPT_PAD_NONE  0x1
#define global BCRYPT_PAD_OAEP  0x4
#define global BCRYPT_PAD_PKCS1  0x2
#define global BCRYPT_PAD_PSS  0x8

; BCRYPT_INTERFACE
#define global BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE  0x3
#define global BCRYPT_CIPHER_INTERFACE  0x1
#define global BCRYPT_HASH_INTERFACE  0x2
#define global BCRYPT_RNG_INTERFACE  0x6
#define global BCRYPT_SECRET_AGREEMENT_INTERFACE  0x4
#define global BCRYPT_SIGNATURE_INTERFACE  0x5
#define global NCRYPT_KEY_STORAGE_INTERFACE  0x10001
#define global NCRYPT_SCHANNEL_INTERFACE  0x10002
#define global NCRYPT_SCHANNEL_SIGNATURE_INTERFACE  0x10003

; BCRYPT_MULTI_OPERATION_TYPE
#define global BCRYPT_OPERATION_TYPE_HASH  0x1

; BCRYPT_OPEN_ALGORITHM_PROVIDER_FLAGS
#define global BCRYPT_ALG_HANDLE_HMAC_FLAG  0x8
#define global BCRYPT_PROV_DISPATCH  0x1
#define global BCRYPT_HASH_REUSABLE_FLAG  0x20

; BCRYPT_OPERATION
#define global BCRYPT_CIPHER_OPERATION  0x1
#define global BCRYPT_HASH_OPERATION  0x2
#define global BCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION  0x4
#define global BCRYPT_SECRET_AGREEMENT_OPERATION  0x8
#define global BCRYPT_SIGNATURE_OPERATION  0x10
#define global BCRYPT_RNG_OPERATION  0x20

; BCRYPT_QUERY_PROVIDER_MODE
#define global CRYPT_ANY  0x4
#define global CRYPT_UM  0x1
#define global CRYPT_KM  0x2
#define global CRYPT_MM  0x3

; BCRYPT_RESOLVE_PROVIDERS_FLAGS
#define global CRYPT_ALL_FUNCTIONS  0x1
#define global CRYPT_ALL_PROVIDERS  0x2

; BCRYPT_TABLE
#define global CRYPT_LOCAL  0x1
#define global CRYPT_DOMAIN  0x2

; BCRYPTGENRANDOM_FLAGS
#define global BCRYPT_RNG_USE_ENTROPY_IN_BUFFER  0x1
#define global BCRYPT_USE_SYSTEM_PREFERRED_RNG  0x2

; BP_ANIMATIONSTYLE
#define global BPAS_NONE  0x0
#define global BPAS_LINEAR  0x1
#define global BPAS_CUBIC  0x2
#define global BPAS_SINE  0x3

; BP_BUFFERFORMAT
#define global BPBF_COMPATIBLEBITMAP  0x0
#define global BPBF_DIB  0x1
#define global BPBF_TOPDOWNDIB  0x2
#define global BPBF_TOPDOWNMONODIB  0x3

; BP_PAINTPARAMS_FLAGS
#define global BPPF_ERASE  0x1
#define global BPPF_NOCLIP  0x2
#define global BPPF_NONCLIENT  0x4

; BROADCAST_SYSTEM_MESSAGE_FLAGS
#define global BSF_ALLOWSFW  0x80
#define global BSF_FLUSHDISK  0x4
#define global BSF_FORCEIFHUNG  0x20
#define global BSF_IGNORECURRENTTASK  0x2
#define global BSF_NOHANG  0x8
#define global BSF_NOTIMEOUTIFNOTHUNG  0x40
#define global BSF_POSTMESSAGE  0x10
#define global BSF_QUERY  0x1
#define global BSF_SENDNOTIFYMESSAGE  0x100
#define global BSF_LUID  0x400
#define global BSF_RETURNHDESK  0x200

; BROADCAST_SYSTEM_MESSAGE_INFO
#define global BSM_ALLCOMPONENTS  0x0
#define global BSM_ALLDESKTOPS  0x10
#define global BSM_APPLICATIONS  0x8

; BRUSH_STYLE
#define global BS_SOLID  0x0
#define global BS_NULL  0x1
#define global BS_HOLLOW  0x1
#define global BS_HATCHED  0x2
#define global BS_PATTERN  0x3
#define global BS_INDEXED  0x4
#define global BS_DIBPATTERN  0x5
#define global BS_DIBPATTERNPT  0x6
#define global BS_PATTERN8X8  0x7
#define global BS_DIBPATTERN8X8  0x8
#define global BS_MONOPATTERN  0x9

; BrushType
#define global BrushTypeSolidColor  0x0
#define global BrushTypeHatchFill  0x1
#define global BrushTypeTextureFill  0x2
#define global BrushTypePathGradient  0x3
#define global BrushTypeLinearGradient  0x4

; CACHE_CONFIG
#define global CACHE_CONFIG_FORCE_CLEANUP_FC  0x20
#define global CACHE_CONFIG_DISK_CACHE_PATHS_FC  0x40
#define global CACHE_CONFIG_SYNC_MODE_FC  0x80
#define global CACHE_CONFIG_CONTENT_PATHS_FC  0x100
#define global CACHE_CONFIG_HISTORY_PATHS_FC  0x400
#define global CACHE_CONFIG_COOKIES_PATHS_FC  0x200
#define global CACHE_CONFIG_QUOTA_FC  0x800
#define global CACHE_CONFIG_USER_MODE_FC  0x1000
#define global CACHE_CONFIG_CONTENT_USAGE_FC  0x2000
#define global CACHE_CONFIG_STICKY_CONTENT_USAGE_FC  0x4000

; CALDATETIME_DATEUNIT
#define global EraUnit  0x0
#define global YearUnit  0x1
#define global MonthUnit  0x2
#define global WeekUnit  0x3
#define global DayUnit  0x4
#define global HourUnit  0x5
#define global MinuteUnit  0x6
#define global SecondUnit  0x7
#define global TickUnit  0x8

; CALLCONV
#define global CC_FASTCALL  0x0
#define global CC_CDECL  0x1
#define global CC_MSCPASCAL  0x2
#define global CC_PASCAL  0x2
#define global CC_MACPASCAL  0x3
#define global CC_STDCALL  0x4
#define global CC_FPFASTCALL  0x5
#define global CC_SYSCALL  0x6
#define global CC_MPWCDECL  0x7
#define global CC_MPWPASCAL  0x8
#define global CC_MAX  0x9

; CASCADE_WINDOWS_HOW
#define global MDITILE_SKIPDISABLED  0x2
#define global MDITILE_ZORDER  0x4

; CDS_TYPE
#define global CDS_FULLSCREEN  0x4
#define global CDS_GLOBAL  0x8
#define global CDS_NORESET  0x10000000
#define global CDS_RESET  0x40000000
#define global CDS_SET_PRIMARY  0x10
#define global CDS_TEST  0x2
#define global CDS_UPDATEREGISTRY  0x1
#define global CDS_VIDEOPARAMETERS  0x20
#define global CDS_ENABLE_UNSAFE_MODES  0x100
#define global CDS_DISABLE_UNSAFE_MODES  0x200
#define global CDS_RESET_EX  0x20000000

; CERT_CHAIN_POLICY_FLAGS
#define global CERT_CHAIN_POLICY_IGNORE_NOT_TIME_VALID_FLAG  0x1
#define global CERT_CHAIN_POLICY_IGNORE_CTL_NOT_TIME_VALID_FLAG  0x2
#define global CERT_CHAIN_POLICY_IGNORE_NOT_TIME_NESTED_FLAG  0x4
#define global CERT_CHAIN_POLICY_IGNORE_ALL_NOT_TIME_VALID_FLAGS  0x7
#define global CERT_CHAIN_POLICY_IGNORE_INVALID_BASIC_CONSTRAINTS_FLAG  0x8
#define global CERT_CHAIN_POLICY_ALLOW_UNKNOWN_CA_FLAG  0x10
#define global CERT_CHAIN_POLICY_IGNORE_WRONG_USAGE_FLAG  0x20
#define global CERT_CHAIN_POLICY_IGNORE_INVALID_NAME_FLAG  0x40
#define global CERT_CHAIN_POLICY_IGNORE_INVALID_POLICY_FLAG  0x80
#define global CERT_CHAIN_POLICY_IGNORE_END_REV_UNKNOWN_FLAG  0x100
#define global CERT_CHAIN_POLICY_IGNORE_CTL_SIGNER_REV_UNKNOWN_FLAG  0x200
#define global CERT_CHAIN_POLICY_IGNORE_CA_REV_UNKNOWN_FLAG  0x400
#define global CERT_CHAIN_POLICY_IGNORE_ROOT_REV_UNKNOWN_FLAG  0x800
#define global CERT_CHAIN_POLICY_IGNORE_ALL_REV_UNKNOWN_FLAGS  0xf00
#define global CERT_CHAIN_POLICY_ALLOW_TESTROOT_FLAG  0x8000
#define global CERT_CHAIN_POLICY_TRUST_TESTROOT_FLAG  0x4000
#define global CERT_CHAIN_POLICY_IGNORE_NOT_SUPPORTED_CRITICAL_EXT_FLAG  0x2000
#define global CERT_CHAIN_POLICY_IGNORE_PEER_TRUST_FLAG  0x1000

; CERT_CONTROL_STORE_FLAGS
#define global CERT_STORE_CTRL_COMMIT_FORCE_FLAG  0x1
#define global CERT_STORE_CTRL_COMMIT_CLEAR_FLAG  0x2
#define global CERT_STORE_CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG  0x1

; CERT_CREATE_SELFSIGN_FLAGS
#define global CERT_CREATE_SELFSIGN_NO_KEY_INFO  0x2
#define global CERT_CREATE_SELFSIGN_NO_SIGN  0x1

; CERT_FIND_CHAIN_IN_STORE_FLAGS
#define global CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG  0x1
#define global CERT_CHAIN_FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG  0x2
#define global CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_FLAG  0x8000
#define global CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG  0x4
#define global CERT_CHAIN_FIND_BY_ISSUER_LOCAL_MACHINE_FLAG  0x8
#define global CERT_CHAIN_FIND_BY_ISSUER_NO_KEY_FLAG  0x4000

; CERT_FIND_FLAGS
#define global CERT_FIND_ANY  0x0
#define global CERT_FIND_CERT_ID  0x100000
#define global CERT_FIND_CTL_USAGE  0xa0000
#define global CERT_FIND_ENHKEY_USAGE  0xa0000
#define global CERT_FIND_EXISTING  0xd0000
#define global CERT_FIND_HASH  0x10000
#define global CERT_FIND_HAS_PRIVATE_KEY  0x150000
#define global CERT_FIND_ISSUER_ATTR  0x30004
#define global CERT_FIND_ISSUER_NAME  0x20004
#define global CERT_FIND_ISSUER_OF  0xc0000
#define global CERT_FIND_ISSUER_STR  0x80004
#define global CERT_FIND_KEY_IDENTIFIER  0xf0000
#define global CERT_FIND_KEY_SPEC  0x90000
#define global CERT_FIND_MD5_HASH  0x40000
#define global CERT_FIND_PROPERTY  0x50000
#define global CERT_FIND_PUBLIC_KEY  0x60000
#define global CERT_FIND_SHA1_HASH  0x10000
#define global CERT_FIND_SIGNATURE_HASH  0xe0000
#define global CERT_FIND_SUBJECT_ATTR  0x30007
#define global CERT_FIND_SUBJECT_CERT  0xb0000
#define global CERT_FIND_SUBJECT_NAME  0x20007
#define global CERT_FIND_SUBJECT_STR  0x80007
#define global CERT_FIND_CROSS_CERT_DIST_POINTS  0x110000
#define global CERT_FIND_PUBKEY_MD5_HASH  0x120000
#define global CERT_FIND_SUBJECT_STR_A  0x70007
#define global CERT_FIND_SUBJECT_STR_W  0x80007
#define global CERT_FIND_ISSUER_STR_A  0x70004
#define global CERT_FIND_ISSUER_STR_W  0x80004
#define global CERT_FIND_SUBJECT_INFO_ACCESS  0x130000
#define global CERT_FIND_HASH_STR  0x140000
#define global CERT_FIND_OPTIONAL_ENHKEY_USAGE_FLAG  0x1
#define global CERT_FIND_EXT_ONLY_ENHKEY_USAGE_FLAG  0x2
#define global CERT_FIND_PROP_ONLY_ENHKEY_USAGE_FLAG  0x4
#define global CERT_FIND_NO_ENHKEY_USAGE_FLAG  0x8
#define global CERT_FIND_OR_ENHKEY_USAGE_FLAG  0x10
#define global CERT_FIND_VALID_ENHKEY_USAGE_FLAG  0x20
#define global CERT_FIND_OPTIONAL_CTL_USAGE_FLAG  0x1
#define global CERT_FIND_EXT_ONLY_CTL_USAGE_FLAG  0x2
#define global CERT_FIND_PROP_ONLY_CTL_USAGE_FLAG  0x4
#define global CERT_FIND_NO_CTL_USAGE_FLAG  0x8
#define global CERT_FIND_OR_CTL_USAGE_FLAG  0x10
#define global CERT_FIND_VALID_CTL_USAGE_FLAG  0x20

; CERT_FIND_TYPE
#define global CTL_FIND_ANY  0x0
#define global CTL_FIND_SHA1_HASH  0x1
#define global CTL_FIND_MD5_HASH  0x2
#define global CTL_FIND_USAGE  0x3
#define global CTL_FIND_SAME_USAGE_FLAG  0x1
#define global CTL_FIND_EXISTING  0x5
#define global CTL_FIND_SUBJECT  0x4

; CERT_KEY_SPEC
#define global AT_KEYEXCHANGE  0x1
#define global AT_SIGNATURE  0x2
#define global CERT_NCRYPT_KEY_SPEC  0xffffffff

; CERT_OPEN_STORE_FLAGS
#define global CERT_STORE_BACKUP_RESTORE_FLAG  0x800
#define global CERT_STORE_CREATE_NEW_FLAG  0x2000
#define global CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG  0x4
#define global CERT_STORE_DELETE_FLAG  0x10
#define global CERT_STORE_ENUM_ARCHIVED_FLAG  0x200
#define global CERT_STORE_MAXIMUM_ALLOWED_FLAG  0x1000
#define global CERT_STORE_NO_CRYPT_RELEASE_FLAG  0x1
#define global CERT_STORE_OPEN_EXISTING_FLAG  0x4000
#define global CERT_STORE_READONLY_FLAG  0x8000
#define global CERT_STORE_SET_LOCALIZED_NAME_FLAG  0x2
#define global CERT_STORE_SHARE_CONTEXT_FLAG  0x80
#define global CERT_STORE_UPDATE_KEYID_FLAG  0x400

; CERT_QUERY_CONTENT_TYPE
#define global CERT_QUERY_CONTENT_CERT  0x1
#define global CERT_QUERY_CONTENT_CTL  0x2
#define global CERT_QUERY_CONTENT_CRL  0x3
#define global CERT_QUERY_CONTENT_SERIALIZED_STORE  0x4
#define global CERT_QUERY_CONTENT_SERIALIZED_CERT  0x5
#define global CERT_QUERY_CONTENT_SERIALIZED_CTL  0x6
#define global CERT_QUERY_CONTENT_SERIALIZED_CRL  0x7
#define global CERT_QUERY_CONTENT_PKCS7_SIGNED  0x8
#define global CERT_QUERY_CONTENT_PKCS7_UNSIGNED  0x9
#define global CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED  0xa
#define global CERT_QUERY_CONTENT_PKCS10  0xb
#define global CERT_QUERY_CONTENT_PFX  0xc
#define global CERT_QUERY_CONTENT_CERT_PAIR  0xd
#define global CERT_QUERY_CONTENT_PFX_AND_LOAD  0xe

; CERT_QUERY_CONTENT_TYPE_FLAGS
#define global CERT_QUERY_CONTENT_FLAG_CERT  0x2
#define global CERT_QUERY_CONTENT_FLAG_CTL  0x4
#define global CERT_QUERY_CONTENT_FLAG_CRL  0x8
#define global CERT_QUERY_CONTENT_FLAG_SERIALIZED_STORE  0x10
#define global CERT_QUERY_CONTENT_FLAG_SERIALIZED_CERT  0x20
#define global CERT_QUERY_CONTENT_FLAG_SERIALIZED_CTL  0x40
#define global CERT_QUERY_CONTENT_FLAG_SERIALIZED_CRL  0x80
#define global CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED  0x100
#define global CERT_QUERY_CONTENT_FLAG_PKCS7_UNSIGNED  0x200
#define global CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED  0x400
#define global CERT_QUERY_CONTENT_FLAG_PKCS10  0x800
#define global CERT_QUERY_CONTENT_FLAG_PFX  0x1000
#define global CERT_QUERY_CONTENT_FLAG_CERT_PAIR  0x2000
#define global CERT_QUERY_CONTENT_FLAG_PFX_AND_LOAD  0x4000
#define global CERT_QUERY_CONTENT_FLAG_ALL  0x3ffe
#define global CERT_QUERY_CONTENT_FLAG_ALL_ISSUER_CERT  0x332

; CERT_QUERY_ENCODING_TYPE
#define global X509_ASN_ENCODING  0x1
#define global PKCS_7_ASN_ENCODING  0x10000

; CERT_QUERY_FORMAT_TYPE
#define global CERT_QUERY_FORMAT_BINARY  0x1
#define global CERT_QUERY_FORMAT_BASE64_ENCODED  0x2
#define global CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED  0x3

; CERT_QUERY_FORMAT_TYPE_FLAGS
#define global CERT_QUERY_FORMAT_FLAG_BINARY  0x2
#define global CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED  0x4
#define global CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED  0x8
#define global CERT_QUERY_FORMAT_FLAG_ALL  0xe

; CERT_QUERY_OBJECT_TYPE
#define global CERT_QUERY_OBJECT_FILE  0x1
#define global CERT_QUERY_OBJECT_BLOB  0x2

; CERT_RDN_ATTR_VALUE_TYPE
#define global CERT_RDN_ANY_TYPE  0x0
#define global CERT_RDN_NUMERIC_STRING  0x3
#define global CERT_RDN_PRINTABLE_STRING  0x4
#define global CERT_RDN_T61_STRING  0x5
#define global CERT_RDN_VIDEOTEX_STRING  0x6
#define global CERT_RDN_IA5_STRING  0x7
#define global CERT_RDN_GRAPHIC_STRING  0x8
#define global CERT_RDN_ISO646_STRING  0x9
#define global CERT_RDN_GENERAL_STRING  0xa
#define global CERT_RDN_INT4_STRING  0xb
#define global CERT_RDN_UNICODE_STRING  0xc
#define global CERT_RDN_BMP_STRING  0xc
#define global CERT_RDN_ENCODED_BLOB  0x1
#define global CERT_RDN_OCTET_STRING  0x2
#define global CERT_RDN_TELETEX_STRING  0x5
#define global CERT_RDN_UNIVERSAL_STRING  0xb
#define global CERT_RDN_UTF8_STRING  0xd
#define global CERT_RDN_VISIBLE_STRING  0x9

; CERT_REVOCATION_STATUS_REASON
#define global CRL_REASON_UNSPECIFIED  0x0
#define global CRL_REASON_KEY_COMPROMISE  0x1
#define global CRL_REASON_CA_COMPROMISE  0x2
#define global CRL_REASON_AFFILIATION_CHANGED  0x3
#define global CRL_REASON_SUPERSEDED  0x4
#define global CRL_REASON_CESSATION_OF_OPERATION  0x5
#define global CRL_REASON_CERTIFICATE_HOLD  0x6
#define global CRL_REASON_REMOVE_FROM_CRL  0x8

; CERT_SELECT_CRITERIA_TYPE
#define global CERT_SELECT_BY_ENHKEY_USAGE  0x1
#define global CERT_SELECT_BY_KEY_USAGE  0x2
#define global CERT_SELECT_BY_POLICY_OID  0x3
#define global CERT_SELECT_BY_PROV_NAME  0x4
#define global CERT_SELECT_BY_EXTENSION  0x5
#define global CERT_SELECT_BY_SUBJECT_HOST_NAME  0x6
#define global CERT_SELECT_BY_ISSUER_ATTR  0x7
#define global CERT_SELECT_BY_SUBJECT_ATTR  0x8
#define global CERT_SELECT_BY_ISSUER_NAME  0x9
#define global CERT_SELECT_BY_PUBLIC_KEY  0xa
#define global CERT_SELECT_BY_TLS_SIGNATURES  0xb

; CERT_STORE_SAVE_AS
#define global CERT_STORE_SAVE_AS_PKCS7  0x2
#define global CERT_STORE_SAVE_AS_STORE  0x1

; CERT_STORE_SAVE_TO
#define global CERT_STORE_SAVE_TO_FILE  0x1
#define global CERT_STORE_SAVE_TO_FILENAME  0x4
#define global CERT_STORE_SAVE_TO_FILENAME_A  0x3
#define global CERT_STORE_SAVE_TO_FILENAME_W  0x4
#define global CERT_STORE_SAVE_TO_MEMORY  0x2

; CERT_STRING_TYPE
#define global CERT_SIMPLE_NAME_STR  0x1
#define global CERT_OID_NAME_STR  0x2
#define global CERT_X500_NAME_STR  0x3

; CERT_STRONG_SIGN_FLAGS
#define global CERT_STRONG_SIGN_ENABLE_CRL_CHECK  0x1
#define global CERT_STRONG_SIGN_ENABLE_OCSP_CHECK  0x2

; CERT_SYSTEM_STORE_FLAGS
#define global CERT_SYSTEM_STORE_LOCATION_MASK  0xff0000
#define global CERT_SYSTEM_STORE_RELOCATE_FLAG  0x80000000

; CHANGE_WINDOW_MESSAGE_FILTER_FLAGS
#define global MSGFLT_ADD  0x1
#define global MSGFLT_REMOVE  0x2

; CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE
#define global CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64  0x1
#define global CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64  0x2
#define global CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING  0x3
#define global CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING  0x10
#define global CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN  0x4
#define global CLAIM_SECURITY_ATTRIBUTE_TYPE_SID  0x5
#define global CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN  0x6

; CLEAR_COMM_ERROR_FLAGS
#define global CE_BREAK  0x10
#define global CE_FRAME  0x8
#define global CE_OVERRUN  0x2
#define global CE_RXOVER  0x1
#define global CE_RXPARITY  0x4

; CLIPBOARD_FORMAT
#define global CF_TEXT  0x1
#define global CF_BITMAP  0x2
#define global CF_METAFILEPICT  0x3
#define global CF_SYLK  0x4
#define global CF_DIF  0x5
#define global CF_TIFF  0x6
#define global CF_OEMTEXT  0x7
#define global CF_DIB  0x8
#define global CF_PALETTE  0x9
#define global CF_PENDATA  0xa
#define global CF_RIFF  0xb
#define global CF_WAVE  0xc
#define global CF_UNICODETEXT  0xd
#define global CF_ENHMETAFILE  0xe
#define global CF_HDROP  0xf
#define global CF_LOCALE  0x10
#define global CF_DIBV5  0x11
#define global CF_MAX  0x12
#define global CF_OWNERDISPLAY  0x80
#define global CF_DSPTEXT  0x81
#define global CF_DSPBITMAP  0x82
#define global CF_DSPMETAFILEPICT  0x83
#define global CF_DSPENHMETAFILE  0x8e
#define global CF_PRIVATEFIRST  0x200
#define global CF_PRIVATELAST  0x2ff
#define global CF_GDIOBJFIRST  0x300
#define global CF_GDIOBJLAST  0x3ff

; CLSCTX
#define global CLSCTX_INPROC_SERVER  0x1
#define global CLSCTX_INPROC_HANDLER  0x2
#define global CLSCTX_LOCAL_SERVER  0x4
#define global CLSCTX_INPROC_SERVER16  0x8
#define global CLSCTX_REMOTE_SERVER  0x10
#define global CLSCTX_INPROC_HANDLER16  0x20
#define global CLSCTX_RESERVED1  0x40
#define global CLSCTX_RESERVED2  0x80
#define global CLSCTX_RESERVED3  0x100
#define global CLSCTX_RESERVED4  0x200
#define global CLSCTX_NO_CODE_DOWNLOAD  0x400
#define global CLSCTX_RESERVED5  0x800
#define global CLSCTX_NO_CUSTOM_MARSHAL  0x1000
#define global CLSCTX_ENABLE_CODE_DOWNLOAD  0x2000
#define global CLSCTX_NO_FAILURE_LOG  0x4000
#define global CLSCTX_DISABLE_AAA  0x8000
#define global CLSCTX_ENABLE_AAA  0x10000
#define global CLSCTX_FROM_DEFAULT_CONTEXT  0x20000
#define global CLSCTX_ACTIVATE_X86_SERVER  0x40000
#define global CLSCTX_ACTIVATE_32_BIT_SERVER  0x40000
#define global CLSCTX_ACTIVATE_64_BIT_SERVER  0x80000
#define global CLSCTX_ENABLE_CLOAKING  0x100000
#define global CLSCTX_APPCONTAINER  0x400000
#define global CLSCTX_ACTIVATE_AAA_AS_IU  0x800000
#define global CLSCTX_RESERVED6  0x1000000
#define global CLSCTX_ACTIVATE_ARM32_SERVER  0x2000000
#define global CLSCTX_ALLOW_LOWER_TRUST_REGISTRATION  0x4000000
#define global CLSCTX_PS_DLL  0x80000000
#define global CLSCTX_ALL  0x17
#define global CLSCTX_SERVER  0x15

; COLOR_MATCH_TO_TARGET_ACTION
#define global CS_ENABLE  0x1
#define global CS_DISABLE  0x2
#define global CS_DELETE_TRANSFORM  0x3

; ColorAdjustType
#define global ColorAdjustTypeDefault  0x0
#define global ColorAdjustTypeBitmap  0x1
#define global ColorAdjustTypeBrush  0x2
#define global ColorAdjustTypePen  0x3
#define global ColorAdjustTypeText  0x4
#define global ColorAdjustTypeCount  0x5
#define global ColorAdjustTypeAny  0x6

; ColorChannelFlags
#define global ColorChannelFlagsC  0x0
#define global ColorChannelFlagsM  0x1
#define global ColorChannelFlagsY  0x2
#define global ColorChannelFlagsK  0x3
#define global ColorChannelFlagsLast  0x4

; ColorMatrixFlags
#define global ColorMatrixFlagsDefault  0x0
#define global ColorMatrixFlagsSkipGrays  0x1
#define global ColorMatrixFlagsAltGray  0x2

; CombineMode
#define global CombineModeReplace  0x0
#define global CombineModeIntersect  0x1
#define global CombineModeUnion  0x2
#define global CombineModeXor  0x3
#define global CombineModeExclude  0x4
#define global CombineModeComplement  0x5

; COMBOBOXINFO_BUTTON_STATE
#define global STATE_SYSTEM_INVISIBLE  0x8000
#define global STATE_SYSTEM_PRESSED  0x8
#define global STATE_SYSTEM_FOCUSABLE  0x100000
#define global STATE_SYSTEM_OFFSCREEN  0x10000
#define global STATE_SYSTEM_UNAVAILABLE  0x1

; COMM_EVENT_MASK
#define global EV_BREAK  0x40
#define global EV_CTS  0x8
#define global EV_DSR  0x10
#define global EV_ERR  0x80
#define global EV_EVENT1  0x800
#define global EV_EVENT2  0x1000
#define global EV_PERR  0x200
#define global EV_RING  0x100
#define global EV_RLSD  0x20
#define global EV_RX80FULL  0x400
#define global EV_RXCHAR  0x1
#define global EV_RXFLAG  0x2
#define global EV_TXEMPTY  0x4

; COMMON_DLG_ERRORS
#define global CDERR_DIALOGFAILURE  0xffff
#define global CDERR_GENERALCODES  0x0
#define global CDERR_STRUCTSIZE  0x1
#define global CDERR_INITIALIZATION  0x2
#define global CDERR_NOTEMPLATE  0x3
#define global CDERR_NOHINSTANCE  0x4
#define global CDERR_LOADSTRFAILURE  0x5
#define global CDERR_FINDRESFAILURE  0x6
#define global CDERR_LOADRESFAILURE  0x7
#define global CDERR_LOCKRESFAILURE  0x8
#define global CDERR_MEMALLOCFAILURE  0x9
#define global CDERR_MEMLOCKFAILURE  0xa
#define global CDERR_NOHOOK  0xb
#define global CDERR_REGISTERMSGFAIL  0xc
#define global PDERR_PRINTERCODES  0x1000
#define global PDERR_SETUPFAILURE  0x1001
#define global PDERR_PARSEFAILURE  0x1002
#define global PDERR_RETDEFFAILURE  0x1003
#define global PDERR_LOADDRVFAILURE  0x1004
#define global PDERR_GETDEVMODEFAIL  0x1005
#define global PDERR_INITFAILURE  0x1006
#define global PDERR_NODEVICES  0x1007
#define global PDERR_NODEFAULTPRN  0x1008
#define global PDERR_DNDMMISMATCH  0x1009
#define global PDERR_CREATEICFAILURE  0x100a
#define global PDERR_PRINTERNOTFOUND  0x100b
#define global PDERR_DEFAULTDIFFERENT  0x100c
#define global CFERR_CHOOSEFONTCODES  0x2000
#define global CFERR_NOFONTS  0x2001
#define global CFERR_MAXLESSTHANMIN  0x2002
#define global FNERR_FILENAMECODES  0x3000
#define global FNERR_SUBCLASSFAILURE  0x3001
#define global FNERR_INVALIDFILENAME  0x3002
#define global FNERR_BUFFERTOOSMALL  0x3003
#define global FRERR_FINDREPLACECODES  0x4000
#define global FRERR_BUFFERLENGTHZERO  0x4001
#define global CCERR_CHOOSECOLORCODES  0x5000

; COMMPROP_STOP_PARITY
#define global STOPBITS_10  0x1
#define global STOPBITS_15  0x2
#define global STOPBITS_20  0x4
#define global PARITY_NONE  0x100
#define global PARITY_ODD  0x200
#define global PARITY_EVEN  0x400
#define global PARITY_MARK  0x800
#define global PARITY_SPACE  0x1000

; COMPARE_STRING_FLAGS
#define global LINGUISTIC_IGNORECASE  0x10
#define global LINGUISTIC_IGNOREDIACRITIC  0x20
#define global NORM_IGNORECASE  0x1
#define global NORM_IGNOREKANATYPE  0x10000
#define global NORM_IGNORENONSPACE  0x2
#define global NORM_IGNORESYMBOLS  0x4
#define global NORM_IGNOREWIDTH  0x20000
#define global NORM_LINGUISTIC_CASING  0x8000000
#define global SORT_DIGITSASNUMBERS  0x8
#define global SORT_STRINGSORT  0x1000

; COMPARESTRING_RESULT
#define global CSTR_LESS_THAN  0x1
#define global CSTR_EQUAL  0x2
#define global CSTR_GREATER_THAN  0x3

; CompositingMode
#define global CompositingModeSourceOver  0x0
#define global CompositingModeSourceCopy  0x1

; CompositingQuality
#define global CompositingQualityInvalid  -1
#define global CompositingQualityDefault  0x0
#define global CompositingQualityHighSpeed  0x1
#define global CompositingQualityHighQuality  0x2
#define global CompositingQualityGammaCorrected  0x3
#define global CompositingQualityAssumeLinear  0x4

; COMPUTER_NAME_FORMAT
#define global ComputerNameNetBIOS  0x0
#define global ComputerNameDnsHostname  0x1
#define global ComputerNameDnsDomain  0x2
#define global ComputerNameDnsFullyQualified  0x3
#define global ComputerNamePhysicalNetBIOS  0x4
#define global ComputerNamePhysicalDnsHostname  0x5
#define global ComputerNamePhysicalDnsDomain  0x6
#define global ComputerNamePhysicalDnsFullyQualified  0x7
#define global ComputerNameMax  0x8

; CONSOLE_CHARACTER_ATTRIBUTES
#define global FOREGROUND_BLUE  0x1
#define global FOREGROUND_GREEN  0x2
#define global FOREGROUND_RED  0x4
#define global FOREGROUND_INTENSITY  0x8
#define global BACKGROUND_BLUE  0x10
#define global BACKGROUND_GREEN  0x20
#define global BACKGROUND_RED  0x40
#define global BACKGROUND_INTENSITY  0x80
#define global COMMON_LVB_LEADING_BYTE  0x100
#define global COMMON_LVB_TRAILING_BYTE  0x200
#define global COMMON_LVB_GRID_HORIZONTAL  0x400
#define global COMMON_LVB_GRID_LVERTICAL  0x800
#define global COMMON_LVB_GRID_RVERTICAL  0x1000
#define global COMMON_LVB_REVERSE_VIDEO  0x4000
#define global COMMON_LVB_UNDERSCORE  0x8000
#define global COMMON_LVB_SBCSDBCS  0x300

; CONSOLE_MODE
#define global ENABLE_PROCESSED_INPUT  0x1
#define global ENABLE_LINE_INPUT  0x2
#define global ENABLE_ECHO_INPUT  0x4
#define global ENABLE_WINDOW_INPUT  0x8
#define global ENABLE_MOUSE_INPUT  0x10
#define global ENABLE_INSERT_MODE  0x20
#define global ENABLE_QUICK_EDIT_MODE  0x40
#define global ENABLE_EXTENDED_FLAGS  0x80
#define global ENABLE_AUTO_POSITION  0x100
#define global ENABLE_VIRTUAL_TERMINAL_INPUT  0x200
#define global ENABLE_PROCESSED_OUTPUT  0x1
#define global ENABLE_WRAP_AT_EOL_OUTPUT  0x2
#define global ENABLE_VIRTUAL_TERMINAL_PROCESSING  0x4
#define global DISABLE_NEWLINE_AUTO_RETURN  0x8
#define global ENABLE_LVB_GRID_WORLDWIDE  0x10

; CONSOLECONTROL
#define global Reserved1  0x0
#define global ConsoleNotifyConsoleApplication  0x1
#define global Reserved2  0x2
#define global ConsoleSetCaretInfo  0x3
#define global Reserved3  0x4
#define global ConsoleSetForeground  0x5
#define global ConsoleSetWindowOwner  0x6
#define global ConsoleEndTask  0x7

; CONVINFO_CONVERSATION_STATE
#define global XST_ADVACKRCVD  0xd
#define global XST_ADVDATAACKRCVD  0x10
#define global XST_ADVDATASENT  0xf
#define global XST_ADVSENT  0xb
#define global XST_CONNECTED  0x2
#define global XST_DATARCVD  0x6
#define global XST_EXECACKRCVD  0xa
#define global XST_EXECSENT  0x9
#define global XST_INCOMPLETE  0x1
#define global XST_INIT1  0x3
#define global XST_INIT2  0x4
#define global XST_NULL  0x0
#define global XST_POKEACKRCVD  0x8
#define global XST_POKESENT  0x7
#define global XST_REQSENT  0x5
#define global XST_UNADVACKRCVD  0xe
#define global XST_UNADVSENT  0xc

; CONVINFO_STATUS
#define global ST_ADVISE  0x2
#define global ST_BLOCKED  0x8
#define global ST_BLOCKNEXT  0x80
#define global ST_CLIENT  0x10
#define global ST_CONNECTED  0x1
#define global ST_INLIST  0x40
#define global ST_ISLOCAL  0x4
#define global ST_ISSELF  0x100
#define global ST_TERMINATED  0x20

; CoordinateSpace
#define global CoordinateSpaceWorld  0x0
#define global CoordinateSpacePage  0x1
#define global CoordinateSpaceDevice  0x2

; COPYFILE2_COPY_PHASE
#define global COPYFILE2_PHASE_NONE  0x0
#define global COPYFILE2_PHASE_PREPARE_SOURCE  0x1
#define global COPYFILE2_PHASE_PREPARE_DEST  0x2
#define global COPYFILE2_PHASE_READ_SOURCE  0x3
#define global COPYFILE2_PHASE_WRITE_DESTINATION  0x4
#define global COPYFILE2_PHASE_SERVER_COPY  0x5
#define global COPYFILE2_PHASE_NAMEGRAFT_COPY  0x6
#define global COPYFILE2_PHASE_MAX  0x7

; COPYFILE2_MESSAGE_ACTION
#define global COPYFILE2_PROGRESS_CONTINUE  0x0
#define global COPYFILE2_PROGRESS_CANCEL  0x1
#define global COPYFILE2_PROGRESS_STOP  0x2
#define global COPYFILE2_PROGRESS_QUIET  0x3
#define global COPYFILE2_PROGRESS_PAUSE  0x4

; COPYFILE2_MESSAGE_TYPE
#define global COPYFILE2_CALLBACK_NONE  0x0
#define global COPYFILE2_CALLBACK_CHUNK_STARTED  0x1
#define global COPYFILE2_CALLBACK_CHUNK_FINISHED  0x2
#define global COPYFILE2_CALLBACK_STREAM_STARTED  0x3
#define global COPYFILE2_CALLBACK_STREAM_FINISHED  0x4
#define global COPYFILE2_CALLBACK_POLL_CONTINUE  0x5
#define global COPYFILE2_CALLBACK_ERROR  0x6
#define global COPYFILE2_CALLBACK_MAX  0x7

; CREATE_EVENT
#define global CREATE_EVENT_INITIAL_SET  0x2
#define global CREATE_EVENT_MANUAL_RESET  0x1

; CREATE_POLYGON_RGN_MODE
#define global ALTERNATE  0x1
#define global WINDING  0x2

; CREATE_PROCESS_LOGON_FLAGS
#define global LOGON_WITH_PROFILE  0x1
#define global LOGON_NETCREDENTIALS_ONLY  0x2

; CREATE_RESTRICTED_TOKEN_FLAGS
#define global DISABLE_MAX_PRIVILEGE  0x1
#define global SANDBOX_INERT  0x2
#define global LUA_TOKEN  0x4
#define global WRITE_RESTRICTED  0x8

; CREATE_TAPE_PARTITION_METHOD
#define global TAPE_FIXED_PARTITIONS  0x0
#define global TAPE_INITIATOR_PARTITIONS  0x2
#define global TAPE_SELECT_PARTITIONS  0x1

; CREATE_TOOLHELP_SNAPSHOT_FLAGS
#define global TH32CS_INHERIT  0x80000000
#define global TH32CS_SNAPALL  0xf
#define global TH32CS_SNAPHEAPLIST  0x1
#define global TH32CS_SNAPMODULE  0x8
#define global TH32CS_SNAPMODULE32  0x10
#define global TH32CS_SNAPPROCESS  0x2
#define global TH32CS_SNAPTHREAD  0x4

; CRED_ENUMERATE_FLAGS
#define global CRED_ENUMERATE_ALL_CREDENTIALS  0x1

; CRED_FLAGS
#define global CRED_FLAGS_PASSWORD_FOR_CERT  0x1
#define global CRED_FLAGS_PROMPT_NOW  0x2
#define global CRED_FLAGS_USERNAME_TARGET  0x4
#define global CRED_FLAGS_OWF_CRED_BLOB  0x8
#define global CRED_FLAGS_REQUIRE_CONFIRMATION  0x10
#define global CRED_FLAGS_WILDCARD_MATCH  0x20
#define global CRED_FLAGS_VSM_PROTECTED  0x40
#define global CRED_FLAGS_NGC_CERT  0x80
#define global CRED_FLAGS_VALID_FLAGS  0xf0ff
#define global CRED_FLAGS_VALID_INPUT_FLAGS  0xf09f

; CRED_MARSHAL_TYPE
#define global CertCredential  0x1
#define global UsernameTargetCredential  0x2
#define global BinaryBlobCredential  0x3
#define global UsernameForPackedCredentials  0x4
#define global BinaryBlobForSystem  0x5

; CRED_PERSIST
#define global CRED_PERSIST_NONE  0x0
#define global CRED_PERSIST_SESSION  0x1
#define global CRED_PERSIST_LOCAL_MACHINE  0x2
#define global CRED_PERSIST_ENTERPRISE  0x3

; CRED_PROTECTION_TYPE
#define global CredUnprotected  0x0
#define global CredUserProtection  0x1
#define global CredTrustedProtection  0x2
#define global CredForSystemProtection  0x3

; CRED_TYPE
#define global CRED_TYPE_GENERIC  0x1
#define global CRED_TYPE_DOMAIN_PASSWORD  0x2
#define global CRED_TYPE_DOMAIN_CERTIFICATE  0x3
#define global CRED_TYPE_DOMAIN_VISIBLE_PASSWORD  0x4
#define global CRED_TYPE_GENERIC_CERTIFICATE  0x5
#define global CRED_TYPE_DOMAIN_EXTENDED  0x6
#define global CRED_TYPE_MAXIMUM  0x7
#define global CRED_TYPE_MAXIMUM_EX  0x3ef

; CRYPT_ACQUIRE_FLAGS
#define global CRYPT_ACQUIRE_CACHE_FLAG  0x1
#define global CRYPT_ACQUIRE_USE_PROV_INFO_FLAG  0x2
#define global CRYPT_ACQUIRE_COMPARE_KEY_FLAG  0x4
#define global CRYPT_ACQUIRE_NO_HEALING  0x8
#define global CRYPT_ACQUIRE_SILENT_FLAG  0x40
#define global CRYPT_ACQUIRE_WINDOW_HANDLE_FLAG  0x80
#define global CRYPT_ACQUIRE_NCRYPT_KEY_FLAGS_MASK  0x70000
#define global CRYPT_ACQUIRE_ALLOW_NCRYPT_KEY_FLAG  0x10000
#define global CRYPT_ACQUIRE_PREFER_NCRYPT_KEY_FLAG  0x20000
#define global CRYPT_ACQUIRE_ONLY_NCRYPT_KEY_FLAG  0x40000

; CRYPT_CONTEXT_CONFIG_FLAGS
#define global CRYPT_EXCLUSIVE  0x1
#define global CRYPT_OVERRIDE  0x10000

; CRYPT_DEFAULT_CONTEXT_FLAGS
#define global CRYPT_DEFAULT_CONTEXT_AUTO_RELEASE_FLAG  0x1
#define global CRYPT_DEFAULT_CONTEXT_PROCESS_FLAG  0x2

; CRYPT_DEFAULT_CONTEXT_TYPE
#define global CRYPT_DEFAULT_CONTEXT_CERT_SIGN_OID  0x1
#define global CRYPT_DEFAULT_CONTEXT_MULTI_CERT_SIGN_OID  0x2

; CRYPT_ENCODE_OBJECT_FLAGS
#define global CRYPT_ENCODE_ALLOC_FLAG  0x8000
#define global CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG  0x20000
#define global CRYPT_UNICODE_NAME_ENCODE_DISABLE_CHECK_TYPE_FLAG  0x40000000
#define global CRYPT_UNICODE_NAME_ENCODE_ENABLE_T61_UNICODE_FLAG  0x80000000
#define global CRYPT_UNICODE_NAME_ENCODE_ENABLE_UTF8_UNICODE_FLAG  0x20000000

; CRYPT_FIND_FLAGS
#define global CRYPT_FIND_USER_KEYSET_FLAG  0x1
#define global CRYPT_FIND_MACHINE_KEYSET_FLAG  0x2
#define global CRYPT_FIND_SILENT_KEYSET_FLAG  0x40

; CRYPT_IMAGE_REF_FLAGS
#define global CRYPT_MIN_DEPENDENCIES  0x1
#define global CRYPT_PROCESS_ISOLATE  0x10000

; CRYPT_IMPORT_PUBLIC_KEY_FLAGS
#define global CRYPT_OID_INFO_PUBKEY_SIGN_KEY_FLAG  0x80000000
#define global CRYPT_OID_INFO_PUBKEY_ENCRYPT_KEY_FLAG  0x40000000

; CRYPT_KEY_FLAGS
#define global CRYPT_EXPORTABLE  0x1
#define global CRYPT_USER_PROTECTED  0x2
#define global CRYPT_ARCHIVABLE  0x4000
#define global CRYPT_CREATE_IV  0x200
#define global CRYPT_CREATE_SALT  0x4
#define global CRYPT_DATA_KEY  0x800
#define global CRYPT_FORCE_KEY_PROTECTION_HIGH  0x8000
#define global CRYPT_KEK  0x400
#define global CRYPT_INITIATOR  0x40
#define global CRYPT_NO_SALT  0x10
#define global CRYPT_ONLINE  0x80
#define global CRYPT_PREGEN  0x40
#define global CRYPT_RECIPIENT  0x10
#define global CRYPT_SF  0x100
#define global CRYPT_SGCKEY  0x2000
#define global CRYPT_VOLATILE  0x1000
#define global CRYPT_MACHINE_KEYSET  0x20
#define global CRYPT_USER_KEYSET  0x1000
#define global PKCS12_PREFER_CNG_KSP  0x100
#define global PKCS12_ALWAYS_CNG_KSP  0x200
#define global PKCS12_ALLOW_OVERWRITE_KEY  0x4000
#define global PKCS12_NO_PERSIST_KEY  0x8000
#define global PKCS12_INCLUDE_EXTENDED_PROPERTIES  0x10
#define global CRYPT_OAEP  0x40
#define global CRYPT_BLOB_VER3  0x80
#define global CRYPT_DESTROYKEY  0x4
#define global CRYPT_SSL2_FALLBACK  0x2
#define global CRYPT_Y_ONLY  0x1
#define global CRYPT_IPSEC_HMAC_KEY  0x100
#define global CERT_SET_KEY_PROV_HANDLE_PROP_ID  0x1
#define global CERT_SET_KEY_CONTEXT_PROP_ID  0x1

; CRYPT_KEY_PARAM_ID
#define global KP_ALGID  0x7
#define global KP_CERTIFICATE  0x1a
#define global KP_PERMISSIONS  0x6
#define global KP_SALT  0x2
#define global KP_SALT_EX  0xa
#define global KP_BLOCKLEN  0x8
#define global KP_GET_USE_COUNT  0x2a
#define global KP_KEYLEN  0x9

; CRYPT_MSG_TYPE
#define global CMSG_DATA  0x1
#define global CMSG_SIGNED  0x2
#define global CMSG_ENVELOPED  0x3
#define global CMSG_SIGNED_AND_ENVELOPED  0x4
#define global CMSG_HASHED  0x5

; CRYPT_SET_HASH_PARAM
#define global HP_HMAC_INFO  0x5
#define global HP_HASHVAL  0x2

; CRYPT_SET_PROV_PARAM_ID
#define global PP_CLIENT_HWND  0x1
#define global PP_DELETEKEY  0x18
#define global PP_KEYEXCHANGE_ALG  0xe
#define global PP_KEYEXCHANGE_PIN  0x20
#define global PP_KEYEXCHANGE_KEYSIZE  0xc
#define global PP_KEYSET_SEC_DESCR  0x8
#define global PP_PIN_PROMPT_STRING  0x2c
#define global PP_ROOT_CERTSTORE  0x2e
#define global PP_SIGNATURE_ALG  0xf
#define global PP_SIGNATURE_PIN  0x21
#define global PP_SIGNATURE_KEYSIZE  0xd
#define global PP_UI_PROMPT  0x15
#define global PP_USE_HARDWARE_RNG  0x26
#define global PP_USER_CERTSTORE  0x2a
#define global PP_SECURE_KEYEXCHANGE_PIN  0x2f
#define global PP_SECURE_SIGNATURE_PIN  0x30
#define global PP_SMARTCARD_READER  0x2b

; CRYPT_STRING
#define global CRYPT_STRING_BASE64HEADER  0x0
#define global CRYPT_STRING_BASE64  0x1
#define global CRYPT_STRING_BINARY  0x2
#define global CRYPT_STRING_BASE64REQUESTHEADER  0x3
#define global CRYPT_STRING_HEX  0x4
#define global CRYPT_STRING_HEXASCII  0x5
#define global CRYPT_STRING_BASE64X509CRLHEADER  0x9
#define global CRYPT_STRING_HEXADDR  0xa
#define global CRYPT_STRING_HEXASCIIADDR  0xb
#define global CRYPT_STRING_HEXRAW  0xc
#define global CRYPT_STRING_STRICT  0x20000000
#define global CRYPT_STRING_BASE64_ANY  0x6
#define global CRYPT_STRING_ANY  0x7
#define global CRYPT_STRING_HEX_ANY  0x8

; CRYPT_VERIFY_CERT_FLAGS
#define global CRYPT_VERIFY_CERT_SIGN_DISABLE_MD2_MD4_FLAG  0x1
#define global CRYPT_VERIFY_CERT_SIGN_SET_STRONG_PROPERTIES_FLAG  0x2
#define global CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG  0x4

; CRYPTCAT_OPEN_FLAGS
#define global CRYPTCAT_OPEN_ALWAYS  0x2
#define global CRYPTCAT_OPEN_CREATENEW  0x1
#define global CRYPTCAT_OPEN_EXISTING  0x4
#define global CRYPTCAT_OPEN_EXCLUDE_PAGE_HASHES  0x10000
#define global CRYPTCAT_OPEN_INCLUDE_PAGE_HASHES  0x20000
#define global CRYPTCAT_OPEN_VERIFYSIGHASH  0x10000000
#define global CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG  0x20000000
#define global CRYPTCAT_OPEN_SORTED  0x40000000
#define global CRYPTCAT_OPEN_FLAGS_MASK  0xffff0000

; CURSORINFO_FLAGS
#define global CURSOR_SHOWING  0x1
#define global CURSOR_SUPPRESSED  0x2

; CustomLineCapType
#define global CustomLineCapTypeDefault  0x0
#define global CustomLineCapTypeAdjustableArrow  0x1

; CWP_FLAGS
#define global CWP_ALL  0x0
#define global CWP_SKIPINVISIBLE  0x1
#define global CWP_SKIPDISABLED  0x2
#define global CWP_SKIPTRANSPARENT  0x4

; D2D1_ALPHA_MODE
#define global D2D1_ALPHA_MODE_UNKNOWN  0x0
#define global D2D1_ALPHA_MODE_PREMULTIPLIED  0x1
#define global D2D1_ALPHA_MODE_STRAIGHT  0x2
#define global D2D1_ALPHA_MODE_IGNORE  0x3

; D2D1_ANTIALIAS_MODE
#define global D2D1_ANTIALIAS_MODE_PER_PRIMITIVE  0x0
#define global D2D1_ANTIALIAS_MODE_ALIASED  0x1

; D2D1_ARC_SIZE
#define global D2D1_ARC_SIZE_SMALL  0x0
#define global D2D1_ARC_SIZE_LARGE  0x1

; D2D1_BITMAP_INTERPOLATION_MODE
#define global D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR  0x0
#define global D2D1_BITMAP_INTERPOLATION_MODE_LINEAR  0x1

; D2D1_BITMAP_OPTIONS
#define global D2D1_BITMAP_OPTIONS_NONE  0x0
#define global D2D1_BITMAP_OPTIONS_TARGET  0x1
#define global D2D1_BITMAP_OPTIONS_CANNOT_DRAW  0x2
#define global D2D1_BITMAP_OPTIONS_CPU_READ  0x4
#define global D2D1_BITMAP_OPTIONS_GDI_COMPATIBLE  0x8

; D2D1_BUFFER_PRECISION
#define global D2D1_BUFFER_PRECISION_UNKNOWN  0x0
#define global D2D1_BUFFER_PRECISION_8BPC_UNORM  0x1
#define global D2D1_BUFFER_PRECISION_8BPC_UNORM_SRGB  0x2
#define global D2D1_BUFFER_PRECISION_16BPC_UNORM  0x3
#define global D2D1_BUFFER_PRECISION_16BPC_FLOAT  0x4
#define global D2D1_BUFFER_PRECISION_32BPC_FLOAT  0x5

; D2D1_CAP_STYLE
#define global D2D1_CAP_STYLE_FLAT  0x0
#define global D2D1_CAP_STYLE_SQUARE  0x1
#define global D2D1_CAP_STYLE_ROUND  0x2
#define global D2D1_CAP_STYLE_TRIANGLE  0x3

; D2D1_COLOR_INTERPOLATION_MODE
#define global D2D1_COLOR_INTERPOLATION_MODE_STRAIGHT  0x0
#define global D2D1_COLOR_INTERPOLATION_MODE_PREMULTIPLIED  0x1

; D2D1_COLOR_SPACE
#define global D2D1_COLOR_SPACE_CUSTOM  0x0
#define global D2D1_COLOR_SPACE_SRGB  0x1
#define global D2D1_COLOR_SPACE_SCRGB  0x2

; D2D1_COMBINE_MODE
#define global D2D1_COMBINE_MODE_UNION  0x0
#define global D2D1_COMBINE_MODE_INTERSECT  0x1
#define global D2D1_COMBINE_MODE_XOR  0x2
#define global D2D1_COMBINE_MODE_EXCLUDE  0x3

; D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS
#define global D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_NONE  0x0
#define global D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE  0x1

; D2D1_COMPOSITE_MODE
#define global D2D1_COMPOSITE_MODE_SOURCE_OVER  0x0
#define global D2D1_COMPOSITE_MODE_DESTINATION_OVER  0x1
#define global D2D1_COMPOSITE_MODE_SOURCE_IN  0x2
#define global D2D1_COMPOSITE_MODE_DESTINATION_IN  0x3
#define global D2D1_COMPOSITE_MODE_SOURCE_OUT  0x4
#define global D2D1_COMPOSITE_MODE_DESTINATION_OUT  0x5
#define global D2D1_COMPOSITE_MODE_SOURCE_ATOP  0x6
#define global D2D1_COMPOSITE_MODE_DESTINATION_ATOP  0x7
#define global D2D1_COMPOSITE_MODE_XOR  0x8
#define global D2D1_COMPOSITE_MODE_PLUS  0x9
#define global D2D1_COMPOSITE_MODE_SOURCE_COPY  0xa
#define global D2D1_COMPOSITE_MODE_BOUNDED_SOURCE_COPY  0xb
#define global D2D1_COMPOSITE_MODE_MASK_INVERT  0xc

; D2D1_DASH_STYLE
#define global D2D1_DASH_STYLE_SOLID  0x0

; D2D1_DEBUG_LEVEL
#define global D2D1_DEBUG_LEVEL_NONE  0x0
#define global D2D1_DEBUG_LEVEL_ERROR  0x1
#define global D2D1_DEBUG_LEVEL_WARNING  0x2
#define global D2D1_DEBUG_LEVEL_INFORMATION  0x3

; D2D1_DEVICE_CONTEXT_OPTIONS
#define global D2D1_DEVICE_CONTEXT_OPTIONS_NONE  0x0
#define global D2D1_DEVICE_CONTEXT_OPTIONS_ENABLE_MULTITHREADED_OPTIMIZATIONS  0x1

; D2D1_DRAW_TEXT_OPTIONS
#define global D2D1_DRAW_TEXT_OPTIONS_NO_SNAP  0x1
#define global D2D1_DRAW_TEXT_OPTIONS_CLIP  0x2
#define global D2D1_DRAW_TEXT_OPTIONS_ENABLE_COLOR_FONT  0x4
#define global D2D1_DRAW_TEXT_OPTIONS_DISABLE_COLOR_BITMAP_SNAPPING  0x8
#define global D2D1_DRAW_TEXT_OPTIONS_NONE  0x0

; D2D1_EXTEND_MODE
#define global D2D1_EXTEND_MODE_CLAMP  0x0
#define global D2D1_EXTEND_MODE_WRAP  0x1
#define global D2D1_EXTEND_MODE_MIRROR  0x2

; D2D1_FACTORY_TYPE
#define global D2D1_FACTORY_TYPE_SINGLE_THREADED  0x0
#define global D2D1_FACTORY_TYPE_MULTI_THREADED  0x1

; D2D1_FEATURE_LEVEL
#define global D2D1_FEATURE_LEVEL_DEFAULT  0x0
#define global D2D1_FEATURE_LEVEL_9  0x9100
#define global D2D1_FEATURE_LEVEL_10  0xa000

; D2D1_FIGURE_BEGIN
#define global D2D1_FIGURE_BEGIN_FILLED  0x0
#define global D2D1_FIGURE_BEGIN_HOLLOW  0x1

; D2D1_FIGURE_END
#define global D2D1_FIGURE_END_OPEN  0x0
#define global D2D1_FIGURE_END_CLOSED  0x1

; D2D1_FILL_MODE
#define global D2D1_FILL_MODE_ALTERNATE  0x0
#define global D2D1_FILL_MODE_WINDING  0x1

; D2D1_GAMMA
#define global D2D1_GAMMA_2_2  0x0
#define global D2D1_GAMMA_1_0  0x1

; D2D1_GEOMETRY_RELATION
#define global D2D1_GEOMETRY_RELATION_UNKNOWN  0x0
#define global D2D1_GEOMETRY_RELATION_DISJOINT  0x1
#define global D2D1_GEOMETRY_RELATION_IS_CONTAINED  0x2
#define global D2D1_GEOMETRY_RELATION_CONTAINS  0x3
#define global D2D1_GEOMETRY_RELATION_OVERLAP  0x4

; D2D1_GEOMETRY_SIMPLIFICATION_OPTION
#define global D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES  0x0
#define global D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES  0x1

; D2D1_INTERPOLATION_MODE
#define global D2D1_INTERPOLATION_MODE_NEAREST_NEIGHBOR  0x0
#define global D2D1_INTERPOLATION_MODE_LINEAR  0x1
#define global D2D1_INTERPOLATION_MODE_CUBIC  0x2
#define global D2D1_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR  0x3
#define global D2D1_INTERPOLATION_MODE_ANISOTROPIC  0x4
#define global D2D1_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC  0x5

; D2D1_LAYER_OPTIONS
#define global D2D1_LAYER_OPTIONS_NONE  0x0
#define global D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE  0x1

; D2D1_LAYER_OPTIONS1
#define global D2D1_LAYER_OPTIONS1_NONE  0x0
#define global D2D1_LAYER_OPTIONS1_INITIALIZE_FROM_BACKGROUND  0x1
#define global D2D1_LAYER_OPTIONS1_IGNORE_ALPHA  0x2

; D2D1_LINE_JOIN
#define global D2D1_LINE_JOIN_MITER  0x0
#define global D2D1_LINE_JOIN_BEVEL  0x1
#define global D2D1_LINE_JOIN_ROUND  0x2
#define global D2D1_LINE_JOIN_MITER_OR_BEVEL  0x3

; D2D1_MAP_OPTIONS
#define global D2D1_MAP_OPTIONS_NONE  0x0
#define global D2D1_MAP_OPTIONS_READ  0x1
#define global D2D1_MAP_OPTIONS_WRITE  0x2
#define global D2D1_MAP_OPTIONS_DISCARD  0x4

; D2D1_OPACITY_MASK_CONTENT
#define global D2D1_OPACITY_MASK_CONTENT_GRAPHICS  0x0
#define global D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL  0x1
#define global D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE  0x2

; D2D1_PATH_SEGMENT
#define global D2D1_PATH_SEGMENT_NONE  0x0
#define global D2D1_PATH_SEGMENT_FORCE_UNSTROKED  0x1
#define global D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN  0x2

; D2D1_PRESENT_OPTIONS
#define global D2D1_PRESENT_OPTIONS_NONE  0x0
#define global D2D1_PRESENT_OPTIONS_RETAIN_CONTENTS  0x1
#define global D2D1_PRESENT_OPTIONS_IMMEDIATELY  0x2

; D2D1_PRIMITIVE_BLEND
#define global D2D1_PRIMITIVE_BLEND_SOURCE_OVER  0x0
#define global D2D1_PRIMITIVE_BLEND_COPY  0x1
#define global D2D1_PRIMITIVE_BLEND_MIN  0x2
#define global D2D1_PRIMITIVE_BLEND_ADD  0x3
#define global D2D1_PRIMITIVE_BLEND_MAX  0x4

; D2D1_PRINT_FONT_SUBSET_MODE
#define global D2D1_PRINT_FONT_SUBSET_MODE_DEFAULT  0x0
#define global D2D1_PRINT_FONT_SUBSET_MODE_EACHPAGE  0x1
#define global D2D1_PRINT_FONT_SUBSET_MODE_NONE  0x2

; D2D1_PROPERTY_TYPE
#define global D2D1_PROPERTY_TYPE_UNKNOWN  0x0
#define global D2D1_PROPERTY_TYPE_STRING  0x1
#define global D2D1_PROPERTY_TYPE_BOOL  0x2
#define global D2D1_PROPERTY_TYPE_UINT32  0x3
#define global D2D1_PROPERTY_TYPE_INT32  0x4
#define global D2D1_PROPERTY_TYPE_FLOAT  0x5
#define global D2D1_PROPERTY_TYPE_VECTOR2  0x6
#define global D2D1_PROPERTY_TYPE_VECTOR3  0x7
#define global D2D1_PROPERTY_TYPE_VECTOR4  0x8
#define global D2D1_PROPERTY_TYPE_BLOB  0x9
#define global D2D1_PROPERTY_TYPE_IUNKNOWN  0xa
#define global D2D1_PROPERTY_TYPE_ENUM  0xb
#define global D2D1_PROPERTY_TYPE_ARRAY  0xc
#define global D2D1_PROPERTY_TYPE_CLSID  0xd
#define global D2D1_PROPERTY_TYPE_MATRIX_3X2  0xe
#define global D2D1_PROPERTY_TYPE_MATRIX_4X3  0xf
#define global D2D1_PROPERTY_TYPE_MATRIX_4X4  0x10
#define global D2D1_PROPERTY_TYPE_MATRIX_5X4  0x11
#define global D2D1_PROPERTY_TYPE_COLOR_CONTEXT  0x12

; D2D1_RENDER_TARGET_TYPE
#define global D2D1_RENDER_TARGET_TYPE_DEFAULT  0x0
#define global D2D1_RENDER_TARGET_TYPE_SOFTWARE  0x1
#define global D2D1_RENDER_TARGET_TYPE_HARDWARE  0x2

; D2D1_RENDER_TARGET_USAGE
#define global D2D1_RENDER_TARGET_USAGE_NONE  0x0
#define global D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING  0x1
#define global D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE  0x2

; D2D1_SWEEP_DIRECTION
#define global D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE  0x0
#define global D2D1_SWEEP_DIRECTION_CLOCKWISE  0x1

; D2D1_TEXT_ANTIALIAS_MODE
#define global D2D1_TEXT_ANTIALIAS_MODE_DEFAULT  0x0
#define global D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE  0x1
#define global D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE  0x2
#define global D2D1_TEXT_ANTIALIAS_MODE_ALIASED  0x3

; D2D1_THREADING_MODE
#define global D2D1_THREADING_MODE_SINGLE_THREADED  0x0
#define global D2D1_THREADING_MODE_MULTI_THREADED  0x1

; D2D1_UNIT_MODE
#define global D2D1_UNIT_MODE_DIPS  0x0
#define global D2D1_UNIT_MODE_PIXELS  0x1

; D2D1_WINDOW_STATE
#define global D2D1_WINDOW_STATE_NONE  0x0
#define global D2D1_WINDOW_STATE_OCCLUDED  0x1

; D3D11_BIND_FLAG
#define global D3D11_BIND_VERTEX_BUFFER  0x1
#define global D3D11_BIND_INDEX_BUFFER  0x2
#define global D3D11_BIND_CONSTANT_BUFFER  0x4
#define global D3D11_BIND_SHADER_RESOURCE  0x8
#define global D3D11_BIND_STREAM_OUTPUT  0x10
#define global D3D11_BIND_RENDER_TARGET  0x20
#define global D3D11_BIND_DEPTH_STENCIL  0x40
#define global D3D11_BIND_UNORDERED_ACCESS  0x80
#define global D3D11_BIND_DECODER  0x200
#define global D3D11_BIND_VIDEO_ENCODER  0x400

; D3D11_BLEND
#define global D3D11_BLEND_ZERO  0x1
#define global D3D11_BLEND_ONE  0x2
#define global D3D11_BLEND_SRC_COLOR  0x3
#define global D3D11_BLEND_INV_SRC_COLOR  0x4
#define global D3D11_BLEND_SRC_ALPHA  0x5
#define global D3D11_BLEND_INV_SRC_ALPHA  0x6
#define global D3D11_BLEND_DEST_ALPHA  0x7
#define global D3D11_BLEND_INV_DEST_ALPHA  0x8
#define global D3D11_BLEND_DEST_COLOR  0x9
#define global D3D11_BLEND_INV_DEST_COLOR  0xa
#define global D3D11_BLEND_SRC_ALPHA_SAT  0xb
#define global D3D11_BLEND_BLEND_FACTOR  0xe
#define global D3D11_BLEND_INV_BLEND_FACTOR  0xf
#define global D3D11_BLEND_SRC1_COLOR  0x10
#define global D3D11_BLEND_INV_SRC1_COLOR  0x11
#define global D3D11_BLEND_SRC1_ALPHA  0x12
#define global D3D11_BLEND_INV_SRC1_ALPHA  0x13

; D3D11_BLEND_OP
#define global D3D11_BLEND_OP_ADD  0x1
#define global D3D11_BLEND_OP_SUBTRACT  0x2
#define global D3D11_BLEND_OP_REV_SUBTRACT  0x3
#define global D3D11_BLEND_OP_MIN  0x4
#define global D3D11_BLEND_OP_MAX  0x5

; D3D11_COMPARISON_FUNC
#define global D3D11_COMPARISON_NEVER  0x1
#define global D3D11_COMPARISON_LESS  0x2
#define global D3D11_COMPARISON_EQUAL  0x3
#define global D3D11_COMPARISON_LESS_EQUAL  0x4
#define global D3D11_COMPARISON_GREATER  0x5
#define global D3D11_COMPARISON_NOT_EQUAL  0x6
#define global D3D11_COMPARISON_GREATER_EQUAL  0x7
#define global D3D11_COMPARISON_ALWAYS  0x8

; D3D11_COUNTER
#define global D3D11_COUNTER_DEVICE_DEPENDENT_0  0x40000000

; D3D11_COUNTER_TYPE
#define global D3D11_COUNTER_TYPE_FLOAT32  0x0
#define global D3D11_COUNTER_TYPE_UINT16  0x1
#define global D3D11_COUNTER_TYPE_UINT32  0x2
#define global D3D11_COUNTER_TYPE_UINT64  0x3

; D3D11_CPU_ACCESS_FLAG
#define global D3D11_CPU_ACCESS_WRITE  0x10000
#define global D3D11_CPU_ACCESS_READ  0x20000

; D3D11_CREATE_DEVICE_FLAG
#define global D3D11_CREATE_DEVICE_SINGLETHREADED  0x1
#define global D3D11_CREATE_DEVICE_DEBUG  0x2
#define global D3D11_CREATE_DEVICE_SWITCH_TO_REF  0x4
#define global D3D11_CREATE_DEVICE_PREVENT_INTERNAL_THREADING_OPTIMIZATIONS  0x8
#define global D3D11_CREATE_DEVICE_BGRA_SUPPORT  0x20
#define global D3D11_CREATE_DEVICE_DEBUGGABLE  0x40
#define global D3D11_CREATE_DEVICE_PREVENT_ALTERING_LAYER_SETTINGS_FROM_REGISTRY  0x80
#define global D3D11_CREATE_DEVICE_DISABLE_GPU_TIMEOUT  0x100
#define global D3D11_CREATE_DEVICE_VIDEO_SUPPORT  0x800

; D3D11_CULL_MODE
#define global D3D11_CULL_NONE  0x1
#define global D3D11_CULL_FRONT  0x2
#define global D3D11_CULL_BACK  0x3

; D3D11_DEPTH_WRITE_MASK
#define global D3D11_DEPTH_WRITE_MASK_ZERO  0x0
#define global D3D11_DEPTH_WRITE_MASK_ALL  0x1

; D3D11_DEVICE_CONTEXT_TYPE
#define global D3D11_DEVICE_CONTEXT_IMMEDIATE  0x0
#define global D3D11_DEVICE_CONTEXT_DEFERRED  0x1

; D3D11_DSV_DIMENSION
#define global D3D11_DSV_DIMENSION_UNKNOWN  0x0
#define global D3D11_DSV_DIMENSION_TEXTURE1D  0x1
#define global D3D11_DSV_DIMENSION_TEXTURE1DARRAY  0x2
#define global D3D11_DSV_DIMENSION_TEXTURE2D  0x3
#define global D3D11_DSV_DIMENSION_TEXTURE2DARRAY  0x4
#define global D3D11_DSV_DIMENSION_TEXTURE2DMS  0x5
#define global D3D11_DSV_DIMENSION_TEXTURE2DMSARRAY  0x6

; D3D11_FEATURE
#define global D3D11_FEATURE_THREADING  0x0
#define global D3D11_FEATURE_DOUBLES  0x1
#define global D3D11_FEATURE_FORMAT_SUPPORT  0x2
#define global D3D11_FEATURE_FORMAT_SUPPORT2  0x3
#define global D3D11_FEATURE_D3D10_X_HARDWARE_OPTIONS  0x4
#define global D3D11_FEATURE_D3D11_OPTIONS  0x5
#define global D3D11_FEATURE_ARCHITECTURE_INFO  0x6
#define global D3D11_FEATURE_D3D9_OPTIONS  0x7
#define global D3D11_FEATURE_SHADER_MIN_PRECISION_SUPPORT  0x8
#define global D3D11_FEATURE_D3D9_SHADOW_SUPPORT  0x9
#define global D3D11_FEATURE_D3D11_OPTIONS1  0xa
#define global D3D11_FEATURE_D3D9_SIMPLE_INSTANCING_SUPPORT  0xb
#define global D3D11_FEATURE_MARKER_SUPPORT  0xc
#define global D3D11_FEATURE_D3D9_OPTIONS1  0xd
#define global D3D11_FEATURE_D3D11_OPTIONS2  0xe
#define global D3D11_FEATURE_D3D11_OPTIONS3  0xf
#define global D3D11_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT  0x10
#define global D3D11_FEATURE_D3D11_OPTIONS4  0x11
#define global D3D11_FEATURE_SHADER_CACHE  0x12
#define global D3D11_FEATURE_D3D11_OPTIONS5  0x13
#define global D3D11_FEATURE_DISPLAYABLE  0x14

; D3D11_FILL_MODE
#define global D3D11_FILL_WIREFRAME  0x2
#define global D3D11_FILL_SOLID  0x3

; D3D11_FILTER
#define global D3D11_FILTER_MIN_MAG_MIP_POINT  0x0
#define global D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR  0x1
#define global D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT  0x4
#define global D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR  0x5
#define global D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT  0x10
#define global D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x11
#define global D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT  0x14
#define global D3D11_FILTER_MIN_MAG_MIP_LINEAR  0x15
#define global D3D11_FILTER_ANISOTROPIC  0x55
#define global D3D11_FILTER_COMPARISON_MIN_MAG_MIP_POINT  0x80
#define global D3D11_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR  0x81
#define global D3D11_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT  0x84
#define global D3D11_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR  0x85
#define global D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT  0x90
#define global D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x91
#define global D3D11_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT  0x94
#define global D3D11_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR  0x95
#define global D3D11_FILTER_COMPARISON_ANISOTROPIC  0xd5
#define global D3D11_FILTER_MINIMUM_MIN_MAG_MIP_POINT  0x100
#define global D3D11_FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR  0x101
#define global D3D11_FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT  0x104
#define global D3D11_FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR  0x105
#define global D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT  0x110
#define global D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x111
#define global D3D11_FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT  0x114
#define global D3D11_FILTER_MINIMUM_MIN_MAG_MIP_LINEAR  0x115
#define global D3D11_FILTER_MINIMUM_ANISOTROPIC  0x155
#define global D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_POINT  0x180
#define global D3D11_FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR  0x181
#define global D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT  0x184
#define global D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR  0x185
#define global D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT  0x190
#define global D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x191
#define global D3D11_FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT  0x194
#define global D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR  0x195
#define global D3D11_FILTER_MAXIMUM_ANISOTROPIC  0x1d5

; D3D11_INPUT_CLASSIFICATION
#define global D3D11_INPUT_PER_VERTEX_DATA  0x0
#define global D3D11_INPUT_PER_INSTANCE_DATA  0x1

; D3D11_MAP
#define global D3D11_MAP_READ  0x1
#define global D3D11_MAP_WRITE  0x2
#define global D3D11_MAP_READ_WRITE  0x3
#define global D3D11_MAP_WRITE_DISCARD  0x4
#define global D3D11_MAP_WRITE_NO_OVERWRITE  0x5

; D3D11_QUERY
#define global D3D11_QUERY_EVENT  0x0
#define global D3D11_QUERY_OCCLUSION  0x1
#define global D3D11_QUERY_TIMESTAMP  0x2
#define global D3D11_QUERY_TIMESTAMP_DISJOINT  0x3
#define global D3D11_QUERY_PIPELINE_STATISTICS  0x4
#define global D3D11_QUERY_OCCLUSION_PREDICATE  0x5
#define global D3D11_QUERY_SO_STATISTICS  0x6
#define global D3D11_QUERY_SO_OVERFLOW_PREDICATE  0x7
#define global D3D11_QUERY_SO_STATISTICS_STREAM0  0x8
#define global D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM0  0x9
#define global D3D11_QUERY_SO_STATISTICS_STREAM1  0xa
#define global D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM1  0xb
#define global D3D11_QUERY_SO_STATISTICS_STREAM2  0xc
#define global D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM2  0xd
#define global D3D11_QUERY_SO_STATISTICS_STREAM3  0xe
#define global D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM3  0xf

; D3D11_RESOURCE_DIMENSION
#define global D3D11_RESOURCE_DIMENSION_UNKNOWN  0x0
#define global D3D11_RESOURCE_DIMENSION_BUFFER  0x1
#define global D3D11_RESOURCE_DIMENSION_TEXTURE1D  0x2
#define global D3D11_RESOURCE_DIMENSION_TEXTURE2D  0x3
#define global D3D11_RESOURCE_DIMENSION_TEXTURE3D  0x4

; D3D11_RESOURCE_MISC_FLAG
#define global D3D11_RESOURCE_MISC_GENERATE_MIPS  0x1
#define global D3D11_RESOURCE_MISC_SHARED  0x2
#define global D3D11_RESOURCE_MISC_TEXTURECUBE  0x4
#define global D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS  0x10
#define global D3D11_RESOURCE_MISC_BUFFER_ALLOW_RAW_VIEWS  0x20
#define global D3D11_RESOURCE_MISC_BUFFER_STRUCTURED  0x40
#define global D3D11_RESOURCE_MISC_RESOURCE_CLAMP  0x80
#define global D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX  0x100
#define global D3D11_RESOURCE_MISC_GDI_COMPATIBLE  0x200
#define global D3D11_RESOURCE_MISC_SHARED_NTHANDLE  0x800
#define global D3D11_RESOURCE_MISC_RESTRICTED_CONTENT  0x1000
#define global D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE  0x2000
#define global D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE_DRIVER  0x4000
#define global D3D11_RESOURCE_MISC_GUARDED  0x8000
#define global D3D11_RESOURCE_MISC_TILE_POOL  0x20000
#define global D3D11_RESOURCE_MISC_TILED  0x40000
#define global D3D11_RESOURCE_MISC_HW_PROTECTED  0x80000
#define global D3D11_RESOURCE_MISC_SHARED_DISPLAYABLE  0x100000
#define global D3D11_RESOURCE_MISC_SHARED_EXCLUSIVE_WRITER  0x200000

; D3D11_RTV_DIMENSION
#define global D3D11_RTV_DIMENSION_UNKNOWN  0x0
#define global D3D11_RTV_DIMENSION_BUFFER  0x1
#define global D3D11_RTV_DIMENSION_TEXTURE1D  0x2
#define global D3D11_RTV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D11_RTV_DIMENSION_TEXTURE2D  0x4
#define global D3D11_RTV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D11_RTV_DIMENSION_TEXTURE2DMS  0x6
#define global D3D11_RTV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define global D3D11_RTV_DIMENSION_TEXTURE3D  0x8

; D3D11_STENCIL_OP
#define global D3D11_STENCIL_OP_KEEP  0x1
#define global D3D11_STENCIL_OP_ZERO  0x2
#define global D3D11_STENCIL_OP_REPLACE  0x3
#define global D3D11_STENCIL_OP_INCR_SAT  0x4
#define global D3D11_STENCIL_OP_DECR_SAT  0x5
#define global D3D11_STENCIL_OP_INVERT  0x6
#define global D3D11_STENCIL_OP_INCR  0x7
#define global D3D11_STENCIL_OP_DECR  0x8

; D3D11_TEXTURE_ADDRESS_MODE
#define global D3D11_TEXTURE_ADDRESS_WRAP  0x1
#define global D3D11_TEXTURE_ADDRESS_MIRROR  0x2
#define global D3D11_TEXTURE_ADDRESS_CLAMP  0x3
#define global D3D11_TEXTURE_ADDRESS_BORDER  0x4
#define global D3D11_TEXTURE_ADDRESS_MIRROR_ONCE  0x5

; D3D11_UAV_DIMENSION
#define global D3D11_UAV_DIMENSION_UNKNOWN  0x0
#define global D3D11_UAV_DIMENSION_BUFFER  0x1
#define global D3D11_UAV_DIMENSION_TEXTURE1D  0x2
#define global D3D11_UAV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D11_UAV_DIMENSION_TEXTURE2D  0x4
#define global D3D11_UAV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D11_UAV_DIMENSION_TEXTURE3D  0x8

; D3D11_USAGE
#define global D3D11_USAGE_DEFAULT  0x0
#define global D3D11_USAGE_IMMUTABLE  0x1
#define global D3D11_USAGE_DYNAMIC  0x2
#define global D3D11_USAGE_STAGING  0x3

; D3D12_BLEND
#define global D3D12_BLEND_ZERO  0x1
#define global D3D12_BLEND_ONE  0x2
#define global D3D12_BLEND_SRC_COLOR  0x3
#define global D3D12_BLEND_INV_SRC_COLOR  0x4
#define global D3D12_BLEND_SRC_ALPHA  0x5
#define global D3D12_BLEND_INV_SRC_ALPHA  0x6
#define global D3D12_BLEND_DEST_ALPHA  0x7
#define global D3D12_BLEND_INV_DEST_ALPHA  0x8
#define global D3D12_BLEND_DEST_COLOR  0x9
#define global D3D12_BLEND_INV_DEST_COLOR  0xa
#define global D3D12_BLEND_SRC_ALPHA_SAT  0xb
#define global D3D12_BLEND_BLEND_FACTOR  0xe
#define global D3D12_BLEND_INV_BLEND_FACTOR  0xf
#define global D3D12_BLEND_SRC1_COLOR  0x10
#define global D3D12_BLEND_INV_SRC1_COLOR  0x11
#define global D3D12_BLEND_SRC1_ALPHA  0x12
#define global D3D12_BLEND_INV_SRC1_ALPHA  0x13
#define global D3D12_BLEND_ALPHA_FACTOR  0x14
#define global D3D12_BLEND_INV_ALPHA_FACTOR  0x15

; D3D12_BLEND_OP
#define global D3D12_BLEND_OP_ADD  0x1
#define global D3D12_BLEND_OP_SUBTRACT  0x2
#define global D3D12_BLEND_OP_REV_SUBTRACT  0x3
#define global D3D12_BLEND_OP_MIN  0x4
#define global D3D12_BLEND_OP_MAX  0x5

; D3D12_BUFFER_SRV_FLAGS
#define global D3D12_BUFFER_SRV_FLAG_NONE  0x0
#define global D3D12_BUFFER_SRV_FLAG_RAW  0x1

; D3D12_BUFFER_UAV_FLAGS
#define global D3D12_BUFFER_UAV_FLAG_NONE  0x0
#define global D3D12_BUFFER_UAV_FLAG_RAW  0x1

; D3D12_COMMAND_LIST_TYPE
#define global D3D12_COMMAND_LIST_TYPE_DIRECT  0x0
#define global D3D12_COMMAND_LIST_TYPE_BUNDLE  0x1
#define global D3D12_COMMAND_LIST_TYPE_COMPUTE  0x2
#define global D3D12_COMMAND_LIST_TYPE_COPY  0x3
#define global D3D12_COMMAND_LIST_TYPE_VIDEO_DECODE  0x4
#define global D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS  0x5
#define global D3D12_COMMAND_LIST_TYPE_VIDEO_ENCODE  0x6
#define global D3D12_COMMAND_LIST_TYPE_NONE  -1

; D3D12_COMMAND_QUEUE_FLAGS
#define global D3D12_COMMAND_QUEUE_FLAG_NONE  0x0
#define global D3D12_COMMAND_QUEUE_FLAG_DISABLE_GPU_TIMEOUT  0x1

; D3D12_COMPARISON_FUNC
#define global D3D12_COMPARISON_FUNC_NONE  0x0
#define global D3D12_COMPARISON_FUNC_NEVER  0x1
#define global D3D12_COMPARISON_FUNC_LESS  0x2
#define global D3D12_COMPARISON_FUNC_EQUAL  0x3
#define global D3D12_COMPARISON_FUNC_LESS_EQUAL  0x4
#define global D3D12_COMPARISON_FUNC_GREATER  0x5
#define global D3D12_COMPARISON_FUNC_NOT_EQUAL  0x6
#define global D3D12_COMPARISON_FUNC_GREATER_EQUAL  0x7
#define global D3D12_COMPARISON_FUNC_ALWAYS  0x8

; D3D12_CONSERVATIVE_RASTERIZATION_MODE
#define global D3D12_CONSERVATIVE_RASTERIZATION_MODE_OFF  0x0
#define global D3D12_CONSERVATIVE_RASTERIZATION_MODE_ON  0x1

; D3D12_CPU_PAGE_PROPERTY
#define global D3D12_CPU_PAGE_PROPERTY_UNKNOWN  0x0
#define global D3D12_CPU_PAGE_PROPERTY_NOT_AVAILABLE  0x1
#define global D3D12_CPU_PAGE_PROPERTY_WRITE_COMBINE  0x2
#define global D3D12_CPU_PAGE_PROPERTY_WRITE_BACK  0x3

; D3D12_CULL_MODE
#define global D3D12_CULL_MODE_NONE  0x1
#define global D3D12_CULL_MODE_FRONT  0x2
#define global D3D12_CULL_MODE_BACK  0x3

; D3D12_DEPTH_WRITE_MASK
#define global D3D12_DEPTH_WRITE_MASK_ZERO  0x0
#define global D3D12_DEPTH_WRITE_MASK_ALL  0x1

; D3D12_DESCRIPTOR_HEAP_FLAGS
#define global D3D12_DESCRIPTOR_HEAP_FLAG_NONE  0x0
#define global D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE  0x1

; D3D12_DESCRIPTOR_HEAP_TYPE
#define global D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV  0x0
#define global D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER  0x1
#define global D3D12_DESCRIPTOR_HEAP_TYPE_RTV  0x2
#define global D3D12_DESCRIPTOR_HEAP_TYPE_DSV  0x3
#define global D3D12_DESCRIPTOR_HEAP_TYPE_NUM_TYPES  0x4

; D3D12_DSV_DIMENSION
#define global D3D12_DSV_DIMENSION_UNKNOWN  0x0
#define global D3D12_DSV_DIMENSION_TEXTURE1D  0x1
#define global D3D12_DSV_DIMENSION_TEXTURE1DARRAY  0x2
#define global D3D12_DSV_DIMENSION_TEXTURE2D  0x3
#define global D3D12_DSV_DIMENSION_TEXTURE2DARRAY  0x4
#define global D3D12_DSV_DIMENSION_TEXTURE2DMS  0x5
#define global D3D12_DSV_DIMENSION_TEXTURE2DMSARRAY  0x6

; D3D12_DSV_FLAGS
#define global D3D12_DSV_FLAG_NONE  0x0
#define global D3D12_DSV_FLAG_READ_ONLY_DEPTH  0x1
#define global D3D12_DSV_FLAG_READ_ONLY_STENCIL  0x2

; D3D12_FEATURE
#define global D3D12_FEATURE_D3D12_OPTIONS  0x0
#define global D3D12_FEATURE_ARCHITECTURE  0x1
#define global D3D12_FEATURE_FEATURE_LEVELS  0x2
#define global D3D12_FEATURE_FORMAT_SUPPORT  0x3
#define global D3D12_FEATURE_MULTISAMPLE_QUALITY_LEVELS  0x4
#define global D3D12_FEATURE_FORMAT_INFO  0x5
#define global D3D12_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT  0x6
#define global D3D12_FEATURE_SHADER_MODEL  0x7
#define global D3D12_FEATURE_D3D12_OPTIONS1  0x8
#define global D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_SUPPORT  0xa
#define global D3D12_FEATURE_ROOT_SIGNATURE  0xc
#define global D3D12_FEATURE_ARCHITECTURE1  0x10
#define global D3D12_FEATURE_D3D12_OPTIONS2  0x12
#define global D3D12_FEATURE_SHADER_CACHE  0x13
#define global D3D12_FEATURE_COMMAND_QUEUE_PRIORITY  0x14
#define global D3D12_FEATURE_D3D12_OPTIONS3  0x15
#define global D3D12_FEATURE_EXISTING_HEAPS  0x16
#define global D3D12_FEATURE_D3D12_OPTIONS4  0x17
#define global D3D12_FEATURE_SERIALIZATION  0x18
#define global D3D12_FEATURE_CROSS_NODE  0x19
#define global D3D12_FEATURE_D3D12_OPTIONS5  0x1b
#define global D3D12_FEATURE_DISPLAYABLE  0x1c
#define global D3D12_FEATURE_D3D12_OPTIONS6  0x1e
#define global D3D12_FEATURE_QUERY_META_COMMAND  0x1f
#define global D3D12_FEATURE_D3D12_OPTIONS7  0x20
#define global D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPE_COUNT  0x21
#define global D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPES  0x22
#define global D3D12_FEATURE_D3D12_OPTIONS8  0x24
#define global D3D12_FEATURE_D3D12_OPTIONS9  0x25
#define global D3D12_FEATURE_D3D12_OPTIONS10  0x27
#define global D3D12_FEATURE_D3D12_OPTIONS11  0x28
#define global D3D12_FEATURE_D3D12_OPTIONS12  0x29
#define global D3D12_FEATURE_D3D12_OPTIONS13  0x2a
#define global D3D12_FEATURE_D3D12_OPTIONS14  0x2b
#define global D3D12_FEATURE_D3D12_OPTIONS15  0x2c
#define global D3D12_FEATURE_D3D12_OPTIONS16  0x2d
#define global D3D12_FEATURE_D3D12_OPTIONS17  0x2e
#define global D3D12_FEATURE_D3D12_OPTIONS18  0x2f
#define global D3D12_FEATURE_D3D12_OPTIONS19  0x30
#define global D3D12_FEATURE_D3D12_OPTIONS20  0x31
#define global D3D12_FEATURE_PREDICATION  0x32
#define global D3D12_FEATURE_PLACED_RESOURCE_SUPPORT_INFO  0x33
#define global D3D12_FEATURE_HARDWARE_COPY  0x34
#define global D3D12_FEATURE_D3D12_OPTIONS21  0x35

; D3D12_FENCE_FLAGS
#define global D3D12_FENCE_FLAG_NONE  0x0
#define global D3D12_FENCE_FLAG_SHARED  0x1
#define global D3D12_FENCE_FLAG_SHARED_CROSS_ADAPTER  0x2
#define global D3D12_FENCE_FLAG_NON_MONITORED  0x4

; D3D12_FILL_MODE
#define global D3D12_FILL_MODE_WIREFRAME  0x2
#define global D3D12_FILL_MODE_SOLID  0x3

; D3D12_FILTER
#define global D3D12_FILTER_MIN_MAG_MIP_POINT  0x0
#define global D3D12_FILTER_MIN_MAG_POINT_MIP_LINEAR  0x1
#define global D3D12_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT  0x4
#define global D3D12_FILTER_MIN_POINT_MAG_MIP_LINEAR  0x5
#define global D3D12_FILTER_MIN_LINEAR_MAG_MIP_POINT  0x10
#define global D3D12_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x11
#define global D3D12_FILTER_MIN_MAG_LINEAR_MIP_POINT  0x14
#define global D3D12_FILTER_MIN_MAG_MIP_LINEAR  0x15
#define global D3D12_FILTER_MIN_MAG_ANISOTROPIC_MIP_POINT  0x54
#define global D3D12_FILTER_ANISOTROPIC  0x55
#define global D3D12_FILTER_COMPARISON_MIN_MAG_MIP_POINT  0x80
#define global D3D12_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR  0x81
#define global D3D12_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT  0x84
#define global D3D12_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR  0x85
#define global D3D12_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT  0x90
#define global D3D12_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x91
#define global D3D12_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT  0x94
#define global D3D12_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR  0x95
#define global D3D12_FILTER_COMPARISON_MIN_MAG_ANISOTROPIC_MIP_POINT  0xd4
#define global D3D12_FILTER_COMPARISON_ANISOTROPIC  0xd5
#define global D3D12_FILTER_MINIMUM_MIN_MAG_MIP_POINT  0x100
#define global D3D12_FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR  0x101
#define global D3D12_FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT  0x104
#define global D3D12_FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR  0x105
#define global D3D12_FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT  0x110
#define global D3D12_FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x111
#define global D3D12_FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT  0x114
#define global D3D12_FILTER_MINIMUM_MIN_MAG_MIP_LINEAR  0x115
#define global D3D12_FILTER_MINIMUM_MIN_MAG_ANISOTROPIC_MIP_POINT  0x154
#define global D3D12_FILTER_MINIMUM_ANISOTROPIC  0x155
#define global D3D12_FILTER_MAXIMUM_MIN_MAG_MIP_POINT  0x180
#define global D3D12_FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR  0x181
#define global D3D12_FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT  0x184
#define global D3D12_FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR  0x185
#define global D3D12_FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT  0x190
#define global D3D12_FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR  0x191
#define global D3D12_FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT  0x194
#define global D3D12_FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR  0x195
#define global D3D12_FILTER_MAXIMUM_MIN_MAG_ANISOTROPIC_MIP_POINT  0x1d4
#define global D3D12_FILTER_MAXIMUM_ANISOTROPIC  0x1d5

; D3D12_HEAP_FLAGS
#define global D3D12_HEAP_FLAG_NONE  0x0
#define global D3D12_HEAP_FLAG_SHARED  0x1
#define global D3D12_HEAP_FLAG_DENY_BUFFERS  0x4
#define global D3D12_HEAP_FLAG_ALLOW_DISPLAY  0x8
#define global D3D12_HEAP_FLAG_SHARED_CROSS_ADAPTER  0x20
#define global D3D12_HEAP_FLAG_DENY_RT_DS_TEXTURES  0x40
#define global D3D12_HEAP_FLAG_DENY_NON_RT_DS_TEXTURES  0x80
#define global D3D12_HEAP_FLAG_HARDWARE_PROTECTED  0x100
#define global D3D12_HEAP_FLAG_ALLOW_WRITE_WATCH  0x200
#define global D3D12_HEAP_FLAG_ALLOW_SHADER_ATOMICS  0x400
#define global D3D12_HEAP_FLAG_CREATE_NOT_RESIDENT  0x800
#define global D3D12_HEAP_FLAG_CREATE_NOT_ZEROED  0x1000
#define global D3D12_HEAP_FLAG_TOOLS_USE_MANUAL_WRITE_TRACKING  0x2000
#define global D3D12_HEAP_FLAG_ALLOW_ALL_BUFFERS_AND_TEXTURES  0x0
#define global D3D12_HEAP_FLAG_ALLOW_ONLY_BUFFERS  0xc0
#define global D3D12_HEAP_FLAG_ALLOW_ONLY_NON_RT_DS_TEXTURES  0x44
#define global D3D12_HEAP_FLAG_ALLOW_ONLY_RT_DS_TEXTURES  0x84

; D3D12_HEAP_TYPE
#define global D3D12_HEAP_TYPE_DEFAULT  0x1
#define global D3D12_HEAP_TYPE_UPLOAD  0x2
#define global D3D12_HEAP_TYPE_READBACK  0x3
#define global D3D12_HEAP_TYPE_CUSTOM  0x4
#define global D3D12_HEAP_TYPE_GPU_UPLOAD  0x5

; D3D12_INDEX_BUFFER_STRIP_CUT_VALUE
#define global D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_DISABLED  0x0
#define global D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_0xFFFF  0x1
#define global D3D12_INDEX_BUFFER_STRIP_CUT_VALUE_0xFFFFFFFF  0x2

; D3D12_INDIRECT_ARGUMENT_TYPE
#define global D3D12_INDIRECT_ARGUMENT_TYPE_DRAW  0x0
#define global D3D12_INDIRECT_ARGUMENT_TYPE_DRAW_INDEXED  0x1
#define global D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH  0x2
#define global D3D12_INDIRECT_ARGUMENT_TYPE_VERTEX_BUFFER_VIEW  0x3
#define global D3D12_INDIRECT_ARGUMENT_TYPE_INDEX_BUFFER_VIEW  0x4
#define global D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT  0x5
#define global D3D12_INDIRECT_ARGUMENT_TYPE_CONSTANT_BUFFER_VIEW  0x6
#define global D3D12_INDIRECT_ARGUMENT_TYPE_SHADER_RESOURCE_VIEW  0x7
#define global D3D12_INDIRECT_ARGUMENT_TYPE_UNORDERED_ACCESS_VIEW  0x8
#define global D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_RAYS  0x9
#define global D3D12_INDIRECT_ARGUMENT_TYPE_DISPATCH_MESH  0xa
#define global D3D12_INDIRECT_ARGUMENT_TYPE_INCREMENTING_CONSTANT  0xb

; D3D12_INPUT_CLASSIFICATION
#define global D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA  0x0
#define global D3D12_INPUT_CLASSIFICATION_PER_INSTANCE_DATA  0x1

; D3D12_LOGIC_OP
#define global D3D12_LOGIC_OP_CLEAR  0x0
#define global D3D12_LOGIC_OP_SET  0x1
#define global D3D12_LOGIC_OP_COPY  0x2
#define global D3D12_LOGIC_OP_COPY_INVERTED  0x3
#define global D3D12_LOGIC_OP_NOOP  0x4
#define global D3D12_LOGIC_OP_INVERT  0x5
#define global D3D12_LOGIC_OP_AND  0x6
#define global D3D12_LOGIC_OP_NAND  0x7
#define global D3D12_LOGIC_OP_OR  0x8
#define global D3D12_LOGIC_OP_NOR  0x9
#define global D3D12_LOGIC_OP_XOR  0xa
#define global D3D12_LOGIC_OP_EQUIV  0xb
#define global D3D12_LOGIC_OP_AND_REVERSE  0xc
#define global D3D12_LOGIC_OP_AND_INVERTED  0xd
#define global D3D12_LOGIC_OP_OR_REVERSE  0xe
#define global D3D12_LOGIC_OP_OR_INVERTED  0xf

; D3D12_MEMORY_POOL
#define global D3D12_MEMORY_POOL_UNKNOWN  0x0
#define global D3D12_MEMORY_POOL_L0  0x1
#define global D3D12_MEMORY_POOL_L1  0x2

; D3D12_PIPELINE_STATE_FLAGS
#define global D3D12_PIPELINE_STATE_FLAG_NONE  0x0
#define global D3D12_PIPELINE_STATE_FLAG_TOOL_DEBUG  0x1
#define global D3D12_PIPELINE_STATE_FLAG_DYNAMIC_DEPTH_BIAS  0x4
#define global D3D12_PIPELINE_STATE_FLAG_DYNAMIC_INDEX_BUFFER_STRIP_CUT  0x8

; D3D12_PRIMITIVE_TOPOLOGY_TYPE
#define global D3D12_PRIMITIVE_TOPOLOGY_TYPE_UNDEFINED  0x0
#define global D3D12_PRIMITIVE_TOPOLOGY_TYPE_POINT  0x1
#define global D3D12_PRIMITIVE_TOPOLOGY_TYPE_LINE  0x2
#define global D3D12_PRIMITIVE_TOPOLOGY_TYPE_TRIANGLE  0x3
#define global D3D12_PRIMITIVE_TOPOLOGY_TYPE_PATCH  0x4

; D3D12_QUERY_HEAP_TYPE
#define global D3D12_QUERY_HEAP_TYPE_OCCLUSION  0x0
#define global D3D12_QUERY_HEAP_TYPE_TIMESTAMP  0x1
#define global D3D12_QUERY_HEAP_TYPE_PIPELINE_STATISTICS  0x2
#define global D3D12_QUERY_HEAP_TYPE_SO_STATISTICS  0x3
#define global D3D12_QUERY_HEAP_TYPE_VIDEO_DECODE_STATISTICS  0x4
#define global D3D12_QUERY_HEAP_TYPE_COPY_QUEUE_TIMESTAMP  0x5
#define global D3D12_QUERY_HEAP_TYPE_PIPELINE_STATISTICS1  0x7

; D3D12_RESOURCE_DIMENSION
#define global D3D12_RESOURCE_DIMENSION_UNKNOWN  0x0
#define global D3D12_RESOURCE_DIMENSION_BUFFER  0x1
#define global D3D12_RESOURCE_DIMENSION_TEXTURE1D  0x2
#define global D3D12_RESOURCE_DIMENSION_TEXTURE2D  0x3
#define global D3D12_RESOURCE_DIMENSION_TEXTURE3D  0x4

; D3D12_RESOURCE_FLAGS
#define global D3D12_RESOURCE_FLAG_NONE  0x0
#define global D3D12_RESOURCE_FLAG_ALLOW_RENDER_TARGET  0x1
#define global D3D12_RESOURCE_FLAG_ALLOW_DEPTH_STENCIL  0x2
#define global D3D12_RESOURCE_FLAG_ALLOW_UNORDERED_ACCESS  0x4
#define global D3D12_RESOURCE_FLAG_DENY_SHADER_RESOURCE  0x8
#define global D3D12_RESOURCE_FLAG_ALLOW_CROSS_ADAPTER  0x10
#define global D3D12_RESOURCE_FLAG_ALLOW_SIMULTANEOUS_ACCESS  0x20
#define global D3D12_RESOURCE_FLAG_VIDEO_DECODE_REFERENCE_ONLY  0x40
#define global D3D12_RESOURCE_FLAG_VIDEO_ENCODE_REFERENCE_ONLY  0x80
#define global D3D12_RESOURCE_FLAG_RAYTRACING_ACCELERATION_STRUCTURE  0x100

; D3D12_RESOURCE_STATES
#define global D3D12_RESOURCE_STATE_COMMON  0x0
#define global D3D12_RESOURCE_STATE_VERTEX_AND_CONSTANT_BUFFER  0x1
#define global D3D12_RESOURCE_STATE_INDEX_BUFFER  0x2
#define global D3D12_RESOURCE_STATE_RENDER_TARGET  0x4
#define global D3D12_RESOURCE_STATE_UNORDERED_ACCESS  0x8
#define global D3D12_RESOURCE_STATE_DEPTH_WRITE  0x10
#define global D3D12_RESOURCE_STATE_DEPTH_READ  0x20
#define global D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE  0x40
#define global D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE  0x80
#define global D3D12_RESOURCE_STATE_STREAM_OUT  0x100
#define global D3D12_RESOURCE_STATE_INDIRECT_ARGUMENT  0x200
#define global D3D12_RESOURCE_STATE_COPY_DEST  0x400
#define global D3D12_RESOURCE_STATE_COPY_SOURCE  0x800
#define global D3D12_RESOURCE_STATE_RESOLVE_DEST  0x1000
#define global D3D12_RESOURCE_STATE_RESOLVE_SOURCE  0x2000
#define global D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE  0x400000
#define global D3D12_RESOURCE_STATE_SHADING_RATE_SOURCE  0x1000000
#define global D3D12_RESOURCE_STATE_RESERVED_INTERNAL_8000  0x8000
#define global D3D12_RESOURCE_STATE_RESERVED_INTERNAL_4000  0x4000
#define global D3D12_RESOURCE_STATE_RESERVED_INTERNAL_100000  0x100000
#define global D3D12_RESOURCE_STATE_RESERVED_INTERNAL_40000000  0x40000000
#define global D3D12_RESOURCE_STATE_RESERVED_INTERNAL_80000000  0x40000001
#define global D3D12_RESOURCE_STATE_GENERIC_READ  0xac3
#define global D3D12_RESOURCE_STATE_ALL_SHADER_RESOURCE  0xc0
#define global D3D12_RESOURCE_STATE_PRESENT  0x0
#define global D3D12_RESOURCE_STATE_PREDICATION  0x200
#define global D3D12_RESOURCE_STATE_VIDEO_DECODE_READ  0x10000
#define global D3D12_RESOURCE_STATE_VIDEO_DECODE_WRITE  0x20000
#define global D3D12_RESOURCE_STATE_VIDEO_PROCESS_READ  0x40000
#define global D3D12_RESOURCE_STATE_VIDEO_PROCESS_WRITE  0x80000
#define global D3D12_RESOURCE_STATE_VIDEO_ENCODE_READ  0x200000
#define global D3D12_RESOURCE_STATE_VIDEO_ENCODE_WRITE  0x800000

; D3D12_RTV_DIMENSION
#define global D3D12_RTV_DIMENSION_UNKNOWN  0x0
#define global D3D12_RTV_DIMENSION_BUFFER  0x1
#define global D3D12_RTV_DIMENSION_TEXTURE1D  0x2
#define global D3D12_RTV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D12_RTV_DIMENSION_TEXTURE2D  0x4
#define global D3D12_RTV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D12_RTV_DIMENSION_TEXTURE2DMS  0x6
#define global D3D12_RTV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define global D3D12_RTV_DIMENSION_TEXTURE3D  0x8

; D3D12_SRV_DIMENSION
#define global D3D12_SRV_DIMENSION_UNKNOWN  0x0
#define global D3D12_SRV_DIMENSION_BUFFER  0x1
#define global D3D12_SRV_DIMENSION_TEXTURE1D  0x2
#define global D3D12_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D12_SRV_DIMENSION_TEXTURE2D  0x4
#define global D3D12_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D12_SRV_DIMENSION_TEXTURE2DMS  0x6
#define global D3D12_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define global D3D12_SRV_DIMENSION_TEXTURE3D  0x8
#define global D3D12_SRV_DIMENSION_TEXTURECUBE  0x9
#define global D3D12_SRV_DIMENSION_TEXTURECUBEARRAY  0xa
#define global D3D12_SRV_DIMENSION_RAYTRACING_ACCELERATION_STRUCTURE  0xb

; D3D12_STENCIL_OP
#define global D3D12_STENCIL_OP_KEEP  0x1
#define global D3D12_STENCIL_OP_ZERO  0x2
#define global D3D12_STENCIL_OP_REPLACE  0x3
#define global D3D12_STENCIL_OP_INCR_SAT  0x4
#define global D3D12_STENCIL_OP_DECR_SAT  0x5
#define global D3D12_STENCIL_OP_INVERT  0x6
#define global D3D12_STENCIL_OP_INCR  0x7
#define global D3D12_STENCIL_OP_DECR  0x8

; D3D12_TEXTURE_ADDRESS_MODE
#define global D3D12_TEXTURE_ADDRESS_MODE_WRAP  0x1
#define global D3D12_TEXTURE_ADDRESS_MODE_MIRROR  0x2
#define global D3D12_TEXTURE_ADDRESS_MODE_CLAMP  0x3
#define global D3D12_TEXTURE_ADDRESS_MODE_BORDER  0x4
#define global D3D12_TEXTURE_ADDRESS_MODE_MIRROR_ONCE  0x5

; D3D12_TEXTURE_LAYOUT
#define global D3D12_TEXTURE_LAYOUT_UNKNOWN  0x0
#define global D3D12_TEXTURE_LAYOUT_ROW_MAJOR  0x1
#define global D3D12_TEXTURE_LAYOUT_64KB_UNDEFINED_SWIZZLE  0x2
#define global D3D12_TEXTURE_LAYOUT_64KB_STANDARD_SWIZZLE  0x3

; D3D12_UAV_DIMENSION
#define global D3D12_UAV_DIMENSION_UNKNOWN  0x0
#define global D3D12_UAV_DIMENSION_BUFFER  0x1
#define global D3D12_UAV_DIMENSION_TEXTURE1D  0x2
#define global D3D12_UAV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D12_UAV_DIMENSION_TEXTURE2D  0x4
#define global D3D12_UAV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D12_UAV_DIMENSION_TEXTURE2DMS  0x6
#define global D3D12_UAV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define global D3D12_UAV_DIMENSION_TEXTURE3D  0x8

; D3D_DRIVER_TYPE
#define global D3D_DRIVER_TYPE_UNKNOWN  0x0
#define global D3D_DRIVER_TYPE_HARDWARE  0x1
#define global D3D_DRIVER_TYPE_REFERENCE  0x2
#define global D3D_DRIVER_TYPE_NULL  0x3
#define global D3D_DRIVER_TYPE_SOFTWARE  0x4
#define global D3D_DRIVER_TYPE_WARP  0x5

; D3D_FEATURE_LEVEL
#define global D3D_FEATURE_LEVEL_1_0_GENERIC  0x100
#define global D3D_FEATURE_LEVEL_1_0_CORE  0x1000
#define global D3D_FEATURE_LEVEL_9_1  0x9100
#define global D3D_FEATURE_LEVEL_9_2  0x9200
#define global D3D_FEATURE_LEVEL_9_3  0x9300
#define global D3D_FEATURE_LEVEL_10_0  0xa000
#define global D3D_FEATURE_LEVEL_10_1  0xa100
#define global D3D_FEATURE_LEVEL_11_0  0xb000
#define global D3D_FEATURE_LEVEL_11_1  0xb100
#define global D3D_FEATURE_LEVEL_12_0  0xc000
#define global D3D_FEATURE_LEVEL_12_1  0xc100
#define global D3D_FEATURE_LEVEL_12_2  0xc200

; D3D_PRIMITIVE_TOPOLOGY
#define global D3D_PRIMITIVE_TOPOLOGY_UNDEFINED  0x0
#define global D3D_PRIMITIVE_TOPOLOGY_POINTLIST  0x1
#define global D3D_PRIMITIVE_TOPOLOGY_LINELIST  0x2
#define global D3D_PRIMITIVE_TOPOLOGY_LINESTRIP  0x3
#define global D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST  0x4
#define global D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP  0x5
#define global D3D_PRIMITIVE_TOPOLOGY_TRIANGLEFAN  0x6
#define global D3D_PRIMITIVE_TOPOLOGY_LINELIST_ADJ  0xa
#define global D3D_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ  0xb
#define global D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ  0xc
#define global D3D_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ  0xd
#define global D3D_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST  0x21
#define global D3D_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST  0x22
#define global D3D_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST  0x23
#define global D3D_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST  0x24
#define global D3D_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST  0x25
#define global D3D_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST  0x26
#define global D3D_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST  0x27
#define global D3D_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST  0x28
#define global D3D_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST  0x29
#define global D3D_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST  0x2a
#define global D3D_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST  0x2b
#define global D3D_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST  0x2c
#define global D3D_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST  0x2d
#define global D3D_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST  0x2e
#define global D3D_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST  0x2f
#define global D3D_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST  0x30
#define global D3D_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST  0x31
#define global D3D_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST  0x32
#define global D3D_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST  0x33
#define global D3D_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST  0x34
#define global D3D_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST  0x35
#define global D3D_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST  0x36
#define global D3D_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST  0x37
#define global D3D_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST  0x38
#define global D3D_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST  0x39
#define global D3D_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST  0x3a
#define global D3D_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST  0x3b
#define global D3D_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST  0x3c
#define global D3D_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST  0x3d
#define global D3D_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST  0x3e
#define global D3D_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST  0x3f
#define global D3D_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST  0x40
#define global D3D10_PRIMITIVE_TOPOLOGY_UNDEFINED  0x0
#define global D3D10_PRIMITIVE_TOPOLOGY_POINTLIST  0x1
#define global D3D10_PRIMITIVE_TOPOLOGY_LINELIST  0x2
#define global D3D10_PRIMITIVE_TOPOLOGY_LINESTRIP  0x3
#define global D3D10_PRIMITIVE_TOPOLOGY_TRIANGLELIST  0x4
#define global D3D10_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP  0x5
#define global D3D10_PRIMITIVE_TOPOLOGY_LINELIST_ADJ  0xa
#define global D3D10_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ  0xb
#define global D3D10_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ  0xc
#define global D3D10_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ  0xd
#define global D3D11_PRIMITIVE_TOPOLOGY_UNDEFINED  0x0
#define global D3D11_PRIMITIVE_TOPOLOGY_POINTLIST  0x1
#define global D3D11_PRIMITIVE_TOPOLOGY_LINELIST  0x2
#define global D3D11_PRIMITIVE_TOPOLOGY_LINESTRIP  0x3
#define global D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST  0x4
#define global D3D11_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP  0x5
#define global D3D11_PRIMITIVE_TOPOLOGY_LINELIST_ADJ  0xa
#define global D3D11_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ  0xb
#define global D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ  0xc
#define global D3D11_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ  0xd
#define global D3D11_PRIMITIVE_TOPOLOGY_1_CONTROL_POINT_PATCHLIST  0x21
#define global D3D11_PRIMITIVE_TOPOLOGY_2_CONTROL_POINT_PATCHLIST  0x22
#define global D3D11_PRIMITIVE_TOPOLOGY_3_CONTROL_POINT_PATCHLIST  0x23
#define global D3D11_PRIMITIVE_TOPOLOGY_4_CONTROL_POINT_PATCHLIST  0x24
#define global D3D11_PRIMITIVE_TOPOLOGY_5_CONTROL_POINT_PATCHLIST  0x25
#define global D3D11_PRIMITIVE_TOPOLOGY_6_CONTROL_POINT_PATCHLIST  0x26
#define global D3D11_PRIMITIVE_TOPOLOGY_7_CONTROL_POINT_PATCHLIST  0x27
#define global D3D11_PRIMITIVE_TOPOLOGY_8_CONTROL_POINT_PATCHLIST  0x28
#define global D3D11_PRIMITIVE_TOPOLOGY_9_CONTROL_POINT_PATCHLIST  0x29
#define global D3D11_PRIMITIVE_TOPOLOGY_10_CONTROL_POINT_PATCHLIST  0x2a
#define global D3D11_PRIMITIVE_TOPOLOGY_11_CONTROL_POINT_PATCHLIST  0x2b
#define global D3D11_PRIMITIVE_TOPOLOGY_12_CONTROL_POINT_PATCHLIST  0x2c
#define global D3D11_PRIMITIVE_TOPOLOGY_13_CONTROL_POINT_PATCHLIST  0x2d
#define global D3D11_PRIMITIVE_TOPOLOGY_14_CONTROL_POINT_PATCHLIST  0x2e
#define global D3D11_PRIMITIVE_TOPOLOGY_15_CONTROL_POINT_PATCHLIST  0x2f
#define global D3D11_PRIMITIVE_TOPOLOGY_16_CONTROL_POINT_PATCHLIST  0x30
#define global D3D11_PRIMITIVE_TOPOLOGY_17_CONTROL_POINT_PATCHLIST  0x31
#define global D3D11_PRIMITIVE_TOPOLOGY_18_CONTROL_POINT_PATCHLIST  0x32
#define global D3D11_PRIMITIVE_TOPOLOGY_19_CONTROL_POINT_PATCHLIST  0x33
#define global D3D11_PRIMITIVE_TOPOLOGY_20_CONTROL_POINT_PATCHLIST  0x34
#define global D3D11_PRIMITIVE_TOPOLOGY_21_CONTROL_POINT_PATCHLIST  0x35
#define global D3D11_PRIMITIVE_TOPOLOGY_22_CONTROL_POINT_PATCHLIST  0x36
#define global D3D11_PRIMITIVE_TOPOLOGY_23_CONTROL_POINT_PATCHLIST  0x37
#define global D3D11_PRIMITIVE_TOPOLOGY_24_CONTROL_POINT_PATCHLIST  0x38
#define global D3D11_PRIMITIVE_TOPOLOGY_25_CONTROL_POINT_PATCHLIST  0x39
#define global D3D11_PRIMITIVE_TOPOLOGY_26_CONTROL_POINT_PATCHLIST  0x3a
#define global D3D11_PRIMITIVE_TOPOLOGY_27_CONTROL_POINT_PATCHLIST  0x3b
#define global D3D11_PRIMITIVE_TOPOLOGY_28_CONTROL_POINT_PATCHLIST  0x3c
#define global D3D11_PRIMITIVE_TOPOLOGY_29_CONTROL_POINT_PATCHLIST  0x3d
#define global D3D11_PRIMITIVE_TOPOLOGY_30_CONTROL_POINT_PATCHLIST  0x3e
#define global D3D11_PRIMITIVE_TOPOLOGY_31_CONTROL_POINT_PATCHLIST  0x3f
#define global D3D11_PRIMITIVE_TOPOLOGY_32_CONTROL_POINT_PATCHLIST  0x40

; D3D_SRV_DIMENSION
#define global D3D_SRV_DIMENSION_UNKNOWN  0x0
#define global D3D_SRV_DIMENSION_BUFFER  0x1
#define global D3D_SRV_DIMENSION_TEXTURE1D  0x2
#define global D3D_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D_SRV_DIMENSION_TEXTURE2D  0x4
#define global D3D_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D_SRV_DIMENSION_TEXTURE2DMS  0x6
#define global D3D_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define global D3D_SRV_DIMENSION_TEXTURE3D  0x8
#define global D3D_SRV_DIMENSION_TEXTURECUBE  0x9
#define global D3D_SRV_DIMENSION_TEXTURECUBEARRAY  0xa
#define global D3D_SRV_DIMENSION_BUFFEREX  0xb
#define global D3D10_SRV_DIMENSION_UNKNOWN  0x0
#define global D3D10_SRV_DIMENSION_BUFFER  0x1
#define global D3D10_SRV_DIMENSION_TEXTURE1D  0x2
#define global D3D10_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D10_SRV_DIMENSION_TEXTURE2D  0x4
#define global D3D10_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D10_SRV_DIMENSION_TEXTURE2DMS  0x6
#define global D3D10_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define global D3D10_SRV_DIMENSION_TEXTURE3D  0x8
#define global D3D10_SRV_DIMENSION_TEXTURECUBE  0x9
#define global D3D10_1_SRV_DIMENSION_UNKNOWN  0x0
#define global D3D10_1_SRV_DIMENSION_BUFFER  0x1
#define global D3D10_1_SRV_DIMENSION_TEXTURE1D  0x2
#define global D3D10_1_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D10_1_SRV_DIMENSION_TEXTURE2D  0x4
#define global D3D10_1_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D10_1_SRV_DIMENSION_TEXTURE2DMS  0x6
#define global D3D10_1_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define global D3D10_1_SRV_DIMENSION_TEXTURE3D  0x8
#define global D3D10_1_SRV_DIMENSION_TEXTURECUBE  0x9
#define global D3D10_1_SRV_DIMENSION_TEXTURECUBEARRAY  0xa
#define global D3D11_SRV_DIMENSION_UNKNOWN  0x0
#define global D3D11_SRV_DIMENSION_BUFFER  0x1
#define global D3D11_SRV_DIMENSION_TEXTURE1D  0x2
#define global D3D11_SRV_DIMENSION_TEXTURE1DARRAY  0x3
#define global D3D11_SRV_DIMENSION_TEXTURE2D  0x4
#define global D3D11_SRV_DIMENSION_TEXTURE2DARRAY  0x5
#define global D3D11_SRV_DIMENSION_TEXTURE2DMS  0x6
#define global D3D11_SRV_DIMENSION_TEXTURE2DMSARRAY  0x7
#define global D3D11_SRV_DIMENSION_TEXTURE3D  0x8
#define global D3D11_SRV_DIMENSION_TEXTURECUBE  0x9
#define global D3D11_SRV_DIMENSION_TEXTURECUBEARRAY  0xa
#define global D3D11_SRV_DIMENSION_BUFFEREX  0xb

; DashCap
#define global DashCapFlat  0x0
#define global DashCapRound  0x2
#define global DashCapTriangle  0x3

; DashStyle
#define global DashStyleSolid  0x0
#define global DashStyleDash  0x1
#define global DashStyleDot  0x2
#define global DashStyleDashDot  0x3
#define global DashStyleDashDotDot  0x4
#define global DashStyleCustom  0x5

; DATAOBJ_GET_ITEM_FLAGS
#define global DOGIF_DEFAULT  0x0
#define global DOGIF_TRAVERSE_LINK  0x1
#define global DOGIF_NO_HDROP  0x2
#define global DOGIF_NO_URL  0x4
#define global DOGIF_ONLY_IF_ONE  0x8

; DC_LAYOUT
#define global LAYOUT_BITMAPORIENTATIONPRESERVED  0x8
#define global LAYOUT_RTL  0x1

; DCB_PARITY
#define global EVENPARITY  0x2
#define global MARKPARITY  0x3
#define global NOPARITY  0x0
#define global ODDPARITY  0x1
#define global SPACEPARITY  0x4

; DCB_STOP_BITS
#define global ONESTOPBIT  0x0
#define global ONE5STOPBITS  0x1
#define global TWOSTOPBITS  0x2

; DDE_CLIENT_TRANSACTION_TYPE
#define global XTYP_ADVSTART  0x1030
#define global XTYP_ADVSTOP  0x8040
#define global XTYP_EXECUTE  0x4050
#define global XTYP_POKE  0x4090
#define global XTYP_REQUEST  0x20b0
#define global XTYP_ADVDATA  0x4010
#define global XTYP_ADVREQ  0x2022
#define global XTYP_CONNECT  0x1062
#define global XTYP_CONNECT_CONFIRM  0x8072
#define global XTYP_DISCONNECT  0x80c2
#define global XTYP_MONITOR  0x80f2
#define global XTYP_REGISTER  0x80a2
#define global XTYP_UNREGISTER  0x80d2
#define global XTYP_WILDCONNECT  0x20e2
#define global XTYP_XACT_COMPLETE  0x8080

; DDE_ENABLE_CALLBACK_CMD
#define global EC_ENABLEALL  0x0
#define global EC_ENABLEONE  0x80
#define global EC_DISABLE  0x8
#define global EC_QUERYWAITING  0x2

; DDE_INITIALIZE_COMMAND
#define global APPCLASS_MONITOR  0x1
#define global APPCLASS_STANDARD  0x0
#define global APPCMD_CLIENTONLY  0x10
#define global APPCMD_FILTERINITS  0x20
#define global CBF_FAIL_ALLSVRXACTIONS  0x3f000
#define global CBF_FAIL_ADVISES  0x4000
#define global CBF_FAIL_CONNECTIONS  0x2000
#define global CBF_FAIL_EXECUTES  0x8000
#define global CBF_FAIL_POKES  0x10000
#define global CBF_FAIL_REQUESTS  0x20000
#define global CBF_FAIL_SELFCONNECTIONS  0x1000
#define global CBF_SKIP_ALLNOTIFICATIONS  0x3c0000
#define global CBF_SKIP_CONNECT_CONFIRMS  0x40000
#define global CBF_SKIP_DISCONNECTS  0x200000
#define global CBF_SKIP_REGISTRATIONS  0x80000
#define global CBF_SKIP_UNREGISTRATIONS  0x100000
#define global MF_CALLBACKS  0x8000000
#define global MF_CONV  0x40000000
#define global MF_ERRORS  0x10000000
#define global MF_HSZ_INFO  0x1000000
#define global MF_LINKS  0x20000000
#define global MF_POSTMSGS  0x4000000
#define global MF_SENDMSGS  0x2000000

; DDE_NAME_SERVICE_CMD
#define global DNS_REGISTER  0x1
#define global DNS_UNREGISTER  0x2
#define global DNS_FILTERON  0x4
#define global DNS_FILTEROFF  0x8

; DEBUG_EVENT_CODE
#define global CREATE_PROCESS_DEBUG_EVENT  0x3
#define global CREATE_THREAD_DEBUG_EVENT  0x2
#define global EXCEPTION_DEBUG_EVENT  0x1
#define global EXIT_PROCESS_DEBUG_EVENT  0x5
#define global EXIT_THREAD_DEBUG_EVENT  0x4
#define global LOAD_DLL_DEBUG_EVENT  0x6
#define global OUTPUT_DEBUG_STRING_EVENT  0x8
#define global RIP_EVENT  0x9
#define global UNLOAD_DLL_DEBUG_EVENT  0x7

; DEFINE_DOS_DEVICE_FLAGS
#define global DDD_RAW_TARGET_PATH  0x1
#define global DDD_REMOVE_DEFINITION  0x2
#define global DDD_EXACT_MATCH_ON_REMOVE  0x4
#define global DDD_NO_BROADCAST_SYSTEM  0x8
#define global DDD_LUID_BROADCAST_DRIVE  0x10

; DEP_SYSTEM_POLICY_TYPE
#define global DEPPolicyAlwaysOff  0x0
#define global DEPPolicyAlwaysOn  0x1
#define global DEPPolicyOptIn  0x2
#define global DEPPolicyOptOut  0x3
#define global DEPTotalPolicyCount  0x4

; DESCKIND
#define global DESCKIND_NONE  0x0
#define global DESCKIND_FUNCDESC  0x1
#define global DESCKIND_VARDESC  0x2
#define global DESCKIND_TYPECOMP  0x3
#define global DESCKIND_IMPLICITAPPOBJ  0x4
#define global DESCKIND_MAX  0x5

; DESKTOP_ACCESS_FLAGS
#define global DESKTOP_DELETE  0x10000
#define global DESKTOP_READ_CONTROL  0x20000
#define global DESKTOP_WRITE_DAC  0x40000
#define global DESKTOP_WRITE_OWNER  0x80000
#define global DESKTOP_SYNCHRONIZE  0x100000
#define global DESKTOP_READOBJECTS  0x1
#define global DESKTOP_CREATEWINDOW  0x2
#define global DESKTOP_CREATEMENU  0x4
#define global DESKTOP_HOOKCONTROL  0x8
#define global DESKTOP_JOURNALRECORD  0x10
#define global DESKTOP_JOURNALPLAYBACK  0x20
#define global DESKTOP_ENUMERATE  0x40
#define global DESKTOP_WRITEOBJECTS  0x80
#define global DESKTOP_SWITCHDESKTOP  0x100

; DESKTOP_CONTROL_FLAGS
#define global DF_ALLOWOTHERACCOUNTHOOK  0x1

; DEVMODE_COLLATE
#define global DMCOLLATE_FALSE  0x0
#define global DMCOLLATE_TRUE  0x1

; DEVMODE_COLOR
#define global DMCOLOR_MONOCHROME  0x1
#define global DMCOLOR_COLOR  0x2

; DEVMODE_DISPLAY_FIXED_OUTPUT
#define global DMDFO_DEFAULT  0x0
#define global DMDFO_STRETCH  0x1
#define global DMDFO_CENTER  0x2

; DEVMODE_DISPLAY_ORIENTATION
#define global DMDO_DEFAULT  0x0
#define global DMDO_90  0x1
#define global DMDO_180  0x2
#define global DMDO_270  0x3

; DEVMODE_DUPLEX
#define global DMDUP_SIMPLEX  0x1
#define global DMDUP_VERTICAL  0x2
#define global DMDUP_HORIZONTAL  0x3

; DEVMODE_FIELD_FLAGS
#define global DM_SPECVERSION  0x401
#define global DM_ORIENTATION  0x1
#define global DM_PAPERSIZE  0x2
#define global DM_PAPERLENGTH  0x4
#define global DM_PAPERWIDTH  0x8
#define global DM_SCALE  0x10
#define global DM_POSITION  0x20
#define global DM_NUP  0x40
#define global DM_DISPLAYORIENTATION  0x80
#define global DM_COPIES  0x100
#define global DM_DEFAULTSOURCE  0x200
#define global DM_PRINTQUALITY  0x400
#define global DM_COLOR  0x800
#define global DM_DUPLEX  0x1000
#define global DM_YRESOLUTION  0x2000
#define global DM_TTOPTION  0x4000
#define global DM_COLLATE  0x8000
#define global DM_FORMNAME  0x10000
#define global DM_LOGPIXELS  0x20000
#define global DM_BITSPERPEL  0x40000
#define global DM_PELSWIDTH  0x80000
#define global DM_PELSHEIGHT  0x100000
#define global DM_DISPLAYFLAGS  0x200000
#define global DM_DISPLAYFREQUENCY  0x400000
#define global DM_ICMMETHOD  0x800000
#define global DM_ICMINTENT  0x1000000
#define global DM_MEDIATYPE  0x2000000
#define global DM_DITHERTYPE  0x4000000
#define global DM_PANNINGWIDTH  0x8000000
#define global DM_PANNINGHEIGHT  0x10000000
#define global DM_DISPLAYFIXEDOUTPUT  0x20000000
#define global DM_INTERLACED  0x2
#define global DM_UPDATE  0x1
#define global DM_COPY  0x2
#define global DM_PROMPT  0x4
#define global DM_MODIFY  0x8
#define global DM_IN_BUFFER  0x8
#define global DM_IN_PROMPT  0x4
#define global DM_OUT_BUFFER  0x2
#define global DM_OUT_DEFAULT  0x1

; DEVMODE_TRUETYPE_OPTION
#define global DMTT_BITMAP  0x1
#define global DMTT_DOWNLOAD  0x2
#define global DMTT_SUBDEV  0x3
#define global DMTT_DOWNLOAD_OUTLINE  0x4

; DFC_TYPE
#define global DFC_CAPTION  0x1
#define global DFC_MENU  0x2
#define global DFC_SCROLL  0x3
#define global DFC_BUTTON  0x4
#define global DFC_POPUPMENU  0x5

; DFCS_STATE
#define global DFCS_CAPTIONCLOSE  0x0
#define global DFCS_CAPTIONMIN  0x1
#define global DFCS_CAPTIONMAX  0x2
#define global DFCS_CAPTIONRESTORE  0x3
#define global DFCS_CAPTIONHELP  0x4
#define global DFCS_MENUARROW  0x0
#define global DFCS_MENUCHECK  0x1
#define global DFCS_MENUBULLET  0x2
#define global DFCS_MENUARROWRIGHT  0x4
#define global DFCS_SCROLLUP  0x0
#define global DFCS_SCROLLDOWN  0x1
#define global DFCS_SCROLLLEFT  0x2
#define global DFCS_SCROLLRIGHT  0x3
#define global DFCS_SCROLLCOMBOBOX  0x5
#define global DFCS_SCROLLSIZEGRIP  0x8
#define global DFCS_SCROLLSIZEGRIPRIGHT  0x10
#define global DFCS_BUTTONCHECK  0x0
#define global DFCS_BUTTONRADIOIMAGE  0x1
#define global DFCS_BUTTONRADIOMASK  0x2
#define global DFCS_BUTTONRADIO  0x4
#define global DFCS_BUTTON3STATE  0x8
#define global DFCS_BUTTONPUSH  0x10
#define global DFCS_INACTIVE  0x100
#define global DFCS_PUSHED  0x200
#define global DFCS_CHECKED  0x400
#define global DFCS_TRANSPARENT  0x800
#define global DFCS_HOT  0x1000
#define global DFCS_ADJUSTRECT  0x2000
#define global DFCS_FLAT  0x4000
#define global DFCS_MONO  0x8000

; DI_FLAGS
#define global DI_MASK  0x1
#define global DI_IMAGE  0x2
#define global DI_NORMAL  0x3
#define global DI_COMPAT  0x4
#define global DI_DEFAULTSIZE  0x8
#define global DI_NOMIRROR  0x10

; DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS
#define global DCDC_DEFAULT  0x0
#define global DCDC_DISABLE_FONT_UPDATE  0x1
#define global DCDC_DISABLE_RELAYOUT  0x2

; DIALOG_DPI_CHANGE_BEHAVIORS
#define global DDC_DEFAULT  0x0
#define global DDC_DISABLE_ALL  0x1
#define global DDC_DISABLE_RESIZE  0x2
#define global DDC_DISABLE_CONTROL_RELAYOUT  0x4

; DIB_USAGE
#define global DIB_RGB_COLORS  0x0
#define global DIB_PAL_COLORS  0x1

; DISP_CHANGE
#define global DISP_CHANGE_SUCCESSFUL  0x0
#define global DISP_CHANGE_RESTART  0x1
#define global DISP_CHANGE_FAILED  -1
#define global DISP_CHANGE_BADMODE  -2
#define global DISP_CHANGE_NOTUPDATED  -3
#define global DISP_CHANGE_BADFLAGS  -4
#define global DISP_CHANGE_BADPARAM  -5
#define global DISP_CHANGE_BADDUALVIEW  -6

; DISPATCH_FLAGS
#define global DISPATCH_METHOD  0x1
#define global DISPATCH_PROPERTYGET  0x2
#define global DISPATCH_PROPERTYPUT  0x4
#define global DISPATCH_PROPERTYPUTREF  0x8

; DISPLAYCONFIG_DEVICE_INFO_TYPE
#define global DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME  0x1
#define global DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_NAME  0x2
#define global DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_PREFERRED_MODE  0x3
#define global DISPLAYCONFIG_DEVICE_INFO_GET_ADAPTER_NAME  0x4
#define global DISPLAYCONFIG_DEVICE_INFO_SET_TARGET_PERSISTENCE  0x5
#define global DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_BASE_TYPE  0x6
#define global DISPLAYCONFIG_DEVICE_INFO_GET_SUPPORT_VIRTUAL_RESOLUTION  0x7
#define global DISPLAYCONFIG_DEVICE_INFO_SET_SUPPORT_VIRTUAL_RESOLUTION  0x8
#define global DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO  0x9
#define global DISPLAYCONFIG_DEVICE_INFO_SET_ADVANCED_COLOR_STATE  0xa
#define global DISPLAYCONFIG_DEVICE_INFO_GET_SDR_WHITE_LEVEL  0xb
#define global DISPLAYCONFIG_DEVICE_INFO_GET_MONITOR_SPECIALIZATION  0xc
#define global DISPLAYCONFIG_DEVICE_INFO_SET_MONITOR_SPECIALIZATION  0xd

; DISPLAYCONFIG_MODE_INFO_TYPE
#define global DISPLAYCONFIG_MODE_INFO_TYPE_SOURCE  0x1
#define global DISPLAYCONFIG_MODE_INFO_TYPE_TARGET  0x2
#define global DISPLAYCONFIG_MODE_INFO_TYPE_DESKTOP_IMAGE  0x3

; DISPLAYCONFIG_PIXELFORMAT
#define global DISPLAYCONFIG_PIXELFORMAT_8BPP  0x1
#define global DISPLAYCONFIG_PIXELFORMAT_16BPP  0x2
#define global DISPLAYCONFIG_PIXELFORMAT_24BPP  0x3
#define global DISPLAYCONFIG_PIXELFORMAT_32BPP  0x4
#define global DISPLAYCONFIG_PIXELFORMAT_NONGDI  0x5

; DISPLAYCONFIG_ROTATION
#define global DISPLAYCONFIG_ROTATION_IDENTITY  0x1
#define global DISPLAYCONFIG_ROTATION_ROTATE90  0x2
#define global DISPLAYCONFIG_ROTATION_ROTATE180  0x3
#define global DISPLAYCONFIG_ROTATION_ROTATE270  0x4

; DISPLAYCONFIG_SCALING
#define global DISPLAYCONFIG_SCALING_IDENTITY  0x1
#define global DISPLAYCONFIG_SCALING_CENTERED  0x2
#define global DISPLAYCONFIG_SCALING_STRETCHED  0x3
#define global DISPLAYCONFIG_SCALING_ASPECTRATIOCENTEREDMAX  0x4
#define global DISPLAYCONFIG_SCALING_CUSTOM  0x5
#define global DISPLAYCONFIG_SCALING_PREFERRED  0x80

; DISPLAYCONFIG_SCANLINE_ORDERING
#define global DISPLAYCONFIG_SCANLINE_ORDERING_UNSPECIFIED  0x0
#define global DISPLAYCONFIG_SCANLINE_ORDERING_PROGRESSIVE  0x1
#define global DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED  0x2
#define global DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_UPPERFIELDFIRST  0x2
#define global DISPLAYCONFIG_SCANLINE_ORDERING_INTERLACED_LOWERFIELDFIRST  0x3

; DISPLAYCONFIG_TOPOLOGY_ID
#define global DISPLAYCONFIG_TOPOLOGY_INTERNAL  0x1
#define global DISPLAYCONFIG_TOPOLOGY_CLONE  0x2
#define global DISPLAYCONFIG_TOPOLOGY_EXTEND  0x4
#define global DISPLAYCONFIG_TOPOLOGY_EXTERNAL  0x8

; DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_OTHER  -1
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HD15  0x0
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SVIDEO  0x1
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPOSITE_VIDEO  0x2
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_COMPONENT_VIDEO  0x3
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DVI  0x4
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_HDMI  0x5
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_LVDS  0x6
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_D_JPN  0x8
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDI  0x9
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EXTERNAL  0xa
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_EMBEDDED  0xb
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EXTERNAL  0xc
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_UDI_EMBEDDED  0xd
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_SDTVDONGLE  0xe
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_MIRACAST  0xf
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_WIRED  0x10
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INDIRECT_VIRTUAL  0x11
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_DISPLAYPORT_USB_TUNNEL  0x12
#define global DISPLAYCONFIG_OUTPUT_TECHNOLOGY_INTERNAL  -2147483648

; DitherType
#define global DitherTypeNone  0x0
#define global DitherTypeSolid  0x1
#define global DitherTypeOrdered4x4  0x2
#define global DitherTypeOrdered8x8  0x3
#define global DitherTypeOrdered16x16  0x4
#define global DitherTypeSpiral4x4  0x5
#define global DitherTypeSpiral8x8  0x6
#define global DitherTypeDualSpiral4x4  0x7
#define global DitherTypeDualSpiral8x8  0x8
#define global DitherTypeErrorDiffusion  0x9
#define global DitherTypeMax  0xa

; DLG_BUTTON_CHECK_STATE
#define global BST_CHECKED  0x1
#define global BST_INDETERMINATE  0x2
#define global BST_UNCHECKED  0x0

; DLG_DIR_LIST_FILE_TYPE
#define global DDL_ARCHIVE  0x20
#define global DDL_DIRECTORY  0x10
#define global DDL_DRIVES  0x4000
#define global DDL_EXCLUSIVE  0x8000
#define global DDL_HIDDEN  0x2
#define global DDL_READONLY  0x1
#define global DDL_READWRITE  0x0
#define global DDL_SYSTEM  0x4
#define global DDL_POSTMSGS  0x2000

; DOT11_AUTH_ALGORITHM
#define global DOT11_AUTH_ALGO_80211_OPEN  0x1
#define global DOT11_AUTH_ALGO_80211_SHARED_KEY  0x2
#define global DOT11_AUTH_ALGO_WPA  0x3
#define global DOT11_AUTH_ALGO_WPA_PSK  0x4
#define global DOT11_AUTH_ALGO_WPA_NONE  0x5
#define global DOT11_AUTH_ALGO_RSNA  0x6
#define global DOT11_AUTH_ALGO_RSNA_PSK  0x7
#define global DOT11_AUTH_ALGO_WPA3  0x8
#define global DOT11_AUTH_ALGO_WPA3_ENT_192  0x8
#define global DOT11_AUTH_ALGO_WPA3_SAE  0x9
#define global DOT11_AUTH_ALGO_OWE  0xa
#define global DOT11_AUTH_ALGO_WPA3_ENT  0xb
#define global DOT11_AUTH_ALGO_IHV_START  -2147483648
#define global DOT11_AUTH_ALGO_IHV_END  -1

; DOT11_BSS_TYPE
#define global dot11_BSS_type_infrastructure  0x1
#define global dot11_BSS_type_independent  0x2
#define global dot11_BSS_type_any  0x3

; DOT11_CIPHER_ALGORITHM
#define global DOT11_CIPHER_ALGO_NONE  0x0
#define global DOT11_CIPHER_ALGO_WEP40  0x1
#define global DOT11_CIPHER_ALGO_TKIP  0x2
#define global DOT11_CIPHER_ALGO_CCMP  0x4
#define global DOT11_CIPHER_ALGO_WEP104  0x5
#define global DOT11_CIPHER_ALGO_BIP  0x6
#define global DOT11_CIPHER_ALGO_GCMP  0x8
#define global DOT11_CIPHER_ALGO_GCMP_256  0x9
#define global DOT11_CIPHER_ALGO_CCMP_256  0xa
#define global DOT11_CIPHER_ALGO_BIP_GMAC_128  0xb
#define global DOT11_CIPHER_ALGO_BIP_GMAC_256  0xc
#define global DOT11_CIPHER_ALGO_BIP_CMAC_256  0xd
#define global DOT11_CIPHER_ALGO_WPA_USE_GROUP  0x100
#define global DOT11_CIPHER_ALGO_RSN_USE_GROUP  0x100
#define global DOT11_CIPHER_ALGO_WEP  0x101
#define global DOT11_CIPHER_ALGO_IHV_START  -2147483648
#define global DOT11_CIPHER_ALGO_IHV_END  -1

; DOT11_PHY_TYPE
#define global dot11_phy_type_unknown  0x0
#define global dot11_phy_type_any  0x0
#define global dot11_phy_type_fhss  0x1
#define global dot11_phy_type_dsss  0x2
#define global dot11_phy_type_irbaseband  0x3
#define global dot11_phy_type_ofdm  0x4
#define global dot11_phy_type_hrdsss  0x5
#define global dot11_phy_type_erp  0x6
#define global dot11_phy_type_ht  0x7
#define global dot11_phy_type_vht  0x8
#define global dot11_phy_type_dmg  0x9
#define global dot11_phy_type_he  0xa
#define global dot11_phy_type_eht  0xb
#define global dot11_phy_type_IHV_start  -2147483648
#define global dot11_phy_type_IHV_end  -1

; DPAMM_MESSAGE
#define global DPAMM_MERGE  0x1
#define global DPAMM_DELETE  0x2
#define global DPAMM_INSERT  0x3

; DPI_AWARENESS
#define global DPI_AWARENESS_INVALID  -1
#define global DPI_AWARENESS_UNAWARE  0x0
#define global DPI_AWARENESS_SYSTEM_AWARE  0x1
#define global DPI_AWARENESS_PER_MONITOR_AWARE  0x2

; DPI_HOSTING_BEHAVIOR
#define global DPI_HOSTING_BEHAVIOR_INVALID  -1
#define global DPI_HOSTING_BEHAVIOR_DEFAULT  0x0
#define global DPI_HOSTING_BEHAVIOR_MIXED  0x1

; DRAW_CAPTION_FLAGS
#define global DC_ACTIVE  0x1
#define global DC_BUTTONS  0x1000
#define global DC_GRADIENT  0x20
#define global DC_ICON  0x4
#define global DC_INBUTTON  0x10
#define global DC_SMALLCAP  0x2
#define global DC_TEXT  0x8

; DRAW_EDGE_FLAGS
#define global BF_ADJUST  0x2000
#define global BF_BOTTOM  0x8
#define global BF_BOTTOMLEFT  0x9
#define global BF_BOTTOMRIGHT  0xc
#define global BF_DIAGONAL  0x10
#define global BF_DIAGONAL_ENDBOTTOMLEFT  0x19
#define global BF_DIAGONAL_ENDBOTTOMRIGHT  0x1c
#define global BF_DIAGONAL_ENDTOPLEFT  0x13
#define global BF_DIAGONAL_ENDTOPRIGHT  0x16
#define global BF_FLAT  0x4000
#define global BF_LEFT  0x1
#define global BF_MIDDLE  0x800
#define global BF_MONO  0x8000
#define global BF_RECT  0xf
#define global BF_RIGHT  0x4
#define global BF_SOFT  0x1000
#define global BF_TOP  0x2
#define global BF_TOPLEFT  0x3
#define global BF_TOPRIGHT  0x6

; DRAW_TEXT_FORMAT
#define global DT_BOTTOM  0x8
#define global DT_CALCRECT  0x400
#define global DT_CENTER  0x1
#define global DT_EDITCONTROL  0x2000
#define global DT_END_ELLIPSIS  0x8000
#define global DT_EXPANDTABS  0x40
#define global DT_EXTERNALLEADING  0x200
#define global DT_HIDEPREFIX  0x100000
#define global DT_INTERNAL  0x1000
#define global DT_LEFT  0x0
#define global DT_MODIFYSTRING  0x10000
#define global DT_NOCLIP  0x100
#define global DT_NOFULLWIDTHCHARBREAK  0x80000
#define global DT_NOPREFIX  0x800
#define global DT_PATH_ELLIPSIS  0x4000
#define global DT_PREFIXONLY  0x200000
#define global DT_RIGHT  0x2
#define global DT_RTLREADING  0x20000
#define global DT_SINGLELINE  0x20
#define global DT_TABSTOP  0x80
#define global DT_TOP  0x0
#define global DT_VCENTER  0x4
#define global DT_WORDBREAK  0x10
#define global DT_WORD_ELLIPSIS  0x40000

; DRAW_THEME_PARENT_BACKGROUND_FLAGS
#define global DTPB_WINDOWDC  0x1
#define global DTPB_USECTLCOLORSTATIC  0x2
#define global DTPB_USEERASEBKGND  0x4

; DRAWEDGE_FLAGS
#define global BDR_RAISEDOUTER  0x1
#define global BDR_SUNKENOUTER  0x2
#define global BDR_RAISEDINNER  0x4
#define global BDR_SUNKENINNER  0x8
#define global BDR_OUTER  0x3
#define global BDR_INNER  0xc
#define global BDR_RAISED  0x5
#define global BDR_SUNKEN  0xa
#define global EDGE_RAISED  0x5
#define global EDGE_SUNKEN  0xa
#define global EDGE_ETCHED  0x6
#define global EDGE_BUMP  0x9

; DRAWSTATE_FLAGS
#define global DST_COMPLEX  0x0
#define global DST_TEXT  0x1
#define global DST_PREFIXTEXT  0x2
#define global DST_ICON  0x3
#define global DST_BITMAP  0x4
#define global DSS_NORMAL  0x0
#define global DSS_UNION  0x10
#define global DSS_DISABLED  0x20
#define global DSS_MONO  0x80
#define global DSS_HIDEPREFIX  0x200
#define global DSS_PREFIXONLY  0x400
#define global DSS_RIGHT  0x8000

; DROPEFFECT
#define global DROPEFFECT_NONE  0x0
#define global DROPEFFECT_COPY  0x1
#define global DROPEFFECT_MOVE  0x2
#define global DROPEFFECT_LINK  0x4
#define global DROPEFFECT_SCROLL  0x80000000

; DTTOPTS_FLAGS
#define global DTT_TEXTCOLOR  0x1
#define global DTT_BORDERCOLOR  0x2
#define global DTT_SHADOWCOLOR  0x4
#define global DTT_SHADOWTYPE  0x8
#define global DTT_SHADOWOFFSET  0x10
#define global DTT_BORDERSIZE  0x20
#define global DTT_FONTPROP  0x40
#define global DTT_COLORPROP  0x80
#define global DTT_STATEID  0x100
#define global DTT_CALCRECT  0x200
#define global DTT_APPLYOVERLAY  0x400
#define global DTT_GLOWSIZE  0x800
#define global DTT_CALLBACK  0x1000
#define global DTT_COMPOSITED  0x2000
#define global DTT_VALIDBITS  0x2fff

; DUPLICATE_HANDLE_OPTIONS
#define global DUPLICATE_CLOSE_SOURCE  0x1
#define global DUPLICATE_SAME_ACCESS  0x2

; DVASPECT
#define global DVASPECT_CONTENT  0x1
#define global DVASPECT_THUMBNAIL  0x2
#define global DVASPECT_ICON  0x4
#define global DVASPECT_DOCPRINT  0x8
#define global DVASPECT_OPAQUE  0x10
#define global DVASPECT_TRANSPARENT  0x20

; DWM_SHOWCONTACT
#define global DWMSC_DOWN  0x1
#define global DWMSC_UP  0x2
#define global DWMSC_DRAG  0x4
#define global DWMSC_HOLD  0x8
#define global DWMSC_PENBARREL  0x10
#define global DWMSC_NONE  0x0
#define global DWMSC_ALL  0xffffffff

; DWM_SOURCE_FRAME_SAMPLING
#define global DWM_SOURCE_FRAME_SAMPLING_POINT  0x0
#define global DWM_SOURCE_FRAME_SAMPLING_COVERAGE  0x1
#define global DWM_SOURCE_FRAME_SAMPLING_LAST  0x2

; DWM_TAB_WINDOW_REQUIREMENTS
#define global DWMTWR_NONE  0x0
#define global DWMTWR_IMPLEMENTED_BY_SYSTEM  0x1
#define global DWMTWR_WINDOW_RELATIONSHIP  0x2
#define global DWMTWR_WINDOW_STYLES  0x4
#define global DWMTWR_WINDOW_REGION  0x8
#define global DWMTWR_WINDOW_DWM_ATTRIBUTES  0x10
#define global DWMTWR_WINDOW_MARGINS  0x20
#define global DWMTWR_TABBING_ENABLED  0x40
#define global DWMTWR_USER_POLICY  0x80
#define global DWMTWR_GROUP_POLICY  0x100
#define global DWMTWR_APP_COMPAT  0x200

; DWMTRANSITION_OWNEDWINDOW_TARGET
#define global DWMTRANSITION_OWNEDWINDOW_NULL  -1
#define global DWMTRANSITION_OWNEDWINDOW_REPOSITION  0x0

; DWMWINDOWATTRIBUTE
#define global DWMWA_NCRENDERING_ENABLED  0x1
#define global DWMWA_NCRENDERING_POLICY  0x2
#define global DWMWA_TRANSITIONS_FORCEDISABLED  0x3
#define global DWMWA_ALLOW_NCPAINT  0x4
#define global DWMWA_CAPTION_BUTTON_BOUNDS  0x5
#define global DWMWA_NONCLIENT_RTL_LAYOUT  0x6
#define global DWMWA_FORCE_ICONIC_REPRESENTATION  0x7
#define global DWMWA_FLIP3D_POLICY  0x8
#define global DWMWA_EXTENDED_FRAME_BOUNDS  0x9
#define global DWMWA_HAS_ICONIC_BITMAP  0xa
#define global DWMWA_DISALLOW_PEEK  0xb
#define global DWMWA_EXCLUDED_FROM_PEEK  0xc
#define global DWMWA_CLOAK  0xd
#define global DWMWA_CLOAKED  0xe
#define global DWMWA_FREEZE_REPRESENTATION  0xf
#define global DWMWA_PASSIVE_UPDATE_MODE  0x10
#define global DWMWA_USE_HOSTBACKDROPBRUSH  0x11
#define global DWMWA_USE_IMMERSIVE_DARK_MODE  0x14
#define global DWMWA_WINDOW_CORNER_PREFERENCE  0x21
#define global DWMWA_BORDER_COLOR  0x22
#define global DWMWA_CAPTION_COLOR  0x23
#define global DWMWA_TEXT_COLOR  0x24
#define global DWMWA_VISIBLE_FRAME_BORDER_THICKNESS  0x25
#define global DWMWA_SYSTEMBACKDROP_TYPE  0x26
#define global DWMWA_LAST  0x27

; DWRITE_BREAK_CONDITION
#define global DWRITE_BREAK_CONDITION_NEUTRAL  0x0
#define global DWRITE_BREAK_CONDITION_CAN_BREAK  0x1
#define global DWRITE_BREAK_CONDITION_MAY_NOT_BREAK  0x2
#define global DWRITE_BREAK_CONDITION_MUST_BREAK  0x3

; DWRITE_FACTORY_TYPE
#define global DWRITE_FACTORY_TYPE_SHARED  0x0
#define global DWRITE_FACTORY_TYPE_ISOLATED  0x1

; DWRITE_FLOW_DIRECTION
#define global DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM  0x0
#define global DWRITE_FLOW_DIRECTION_BOTTOM_TO_TOP  0x1
#define global DWRITE_FLOW_DIRECTION_LEFT_TO_RIGHT  0x2
#define global DWRITE_FLOW_DIRECTION_RIGHT_TO_LEFT  0x3

; DWRITE_FONT_FACE_TYPE
#define global DWRITE_FONT_FACE_TYPE_CFF  0x0
#define global DWRITE_FONT_FACE_TYPE_TRUETYPE  0x1
#define global DWRITE_FONT_FACE_TYPE_OPENTYPE_COLLECTION  0x2
#define global DWRITE_FONT_FACE_TYPE_TYPE1  0x3
#define global DWRITE_FONT_FACE_TYPE_VECTOR  0x4
#define global DWRITE_FONT_FACE_TYPE_BITMAP  0x5
#define global DWRITE_FONT_FACE_TYPE_UNKNOWN  0x6
#define global DWRITE_FONT_FACE_TYPE_RAW_CFF  0x7
#define global DWRITE_FONT_FACE_TYPE_TRUETYPE_COLLECTION  0x2

; DWRITE_FONT_FEATURE_TAG
#define global DWRITE_FONT_FEATURE_TAG_ALTERNATIVE_FRACTIONS  0x63726661
#define global DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS_FROM_CAPITALS  0x63703263
#define global DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS_FROM_CAPITALS  0x63733263
#define global DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_ALTERNATES  0x746c6163
#define global DWRITE_FONT_FEATURE_TAG_CASE_SENSITIVE_FORMS  0x65736163
#define global DWRITE_FONT_FEATURE_TAG_GLYPH_COMPOSITION_DECOMPOSITION  0x706d6363
#define global DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_LIGATURES  0x67696c63
#define global DWRITE_FONT_FEATURE_TAG_CAPITAL_SPACING  0x70737063
#define global DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_SWASH  0x68777363
#define global DWRITE_FONT_FEATURE_TAG_CURSIVE_POSITIONING  0x73727563
#define global DWRITE_FONT_FEATURE_TAG_DEFAULT  0x746c6664
#define global DWRITE_FONT_FEATURE_TAG_DISCRETIONARY_LIGATURES  0x67696c64
#define global DWRITE_FONT_FEATURE_TAG_EXPERT_FORMS  0x74707865
#define global DWRITE_FONT_FEATURE_TAG_FRACTIONS  0x63617266
#define global DWRITE_FONT_FEATURE_TAG_FULL_WIDTH  0x64697766
#define global DWRITE_FONT_FEATURE_TAG_HALF_FORMS  0x666c6168
#define global DWRITE_FONT_FEATURE_TAG_HALANT_FORMS  0x6e6c6168
#define global DWRITE_FONT_FEATURE_TAG_ALTERNATE_HALF_WIDTH  0x746c6168
#define global DWRITE_FONT_FEATURE_TAG_HISTORICAL_FORMS  0x74736968
#define global DWRITE_FONT_FEATURE_TAG_HORIZONTAL_KANA_ALTERNATES  0x616e6b68
#define global DWRITE_FONT_FEATURE_TAG_HISTORICAL_LIGATURES  0x67696c68
#define global DWRITE_FONT_FEATURE_TAG_HALF_WIDTH  0x64697768
#define global DWRITE_FONT_FEATURE_TAG_HOJO_KANJI_FORMS  0x6f6a6f68
#define global DWRITE_FONT_FEATURE_TAG_JIS04_FORMS  0x3430706a
#define global DWRITE_FONT_FEATURE_TAG_JIS78_FORMS  0x3837706a
#define global DWRITE_FONT_FEATURE_TAG_JIS83_FORMS  0x3338706a
#define global DWRITE_FONT_FEATURE_TAG_JIS90_FORMS  0x3039706a
#define global DWRITE_FONT_FEATURE_TAG_KERNING  0x6e72656b
#define global DWRITE_FONT_FEATURE_TAG_STANDARD_LIGATURES  0x6167696c
#define global DWRITE_FONT_FEATURE_TAG_LINING_FIGURES  0x6d756e6c
#define global DWRITE_FONT_FEATURE_TAG_LOCALIZED_FORMS  0x6c636f6c
#define global DWRITE_FONT_FEATURE_TAG_MARK_POSITIONING  0x6b72616d
#define global DWRITE_FONT_FEATURE_TAG_MATHEMATICAL_GREEK  0x6b72676d
#define global DWRITE_FONT_FEATURE_TAG_MARK_TO_MARK_POSITIONING  0x6b6d6b6d
#define global DWRITE_FONT_FEATURE_TAG_ALTERNATE_ANNOTATION_FORMS  0x746c616e
#define global DWRITE_FONT_FEATURE_TAG_NLC_KANJI_FORMS  0x6b636c6e
#define global DWRITE_FONT_FEATURE_TAG_OLD_STYLE_FIGURES  0x6d756e6f
#define global DWRITE_FONT_FEATURE_TAG_ORDINALS  0x6e64726f
#define global DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_ALTERNATE_WIDTH  0x746c6170
#define global DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS  0x70616370
#define global DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_FIGURES  0x6d756e70
#define global DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_WIDTHS  0x64697770
#define global DWRITE_FONT_FEATURE_TAG_QUARTER_WIDTHS  0x64697771
#define global DWRITE_FONT_FEATURE_TAG_REQUIRED_LIGATURES  0x67696c72
#define global DWRITE_FONT_FEATURE_TAG_RUBY_NOTATION_FORMS  0x79627572
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_ALTERNATES  0x746c6173
#define global DWRITE_FONT_FEATURE_TAG_SCIENTIFIC_INFERIORS  0x666e6973
#define global DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS  0x70636d73
#define global DWRITE_FONT_FEATURE_TAG_SIMPLIFIED_FORMS  0x6c706d73
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1  0x31307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_2  0x32307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_3  0x33307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_4  0x34307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_5  0x35307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_6  0x36307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_7  0x37307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_8  0x38307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_9  0x39307373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_10  0x30317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_11  0x31317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_12  0x32317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_13  0x33317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_14  0x34317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_15  0x35317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_16  0x36317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_17  0x37317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_18  0x38317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_19  0x39317373
#define global DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_20  0x30327373
#define global DWRITE_FONT_FEATURE_TAG_SUBSCRIPT  0x73627573
#define global DWRITE_FONT_FEATURE_TAG_SUPERSCRIPT  0x73707573
#define global DWRITE_FONT_FEATURE_TAG_SWASH  0x68737773
#define global DWRITE_FONT_FEATURE_TAG_TITLING  0x6c746974
#define global DWRITE_FONT_FEATURE_TAG_TRADITIONAL_NAME_FORMS  0x6d616e74
#define global DWRITE_FONT_FEATURE_TAG_TABULAR_FIGURES  0x6d756e74
#define global DWRITE_FONT_FEATURE_TAG_TRADITIONAL_FORMS  0x64617274
#define global DWRITE_FONT_FEATURE_TAG_THIRD_WIDTHS  0x64697774
#define global DWRITE_FONT_FEATURE_TAG_UNICASE  0x63696e75
#define global DWRITE_FONT_FEATURE_TAG_VERTICAL_WRITING  0x74726576
#define global DWRITE_FONT_FEATURE_TAG_VERTICAL_ALTERNATES_AND_ROTATION  0x32747276
#define global DWRITE_FONT_FEATURE_TAG_SLASHED_ZERO  0x6f72657a

; DWRITE_FONT_FILE_TYPE
#define global DWRITE_FONT_FILE_TYPE_UNKNOWN  0x0
#define global DWRITE_FONT_FILE_TYPE_CFF  0x1
#define global DWRITE_FONT_FILE_TYPE_TRUETYPE  0x2
#define global DWRITE_FONT_FILE_TYPE_OPENTYPE_COLLECTION  0x3
#define global DWRITE_FONT_FILE_TYPE_TYPE1_PFM  0x4
#define global DWRITE_FONT_FILE_TYPE_TYPE1_PFB  0x5
#define global DWRITE_FONT_FILE_TYPE_VECTOR  0x6
#define global DWRITE_FONT_FILE_TYPE_BITMAP  0x7
#define global DWRITE_FONT_FILE_TYPE_TRUETYPE_COLLECTION  0x3

; DWRITE_FONT_SIMULATIONS
#define global DWRITE_FONT_SIMULATIONS_NONE  0x0
#define global DWRITE_FONT_SIMULATIONS_BOLD  0x1
#define global DWRITE_FONT_SIMULATIONS_OBLIQUE  0x2

; DWRITE_FONT_STRETCH
#define global DWRITE_FONT_STRETCH_UNDEFINED  0x0
#define global DWRITE_FONT_STRETCH_ULTRA_CONDENSED  0x1
#define global DWRITE_FONT_STRETCH_EXTRA_CONDENSED  0x2
#define global DWRITE_FONT_STRETCH_CONDENSED  0x3
#define global DWRITE_FONT_STRETCH_SEMI_CONDENSED  0x4
#define global DWRITE_FONT_STRETCH_NORMAL  0x5
#define global DWRITE_FONT_STRETCH_MEDIUM  0x5
#define global DWRITE_FONT_STRETCH_SEMI_EXPANDED  0x6
#define global DWRITE_FONT_STRETCH_EXPANDED  0x7
#define global DWRITE_FONT_STRETCH_EXTRA_EXPANDED  0x8
#define global DWRITE_FONT_STRETCH_ULTRA_EXPANDED  0x9

; DWRITE_FONT_STYLE
#define global DWRITE_FONT_STYLE_NORMAL  0x0
#define global DWRITE_FONT_STYLE_OBLIQUE  0x1
#define global DWRITE_FONT_STYLE_ITALIC  0x2

; DWRITE_FONT_WEIGHT
#define global DWRITE_FONT_WEIGHT_THIN  0x64
#define global DWRITE_FONT_WEIGHT_EXTRA_LIGHT  0xc8
#define global DWRITE_FONT_WEIGHT_ULTRA_LIGHT  0xc8
#define global DWRITE_FONT_WEIGHT_LIGHT  0x12c
#define global DWRITE_FONT_WEIGHT_SEMI_LIGHT  0x15e
#define global DWRITE_FONT_WEIGHT_NORMAL  0x190
#define global DWRITE_FONT_WEIGHT_REGULAR  0x190
#define global DWRITE_FONT_WEIGHT_MEDIUM  0x1f4
#define global DWRITE_FONT_WEIGHT_DEMI_BOLD  0x258
#define global DWRITE_FONT_WEIGHT_SEMI_BOLD  0x258
#define global DWRITE_FONT_WEIGHT_BOLD  0x2bc
#define global DWRITE_FONT_WEIGHT_EXTRA_BOLD  0x320
#define global DWRITE_FONT_WEIGHT_ULTRA_BOLD  0x320
#define global DWRITE_FONT_WEIGHT_BLACK  0x384
#define global DWRITE_FONT_WEIGHT_HEAVY  0x384
#define global DWRITE_FONT_WEIGHT_EXTRA_BLACK  0x3b6
#define global DWRITE_FONT_WEIGHT_ULTRA_BLACK  0x3b6

; DWRITE_INFORMATIONAL_STRING_ID
#define global DWRITE_INFORMATIONAL_STRING_NONE  0x0
#define global DWRITE_INFORMATIONAL_STRING_COPYRIGHT_NOTICE  0x1
#define global DWRITE_INFORMATIONAL_STRING_VERSION_STRINGS  0x2
#define global DWRITE_INFORMATIONAL_STRING_TRADEMARK  0x3
#define global DWRITE_INFORMATIONAL_STRING_MANUFACTURER  0x4
#define global DWRITE_INFORMATIONAL_STRING_DESIGNER  0x5
#define global DWRITE_INFORMATIONAL_STRING_DESIGNER_URL  0x6
#define global DWRITE_INFORMATIONAL_STRING_DESCRIPTION  0x7
#define global DWRITE_INFORMATIONAL_STRING_FONT_VENDOR_URL  0x8
#define global DWRITE_INFORMATIONAL_STRING_LICENSE_DESCRIPTION  0x9
#define global DWRITE_INFORMATIONAL_STRING_LICENSE_INFO_URL  0xa
#define global DWRITE_INFORMATIONAL_STRING_WIN32_FAMILY_NAMES  0xb
#define global DWRITE_INFORMATIONAL_STRING_WIN32_SUBFAMILY_NAMES  0xc
#define global DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_FAMILY_NAMES  0xd
#define global DWRITE_INFORMATIONAL_STRING_TYPOGRAPHIC_SUBFAMILY_NAMES  0xe
#define global DWRITE_INFORMATIONAL_STRING_SAMPLE_TEXT  0xf
#define global DWRITE_INFORMATIONAL_STRING_FULL_NAME  0x10
#define global DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_NAME  0x11
#define global DWRITE_INFORMATIONAL_STRING_POSTSCRIPT_CID_NAME  0x12
#define global DWRITE_INFORMATIONAL_STRING_WEIGHT_STRETCH_STYLE_FAMILY_NAME  0x13
#define global DWRITE_INFORMATIONAL_STRING_DESIGN_SCRIPT_LANGUAGE_TAG  0x14
#define global DWRITE_INFORMATIONAL_STRING_SUPPORTED_SCRIPT_LANGUAGE_TAG  0x15
#define global DWRITE_INFORMATIONAL_STRING_PREFERRED_FAMILY_NAMES  0xd
#define global DWRITE_INFORMATIONAL_STRING_PREFERRED_SUBFAMILY_NAMES  0xe
#define global DWRITE_INFORMATIONAL_STRING_WWS_FAMILY_NAME  0x13

; DWRITE_LINE_SPACING_METHOD
#define global DWRITE_LINE_SPACING_METHOD_DEFAULT  0x0
#define global DWRITE_LINE_SPACING_METHOD_UNIFORM  0x1
#define global DWRITE_LINE_SPACING_METHOD_PROPORTIONAL  0x2

; DWRITE_MEASURING_MODE
#define global DWRITE_MEASURING_MODE_NATURAL  0x0
#define global DWRITE_MEASURING_MODE_GDI_CLASSIC  0x1
#define global DWRITE_MEASURING_MODE_GDI_NATURAL  0x2

; DWRITE_PARAGRAPH_ALIGNMENT
#define global DWRITE_PARAGRAPH_ALIGNMENT_NEAR  0x0
#define global DWRITE_PARAGRAPH_ALIGNMENT_FAR  0x1
#define global DWRITE_PARAGRAPH_ALIGNMENT_CENTER  0x2

; DWRITE_PIXEL_GEOMETRY
#define global DWRITE_PIXEL_GEOMETRY_FLAT  0x0
#define global DWRITE_PIXEL_GEOMETRY_RGB  0x1
#define global DWRITE_PIXEL_GEOMETRY_BGR  0x2

; DWRITE_READING_DIRECTION
#define global DWRITE_READING_DIRECTION_LEFT_TO_RIGHT  0x0
#define global DWRITE_READING_DIRECTION_RIGHT_TO_LEFT  0x1
#define global DWRITE_READING_DIRECTION_TOP_TO_BOTTOM  0x2
#define global DWRITE_READING_DIRECTION_BOTTOM_TO_TOP  0x3

; DWRITE_RENDERING_MODE
#define global DWRITE_RENDERING_MODE_DEFAULT  0x0
#define global DWRITE_RENDERING_MODE_ALIASED  0x1
#define global DWRITE_RENDERING_MODE_GDI_CLASSIC  0x2
#define global DWRITE_RENDERING_MODE_GDI_NATURAL  0x3
#define global DWRITE_RENDERING_MODE_NATURAL  0x4
#define global DWRITE_RENDERING_MODE_NATURAL_SYMMETRIC  0x5
#define global DWRITE_RENDERING_MODE_OUTLINE  0x6
#define global DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC  0x2
#define global DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL  0x3
#define global DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL  0x4
#define global DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL_SYMMETRIC  0x5

; DWRITE_TEXT_ALIGNMENT
#define global DWRITE_TEXT_ALIGNMENT_LEADING  0x0
#define global DWRITE_TEXT_ALIGNMENT_TRAILING  0x1
#define global DWRITE_TEXT_ALIGNMENT_CENTER  0x2
#define global DWRITE_TEXT_ALIGNMENT_JUSTIFIED  0x3

; DWRITE_TRIMMING_GRANULARITY
#define global DWRITE_TRIMMING_GRANULARITY_NONE  0x0
#define global DWRITE_TRIMMING_GRANULARITY_CHARACTER  0x1
#define global DWRITE_TRIMMING_GRANULARITY_WORD  0x2

; DWRITE_WORD_WRAPPING
#define global DWRITE_WORD_WRAPPING_WRAP  0x0
#define global DWRITE_WORD_WRAPPING_NO_WRAP  0x1
#define global DWRITE_WORD_WRAPPING_EMERGENCY_BREAK  0x2
#define global DWRITE_WORD_WRAPPING_WHOLE_WORD  0x3
#define global DWRITE_WORD_WRAPPING_CHARACTER  0x4

; DXGI_CREATE_FACTORY_FLAGS
#define global DXGI_CREATE_FACTORY_DEBUG  0x1

; DXGI_ENUM_MODES
#define global DXGI_ENUM_MODES_INTERLACED  0x1
#define global DXGI_ENUM_MODES_SCALING  0x2
#define global DXGI_ENUM_MODES_STEREO  0x4
#define global DXGI_ENUM_MODES_DISABLED_STEREO  0x8

; DXGI_FORMAT
#define global DXGI_FORMAT_UNKNOWN  0x0
#define global DXGI_FORMAT_R32G32B32A32_TYPELESS  0x1
#define global DXGI_FORMAT_R32G32B32A32_FLOAT  0x2
#define global DXGI_FORMAT_R32G32B32A32_UINT  0x3
#define global DXGI_FORMAT_R32G32B32A32_SINT  0x4
#define global DXGI_FORMAT_R32G32B32_TYPELESS  0x5
#define global DXGI_FORMAT_R32G32B32_FLOAT  0x6
#define global DXGI_FORMAT_R32G32B32_UINT  0x7
#define global DXGI_FORMAT_R32G32B32_SINT  0x8
#define global DXGI_FORMAT_R16G16B16A16_TYPELESS  0x9
#define global DXGI_FORMAT_R16G16B16A16_FLOAT  0xa
#define global DXGI_FORMAT_R16G16B16A16_UNORM  0xb
#define global DXGI_FORMAT_R16G16B16A16_UINT  0xc
#define global DXGI_FORMAT_R16G16B16A16_SNORM  0xd
#define global DXGI_FORMAT_R16G16B16A16_SINT  0xe
#define global DXGI_FORMAT_R32G32_TYPELESS  0xf
#define global DXGI_FORMAT_R32G32_FLOAT  0x10
#define global DXGI_FORMAT_R32G32_UINT  0x11
#define global DXGI_FORMAT_R32G32_SINT  0x12
#define global DXGI_FORMAT_R32G8X24_TYPELESS  0x13
#define global DXGI_FORMAT_D32_FLOAT_S8X24_UINT  0x14
#define global DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS  0x15
#define global DXGI_FORMAT_X32_TYPELESS_G8X24_UINT  0x16
#define global DXGI_FORMAT_R10G10B10A2_TYPELESS  0x17
#define global DXGI_FORMAT_R10G10B10A2_UNORM  0x18
#define global DXGI_FORMAT_R10G10B10A2_UINT  0x19
#define global DXGI_FORMAT_R11G11B10_FLOAT  0x1a
#define global DXGI_FORMAT_R8G8B8A8_TYPELESS  0x1b
#define global DXGI_FORMAT_R8G8B8A8_UNORM  0x1c
#define global DXGI_FORMAT_R8G8B8A8_UNORM_SRGB  0x1d
#define global DXGI_FORMAT_R8G8B8A8_UINT  0x1e
#define global DXGI_FORMAT_R8G8B8A8_SNORM  0x1f
#define global DXGI_FORMAT_R8G8B8A8_SINT  0x20
#define global DXGI_FORMAT_R16G16_TYPELESS  0x21
#define global DXGI_FORMAT_R16G16_FLOAT  0x22
#define global DXGI_FORMAT_R16G16_UNORM  0x23
#define global DXGI_FORMAT_R16G16_UINT  0x24
#define global DXGI_FORMAT_R16G16_SNORM  0x25
#define global DXGI_FORMAT_R16G16_SINT  0x26
#define global DXGI_FORMAT_R32_TYPELESS  0x27
#define global DXGI_FORMAT_D32_FLOAT  0x28
#define global DXGI_FORMAT_R32_FLOAT  0x29
#define global DXGI_FORMAT_R32_UINT  0x2a
#define global DXGI_FORMAT_R32_SINT  0x2b
#define global DXGI_FORMAT_R24G8_TYPELESS  0x2c
#define global DXGI_FORMAT_D24_UNORM_S8_UINT  0x2d
#define global DXGI_FORMAT_R24_UNORM_X8_TYPELESS  0x2e
#define global DXGI_FORMAT_X24_TYPELESS_G8_UINT  0x2f
#define global DXGI_FORMAT_R8G8_TYPELESS  0x30
#define global DXGI_FORMAT_R8G8_UNORM  0x31
#define global DXGI_FORMAT_R8G8_UINT  0x32
#define global DXGI_FORMAT_R8G8_SNORM  0x33
#define global DXGI_FORMAT_R8G8_SINT  0x34
#define global DXGI_FORMAT_R16_TYPELESS  0x35
#define global DXGI_FORMAT_R16_FLOAT  0x36
#define global DXGI_FORMAT_D16_UNORM  0x37
#define global DXGI_FORMAT_R16_UNORM  0x38
#define global DXGI_FORMAT_R16_UINT  0x39
#define global DXGI_FORMAT_R16_SNORM  0x3a
#define global DXGI_FORMAT_R16_SINT  0x3b
#define global DXGI_FORMAT_R8_TYPELESS  0x3c
#define global DXGI_FORMAT_R8_UNORM  0x3d
#define global DXGI_FORMAT_R8_UINT  0x3e
#define global DXGI_FORMAT_R8_SNORM  0x3f
#define global DXGI_FORMAT_R8_SINT  0x40
#define global DXGI_FORMAT_A8_UNORM  0x41
#define global DXGI_FORMAT_R1_UNORM  0x42
#define global DXGI_FORMAT_R9G9B9E5_SHAREDEXP  0x43
#define global DXGI_FORMAT_R8G8_B8G8_UNORM  0x44
#define global DXGI_FORMAT_G8R8_G8B8_UNORM  0x45
#define global DXGI_FORMAT_BC1_TYPELESS  0x46
#define global DXGI_FORMAT_BC1_UNORM  0x47
#define global DXGI_FORMAT_BC1_UNORM_SRGB  0x48
#define global DXGI_FORMAT_BC2_TYPELESS  0x49
#define global DXGI_FORMAT_BC2_UNORM  0x4a
#define global DXGI_FORMAT_BC2_UNORM_SRGB  0x4b
#define global DXGI_FORMAT_BC3_TYPELESS  0x4c
#define global DXGI_FORMAT_BC3_UNORM  0x4d
#define global DXGI_FORMAT_BC3_UNORM_SRGB  0x4e
#define global DXGI_FORMAT_BC4_TYPELESS  0x4f
#define global DXGI_FORMAT_BC4_UNORM  0x50
#define global DXGI_FORMAT_BC4_SNORM  0x51
#define global DXGI_FORMAT_BC5_TYPELESS  0x52
#define global DXGI_FORMAT_BC5_UNORM  0x53
#define global DXGI_FORMAT_BC5_SNORM  0x54
#define global DXGI_FORMAT_B5G6R5_UNORM  0x55
#define global DXGI_FORMAT_B5G5R5A1_UNORM  0x56
#define global DXGI_FORMAT_B8G8R8A8_UNORM  0x57
#define global DXGI_FORMAT_B8G8R8X8_UNORM  0x58
#define global DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM  0x59
#define global DXGI_FORMAT_B8G8R8A8_TYPELESS  0x5a
#define global DXGI_FORMAT_B8G8R8A8_UNORM_SRGB  0x5b
#define global DXGI_FORMAT_B8G8R8X8_TYPELESS  0x5c
#define global DXGI_FORMAT_B8G8R8X8_UNORM_SRGB  0x5d
#define global DXGI_FORMAT_BC6H_TYPELESS  0x5e
#define global DXGI_FORMAT_BC6H_UF16  0x5f
#define global DXGI_FORMAT_BC6H_SF16  0x60
#define global DXGI_FORMAT_BC7_TYPELESS  0x61
#define global DXGI_FORMAT_BC7_UNORM  0x62
#define global DXGI_FORMAT_BC7_UNORM_SRGB  0x63
#define global DXGI_FORMAT_AYUV  0x64
#define global DXGI_FORMAT_Y410  0x65
#define global DXGI_FORMAT_Y416  0x66
#define global DXGI_FORMAT_NV12  0x67
#define global DXGI_FORMAT_P010  0x68
#define global DXGI_FORMAT_P016  0x69
#define global DXGI_FORMAT_420_OPAQUE  0x6a
#define global DXGI_FORMAT_YUY2  0x6b
#define global DXGI_FORMAT_Y210  0x6c
#define global DXGI_FORMAT_Y216  0x6d
#define global DXGI_FORMAT_NV11  0x6e
#define global DXGI_FORMAT_AI44  0x6f
#define global DXGI_FORMAT_IA44  0x70
#define global DXGI_FORMAT_P8  0x71
#define global DXGI_FORMAT_A8P8  0x72
#define global DXGI_FORMAT_B4G4R4A4_UNORM  0x73
#define global DXGI_FORMAT_P208  0x82
#define global DXGI_FORMAT_V208  0x83
#define global DXGI_FORMAT_V408  0x84
#define global DXGI_FORMAT_SAMPLER_FEEDBACK_MIN_MIP_OPAQUE  0xbd
#define global DXGI_FORMAT_SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE  0xbe
#define global DXGI_FORMAT_A4B4G4R4_UNORM  0xbf

; DXGI_MAP_FLAGS
#define global DXGI_MAP_READ  0x1
#define global DXGI_MAP_WRITE  0x2
#define global DXGI_MAP_DISCARD  0x4

; DXGI_MODE_ROTATION
#define global DXGI_MODE_ROTATION_UNSPECIFIED  0x0
#define global DXGI_MODE_ROTATION_IDENTITY  0x1
#define global DXGI_MODE_ROTATION_ROTATE90  0x2
#define global DXGI_MODE_ROTATION_ROTATE180  0x3
#define global DXGI_MODE_ROTATION_ROTATE270  0x4

; DXGI_MODE_SCALING
#define global DXGI_MODE_SCALING_UNSPECIFIED  0x0
#define global DXGI_MODE_SCALING_CENTERED  0x1
#define global DXGI_MODE_SCALING_STRETCHED  0x2

; DXGI_MODE_SCANLINE_ORDER
#define global DXGI_MODE_SCANLINE_ORDER_UNSPECIFIED  0x0
#define global DXGI_MODE_SCANLINE_ORDER_PROGRESSIVE  0x1
#define global DXGI_MODE_SCANLINE_ORDER_UPPER_FIELD_FIRST  0x2
#define global DXGI_MODE_SCANLINE_ORDER_LOWER_FIELD_FIRST  0x3

; DXGI_PRESENT
#define global DXGI_PRESENT_TEST  0x1
#define global DXGI_PRESENT_DO_NOT_SEQUENCE  0x2
#define global DXGI_PRESENT_RESTART  0x4
#define global DXGI_PRESENT_DO_NOT_WAIT  0x8
#define global DXGI_PRESENT_STEREO_PREFER_RIGHT  0x10
#define global DXGI_PRESENT_STEREO_TEMPORARY_MONO  0x20
#define global DXGI_PRESENT_RESTRICT_TO_OUTPUT  0x40
#define global DXGI_PRESENT_USE_DURATION  0x100
#define global DXGI_PRESENT_ALLOW_TEARING  0x200

; DXGI_RESIDENCY
#define global DXGI_RESIDENCY_FULLY_RESIDENT  0x1
#define global DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY  0x2
#define global DXGI_RESIDENCY_EVICTED_TO_DISK  0x3

; DXGI_SWAP_CHAIN_FLAG
#define global DXGI_SWAP_CHAIN_FLAG_NONPREROTATED  0x1
#define global DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH  0x2
#define global DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE  0x4
#define global DXGI_SWAP_CHAIN_FLAG_RESTRICTED_CONTENT  0x8
#define global DXGI_SWAP_CHAIN_FLAG_RESTRICT_SHARED_RESOURCE_DRIVER  0x10
#define global DXGI_SWAP_CHAIN_FLAG_DISPLAY_ONLY  0x20
#define global DXGI_SWAP_CHAIN_FLAG_FRAME_LATENCY_WAITABLE_OBJECT  0x40
#define global DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER  0x80
#define global DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO  0x100
#define global DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO  0x200
#define global DXGI_SWAP_CHAIN_FLAG_HW_PROTECTED  0x400
#define global DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING  0x800
#define global DXGI_SWAP_CHAIN_FLAG_RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS  0x1000

; DXGI_SWAP_EFFECT
#define global DXGI_SWAP_EFFECT_DISCARD  0x0
#define global DXGI_SWAP_EFFECT_SEQUENTIAL  0x1
#define global DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL  0x3
#define global DXGI_SWAP_EFFECT_FLIP_DISCARD  0x4

; DXGI_USAGE
#define global DXGI_USAGE_SHADER_INPUT  0x10
#define global DXGI_USAGE_RENDER_TARGET_OUTPUT  0x20
#define global DXGI_USAGE_BACK_BUFFER  0x40
#define global DXGI_USAGE_SHARED  0x80
#define global DXGI_USAGE_READ_ONLY  0x100
#define global DXGI_USAGE_DISCARD_ON_PRESENT  0x200
#define global DXGI_USAGE_UNORDERED_ACCESS  0x400

; EAllocationType
#define global eAllocationTypeDynamic  0x0
#define global eAllocationTypeRT  0x1
#define global eAllocationTypePageable  0x2
#define global eAllocationTypeIgnore  0x3

; EFFECTIVE_POWER_MODE
#define global EffectivePowerModeBatterySaver  0x0
#define global EffectivePowerModeBetterBattery  0x1
#define global EffectivePowerModeBalanced  0x2
#define global EffectivePowerModeHighPerformance  0x3
#define global EffectivePowerModeMaxPerformance  0x4
#define global EffectivePowerModeGameMode  0x5
#define global EffectivePowerModeMixedReality  0x6

; EMBDHLP_FLAGS
#define global EMBDHLP_INPROC_HANDLER  0x0
#define global EMBDHLP_INPROC_SERVER  0x1
#define global EMBDHLP_CREATENOW  0x0
#define global EMBDHLP_DELAYCREATE  0x10000

; EmfPlusRecordType
#define global WmfRecordTypeSetBkColor  0x10201
#define global WmfRecordTypeSetBkMode  0x10102
#define global WmfRecordTypeSetMapMode  0x10103
#define global WmfRecordTypeSetROP2  0x10104
#define global WmfRecordTypeSetRelAbs  0x10105
#define global WmfRecordTypeSetPolyFillMode  0x10106
#define global WmfRecordTypeSetStretchBltMode  0x10107
#define global WmfRecordTypeSetTextCharExtra  0x10108
#define global WmfRecordTypeSetTextColor  0x10209
#define global WmfRecordTypeSetTextJustification  0x1020a
#define global WmfRecordTypeSetWindowOrg  0x1020b
#define global WmfRecordTypeSetWindowExt  0x1020c
#define global WmfRecordTypeSetViewportOrg  0x1020d
#define global WmfRecordTypeSetViewportExt  0x1020e
#define global WmfRecordTypeOffsetWindowOrg  0x1020f
#define global WmfRecordTypeScaleWindowExt  0x10410
#define global WmfRecordTypeOffsetViewportOrg  0x10211
#define global WmfRecordTypeScaleViewportExt  0x10412
#define global WmfRecordTypeLineTo  0x10213
#define global WmfRecordTypeMoveTo  0x10214
#define global WmfRecordTypeExcludeClipRect  0x10415
#define global WmfRecordTypeIntersectClipRect  0x10416
#define global WmfRecordTypeArc  0x10817
#define global WmfRecordTypeEllipse  0x10418
#define global WmfRecordTypeFloodFill  0x10419
#define global WmfRecordTypePie  0x1081a
#define global WmfRecordTypeRectangle  0x1041b
#define global WmfRecordTypeRoundRect  0x1061c
#define global WmfRecordTypePatBlt  0x1061d
#define global WmfRecordTypeSaveDC  0x1001e
#define global WmfRecordTypeSetPixel  0x1041f
#define global WmfRecordTypeOffsetClipRgn  0x10220
#define global WmfRecordTypeTextOut  0x10521
#define global WmfRecordTypeBitBlt  0x10922
#define global WmfRecordTypeStretchBlt  0x10b23
#define global WmfRecordTypePolygon  0x10324
#define global WmfRecordTypePolyline  0x10325
#define global WmfRecordTypeEscape  0x10626
#define global WmfRecordTypeRestoreDC  0x10127
#define global WmfRecordTypeFillRegion  0x10228
#define global WmfRecordTypeFrameRegion  0x10429
#define global WmfRecordTypeInvertRegion  0x1012a
#define global WmfRecordTypePaintRegion  0x1012b
#define global WmfRecordTypeSelectClipRegion  0x1012c
#define global WmfRecordTypeSelectObject  0x1012d
#define global WmfRecordTypeSetTextAlign  0x1012e
#define global WmfRecordTypeDrawText  0x1062f
#define global WmfRecordTypeChord  0x10830
#define global WmfRecordTypeSetMapperFlags  0x10231
#define global WmfRecordTypeExtTextOut  0x10a32
#define global WmfRecordTypeSetDIBToDev  0x10d33
#define global WmfRecordTypeSelectPalette  0x10234
#define global WmfRecordTypeRealizePalette  0x10035
#define global WmfRecordTypeAnimatePalette  0x10436
#define global WmfRecordTypeSetPalEntries  0x10037
#define global WmfRecordTypePolyPolygon  0x10538
#define global WmfRecordTypeResizePalette  0x10139
#define global WmfRecordTypeDIBBitBlt  0x10940
#define global WmfRecordTypeDIBStretchBlt  0x10b41
#define global WmfRecordTypeDIBCreatePatternBrush  0x10142
#define global WmfRecordTypeStretchDIB  0x10f43
#define global WmfRecordTypeExtFloodFill  0x10548
#define global WmfRecordTypeSetLayout  0x10149
#define global WmfRecordTypeResetDC  0x1014c
#define global WmfRecordTypeStartDoc  0x1014d
#define global WmfRecordTypeStartPage  0x1004f
#define global WmfRecordTypeEndPage  0x10050
#define global WmfRecordTypeAbortDoc  0x10052
#define global WmfRecordTypeEndDoc  0x1005e
#define global WmfRecordTypeDeleteObject  0x101f0
#define global WmfRecordTypeCreatePalette  0x100f7
#define global WmfRecordTypeCreateBrush  0x100f8
#define global WmfRecordTypeCreatePatternBrush  0x101f9
#define global WmfRecordTypeCreatePenIndirect  0x102fa
#define global WmfRecordTypeCreateFontIndirect  0x102fb
#define global WmfRecordTypeCreateBrushIndirect  0x102fc
#define global WmfRecordTypeCreateBitmapIndirect  0x102fd
#define global WmfRecordTypeCreateBitmap  0x106fe
#define global WmfRecordTypeCreateRegion  0x106ff
#define global EmfRecordTypeHeader  0x1
#define global EmfRecordTypePolyBezier  0x2
#define global EmfRecordTypePolygon  0x3
#define global EmfRecordTypePolyline  0x4
#define global EmfRecordTypePolyBezierTo  0x5
#define global EmfRecordTypePolyLineTo  0x6
#define global EmfRecordTypePolyPolyline  0x7
#define global EmfRecordTypePolyPolygon  0x8
#define global EmfRecordTypeSetWindowExtEx  0x9
#define global EmfRecordTypeSetWindowOrgEx  0xa
#define global EmfRecordTypeSetViewportExtEx  0xb
#define global EmfRecordTypeSetViewportOrgEx  0xc
#define global EmfRecordTypeSetBrushOrgEx  0xd
#define global EmfRecordTypeEOF  0xe
#define global EmfRecordTypeSetPixelV  0xf
#define global EmfRecordTypeSetMapperFlags  0x10
#define global EmfRecordTypeSetMapMode  0x11
#define global EmfRecordTypeSetBkMode  0x12
#define global EmfRecordTypeSetPolyFillMode  0x13
#define global EmfRecordTypeSetROP2  0x14
#define global EmfRecordTypeSetStretchBltMode  0x15
#define global EmfRecordTypeSetTextAlign  0x16
#define global EmfRecordTypeSetColorAdjustment  0x17
#define global EmfRecordTypeSetTextColor  0x18
#define global EmfRecordTypeSetBkColor  0x19
#define global EmfRecordTypeOffsetClipRgn  0x1a
#define global EmfRecordTypeMoveToEx  0x1b
#define global EmfRecordTypeSetMetaRgn  0x1c
#define global EmfRecordTypeExcludeClipRect  0x1d
#define global EmfRecordTypeIntersectClipRect  0x1e
#define global EmfRecordTypeScaleViewportExtEx  0x1f
#define global EmfRecordTypeScaleWindowExtEx  0x20
#define global EmfRecordTypeSaveDC  0x21
#define global EmfRecordTypeRestoreDC  0x22
#define global EmfRecordTypeSetWorldTransform  0x23
#define global EmfRecordTypeModifyWorldTransform  0x24
#define global EmfRecordTypeSelectObject  0x25
#define global EmfRecordTypeCreatePen  0x26
#define global EmfRecordTypeCreateBrushIndirect  0x27
#define global EmfRecordTypeDeleteObject  0x28
#define global EmfRecordTypeAngleArc  0x29
#define global EmfRecordTypeEllipse  0x2a
#define global EmfRecordTypeRectangle  0x2b
#define global EmfRecordTypeRoundRect  0x2c
#define global EmfRecordTypeArc  0x2d
#define global EmfRecordTypeChord  0x2e
#define global EmfRecordTypePie  0x2f
#define global EmfRecordTypeSelectPalette  0x30
#define global EmfRecordTypeCreatePalette  0x31
#define global EmfRecordTypeSetPaletteEntries  0x32
#define global EmfRecordTypeResizePalette  0x33
#define global EmfRecordTypeRealizePalette  0x34
#define global EmfRecordTypeExtFloodFill  0x35
#define global EmfRecordTypeLineTo  0x36
#define global EmfRecordTypeArcTo  0x37
#define global EmfRecordTypePolyDraw  0x38
#define global EmfRecordTypeSetArcDirection  0x39
#define global EmfRecordTypeSetMiterLimit  0x3a
#define global EmfRecordTypeBeginPath  0x3b
#define global EmfRecordTypeEndPath  0x3c
#define global EmfRecordTypeCloseFigure  0x3d
#define global EmfRecordTypeFillPath  0x3e
#define global EmfRecordTypeStrokeAndFillPath  0x3f
#define global EmfRecordTypeStrokePath  0x40
#define global EmfRecordTypeFlattenPath  0x41
#define global EmfRecordTypeWidenPath  0x42
#define global EmfRecordTypeSelectClipPath  0x43
#define global EmfRecordTypeAbortPath  0x44
#define global EmfRecordTypeReserved_069  0x45
#define global EmfRecordTypeGdiComment  0x46
#define global EmfRecordTypeFillRgn  0x47
#define global EmfRecordTypeFrameRgn  0x48
#define global EmfRecordTypeInvertRgn  0x49
#define global EmfRecordTypePaintRgn  0x4a
#define global EmfRecordTypeExtSelectClipRgn  0x4b
#define global EmfRecordTypeBitBlt  0x4c
#define global EmfRecordTypeStretchBlt  0x4d
#define global EmfRecordTypeMaskBlt  0x4e
#define global EmfRecordTypePlgBlt  0x4f
#define global EmfRecordTypeSetDIBitsToDevice  0x50
#define global EmfRecordTypeStretchDIBits  0x51
#define global EmfRecordTypeExtCreateFontIndirect  0x52
#define global EmfRecordTypeExtTextOutA  0x53
#define global EmfRecordTypeExtTextOutW  0x54
#define global EmfRecordTypePolyBezier16  0x55
#define global EmfRecordTypePolygon16  0x56
#define global EmfRecordTypePolyline16  0x57
#define global EmfRecordTypePolyBezierTo16  0x58
#define global EmfRecordTypePolylineTo16  0x59
#define global EmfRecordTypePolyPolyline16  0x5a
#define global EmfRecordTypePolyPolygon16  0x5b
#define global EmfRecordTypePolyDraw16  0x5c
#define global EmfRecordTypeCreateMonoBrush  0x5d
#define global EmfRecordTypeCreateDIBPatternBrushPt  0x5e
#define global EmfRecordTypeExtCreatePen  0x5f
#define global EmfRecordTypePolyTextOutA  0x60
#define global EmfRecordTypePolyTextOutW  0x61
#define global EmfRecordTypeSetICMMode  0x62
#define global EmfRecordTypeCreateColorSpace  0x63
#define global EmfRecordTypeSetColorSpace  0x64
#define global EmfRecordTypeDeleteColorSpace  0x65
#define global EmfRecordTypeGLSRecord  0x66
#define global EmfRecordTypeGLSBoundedRecord  0x67
#define global EmfRecordTypePixelFormat  0x68
#define global EmfRecordTypeDrawEscape  0x69
#define global EmfRecordTypeExtEscape  0x6a
#define global EmfRecordTypeStartDoc  0x6b
#define global EmfRecordTypeSmallTextOut  0x6c
#define global EmfRecordTypeForceUFIMapping  0x6d
#define global EmfRecordTypeNamedEscape  0x6e
#define global EmfRecordTypeColorCorrectPalette  0x6f
#define global EmfRecordTypeSetICMProfileA  0x70
#define global EmfRecordTypeSetICMProfileW  0x71
#define global EmfRecordTypeAlphaBlend  0x72
#define global EmfRecordTypeSetLayout  0x73
#define global EmfRecordTypeTransparentBlt  0x74
#define global EmfRecordTypeReserved_117  0x75
#define global EmfRecordTypeGradientFill  0x76
#define global EmfRecordTypeSetLinkedUFIs  0x77
#define global EmfRecordTypeSetTextJustification  0x78
#define global EmfRecordTypeColorMatchToTargetW  0x79
#define global EmfRecordTypeCreateColorSpaceW  0x7a
#define global EmfRecordTypeMax  0x7a
#define global EmfRecordTypeMin  0x1
#define global EmfPlusRecordTypeInvalid  0x4000
#define global EmfPlusRecordTypeHeader  0x4001
#define global EmfPlusRecordTypeEndOfFile  0x4002
#define global EmfPlusRecordTypeComment  0x4003
#define global EmfPlusRecordTypeGetDC  0x4004
#define global EmfPlusRecordTypeMultiFormatStart  0x4005
#define global EmfPlusRecordTypeMultiFormatSection  0x4006
#define global EmfPlusRecordTypeMultiFormatEnd  0x4007
#define global EmfPlusRecordTypeObject  0x4008
#define global EmfPlusRecordTypeClear  0x4009
#define global EmfPlusRecordTypeFillRects  0x400a
#define global EmfPlusRecordTypeDrawRects  0x400b
#define global EmfPlusRecordTypeFillPolygon  0x400c
#define global EmfPlusRecordTypeDrawLines  0x400d
#define global EmfPlusRecordTypeFillEllipse  0x400e
#define global EmfPlusRecordTypeDrawEllipse  0x400f
#define global EmfPlusRecordTypeFillPie  0x4010
#define global EmfPlusRecordTypeDrawPie  0x4011
#define global EmfPlusRecordTypeDrawArc  0x4012
#define global EmfPlusRecordTypeFillRegion  0x4013
#define global EmfPlusRecordTypeFillPath  0x4014
#define global EmfPlusRecordTypeDrawPath  0x4015
#define global EmfPlusRecordTypeFillClosedCurve  0x4016
#define global EmfPlusRecordTypeDrawClosedCurve  0x4017
#define global EmfPlusRecordTypeDrawCurve  0x4018
#define global EmfPlusRecordTypeDrawBeziers  0x4019
#define global EmfPlusRecordTypeDrawImage  0x401a
#define global EmfPlusRecordTypeDrawImagePoints  0x401b
#define global EmfPlusRecordTypeDrawString  0x401c
#define global EmfPlusRecordTypeSetRenderingOrigin  0x401d
#define global EmfPlusRecordTypeSetAntiAliasMode  0x401e
#define global EmfPlusRecordTypeSetTextRenderingHint  0x401f
#define global EmfPlusRecordTypeSetTextContrast  0x4020
#define global EmfPlusRecordTypeSetInterpolationMode  0x4021
#define global EmfPlusRecordTypeSetPixelOffsetMode  0x4022
#define global EmfPlusRecordTypeSetCompositingMode  0x4023
#define global EmfPlusRecordTypeSetCompositingQuality  0x4024
#define global EmfPlusRecordTypeSave  0x4025
#define global EmfPlusRecordTypeRestore  0x4026
#define global EmfPlusRecordTypeBeginContainer  0x4027
#define global EmfPlusRecordTypeBeginContainerNoParams  0x4028
#define global EmfPlusRecordTypeEndContainer  0x4029
#define global EmfPlusRecordTypeSetWorldTransform  0x402a
#define global EmfPlusRecordTypeResetWorldTransform  0x402b
#define global EmfPlusRecordTypeMultiplyWorldTransform  0x402c
#define global EmfPlusRecordTypeTranslateWorldTransform  0x402d
#define global EmfPlusRecordTypeScaleWorldTransform  0x402e
#define global EmfPlusRecordTypeRotateWorldTransform  0x402f
#define global EmfPlusRecordTypeSetPageTransform  0x4030
#define global EmfPlusRecordTypeResetClip  0x4031
#define global EmfPlusRecordTypeSetClipRect  0x4032
#define global EmfPlusRecordTypeSetClipPath  0x4033
#define global EmfPlusRecordTypeSetClipRegion  0x4034
#define global EmfPlusRecordTypeOffsetClip  0x4035
#define global EmfPlusRecordTypeDrawDriverString  0x4036
#define global EmfPlusRecordTypeStrokeFillPath  0x4037
#define global EmfPlusRecordTypeSerializableObject  0x4038
#define global EmfPlusRecordTypeSetTSGraphics  0x4039
#define global EmfPlusRecordTypeSetTSClip  0x403a
#define global EmfPlusRecordTotal  0x403b
#define global EmfPlusRecordTypeMax  0x403a
#define global EmfPlusRecordTypeMin  0x4001

; EmfType
#define global EmfTypeEmfOnly  0x3
#define global EmfTypeEmfPlusOnly  0x4
#define global EmfTypeEmfPlusDual  0x5

; ENABLE_SCROLL_BAR_ARROWS
#define global ESB_DISABLE_BOTH  0x3
#define global ESB_DISABLE_DOWN  0x2
#define global ESB_DISABLE_LEFT  0x1
#define global ESB_DISABLE_LTUP  0x1
#define global ESB_DISABLE_RIGHT  0x2
#define global ESB_DISABLE_RTDN  0x2
#define global ESB_DISABLE_UP  0x1
#define global ESB_ENABLE_BOTH  0x0

; ENHANCED_METAFILE_RECORD_TYPE
#define global EMR_HEADER  0x1
#define global EMR_POLYBEZIER  0x2
#define global EMR_POLYGON  0x3
#define global EMR_POLYLINE  0x4
#define global EMR_POLYBEZIERTO  0x5
#define global EMR_POLYLINETO  0x6
#define global EMR_POLYPOLYLINE  0x7
#define global EMR_POLYPOLYGON  0x8
#define global EMR_SETWINDOWEXTEX  0x9
#define global EMR_SETWINDOWORGEX  0xa
#define global EMR_SETVIEWPORTEXTEX  0xb
#define global EMR_SETVIEWPORTORGEX  0xc
#define global EMR_SETBRUSHORGEX  0xd
#define global EMR_EOF  0xe
#define global EMR_SETPIXELV  0xf
#define global EMR_SETMAPPERFLAGS  0x10
#define global EMR_SETMAPMODE  0x11
#define global EMR_SETBKMODE  0x12
#define global EMR_SETPOLYFILLMODE  0x13
#define global EMR_SETROP2  0x14
#define global EMR_SETSTRETCHBLTMODE  0x15
#define global EMR_SETTEXTALIGN  0x16
#define global EMR_SETCOLORADJUSTMENT  0x17
#define global EMR_SETTEXTCOLOR  0x18
#define global EMR_SETBKCOLOR  0x19
#define global EMR_OFFSETCLIPRGN  0x1a
#define global EMR_MOVETOEX  0x1b
#define global EMR_SETMETARGN  0x1c
#define global EMR_EXCLUDECLIPRECT  0x1d
#define global EMR_INTERSECTCLIPRECT  0x1e
#define global EMR_SCALEVIEWPORTEXTEX  0x1f
#define global EMR_SCALEWINDOWEXTEX  0x20
#define global EMR_SAVEDC  0x21
#define global EMR_RESTOREDC  0x22
#define global EMR_SETWORLDTRANSFORM  0x23
#define global EMR_MODIFYWORLDTRANSFORM  0x24
#define global EMR_SELECTOBJECT  0x25
#define global EMR_CREATEPEN  0x26
#define global EMR_CREATEBRUSHINDIRECT  0x27
#define global EMR_DELETEOBJECT  0x28
#define global EMR_ANGLEARC  0x29
#define global EMR_ELLIPSE  0x2a
#define global EMR_RECTANGLE  0x2b
#define global EMR_ROUNDRECT  0x2c
#define global EMR_ARC  0x2d
#define global EMR_CHORD  0x2e
#define global EMR_PIE  0x2f
#define global EMR_SELECTPALETTE  0x30
#define global EMR_CREATEPALETTE  0x31
#define global EMR_SETPALETTEENTRIES  0x32
#define global EMR_RESIZEPALETTE  0x33
#define global EMR_REALIZEPALETTE  0x34
#define global EMR_EXTFLOODFILL  0x35
#define global EMR_LINETO  0x36
#define global EMR_ARCTO  0x37
#define global EMR_POLYDRAW  0x38
#define global EMR_SETARCDIRECTION  0x39
#define global EMR_SETMITERLIMIT  0x3a
#define global EMR_BEGINPATH  0x3b
#define global EMR_ENDPATH  0x3c
#define global EMR_CLOSEFIGURE  0x3d
#define global EMR_FILLPATH  0x3e
#define global EMR_STROKEANDFILLPATH  0x3f
#define global EMR_STROKEPATH  0x40
#define global EMR_FLATTENPATH  0x41
#define global EMR_WIDENPATH  0x42
#define global EMR_SELECTCLIPPATH  0x43
#define global EMR_ABORTPATH  0x44
#define global EMR_GDICOMMENT  0x46
#define global EMR_FILLRGN  0x47
#define global EMR_FRAMERGN  0x48
#define global EMR_INVERTRGN  0x49
#define global EMR_PAINTRGN  0x4a
#define global EMR_EXTSELECTCLIPRGN  0x4b
#define global EMR_BITBLT  0x4c
#define global EMR_STRETCHBLT  0x4d
#define global EMR_MASKBLT  0x4e
#define global EMR_PLGBLT  0x4f
#define global EMR_SETDIBITSTODEVICE  0x50
#define global EMR_STRETCHDIBITS  0x51
#define global EMR_EXTCREATEFONTINDIRECTW  0x52
#define global EMR_EXTTEXTOUTA  0x53
#define global EMR_EXTTEXTOUTW  0x54
#define global EMR_POLYBEZIER16  0x55
#define global EMR_POLYGON16  0x56
#define global EMR_POLYLINE16  0x57
#define global EMR_POLYBEZIERTO16  0x58
#define global EMR_POLYLINETO16  0x59
#define global EMR_POLYPOLYLINE16  0x5a
#define global EMR_POLYPOLYGON16  0x5b
#define global EMR_POLYDRAW16  0x5c
#define global EMR_CREATEMONOBRUSH  0x5d
#define global EMR_CREATEDIBPATTERNBRUSHPT  0x5e
#define global EMR_EXTCREATEPEN  0x5f
#define global EMR_POLYTEXTOUTA  0x60
#define global EMR_POLYTEXTOUTW  0x61
#define global EMR_SETICMMODE  0x62
#define global EMR_CREATECOLORSPACE  0x63
#define global EMR_SETCOLORSPACE  0x64
#define global EMR_DELETECOLORSPACE  0x65
#define global EMR_GLSRECORD  0x66
#define global EMR_GLSBOUNDEDRECORD  0x67
#define global EMR_PIXELFORMAT  0x68
#define global EMR_RESERVED_105  0x69
#define global EMR_RESERVED_106  0x6a
#define global EMR_RESERVED_107  0x6b
#define global EMR_RESERVED_108  0x6c
#define global EMR_RESERVED_109  0x6d
#define global EMR_RESERVED_110  0x6e
#define global EMR_COLORCORRECTPALETTE  0x6f
#define global EMR_SETICMPROFILEA  0x70
#define global EMR_SETICMPROFILEW  0x71
#define global EMR_ALPHABLEND  0x72
#define global EMR_SETLAYOUT  0x73
#define global EMR_TRANSPARENTBLT  0x74
#define global EMR_RESERVED_117  0x75
#define global EMR_GRADIENTFILL  0x76
#define global EMR_RESERVED_119  0x77
#define global EMR_RESERVED_120  0x78
#define global EMR_COLORMATCHTOTARGETW  0x79
#define global EMR_CREATECOLORSPACEW  0x7a
#define global EMR_MIN  0x1
#define global EMR_MAX  0x7a

; ENUM_DATE_FORMATS_FLAGS
#define global DATE_SHORTDATE  0x1
#define global DATE_LONGDATE  0x2
#define global DATE_YEARMONTH  0x8
#define global DATE_MONTHDAY  0x80
#define global DATE_AUTOLAYOUT  0x40
#define global DATE_LTRREADING  0x10
#define global DATE_RTLREADING  0x20
#define global DATE_USE_ALT_CALENDAR  0x4

; ENUM_DISPLAY_SETTINGS_FLAGS
#define global EDS_RAWMODE  0x2
#define global EDS_ROTATEDMODE  0x4

; ENUM_DISPLAY_SETTINGS_MODE
#define global ENUM_CURRENT_SETTINGS  0xffffffff
#define global ENUM_REGISTRY_SETTINGS  0xfffffffe

; ENUM_PROCESS_MODULES_EX_FLAGS
#define global LIST_MODULES_ALL  0x3
#define global LIST_MODULES_DEFAULT  0x0
#define global LIST_MODULES_32BIT  0x1
#define global LIST_MODULES_64BIT  0x2

; ENUM_SERVICE_STATE
#define global SERVICE_ACTIVE  0x1
#define global SERVICE_INACTIVE  0x2
#define global SERVICE_STATE_ALL  0x3

; ENUM_SERVICE_TYPE
#define global SERVICE_DRIVER  0xb
#define global SERVICE_KERNEL_DRIVER  0x1
#define global SERVICE_WIN32  0x30
#define global SERVICE_WIN32_SHARE_PROCESS  0x20
#define global SERVICE_ADAPTER  0x4
#define global SERVICE_FILE_SYSTEM_DRIVER  0x2
#define global SERVICE_RECOGNIZER_DRIVER  0x8
#define global SERVICE_WIN32_OWN_PROCESS  0x10
#define global SERVICE_USER_OWN_PROCESS  0x50
#define global SERVICE_USER_SHARE_PROCESS  0x60
#define global SERVICE_NO_CHANGE  0xffffffff

; ENUM_SYSTEM_CODE_PAGES_FLAGS
#define global CP_INSTALLED  0x1
#define global CP_SUPPORTED  0x2

; ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS
#define global LGRPID_INSTALLED  0x1
#define global LGRPID_SUPPORTED  0x2

; ERASE_TAPE_TYPE
#define global TAPE_ERASE_LONG  0x1
#define global TAPE_ERASE_SHORT  0x0

; ESCAPE_COMM_FUNCTION
#define global CLRBREAK  0x9
#define global CLRDTR  0x6
#define global CLRRTS  0x4
#define global SETBREAK  0x8
#define global SETDTR  0x5
#define global SETRTS  0x3
#define global SETXOFF  0x1
#define global SETXON  0x2

; ETO_OPTIONS
#define global ETO_OPAQUE  0x2
#define global ETO_CLIPPED  0x4
#define global ETO_GLYPH_INDEX  0x10
#define global ETO_RTLREADING  0x80
#define global ETO_NUMERICSLOCAL  0x400
#define global ETO_NUMERICSLATIN  0x800
#define global ETO_IGNORELANGUAGE  0x1000
#define global ETO_PDY  0x2000
#define global ETO_REVERSE_INDEX_MAP  0x10000

; ETW_PROCESS_HANDLE_INFO_TYPE
#define global EtwQueryPartitionInformation  0x1
#define global EtwQueryPartitionInformationV2  0x2
#define global EtwQueryLastDroppedTimes  0x3
#define global EtwQueryLogFileHeader  0x4
#define global EtwQueryProcessHandleInfoMax  0x5

; EVENT_TRACE_CONTROL
#define global EVENT_TRACE_CONTROL_FLUSH  0x3
#define global EVENT_TRACE_CONTROL_QUERY  0x0
#define global EVENT_TRACE_CONTROL_STOP  0x1
#define global EVENT_TRACE_CONTROL_UPDATE  0x2

; EVENT_TRACE_FLAG
#define global EVENT_TRACE_FLAG_ALPC  0x100000
#define global EVENT_TRACE_FLAG_CSWITCH  0x10
#define global EVENT_TRACE_FLAG_DBGPRINT  0x40000
#define global EVENT_TRACE_FLAG_DISK_FILE_IO  0x200
#define global EVENT_TRACE_FLAG_DISK_IO  0x100
#define global EVENT_TRACE_FLAG_DISK_IO_INIT  0x400
#define global EVENT_TRACE_FLAG_DISPATCHER  0x800
#define global EVENT_TRACE_FLAG_DPC  0x20
#define global EVENT_TRACE_FLAG_DRIVER  0x800000
#define global EVENT_TRACE_FLAG_FILE_IO  0x2000000
#define global EVENT_TRACE_FLAG_FILE_IO_INIT  0x4000000
#define global EVENT_TRACE_FLAG_IMAGE_LOAD  0x4
#define global EVENT_TRACE_FLAG_INTERRUPT  0x40
#define global EVENT_TRACE_FLAG_JOB  0x80000
#define global EVENT_TRACE_FLAG_MEMORY_HARD_FAULTS  0x2000
#define global EVENT_TRACE_FLAG_MEMORY_PAGE_FAULTS  0x1000
#define global EVENT_TRACE_FLAG_NETWORK_TCPIP  0x10000
#define global EVENT_TRACE_FLAG_NO_SYSCONFIG  0x10000000
#define global EVENT_TRACE_FLAG_PROCESS  0x1
#define global EVENT_TRACE_FLAG_PROCESS_COUNTERS  0x8
#define global EVENT_TRACE_FLAG_PROFILE  0x1000000
#define global EVENT_TRACE_FLAG_REGISTRY  0x20000
#define global EVENT_TRACE_FLAG_SPLIT_IO  0x200000
#define global EVENT_TRACE_FLAG_SYSTEMCALL  0x80
#define global EVENT_TRACE_FLAG_THREAD  0x2
#define global EVENT_TRACE_FLAG_VAMAP  0x8000
#define global EVENT_TRACE_FLAG_VIRTUAL_ALLOC  0x4000

; EXECUTION_STATE
#define global ES_AWAYMODE_REQUIRED  0x40
#define global ES_CONTINUOUS  0x80000000
#define global ES_DISPLAY_REQUIRED  0x2
#define global ES_SYSTEM_REQUIRED  0x1
#define global ES_USER_PRESENT  0x4

; EXIT_WINDOWS_FLAGS
#define global EWX_LOGOFF  0x0
#define global EWX_SHUTDOWN  0x1
#define global EWX_REBOOT  0x2
#define global EWX_FORCE  0x4
#define global EWX_POWEROFF  0x8
#define global EWX_FORCEIFHUNG  0x10
#define global EWX_QUICKRESOLVE  0x20
#define global EWX_RESTARTAPPS  0x40
#define global EWX_HYBRID_SHUTDOWN  0x400000
#define global EWX_BOOTOPTIONS  0x1000000
#define global EWX_ARSO  0x4000000
#define global EWX_CHECK_SAFE_FOR_SERVER  0x8000000
#define global EWX_SYSTEM_INITIATED  0x10000000

; EXT_FLOOD_FILL_TYPE
#define global FLOODFILLBORDER  0x0
#define global FLOODFILLSURFACE  0x1

; EXTENDED_NAME_FORMAT
#define global NameUnknown  0x0
#define global NameFullyQualifiedDN  0x1
#define global NameSamCompatible  0x2
#define global NameDisplay  0x3

; FEEDBACK_TYPE
#define global FEEDBACK_TOUCH_CONTACTVISUALIZATION  0x1
#define global FEEDBACK_PEN_BARRELVISUALIZATION  0x2
#define global FEEDBACK_PEN_TAP  0x3
#define global FEEDBACK_PEN_DOUBLETAP  0x4
#define global FEEDBACK_PEN_PRESSANDHOLD  0x5
#define global FEEDBACK_PEN_RIGHTTAP  0x6
#define global FEEDBACK_TOUCH_TAP  0x7
#define global FEEDBACK_TOUCH_DOUBLETAP  0x8
#define global FEEDBACK_TOUCH_PRESSANDHOLD  0x9
#define global FEEDBACK_TOUCH_RIGHTTAP  0xa
#define global FEEDBACK_GESTURE_PRESSANDTAP  0xb
#define global FEEDBACK_MAX  -1

; FILE_CREATION_DISPOSITION
#define global CREATE_NEW  0x1
#define global CREATE_ALWAYS  0x2
#define global OPEN_EXISTING  0x3
#define global OPEN_ALWAYS  0x4
#define global TRUNCATE_EXISTING  0x5

; FILE_FLAGS_AND_ATTRIBUTES
#define global FILE_ATTRIBUTE_READONLY  0x1
#define global FILE_ATTRIBUTE_HIDDEN  0x2
#define global FILE_ATTRIBUTE_SYSTEM  0x4
#define global FILE_ATTRIBUTE_DIRECTORY  0x10
#define global FILE_ATTRIBUTE_ARCHIVE  0x20
#define global FILE_ATTRIBUTE_DEVICE  0x40
#define global FILE_ATTRIBUTE_NORMAL  0x80
#define global FILE_ATTRIBUTE_TEMPORARY  0x100
#define global FILE_ATTRIBUTE_SPARSE_FILE  0x200
#define global FILE_ATTRIBUTE_REPARSE_POINT  0x400
#define global FILE_ATTRIBUTE_COMPRESSED  0x800
#define global FILE_ATTRIBUTE_OFFLINE  0x1000
#define global FILE_ATTRIBUTE_NOT_CONTENT_INDEXED  0x2000
#define global FILE_ATTRIBUTE_ENCRYPTED  0x4000
#define global FILE_ATTRIBUTE_INTEGRITY_STREAM  0x8000
#define global FILE_ATTRIBUTE_VIRTUAL  0x10000
#define global FILE_ATTRIBUTE_NO_SCRUB_DATA  0x20000
#define global FILE_ATTRIBUTE_EA  0x40000
#define global FILE_ATTRIBUTE_PINNED  0x80000
#define global FILE_ATTRIBUTE_UNPINNED  0x100000
#define global FILE_ATTRIBUTE_RECALL_ON_OPEN  0x40000
#define global FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS  0x400000
#define global FILE_FLAG_WRITE_THROUGH  0x80000000
#define global FILE_FLAG_OVERLAPPED  0x40000000
#define global FILE_FLAG_NO_BUFFERING  0x20000000
#define global FILE_FLAG_RANDOM_ACCESS  0x10000000
#define global FILE_FLAG_SEQUENTIAL_SCAN  0x8000000
#define global FILE_FLAG_DELETE_ON_CLOSE  0x4000000
#define global FILE_FLAG_BACKUP_SEMANTICS  0x2000000
#define global FILE_FLAG_POSIX_SEMANTICS  0x1000000
#define global FILE_FLAG_SESSION_AWARE  0x800000
#define global FILE_FLAG_OPEN_REPARSE_POINT  0x200000
#define global FILE_FLAG_OPEN_NO_RECALL  0x100000
#define global FILE_FLAG_FIRST_PIPE_INSTANCE  0x80000
#define global PIPE_ACCESS_DUPLEX  0x3
#define global PIPE_ACCESS_INBOUND  0x1
#define global PIPE_ACCESS_OUTBOUND  0x2
#define global SECURITY_ANONYMOUS  0x0
#define global SECURITY_IDENTIFICATION  0x10000
#define global SECURITY_IMPERSONATION  0x20000
#define global SECURITY_DELEGATION  0x30000
#define global SECURITY_CONTEXT_TRACKING  0x40000
#define global SECURITY_EFFECTIVE_ONLY  0x80000
#define global SECURITY_SQOS_PRESENT  0x100000
#define global SECURITY_VALID_SQOS_FLAGS  0x1f0000

; FILE_ID_TYPE
#define global FileIdType  0x0
#define global ObjectIdType  0x1
#define global ExtendedFileIdType  0x2
#define global MaximumFileIdType  0x3

; FILE_INFO_BY_HANDLE_CLASS
#define global FileBasicInfo  0x0
#define global FileStandardInfo  0x1
#define global FileNameInfo  0x2
#define global FileRenameInfo  0x3
#define global FileDispositionInfo  0x4
#define global FileAllocationInfo  0x5
#define global FileEndOfFileInfo  0x6
#define global FileStreamInfo  0x7
#define global FileCompressionInfo  0x8
#define global FileAttributeTagInfo  0x9
#define global FileIdBothDirectoryInfo  0xa
#define global FileIdBothDirectoryRestartInfo  0xb
#define global FileIoPriorityHintInfo  0xc
#define global FileRemoteProtocolInfo  0xd
#define global FileFullDirectoryInfo  0xe
#define global FileFullDirectoryRestartInfo  0xf
#define global FileStorageInfo  0x10
#define global FileAlignmentInfo  0x11
#define global FileIdInfo  0x12
#define global FileIdExtdDirectoryInfo  0x13
#define global FileIdExtdDirectoryRestartInfo  0x14
#define global FileDispositionInfoEx  0x15
#define global FileRenameInfoEx  0x16
#define global FileCaseSensitiveInfo  0x17
#define global FileNormalizedNameInfo  0x18
#define global MaximumFileInfoByHandleClass  0x19

; FILE_MAP
#define global FILE_MAP_WRITE  0x2
#define global FILE_MAP_READ  0x4
#define global FILE_MAP_ALL_ACCESS  0xf001f
#define global FILE_MAP_EXECUTE  0x20
#define global FILE_MAP_COPY  0x1
#define global FILE_MAP_RESERVE  0x80000000
#define global FILE_MAP_TARGETS_INVALID  0x40000000
#define global FILE_MAP_LARGE_PAGES  0x20000000

; FILE_NOTIFY_CHANGE
#define global FILE_NOTIFY_CHANGE_FILE_NAME  0x1
#define global FILE_NOTIFY_CHANGE_DIR_NAME  0x2
#define global FILE_NOTIFY_CHANGE_ATTRIBUTES  0x4
#define global FILE_NOTIFY_CHANGE_SIZE  0x8
#define global FILE_NOTIFY_CHANGE_LAST_WRITE  0x10
#define global FILE_NOTIFY_CHANGE_LAST_ACCESS  0x20
#define global FILE_NOTIFY_CHANGE_CREATION  0x40
#define global FILE_NOTIFY_CHANGE_SECURITY  0x100

; FILE_SHARE_MODE
#define global FILE_SHARE_NONE  0x0
#define global FILE_SHARE_DELETE  0x4
#define global FILE_SHARE_READ  0x1
#define global FILE_SHARE_WRITE  0x2

; FILE_TYPE
#define global FILE_TYPE_UNKNOWN  0x0
#define global FILE_TYPE_DISK  0x1
#define global FILE_TYPE_CHAR  0x2
#define global FILE_TYPE_PIPE  0x3
#define global FILE_TYPE_REMOTE  0x8000

; FILEOPERATION_FLAGS
#define global FOFX_NOSKIPJUNCTIONS  0x10000
#define global FOFX_PREFERHARDLINK  0x20000
#define global FOFX_SHOWELEVATIONPROMPT  0x40000
#define global FOFX_RECYCLEONDELETE  0x80000
#define global FOFX_EARLYFAILURE  0x100000
#define global FOFX_PRESERVEFILEEXTENSIONS  0x200000
#define global FOFX_KEEPNEWERFILE  0x400000
#define global FOFX_NOCOPYHOOKS  0x800000
#define global FOFX_NOMINIMIZEBOX  0x1000000
#define global FOFX_MOVEACLSACROSSVOLUMES  0x2000000
#define global FOFX_DONTDISPLAYSOURCEPATH  0x4000000
#define global FOFX_DONTDISPLAYDESTPATH  0x8000000
#define global FOFX_REQUIREELEVATION  0x10000000
#define global FOFX_ADDUNDORECORD  0x20000000
#define global FOFX_COPYASDOWNLOAD  0x40000000
#define global FOFX_DONTDISPLAYLOCATIONS  0x80000000
#define global FOF_MULTIDESTFILES  0x1
#define global FOF_CONFIRMMOUSE  0x2
#define global FOF_SILENT  0x4
#define global FOF_RENAMEONCOLLISION  0x8
#define global FOF_NOCONFIRMATION  0x10
#define global FOF_WANTMAPPINGHANDLE  0x20
#define global FOF_ALLOWUNDO  0x40
#define global FOF_FILESONLY  0x80
#define global FOF_SIMPLEPROGRESS  0x100
#define global FOF_NOCONFIRMMKDIR  0x200
#define global FOF_NOERRORUI  0x400
#define global FOF_NOCOPYSECURITYATTRIBS  0x800
#define global FOF_NORECURSION  0x1000
#define global FOF_NO_CONNECTED_ELEMENTS  0x2000
#define global FOF_WANTNUKEWARNING  0x4000
#define global FOF_NORECURSEREPARSE  0x8000
#define global FOF_NO_UI  0x614

; FillMode
#define global FillModeAlternate  0x0
#define global FillModeWinding  0x1

; FIND_FIRST_EX_FLAGS
#define global FIND_FIRST_EX_CASE_SENSITIVE  0x1
#define global FIND_FIRST_EX_LARGE_FETCH  0x2
#define global FIND_FIRST_EX_ON_DISK_ENTRIES_ONLY  0x4

; FINDEX_INFO_LEVELS
#define global FindExInfoStandard  0x0
#define global FindExInfoBasic  0x1
#define global FindExInfoMaxInfoLevel  0x2

; FINDEX_SEARCH_OPS
#define global FindExSearchNameMatch  0x0
#define global FindExSearchLimitToDirectories  0x1
#define global FindExSearchLimitToDevices  0x2
#define global FindExSearchMaxSearchOp  0x3

; FIRMWARE_TABLE_PROVIDER
#define global ACPI  0x41435049
#define global FIRM  0x4649524d
#define global RSMB  0x52534d42

; FIRMWARE_TYPE
#define global FirmwareTypeUnknown  0x0
#define global FirmwareTypeBios  0x1
#define global FirmwareTypeUefi  0x2
#define global FirmwareTypeMax  0x3

; FLASHWINFO_FLAGS
#define global FLASHW_ALL  0x3
#define global FLASHW_CAPTION  0x1
#define global FLASHW_STOP  0x0
#define global FLASHW_TIMER  0x4
#define global FLASHW_TIMERNOFG  0xc
#define global FLASHW_TRAY  0x2

; FlushIntention
#define global FlushIntentionFlush  0x0
#define global FlushIntentionSync  0x1

; FOLD_STRING_MAP_FLAGS
#define global MAP_COMPOSITE  0x40
#define global MAP_EXPAND_LIGATURES  0x2000
#define global MAP_FOLDCZONE  0x10
#define global MAP_FOLDDIGITS  0x80
#define global MAP_PRECOMPOSED  0x20

; FONT_CHARSET
#define global ANSI_CHARSET  0x0
#define global DEFAULT_CHARSET  0x1
#define global SYMBOL_CHARSET  0x2
#define global SHIFTJIS_CHARSET  0x80
#define global HANGEUL_CHARSET  0x81
#define global HANGUL_CHARSET  0x81
#define global GB2312_CHARSET  0x86
#define global CHINESEBIG5_CHARSET  0x88
#define global OEM_CHARSET  0xff
#define global JOHAB_CHARSET  0x82
#define global HEBREW_CHARSET  0xb1
#define global ARABIC_CHARSET  0xb2
#define global GREEK_CHARSET  0xa1
#define global TURKISH_CHARSET  0xa2
#define global VIETNAMESE_CHARSET  0xa3
#define global THAI_CHARSET  0xde
#define global EASTEUROPE_CHARSET  0xee
#define global RUSSIAN_CHARSET  0xcc
#define global MAC_CHARSET  0x4d
#define global BALTIC_CHARSET  0xba

; FONT_CLIP_PRECISION
#define global CLIP_DEFAULT_PRECIS  0x0
#define global CLIP_CHARACTER_PRECIS  0x1
#define global CLIP_STROKE_PRECIS  0x2
#define global CLIP_MASK  0xf
#define global CLIP_LH_ANGLES  0x10
#define global CLIP_TT_ALWAYS  0x20
#define global CLIP_DFA_DISABLE  0x40
#define global CLIP_EMBEDDED  0x80
#define global CLIP_DFA_OVERRIDE  0x40

; FONT_OUTPUT_PRECISION
#define global OUT_DEFAULT_PRECIS  0x0
#define global OUT_STRING_PRECIS  0x1
#define global OUT_CHARACTER_PRECIS  0x2
#define global OUT_STROKE_PRECIS  0x3
#define global OUT_TT_PRECIS  0x4
#define global OUT_DEVICE_PRECIS  0x5
#define global OUT_RASTER_PRECIS  0x6
#define global OUT_TT_ONLY_PRECIS  0x7
#define global OUT_OUTLINE_PRECIS  0x8
#define global OUT_SCREEN_OUTLINE_PRECIS  0x9
#define global OUT_PS_ONLY_PRECIS  0xa

; FONT_QUALITY
#define global DEFAULT_QUALITY  0x0
#define global DRAFT_QUALITY  0x1
#define global PROOF_QUALITY  0x2
#define global NONANTIALIASED_QUALITY  0x3
#define global ANTIALIASED_QUALITY  0x4
#define global CLEARTYPE_QUALITY  0x5

; FONT_RESOURCE_CHARACTERISTICS
#define global FR_PRIVATE  0x10
#define global FR_NOT_ENUM  0x20

; FOREGROUND_WINDOW_LOCK_CODE
#define global LSFW_LOCK  0x1
#define global LSFW_UNLOCK  0x2

; FORMAT_MESSAGE_OPTIONS
#define global FORMAT_MESSAGE_ALLOCATE_BUFFER  0x100
#define global FORMAT_MESSAGE_ARGUMENT_ARRAY  0x2000
#define global FORMAT_MESSAGE_FROM_HMODULE  0x800
#define global FORMAT_MESSAGE_FROM_STRING  0x400
#define global FORMAT_MESSAGE_FROM_SYSTEM  0x1000
#define global FORMAT_MESSAGE_IGNORE_INSERTS  0x200

; FTP_FLAGS
#define global FTP_TRANSFER_TYPE_ASCII  0x1
#define global FTP_TRANSFER_TYPE_BINARY  0x2
#define global FTP_TRANSFER_TYPE_UNKNOWN  0x0
#define global INTERNET_FLAG_TRANSFER_ASCII  0x1
#define global INTERNET_FLAG_TRANSFER_BINARY  0x2

; FUNCFLAGS
#define global FUNCFLAG_FRESTRICTED  0x1
#define global FUNCFLAG_FSOURCE  0x2
#define global FUNCFLAG_FBINDABLE  0x4
#define global FUNCFLAG_FREQUESTEDIT  0x8
#define global FUNCFLAG_FDISPLAYBIND  0x10
#define global FUNCFLAG_FDEFAULTBIND  0x20
#define global FUNCFLAG_FHIDDEN  0x40
#define global FUNCFLAG_FUSESGETLASTERROR  0x80
#define global FUNCFLAG_FDEFAULTCOLLELEM  0x100
#define global FUNCFLAG_FUIDEFAULT  0x200
#define global FUNCFLAG_FNONBROWSABLE  0x400
#define global FUNCFLAG_FREPLACEABLE  0x800
#define global FUNCFLAG_FIMMEDIATEBIND  0x1000

; FUNCKIND
#define global FUNC_VIRTUAL  0x0
#define global FUNC_PUREVIRTUAL  0x1
#define global FUNC_NONVIRTUAL  0x2
#define global FUNC_STATIC  0x3
#define global FUNC_DISPATCH  0x4

; GDI_IMAGE_TYPE
#define global IMAGE_BITMAP  0x0
#define global IMAGE_CURSOR  0x2
#define global IMAGE_ICON  0x1

; GDI_REGION_TYPE
#define global RGN_ERROR  0x0
#define global NULLREGION  0x1
#define global SIMPLEREGION  0x2
#define global COMPLEXREGION  0x3

; GENERIC_ACCESS_RIGHTS
#define global GENERIC_READ  0x80000000
#define global GENERIC_WRITE  0x40000000
#define global GENERIC_EXECUTE  0x20000000
#define global GENERIC_ALL  0x10000000

; GESTURE_TYPE
#define global GT_PEN_TAP  0x0
#define global GT_PEN_DOUBLETAP  0x1
#define global GT_PEN_RIGHTTAP  0x2
#define global GT_PEN_PRESSANDHOLD  0x3
#define global GT_PEN_PRESSANDHOLDABORT  0x4
#define global GT_TOUCH_TAP  0x5
#define global GT_TOUCH_DOUBLETAP  0x6
#define global GT_TOUCH_RIGHTTAP  0x7
#define global GT_TOUCH_PRESSANDHOLD  0x8
#define global GT_TOUCH_PRESSANDHOLDABORT  0x9
#define global GT_TOUCH_PRESSANDTAP  0xa

; GESTURECONFIG_ID
#define global GID_BEGIN  0x1
#define global GID_END  0x2
#define global GID_ZOOM  0x3
#define global GID_PAN  0x4
#define global GID_ROTATE  0x5
#define global GID_TWOFINGERTAP  0x6
#define global GID_PRESSANDTAP  0x7
#define global GID_ROLLOVER  0x7

; GET_ADAPTERS_ADDRESSES_FLAGS
#define global GAA_FLAG_SKIP_UNICAST  0x1
#define global GAA_FLAG_SKIP_ANYCAST  0x2
#define global GAA_FLAG_SKIP_MULTICAST  0x4
#define global GAA_FLAG_SKIP_DNS_SERVER  0x8
#define global GAA_FLAG_INCLUDE_PREFIX  0x10
#define global GAA_FLAG_SKIP_FRIENDLY_NAME  0x20
#define global GAA_FLAG_INCLUDE_WINS_INFO  0x40
#define global GAA_FLAG_INCLUDE_GATEWAYS  0x80
#define global GAA_FLAG_INCLUDE_ALL_INTERFACES  0x100
#define global GAA_FLAG_INCLUDE_ALL_COMPARTMENTS  0x200
#define global GAA_FLAG_INCLUDE_TUNNEL_BINDINGORDER  0x400

; GET_ANCESTOR_FLAGS
#define global GA_PARENT  0x1
#define global GA_ROOT  0x2
#define global GA_ROOTOWNER  0x3

; GET_CHARACTER_PLACEMENT_FLAGS
#define global GCP_CLASSIN  0x80000
#define global GCP_DIACRITIC  0x100
#define global GCP_DISPLAYZWG  0x400000
#define global GCP_GLYPHSHAPE  0x10
#define global GCP_JUSTIFY  0x10000
#define global GCP_KASHIDA  0x400
#define global GCP_LIGATE  0x20
#define global GCP_MAXEXTENT  0x100000
#define global GCP_NEUTRALOVERRIDE  0x2000000
#define global GCP_NUMERICOVERRIDE  0x1000000
#define global GCP_NUMERICSLATIN  0x4000000
#define global GCP_NUMERICSLOCAL  0x8000000
#define global GCP_REORDER  0x2
#define global GCP_SYMSWAPOFF  0x800000
#define global GCP_USEKERNING  0x8

; GET_CLASS_LONG_INDEX
#define global GCW_ATOM  -32
#define global GCL_CBCLSEXTRA  -20
#define global GCL_CBWNDEXTRA  -18
#define global GCL_HBRBACKGROUND  -10
#define global GCL_HCURSOR  -12
#define global GCL_HICON  -14
#define global GCL_HICONSM  -34
#define global GCL_HMODULE  -16
#define global GCL_MENUNAME  -8
#define global GCL_STYLE  -26
#define global GCL_WNDPROC  -24
#define global GCLP_HBRBACKGROUND  -10
#define global GCLP_HCURSOR  -12
#define global GCLP_HICON  -14
#define global GCLP_HICONSM  -34
#define global GCLP_HMODULE  -16
#define global GCLP_MENUNAME  -8
#define global GCLP_WNDPROC  -24

; GET_CONVERSION_LIST_FLAG
#define global GCL_CONVERSION  0x1
#define global GCL_REVERSECONVERSION  0x2
#define global GCL_REVERSE_LENGTH  0x3

; GET_DCX_FLAGS
#define global DCX_WINDOW  0x1
#define global DCX_CACHE  0x2
#define global DCX_PARENTCLIP  0x20
#define global DCX_CLIPSIBLINGS  0x10
#define global DCX_CLIPCHILDREN  0x8
#define global DCX_NORESETATTRS  0x4
#define global DCX_LOCKWINDOWUPDATE  0x400
#define global DCX_EXCLUDERGN  0x40
#define global DCX_INTERSECTRGN  0x80
#define global DCX_INTERSECTUPDATE  0x200
#define global DCX_VALIDATE  0x200000

; GET_DEVICE_CAPS_INDEX
#define global DRIVERVERSION  0x0
#define global TECHNOLOGY  0x2
#define global HORZSIZE  0x4
#define global VERTSIZE  0x6
#define global HORZRES  0x8
#define global VERTRES  0xa
#define global BITSPIXEL  0xc
#define global PLANES  0xe
#define global NUMBRUSHES  0x10
#define global NUMPENS  0x12
#define global NUMMARKERS  0x14
#define global NUMFONTS  0x16
#define global NUMCOLORS  0x18
#define global PDEVICESIZE  0x1a
#define global CURVECAPS  0x1c
#define global LINECAPS  0x1e
#define global POLYGONALCAPS  0x20
#define global TEXTCAPS  0x22
#define global CLIPCAPS  0x24
#define global RASTERCAPS  0x26
#define global ASPECTX  0x28
#define global ASPECTY  0x2a
#define global ASPECTXY  0x2c
#define global LOGPIXELSX  0x58
#define global LOGPIXELSY  0x5a
#define global SIZEPALETTE  0x68
#define global NUMRESERVED  0x6a
#define global COLORRES  0x6c
#define global PHYSICALWIDTH  0x6e
#define global PHYSICALHEIGHT  0x6f
#define global PHYSICALOFFSETX  0x70
#define global PHYSICALOFFSETY  0x71
#define global SCALINGFACTORX  0x72
#define global SCALINGFACTORY  0x73
#define global VREFRESH  0x74
#define global DESKTOPVERTRES  0x75
#define global DESKTOPHORZRES  0x76
#define global BLTALIGNMENT  0x77
#define global SHADEBLENDCAPS  0x78
#define global COLORMGMTCAPS  0x79

; GET_FILE_VERSION_INFO_FLAGS
#define global FILE_VER_GET_LOCALISED  0x1
#define global FILE_VER_GET_NEUTRAL  0x2
#define global FILE_VER_GET_PREFETCHED  0x4

; GET_FILEEX_INFO_LEVELS
#define global GetFileExInfoStandard  0x0
#define global GetFileExMaxInfoLevel  0x1

; GET_GLYPH_OUTLINE_FORMAT
#define global GGO_BEZIER  0x3
#define global GGO_BITMAP  0x1
#define global GGO_GLYPH_INDEX  0x80
#define global GGO_GRAY2_BITMAP  0x4
#define global GGO_GRAY4_BITMAP  0x5
#define global GGO_GRAY8_BITMAP  0x6
#define global GGO_METRICS  0x0
#define global GGO_NATIVE  0x2
#define global GGO_UNHINTED  0x100

; GET_GUI_RESOURCES_FLAGS
#define global GR_GDIOBJECTS  0x0
#define global GR_GDIOBJECTS_PEAK  0x2
#define global GR_USEROBJECTS  0x1
#define global GR_USEROBJECTS_PEAK  0x4

; GET_GUIDE_LINE_TYPE
#define global GGL_LEVEL  0x1
#define global GGL_INDEX  0x2
#define global GGL_STRING  0x3
#define global GGL_PRIVATE  0x4

; GET_MENU_DEFAULT_ITEM_FLAGS
#define global GMDI_GOINTOPOPUPS  0x2
#define global GMDI_USEDISABLED  0x1

; GET_MOUSE_MOVE_POINTS_EX_RESOLUTION
#define global GMMP_USE_DISPLAY_POINTS  0x1
#define global GMMP_USE_HIGH_RESOLUTION_POINTS  0x2

; GET_STOCK_OBJECT_FLAGS
#define global BLACK_BRUSH  0x4
#define global DKGRAY_BRUSH  0x3
#define global DC_BRUSH  0x12
#define global GRAY_BRUSH  0x2
#define global HOLLOW_BRUSH  0x5
#define global LTGRAY_BRUSH  0x1
#define global NULL_BRUSH  0x5
#define global WHITE_BRUSH  0x0
#define global BLACK_PEN  0x7
#define global DC_PEN  0x13
#define global NULL_PEN  0x8
#define global WHITE_PEN  0x6
#define global ANSI_FIXED_FONT  0xb
#define global ANSI_VAR_FONT  0xc
#define global DEVICE_DEFAULT_FONT  0xe
#define global DEFAULT_GUI_FONT  0x11
#define global OEM_FIXED_FONT  0xa
#define global SYSTEM_FONT  0xd
#define global SYSTEM_FIXED_FONT  0x10
#define global DEFAULT_PALETTE  0xf

; GET_TAPE_DRIVE_PARAMETERS_OPERATION
#define global GET_TAPE_DRIVE_INFORMATION  0x1
#define global GET_TAPE_MEDIA_INFORMATION  0x0

; GET_THEME_BITMAP_FLAGS
#define global GBF_DIRECT  0x1
#define global GBF_COPY  0x2
#define global GBF_VALIDBITS  0x3

; GET_WINDOW_CMD
#define global GW_CHILD  0x5
#define global GW_ENABLEDPOPUP  0x6
#define global GW_HWNDFIRST  0x0
#define global GW_HWNDLAST  0x1
#define global GW_HWNDNEXT  0x2
#define global GW_HWNDPREV  0x3
#define global GW_OWNER  0x4

; GETFINALPATHNAMEBYHANDLE_FLAGS
#define global VOLUME_NAME_DOS  0x0
#define global VOLUME_NAME_GUID  0x1
#define global VOLUME_NAME_NT  0x2
#define global VOLUME_NAME_NONE  0x4
#define global FILE_NAME_NORMALIZED  0x0
#define global FILE_NAME_OPENED  0x8

; GETPROPERTYSTOREFLAGS
#define global GPS_DEFAULT  0x0
#define global GPS_HANDLERPROPERTIESONLY  0x1
#define global GPS_READWRITE  0x2
#define global GPS_TEMPORARY  0x4
#define global GPS_FASTPROPERTIESONLY  0x8
#define global GPS_OPENSLOWITEM  0x10
#define global GPS_DELAYCREATION  0x20
#define global GPS_BESTEFFORT  0x40
#define global GPS_NO_OPLOCK  0x80
#define global GPS_PREFERQUERYPROPERTIES  0x100
#define global GPS_EXTRINSICPROPERTIES  0x200
#define global GPS_EXTRINSICPROPERTIESONLY  0x400
#define global GPS_VOLATILEPROPERTIES  0x800
#define global GPS_VOLATILEPROPERTIESONLY  0x1000
#define global GPS_MASK_VALID  0x1fff

; GLOBAL_ALLOC_FLAGS
#define global GHND  0x42
#define global GMEM_FIXED  0x0
#define global GMEM_MOVEABLE  0x2
#define global GMEM_ZEROINIT  0x40
#define global GPTR  0x40

; GLOBAL_FILTER
#define global GF_FRAGMENTS  0x2
#define global GF_STRONGHOST  0x8
#define global GF_FRAGCACHE  0x9

; GOPHER_TYPE
#define global GOPHER_TYPE_ASK  0x40000000
#define global GOPHER_TYPE_BINARY  0x200
#define global GOPHER_TYPE_BITMAP  0x4000
#define global GOPHER_TYPE_CALENDAR  0x80000
#define global GOPHER_TYPE_CSO  0x4
#define global GOPHER_TYPE_DIRECTORY  0x2
#define global GOPHER_TYPE_DOS_ARCHIVE  0x20
#define global GOPHER_TYPE_ERROR  0x8
#define global GOPHER_TYPE_GIF  0x1000
#define global GOPHER_TYPE_GOPHER_PLUS  0x80000000
#define global GOPHER_TYPE_HTML  0x20000
#define global GOPHER_TYPE_IMAGE  0x2000
#define global GOPHER_TYPE_INDEX_SERVER  0x80
#define global GOPHER_TYPE_INLINE  0x100000
#define global GOPHER_TYPE_MAC_BINHEX  0x10
#define global GOPHER_TYPE_MOVIE  0x8000
#define global GOPHER_TYPE_PDF  0x40000
#define global GOPHER_TYPE_REDUNDANT  0x400
#define global GOPHER_TYPE_SOUND  0x10000
#define global GOPHER_TYPE_TELNET  0x100
#define global GOPHER_TYPE_TEXT_FILE  0x1
#define global GOPHER_TYPE_TN3270  0x800
#define global GOPHER_TYPE_UNIX_UUENCODED  0x40
#define global GOPHER_TYPE_UNKNOWN  0x20000000

; GPFIDL_FLAGS
#define global GPFIDL_DEFAULT  0x0
#define global GPFIDL_ALTNAME  0x1
#define global GPFIDL_UNCPRINTER  0x2

; GPO_LINK
#define global GPLinkUnknown  0x0
#define global GPLinkMachine  0x1
#define global GPLinkSite  0x2
#define global GPLinkDomain  0x3
#define global GPLinkOrganizationalUnit  0x4

; GpTestControlEnum
#define global TestControlForceBilinear  0x0
#define global TestControlNoICM  0x1
#define global TestControlGetBuildNumber  0x2

; GRADIENT_FILL
#define global GRADIENT_FILL_RECT_H  0x0
#define global GRADIENT_FILL_RECT_V  0x1
#define global GRADIENT_FILL_TRIANGLE  0x2

; GRAPHICS_MODE
#define global GM_COMPATIBLE  0x1
#define global GM_ADVANCED  0x2

; GUITHREADINFO_FLAGS
#define global GUI_CARETBLINKING  0x1
#define global GUI_INMENUMODE  0x4
#define global GUI_INMOVESIZE  0x2
#define global GUI_POPUPMENUMODE  0x10
#define global GUI_SYSTEMMENUMODE  0x8

; HANDLE_FLAGS
#define global HANDLE_FLAG_INHERIT  0x1
#define global HANDLE_FLAG_PROTECT_FROM_CLOSE  0x2

; HARDWARE_COUNTER_TYPE
#define global PMCCounter  0x0
#define global MaxHardwareCounterType  0x1

; HATCH_BRUSH_STYLE
#define global HS_BDIAGONAL  0x3
#define global HS_CROSS  0x4
#define global HS_DIAGCROSS  0x5
#define global HS_FDIAGONAL  0x2
#define global HS_HORIZONTAL  0x0
#define global HS_VERTICAL  0x1

; HatchStyle
#define global HatchStyleHorizontal  0x0
#define global HatchStyleVertical  0x1
#define global HatchStyleForwardDiagonal  0x2
#define global HatchStyleBackwardDiagonal  0x3
#define global HatchStyleCross  0x4
#define global HatchStyleDiagonalCross  0x5
#define global HatchStyle05Percent  0x6
#define global HatchStyle10Percent  0x7
#define global HatchStyle20Percent  0x8
#define global HatchStyle25Percent  0x9
#define global HatchStyle30Percent  0xa
#define global HatchStyle40Percent  0xb
#define global HatchStyle50Percent  0xc
#define global HatchStyle60Percent  0xd
#define global HatchStyle70Percent  0xe
#define global HatchStyle75Percent  0xf
#define global HatchStyle80Percent  0x10
#define global HatchStyle90Percent  0x11
#define global HatchStyleLightDownwardDiagonal  0x12
#define global HatchStyleLightUpwardDiagonal  0x13
#define global HatchStyleDarkDownwardDiagonal  0x14
#define global HatchStyleDarkUpwardDiagonal  0x15
#define global HatchStyleWideDownwardDiagonal  0x16
#define global HatchStyleWideUpwardDiagonal  0x17
#define global HatchStyleLightVertical  0x18
#define global HatchStyleLightHorizontal  0x19
#define global HatchStyleNarrowVertical  0x1a
#define global HatchStyleNarrowHorizontal  0x1b
#define global HatchStyleDarkVertical  0x1c
#define global HatchStyleDarkHorizontal  0x1d
#define global HatchStyleDashedDownwardDiagonal  0x1e
#define global HatchStyleDashedUpwardDiagonal  0x1f
#define global HatchStyleDashedHorizontal  0x20
#define global HatchStyleDashedVertical  0x21
#define global HatchStyleSmallConfetti  0x22
#define global HatchStyleLargeConfetti  0x23
#define global HatchStyleZigZag  0x24
#define global HatchStyleWave  0x25
#define global HatchStyleDiagonalBrick  0x26
#define global HatchStyleHorizontalBrick  0x27
#define global HatchStyleWeave  0x28
#define global HatchStylePlaid  0x29
#define global HatchStyleDivot  0x2a
#define global HatchStyleDottedGrid  0x2b
#define global HatchStyleDottedDiamond  0x2c
#define global HatchStyleShingle  0x2d
#define global HatchStyleTrellis  0x2e
#define global HatchStyleSphere  0x2f
#define global HatchStyleSmallGrid  0x30
#define global HatchStyleSmallCheckerBoard  0x31
#define global HatchStyleLargeCheckerBoard  0x32
#define global HatchStyleOutlinedDiamond  0x33
#define global HatchStyleSolidDiamond  0x34
#define global HatchStyleTotal  0x35
#define global HatchStyleLargeGrid  0x4
#define global HatchStyleMin  0x0
#define global HatchStyleMax  0x34

; HDC_MAP_MODE
#define global MM_ANISOTROPIC  0x8
#define global MM_HIENGLISH  0x5
#define global MM_HIMETRIC  0x3
#define global MM_ISOTROPIC  0x7
#define global MM_LOENGLISH  0x4
#define global MM_LOMETRIC  0x2
#define global MM_TEXT  0x1
#define global MM_TWIPS  0x6

; HEAP_FLAGS
#define global HEAP_NONE  0x0
#define global HEAP_NO_SERIALIZE  0x1
#define global HEAP_GROWABLE  0x2
#define global HEAP_GENERATE_EXCEPTIONS  0x4
#define global HEAP_ZERO_MEMORY  0x8
#define global HEAP_REALLOC_IN_PLACE_ONLY  0x10
#define global HEAP_TAIL_CHECKING_ENABLED  0x20
#define global HEAP_FREE_CHECKING_ENABLED  0x40
#define global HEAP_DISABLE_COALESCE_ON_FREE  0x80
#define global HEAP_CREATE_ALIGN_16  0x10000
#define global HEAP_CREATE_ENABLE_TRACING  0x20000
#define global HEAP_CREATE_ENABLE_EXECUTE  0x40000
#define global HEAP_MAXIMUM_TAG  0xfff
#define global HEAP_PSEUDO_TAG_FLAG  0x8000
#define global HEAP_TAG_SHIFT  0x12
#define global HEAP_CREATE_SEGMENT_HEAP  0x100
#define global HEAP_CREATE_HARDENED  0x200

; HEAP_INFORMATION_CLASS
#define global HeapCompatibilityInformation  0x0
#define global HeapEnableTerminationOnCorruption  0x1
#define global HeapOptimizeResources  0x3
#define global HeapTag  0x7

; HEAPENTRY32_FLAGS
#define global LF32_FIXED  0x1
#define global LF32_FREE  0x2
#define global LF32_MOVEABLE  0x4

; HELP_INFO_TYPE
#define global HELPINFO_WINDOW  0x1
#define global HELPINFO_MENUITEM  0x2

; HistogramFormat
#define global HistogramFormatARGB  0x0
#define global HistogramFormatPARGB  0x1
#define global HistogramFormatRGB  0x2
#define global HistogramFormatGray  0x3
#define global HistogramFormatB  0x4
#define global HistogramFormatG  0x5
#define global HistogramFormatR  0x6
#define global HistogramFormatA  0x7

; HIT_TEST_BACKGROUND_OPTIONS
#define global HTTB_BACKGROUNDSEG  0x0
#define global HTTB_FIXEDBORDER  0x2
#define global HTTB_CAPTION  0x4
#define global HTTB_RESIZINGBORDER_LEFT  0x10
#define global HTTB_RESIZINGBORDER_TOP  0x20
#define global HTTB_RESIZINGBORDER_RIGHT  0x40
#define global HTTB_RESIZINGBORDER_BOTTOM  0x80
#define global HTTB_RESIZINGBORDER  0xf0
#define global HTTB_SIZINGTEMPLATE  0x100
#define global HTTB_SYSTEMSIZINGMARGINS  0x200

; HOT_KEY_MODIFIERS
#define global MOD_ALT  0x1
#define global MOD_CONTROL  0x2
#define global MOD_NOREPEAT  0x4000
#define global MOD_SHIFT  0x4
#define global MOD_WIN  0x8

; HTTP_ADDREQ_FLAG
#define global HTTP_ADDREQ_FLAG_ADD  0x20000000
#define global HTTP_ADDREQ_FLAG_ADD_IF_NEW  0x10000000
#define global HTTP_ADDREQ_FLAG_COALESCE  0x40000000
#define global HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA  0x40000000
#define global HTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON  0x1000000
#define global HTTP_ADDREQ_FLAG_REPLACE  0x80000000

; HTTP_CACHE_POLICY_TYPE
#define global HttpCachePolicyNocache  0x0
#define global HttpCachePolicyUserInvalidates  0x1
#define global HttpCachePolicyTimeToLive  0x2
#define global HttpCachePolicyMaximum  0x3

; HTTP_DATA_CHUNK_TYPE
#define global HttpDataChunkFromMemory  0x0
#define global HttpDataChunkFromFileHandle  0x1
#define global HttpDataChunkFromFragmentCache  0x2
#define global HttpDataChunkFromFragmentCacheEx  0x3
#define global HttpDataChunkTrailers  0x4
#define global HttpDataChunkMaximum  0x5

; HTTP_DELEGATE_REQUEST_PROPERTY_ID
#define global DelegateRequestReservedProperty  0x0
#define global DelegateRequestDelegateUrlProperty  0x1

; HTTP_FEATURE_ID
#define global HttpFeatureUnknown  0x0
#define global HttpFeatureResponseTrailers  0x1
#define global HttpFeatureApiTimings  0x2
#define global HttpFeatureDelegateEx  0x3
#define global HttpFeatureHttp3  0x4
#define global HttpFeatureLast  0x5
#define global HttpFeaturemax  -1

; HTTP_INITIALIZE
#define global HTTP_INITIALIZE_CONFIG  0x2
#define global HTTP_INITIALIZE_SERVER  0x1

; HTTP_LOG_DATA_TYPE
#define global HttpLogDataTypeFields  0x0

; HTTP_PUSH_WAIT_TYPE
#define global HttpPushWaitEnableComplete  0x0
#define global HttpPushWaitReceiveComplete  0x1
#define global HttpPushWaitSendComplete  0x2

; HTTP_RECEIVE_HTTP_REQUEST_FLAGS
#define global HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY  0x1
#define global HTTP_RECEIVE_REQUEST_FLAG_FLUSH_BODY  0x2

; HTTP_REQUEST_INFO_TYPE
#define global HttpRequestInfoTypeAuth  0x0
#define global HttpRequestInfoTypeChannelBind  0x1
#define global HttpRequestInfoTypeSslProtocol  0x2
#define global HttpRequestInfoTypeSslTokenBindingDraft  0x3
#define global HttpRequestInfoTypeSslTokenBinding  0x4
#define global HttpRequestInfoTypeRequestTiming  0x5
#define global HttpRequestInfoTypeTcpInfoV0  0x6
#define global HttpRequestInfoTypeRequestSizing  0x7
#define global HttpRequestInfoTypeQuicStats  0x8
#define global HttpRequestInfoTypeTcpInfoV1  0x9

; HTTP_RESPONSE_INFO_TYPE
#define global HttpResponseInfoTypeMultipleKnownHeaders  0x0
#define global HttpResponseInfoTypeAuthenticationProperty  0x1
#define global HttpResponseInfoTypeQoSProperty  0x2
#define global HttpResponseInfoTypeChannelBind  0x3

; HTTP_SERVER_PROPERTY
#define global HttpServerAuthenticationProperty  0x0
#define global HttpServerLoggingProperty  0x1
#define global HttpServerQosProperty  0x2
#define global HttpServerTimeoutsProperty  0x3
#define global HttpServerQueueLengthProperty  0x4
#define global HttpServerStateProperty  0x5
#define global HttpServer503VerbosityProperty  0x6
#define global HttpServerBindingProperty  0x7
#define global HttpServerExtendedAuthenticationProperty  0x8
#define global HttpServerListenEndpointProperty  0x9
#define global HttpServerChannelBindProperty  0xa
#define global HttpServerProtectionLevelProperty  0xb
#define global HttpServerDelegationProperty  0x10

; HTTP_SERVICE_CONFIG_ID
#define global HttpServiceConfigIPListenList  0x0
#define global HttpServiceConfigSSLCertInfo  0x1
#define global HttpServiceConfigUrlAclInfo  0x2
#define global HttpServiceConfigTimeout  0x3
#define global HttpServiceConfigCache  0x4
#define global HttpServiceConfigSslSniCertInfo  0x5
#define global HttpServiceConfigSslCcsCertInfo  0x6
#define global HttpServiceConfigSetting  0x7
#define global HttpServiceConfigSslCertInfoEx  0x8
#define global HttpServiceConfigSslSniCertInfoEx  0x9
#define global HttpServiceConfigSslCcsCertInfoEx  0xa
#define global HttpServiceConfigSslScopedCcsCertInfo  0xb
#define global HttpServiceConfigSslScopedCcsCertInfoEx  0xc
#define global HttpServiceConfigMax  0xd

; HTTP_VERB
#define global HttpVerbUnparsed  0x0
#define global HttpVerbUnknown  0x1
#define global HttpVerbInvalid  0x2
#define global HttpVerbOPTIONS  0x3
#define global HttpVerbGET  0x4
#define global HttpVerbHEAD  0x5
#define global HttpVerbPOST  0x6
#define global HttpVerbPUT  0x7
#define global HttpVerbDELETE  0x8
#define global HttpVerbTRACE  0x9
#define global HttpVerbCONNECT  0xa
#define global HttpVerbTRACK  0xb
#define global HttpVerbMOVE  0xc
#define global HttpVerbCOPY  0xd
#define global HttpVerbPROPFIND  0xe
#define global HttpVerbPROPPATCH  0xf
#define global HttpVerbMKCOL  0x10
#define global HttpVerbLOCK  0x11
#define global HttpVerbUNLOCK  0x12
#define global HttpVerbSEARCH  0x13
#define global HttpVerbMaximum  0x14

; HTTP_WEB_SOCKET_BUFFER_TYPE
#define global HTTP_WEB_SOCKET_BINARY_MESSAGE_TYPE  0x0
#define global HTTP_WEB_SOCKET_BINARY_FRAGMENT_TYPE  0x1
#define global HTTP_WEB_SOCKET_UTF8_MESSAGE_TYPE  0x2
#define global HTTP_WEB_SOCKET_UTF8_FRAGMENT_TYPE  0x3
#define global HTTP_WEB_SOCKET_CLOSE_TYPE  0x4
#define global HTTP_WEB_SOCKET_PING_TYPE  0x5

; ICM_COMMAND
#define global ICM_ADDPROFILE  0x1
#define global ICM_DELETEPROFILE  0x2
#define global ICM_QUERYPROFILE  0x3
#define global ICM_SETDEFAULTPROFILE  0x4
#define global ICM_REGISTERICMATCHER  0x5
#define global ICM_UNREGISTERICMATCHER  0x6
#define global ICM_QUERYMATCH  0x7

; ICM_MODE
#define global ICM_OFF  0x1
#define global ICM_ON  0x2
#define global ICM_QUERY  0x3
#define global ICM_DONE_OUTSIDEDC  0x4

; IDLFLAGS
#define global IDLFLAG_NONE  0x0
#define global IDLFLAG_FIN  0x1
#define global IDLFLAG_FOUT  0x2
#define global IDLFLAG_FLCID  0x4
#define global IDLFLAG_FRETVAL  0x8

; IEObjectType
#define global IE_EPM_OBJECT_EVENT  0x0
#define global IE_EPM_OBJECT_MUTEX  0x1
#define global IE_EPM_OBJECT_SEMAPHORE  0x2
#define global IE_EPM_OBJECT_SHARED_MEMORY  0x3
#define global IE_EPM_OBJECT_WAITABLE_TIMER  0x4
#define global IE_EPM_OBJECT_FILE  0x5
#define global IE_EPM_OBJECT_NAMED_PIPE  0x6
#define global IE_EPM_OBJECT_REGISTRY  0x7

; IF_OPER_STATUS
#define global IfOperStatusUp  0x1
#define global IfOperStatusDown  0x2
#define global IfOperStatusTesting  0x3
#define global IfOperStatusUnknown  0x4
#define global IfOperStatusDormant  0x5
#define global IfOperStatusNotPresent  0x6
#define global IfOperStatusLowerLayerDown  0x7

; IMAGE_DIRECTORY_ENTRY
#define global IMAGE_DIRECTORY_ENTRY_ARCHITECTURE  0x7
#define global IMAGE_DIRECTORY_ENTRY_BASERELOC  0x5
#define global IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT  0xb
#define global IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR  0xe
#define global IMAGE_DIRECTORY_ENTRY_DEBUG  0x6
#define global IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT  0xd
#define global IMAGE_DIRECTORY_ENTRY_EXCEPTION  0x3
#define global IMAGE_DIRECTORY_ENTRY_EXPORT  0x0
#define global IMAGE_DIRECTORY_ENTRY_GLOBALPTR  0x8
#define global IMAGE_DIRECTORY_ENTRY_IAT  0xc
#define global IMAGE_DIRECTORY_ENTRY_IMPORT  0x1
#define global IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG  0xa
#define global IMAGE_DIRECTORY_ENTRY_RESOURCE  0x2
#define global IMAGE_DIRECTORY_ENTRY_SECURITY  0x4
#define global IMAGE_DIRECTORY_ENTRY_TLS  0x9

; IMAGE_FLAGS
#define global LR_CREATEDIBSECTION  0x2000
#define global LR_DEFAULTCOLOR  0x0
#define global LR_DEFAULTSIZE  0x40
#define global LR_LOADFROMFILE  0x10
#define global LR_LOADMAP3DCOLORS  0x1000
#define global LR_LOADTRANSPARENT  0x20
#define global LR_MONOCHROME  0x1
#define global LR_SHARED  0x8000
#define global LR_VGACOLOR  0x80
#define global LR_COPYDELETEORG  0x8
#define global LR_COPYFROMRESOURCE  0x4000
#define global LR_COPYRETURNORG  0x4

; IMAGE_LIST_COPY_FLAGS
#define global ILCF_MOVE  0x0
#define global ILCF_SWAP  0x1

; IMAGE_LIST_DRAW_STYLE
#define global ILD_NORMAL  0x0
#define global ILD_TRANSPARENT  0x1
#define global ILD_BLEND25  0x2
#define global ILD_FOCUS  0x2
#define global ILD_BLEND50  0x4
#define global ILD_SELECTED  0x4
#define global ILD_BLEND  0x4
#define global ILD_MASK  0x10
#define global ILD_IMAGE  0x20
#define global ILD_ROP  0x40
#define global ILD_OVERLAYMASK  0xf00
#define global ILD_PRESERVEALPHA  0x1000
#define global ILD_SCALE  0x2000
#define global ILD_DPISCALE  0x4000
#define global ILD_ASYNC  0x8000

; IMAGE_SECTION_CHARACTERISTICS
#define global IMAGE_SCN_TYPE_NO_PAD  0x8
#define global IMAGE_SCN_CNT_CODE  0x20
#define global IMAGE_SCN_CNT_INITIALIZED_DATA  0x40
#define global IMAGE_SCN_CNT_UNINITIALIZED_DATA  0x80
#define global IMAGE_SCN_LNK_OTHER  0x100
#define global IMAGE_SCN_LNK_INFO  0x200
#define global IMAGE_SCN_LNK_REMOVE  0x800
#define global IMAGE_SCN_LNK_COMDAT  0x1000
#define global IMAGE_SCN_NO_DEFER_SPEC_EXC  0x4000
#define global IMAGE_SCN_GPREL  0x8000
#define global IMAGE_SCN_MEM_FARDATA  0x8000
#define global IMAGE_SCN_MEM_PURGEABLE  0x20000
#define global IMAGE_SCN_MEM_16BIT  0x20000
#define global IMAGE_SCN_MEM_LOCKED  0x40000
#define global IMAGE_SCN_MEM_PRELOAD  0x80000
#define global IMAGE_SCN_ALIGN_1BYTES  0x100000
#define global IMAGE_SCN_ALIGN_2BYTES  0x200000
#define global IMAGE_SCN_ALIGN_4BYTES  0x300000
#define global IMAGE_SCN_ALIGN_8BYTES  0x400000
#define global IMAGE_SCN_ALIGN_16BYTES  0x500000
#define global IMAGE_SCN_ALIGN_32BYTES  0x600000
#define global IMAGE_SCN_ALIGN_64BYTES  0x700000
#define global IMAGE_SCN_ALIGN_128BYTES  0x800000
#define global IMAGE_SCN_ALIGN_256BYTES  0x900000
#define global IMAGE_SCN_ALIGN_512BYTES  0xa00000
#define global IMAGE_SCN_ALIGN_1024BYTES  0xb00000
#define global IMAGE_SCN_ALIGN_2048BYTES  0xc00000
#define global IMAGE_SCN_ALIGN_4096BYTES  0xd00000
#define global IMAGE_SCN_ALIGN_8192BYTES  0xe00000
#define global IMAGE_SCN_ALIGN_MASK  0xf00000
#define global IMAGE_SCN_LNK_NRELOC_OVFL  0x1000000
#define global IMAGE_SCN_MEM_DISCARDABLE  0x2000000
#define global IMAGE_SCN_MEM_NOT_CACHED  0x4000000
#define global IMAGE_SCN_MEM_NOT_PAGED  0x8000000
#define global IMAGE_SCN_MEM_SHARED  0x10000000
#define global IMAGE_SCN_MEM_EXECUTE  0x20000000
#define global IMAGE_SCN_MEM_READ  0x40000000
#define global IMAGE_SCN_MEM_WRITE  0x80000000
#define global IMAGE_SCN_SCALE_INDEX  0x1

; IMAGEHLP_EXTENDED_OPTIONS
#define global SYMOPT_EX_DISABLEACCESSTIMEUPDATE  0x0
#define global SYMOPT_EX_LASTVALIDDEBUGDIRECTORY  0x1
#define global SYMOPT_EX_NOIMPLICITPATTERNSEARCH  0x2
#define global SYMOPT_EX_NEVERLOADSYMBOLS  0x3
#define global SYMOPT_EX_MAX  0x4

; IMAGEHLP_GET_TYPE_INFO_FLAGS
#define global IMAGEHLP_GET_TYPE_INFO_CHILDREN  0x2
#define global IMAGEHLP_GET_TYPE_INFO_UNCACHED  0x1

; IMAGEHLP_HD_TYPE
#define global hdBase  0x0
#define global hdSym  0x1
#define global hdSrc  0x2
#define global hdMax  0x3

; IMAGEHLP_SF_TYPE
#define global sfImage  0x0
#define global sfDbg  0x1
#define global sfPdb  0x2
#define global sfMpd  0x3
#define global sfMax  0x4

; IMAGEHLP_SYMBOL_TYPE_INFO
#define global TI_GET_SYMTAG  0x0
#define global TI_GET_SYMNAME  0x1
#define global TI_GET_LENGTH  0x2
#define global TI_GET_TYPE  0x3
#define global TI_GET_TYPEID  0x4
#define global TI_GET_BASETYPE  0x5
#define global TI_GET_ARRAYINDEXTYPEID  0x6
#define global TI_FINDCHILDREN  0x7
#define global TI_GET_DATAKIND  0x8
#define global TI_GET_ADDRESSOFFSET  0x9
#define global TI_GET_OFFSET  0xa
#define global TI_GET_VALUE  0xb
#define global TI_GET_COUNT  0xc
#define global TI_GET_CHILDRENCOUNT  0xd
#define global TI_GET_BITPOSITION  0xe
#define global TI_GET_VIRTUALBASECLASS  0xf
#define global TI_GET_VIRTUALTABLESHAPEID  0x10
#define global TI_GET_VIRTUALBASEPOINTEROFFSET  0x11
#define global TI_GET_CLASSPARENTID  0x12
#define global TI_GET_NESTED  0x13
#define global TI_GET_SYMINDEX  0x14
#define global TI_GET_LEXICALPARENT  0x15
#define global TI_GET_ADDRESS  0x16
#define global TI_GET_THISADJUST  0x17
#define global TI_GET_UDTKIND  0x18
#define global TI_IS_EQUIV_TO  0x19
#define global TI_GET_CALLING_CONVENTION  0x1a
#define global TI_IS_CLOSE_EQUIV_TO  0x1b
#define global TI_GTIEX_REQS_VALID  0x1c
#define global TI_GET_VIRTUALBASEOFFSET  0x1d
#define global TI_GET_VIRTUALBASEDISPINDEX  0x1e
#define global TI_GET_IS_REFERENCE  0x1f
#define global TI_GET_INDIRECTVIRTUALBASECLASS  0x20
#define global TI_GET_VIRTUALBASETABLETYPE  0x21
#define global TI_GET_OBJECTPOINTERTYPE  0x22
#define global IMAGEHLP_SYMBOL_TYPE_INFO_MAX  0x23

; IMAGELIST_CREATION_FLAGS
#define global ILC_MASK  0x1
#define global ILC_COLOR  0x0
#define global ILC_COLORDDB  0xfe
#define global ILC_COLOR4  0x4
#define global ILC_COLOR8  0x8
#define global ILC_COLOR16  0x10
#define global ILC_COLOR24  0x18
#define global ILC_COLOR32  0x20
#define global ILC_PALETTE  0x800
#define global ILC_MIRROR  0x2000
#define global ILC_PERITEMMIRROR  0x8000
#define global ILC_ORIGINALSIZE  0x10000
#define global ILC_HIGHQUALITYSCALE  0x20000

; ImageType
#define global ImageTypeUnknown  0x0
#define global ImageTypeBitmap  0x1
#define global ImageTypeMetafile  0x2

; IME_COMPOSITION_STRING
#define global GCS_COMPREADSTR  0x1
#define global GCS_COMPREADATTR  0x2
#define global GCS_COMPREADCLAUSE  0x4
#define global GCS_COMPSTR  0x8
#define global GCS_COMPATTR  0x10
#define global GCS_COMPCLAUSE  0x20
#define global GCS_CURSORPOS  0x80
#define global GCS_DELTASTART  0x100
#define global GCS_RESULTREADSTR  0x200
#define global GCS_RESULTREADCLAUSE  0x400
#define global GCS_RESULTSTR  0x800
#define global GCS_RESULTCLAUSE  0x1000

; IME_CONVERSION_MODE
#define global IME_CMODE_ALPHANUMERIC  0x0
#define global IME_CMODE_NATIVE  0x1
#define global IME_CMODE_CHINESE  0x1
#define global IME_CMODE_HANGUL  0x1
#define global IME_CMODE_JAPANESE  0x1
#define global IME_CMODE_KATAKANA  0x2
#define global IME_CMODE_LANGUAGE  0x3
#define global IME_CMODE_FULLSHAPE  0x8
#define global IME_CMODE_ROMAN  0x10
#define global IME_CMODE_CHARCODE  0x20
#define global IME_CMODE_HANJACONVERT  0x40
#define global IME_CMODE_NATIVESYMBOL  0x80
#define global IME_CMODE_HANGEUL  0x1
#define global IME_CMODE_SOFTKBD  0x80
#define global IME_CMODE_NOCONVERSION  0x100
#define global IME_CMODE_EUDC  0x200
#define global IME_CMODE_SYMBOL  0x400
#define global IME_CMODE_FIXED  0x800
#define global IME_CMODE_RESERVED  0xf0000000

; IME_ESCAPE
#define global IME_ESC_QUERY_SUPPORT  0x3
#define global IME_ESC_RESERVED_FIRST  0x4
#define global IME_ESC_RESERVED_LAST  0x7ff
#define global IME_ESC_PRIVATE_FIRST  0x800
#define global IME_ESC_PRIVATE_LAST  0xfff
#define global IME_ESC_SEQUENCE_TO_INTERNAL  0x1001
#define global IME_ESC_GET_EUDC_DICTIONARY  0x1003
#define global IME_ESC_SET_EUDC_DICTIONARY  0x1004
#define global IME_ESC_MAX_KEY  0x1005
#define global IME_ESC_IME_NAME  0x1006
#define global IME_ESC_SYNC_HOTKEY  0x1007
#define global IME_ESC_HANJA_MODE  0x1008
#define global IME_ESC_AUTOMATA  0x1009
#define global IME_ESC_PRIVATE_HOTKEY  0x100a
#define global IME_ESC_GETHELPFILENAME  0x100b

; IME_HOTKEY_IDENTIFIER
#define global IME_CHOTKEY_IME_NONIME_TOGGLE  0x10
#define global IME_CHOTKEY_SHAPE_TOGGLE  0x11
#define global IME_CHOTKEY_SYMBOL_TOGGLE  0x12
#define global IME_JHOTKEY_CLOSE_OPEN  0x30
#define global IME_KHOTKEY_SHAPE_TOGGLE  0x50
#define global IME_KHOTKEY_HANJACONVERT  0x51
#define global IME_KHOTKEY_ENGLISH  0x52
#define global IME_THOTKEY_IME_NONIME_TOGGLE  0x70
#define global IME_THOTKEY_SHAPE_TOGGLE  0x71
#define global IME_THOTKEY_SYMBOL_TOGGLE  0x72
#define global IME_ITHOTKEY_RESEND_RESULTSTR  0x200
#define global IME_ITHOTKEY_PREVIOUS_COMPOSITION  0x201
#define global IME_ITHOTKEY_UISTYLE_TOGGLE  0x202
#define global IME_ITHOTKEY_RECONVERTSTRING  0x203

; IME_SENTENCE_MODE
#define global IME_SMODE_NONE  0x0
#define global IME_SMODE_PLAURALCLAUSE  0x1
#define global IME_SMODE_SINGLECONVERT  0x2
#define global IME_SMODE_AUTOMATIC  0x4
#define global IME_SMODE_PHRASEPREDICT  0x8
#define global IME_SMODE_CONVERSATION  0x10
#define global IME_SMODE_RESERVED  0xf000

; IMPLTYPEFLAGS
#define global IMPLTYPEFLAG_FDEFAULT  0x1
#define global IMPLTYPEFLAG_FSOURCE  0x2
#define global IMPLTYPEFLAG_FRESTRICTED  0x4
#define global IMPLTYPEFLAG_FDEFAULTVTABLE  0x8

; INITCOMMONCONTROLSEX_ICC
#define global ICC_ANIMATE_CLASS  0x80
#define global ICC_BAR_CLASSES  0x4
#define global ICC_COOL_CLASSES  0x400
#define global ICC_DATE_CLASSES  0x100
#define global ICC_HOTKEY_CLASS  0x40
#define global ICC_INTERNET_CLASSES  0x800
#define global ICC_LINK_CLASS  0x8000
#define global ICC_LISTVIEW_CLASSES  0x1
#define global ICC_NATIVEFNTCTL_CLASS  0x2000
#define global ICC_PAGESCROLLER_CLASS  0x1000
#define global ICC_PROGRESS_CLASS  0x20
#define global ICC_STANDARD_CLASSES  0x4000
#define global ICC_TAB_CLASSES  0x8
#define global ICC_TREEVIEW_CLASSES  0x2
#define global ICC_UPDOWN_CLASS  0x10
#define global ICC_USEREX_CLASSES  0x200
#define global ICC_WIN95_CLASSES  0xff

; INPUT_MESSAGE_DEVICE_TYPE
#define global IMDT_UNAVAILABLE  0x0
#define global IMDT_KEYBOARD  0x1
#define global IMDT_MOUSE  0x2
#define global IMDT_TOUCH  0x4
#define global IMDT_PEN  0x8
#define global IMDT_TOUCHPAD  0x10

; INPUT_MESSAGE_ORIGIN_ID
#define global IMO_UNAVAILABLE  0x0
#define global IMO_HARDWARE  0x1
#define global IMO_INJECTED  0x2
#define global IMO_SYSTEM  0x4

; INPUT_TYPE
#define global INPUT_MOUSE  0x0
#define global INPUT_KEYBOARD  0x1
#define global INPUT_HARDWARE  0x2

; INSTALLSPECTYPE
#define global APPNAME  0x1
#define global FILEEXT  0x2
#define global PROGID  0x3
#define global COMCLASS  0x4

; INTERNAL_IF_OPER_STATUS
#define global IF_OPER_STATUS_NON_OPERATIONAL  0x0
#define global IF_OPER_STATUS_UNREACHABLE  0x1
#define global IF_OPER_STATUS_DISCONNECTED  0x2
#define global IF_OPER_STATUS_CONNECTING  0x3
#define global IF_OPER_STATUS_CONNECTED  0x4
#define global IF_OPER_STATUS_OPERATIONAL  0x5

; INTERNET_AUTODIAL
#define global INTERNET_AUTODIAL_FAILIFSECURITYCHECK  0x4
#define global INTERNET_AUTODIAL_FORCE_ONLINE  0x1
#define global INTERNET_AUTODIAL_FORCE_UNATTENDED  0x2
#define global INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT  0x8

; INTERNET_CONNECTION
#define global INTERNET_CONNECTION_CONFIGURED  0x40
#define global INTERNET_CONNECTION_LAN  0x2
#define global INTERNET_CONNECTION_MODEM  0x1
#define global INTERNET_CONNECTION_MODEM_BUSY  0x8
#define global INTERNET_CONNECTION_OFFLINE  0x20
#define global INTERNET_CONNECTION_PROXY  0x4
#define global INTERNET_RAS_INSTALLED  0x10

; INTERNET_COOKIE_FLAGS
#define global INTERNET_COOKIE_HTTPONLY  0x2000
#define global INTERNET_COOKIE_THIRD_PARTY  0x10
#define global INTERNET_FLAG_RESTRICTED_ZONE  0x20000

; INTERNET_SCHEME
#define global INTERNET_SCHEME_PARTIAL  -2
#define global INTERNET_SCHEME_UNKNOWN  -1
#define global INTERNET_SCHEME_DEFAULT  0x0
#define global INTERNET_SCHEME_FTP  0x1
#define global INTERNET_SCHEME_GOPHER  0x2
#define global INTERNET_SCHEME_HTTP  0x3
#define global INTERNET_SCHEME_HTTPS  0x4
#define global INTERNET_SCHEME_FILE  0x5
#define global INTERNET_SCHEME_NEWS  0x6
#define global INTERNET_SCHEME_MAILTO  0x7
#define global INTERNET_SCHEME_SOCKS  0x8
#define global INTERNET_SCHEME_JAVASCRIPT  0x9
#define global INTERNET_SCHEME_VBSCRIPT  0xa
#define global INTERNET_SCHEME_RES  0xb
#define global INTERNET_SCHEME_FIRST  0x1
#define global INTERNET_SCHEME_LAST  0xb

; INTERNETFEATURELIST
#define global FEATURE_OBJECT_CACHING  0x0
#define global FEATURE_ZONE_ELEVATION  0x1
#define global FEATURE_MIME_HANDLING  0x2
#define global FEATURE_MIME_SNIFFING  0x3
#define global FEATURE_WINDOW_RESTRICTIONS  0x4
#define global FEATURE_WEBOC_POPUPMANAGEMENT  0x5
#define global FEATURE_BEHAVIORS  0x6
#define global FEATURE_DISABLE_MK_PROTOCOL  0x7
#define global FEATURE_LOCALMACHINE_LOCKDOWN  0x8
#define global FEATURE_SECURITYBAND  0x9
#define global FEATURE_RESTRICT_ACTIVEXINSTALL  0xa
#define global FEATURE_VALIDATE_NAVIGATE_URL  0xb
#define global FEATURE_RESTRICT_FILEDOWNLOAD  0xc
#define global FEATURE_ADDON_MANAGEMENT  0xd
#define global FEATURE_PROTOCOL_LOCKDOWN  0xe
#define global FEATURE_HTTP_USERNAME_PASSWORD_DISABLE  0xf
#define global FEATURE_SAFE_BINDTOOBJECT  0x10
#define global FEATURE_UNC_SAVEDFILECHECK  0x11
#define global FEATURE_GET_URL_DOM_FILEPATH_UNENCODED  0x12
#define global FEATURE_TABBED_BROWSING  0x13
#define global FEATURE_SSLUX  0x14
#define global FEATURE_DISABLE_NAVIGATION_SOUNDS  0x15
#define global FEATURE_DISABLE_LEGACY_COMPRESSION  0x16
#define global FEATURE_FORCE_ADDR_AND_STATUS  0x17
#define global FEATURE_XMLHTTP  0x18
#define global FEATURE_DISABLE_TELNET_PROTOCOL  0x19
#define global FEATURE_FEEDS  0x1a
#define global FEATURE_BLOCK_INPUT_PROMPTS  0x1b
#define global FEATURE_ENTRY_COUNT  0x1c

; InterpolationMode
#define global InterpolationModeInvalid  -1
#define global InterpolationModeDefault  0x0
#define global InterpolationModeLowQuality  0x1
#define global InterpolationModeHighQuality  0x2
#define global InterpolationModeBilinear  0x3
#define global InterpolationModeBicubic  0x4
#define global InterpolationModeNearestNeighbor  0x5
#define global InterpolationModeHighQualityBilinear  0x6
#define global InterpolationModeHighQualityBicubic  0x7

; INVOKEKIND
#define global INVOKE_FUNC  0x1
#define global INVOKE_PROPERTYGET  0x2
#define global INVOKE_PROPERTYPUT  0x4
#define global INVOKE_PROPERTYPUTREF  0x8

; IS_TEXT_UNICODE_RESULT
#define global IS_TEXT_UNICODE_ASCII16  0x1
#define global IS_TEXT_UNICODE_REVERSE_ASCII16  0x10
#define global IS_TEXT_UNICODE_STATISTICS  0x2
#define global IS_TEXT_UNICODE_REVERSE_STATISTICS  0x20
#define global IS_TEXT_UNICODE_CONTROLS  0x4
#define global IS_TEXT_UNICODE_REVERSE_CONTROLS  0x40
#define global IS_TEXT_UNICODE_SIGNATURE  0x8
#define global IS_TEXT_UNICODE_REVERSE_SIGNATURE  0x80
#define global IS_TEXT_UNICODE_ILLEGAL_CHARS  0x100
#define global IS_TEXT_UNICODE_ODD_LENGTH  0x200
#define global IS_TEXT_UNICODE_NULL_BYTES  0x1000
#define global IS_TEXT_UNICODE_UNICODE_MASK  0xf
#define global IS_TEXT_UNICODE_REVERSE_MASK  0xf0
#define global IS_TEXT_UNICODE_NOT_UNICODE_MASK  0xf00
#define global IS_TEXT_UNICODE_NOT_ASCII_MASK  0xf000

; IS_VALID_LOCALE_FLAGS
#define global LCID_INSTALLED  0x1
#define global LCID_SUPPORTED  0x2

; JOB_OBJECT_IO_RATE_CONTROL_FLAGS
#define global JOB_OBJECT_IO_RATE_CONTROL_ENABLE  0x1
#define global JOB_OBJECT_IO_RATE_CONTROL_STANDALONE_VOLUME  0x2
#define global JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ALL  0x4
#define global JOB_OBJECT_IO_RATE_CONTROL_FORCE_UNIT_ACCESS_ON_SOFT_CAP  0x8
#define global JOB_OBJECT_IO_RATE_CONTROL_VALID_FLAGS  0xf

; JOBOBJECTINFOCLASS
#define global JobObjectBasicAccountingInformation  0x1
#define global JobObjectBasicLimitInformation  0x2
#define global JobObjectBasicProcessIdList  0x3
#define global JobObjectBasicUIRestrictions  0x4
#define global JobObjectSecurityLimitInformation  0x5
#define global JobObjectEndOfJobTimeInformation  0x6
#define global JobObjectAssociateCompletionPortInformation  0x7
#define global JobObjectBasicAndIoAccountingInformation  0x8
#define global JobObjectExtendedLimitInformation  0x9
#define global JobObjectJobSetInformation  0xa
#define global JobObjectGroupInformation  0xb
#define global JobObjectNotificationLimitInformation  0xc
#define global JobObjectLimitViolationInformation  0xd
#define global JobObjectGroupInformationEx  0xe
#define global JobObjectCpuRateControlInformation  0xf
#define global JobObjectCompletionFilter  0x10
#define global JobObjectCompletionCounter  0x11
#define global JobObjectReserved1Information  0x12
#define global JobObjectReserved2Information  0x13
#define global JobObjectReserved3Information  0x14
#define global JobObjectReserved4Information  0x15
#define global JobObjectReserved5Information  0x16
#define global JobObjectReserved6Information  0x17
#define global JobObjectReserved7Information  0x18
#define global JobObjectReserved8Information  0x19
#define global JobObjectReserved9Information  0x1a
#define global JobObjectReserved10Information  0x1b
#define global JobObjectReserved11Information  0x1c
#define global JobObjectReserved12Information  0x1d
#define global JobObjectReserved13Information  0x1e
#define global JobObjectReserved14Information  0x1f
#define global JobObjectNetRateControlInformation  0x20
#define global JobObjectNotificationLimitInformation2  0x21
#define global JobObjectLimitViolationInformation2  0x22
#define global JobObjectCreateSilo  0x23
#define global JobObjectSiloBasicInformation  0x24
#define global JobObjectReserved15Information  0x25
#define global JobObjectReserved16Information  0x26
#define global JobObjectReserved17Information  0x27
#define global JobObjectReserved18Information  0x28
#define global JobObjectReserved19Information  0x29
#define global JobObjectReserved20Information  0x2a
#define global JobObjectReserved21Information  0x2b
#define global JobObjectReserved22Information  0x2c
#define global JobObjectReserved23Information  0x2d
#define global JobObjectReserved24Information  0x2e
#define global JobObjectReserved25Information  0x2f
#define global JobObjectReserved26Information  0x30
#define global JobObjectReserved27Information  0x31
#define global MaxJobObjectInfoClass  0x32

; KEYBD_EVENT_FLAGS
#define global KEYEVENTF_EXTENDEDKEY  0x1
#define global KEYEVENTF_KEYUP  0x2
#define global KEYEVENTF_SCANCODE  0x8
#define global KEYEVENTF_UNICODE  0x4

; KNOWN_FOLDER_FLAG
#define global KF_FLAG_DEFAULT  0x0
#define global KF_FLAG_FORCE_APP_DATA_REDIRECTION  0x80000
#define global KF_FLAG_RETURN_FILTER_REDIRECTION_TARGET  0x40000
#define global KF_FLAG_FORCE_PACKAGE_REDIRECTION  0x20000
#define global KF_FLAG_NO_PACKAGE_REDIRECTION  0x10000
#define global KF_FLAG_FORCE_APPCONTAINER_REDIRECTION  0x20000
#define global KF_FLAG_NO_APPCONTAINER_REDIRECTION  0x10000
#define global KF_FLAG_CREATE  0x8000
#define global KF_FLAG_DONT_VERIFY  0x4000
#define global KF_FLAG_DONT_UNEXPAND  0x2000
#define global KF_FLAG_NO_ALIAS  0x1000
#define global KF_FLAG_INIT  0x800
#define global KF_FLAG_DEFAULT_PATH  0x400
#define global KF_FLAG_NOT_PARENT_RELATIVE  0x200
#define global KF_FLAG_SIMPLE_IDLIST  0x100
#define global KF_FLAG_ALIAS_ONLY  0x101

; LATENCY_TIME
#define global LT_DONT_CARE  0x0
#define global LT_LOWEST_LATENCY  0x1

; LAYERED_WINDOW_ATTRIBUTES_FLAGS
#define global LWA_ALPHA  0x2
#define global LWA_COLORKEY  0x1

; LCSCSTYPE
#define global LCS_CALIBRATED_RGB  0x0
#define global LCS_sRGB  0x73524742
#define global LCS_WINDOWS_COLOR_SPACE  0x57696e20

; LIBRARYMANAGEDIALOGOPTIONS
#define global LMD_DEFAULT  0x0
#define global LMD_ALLOWUNINDEXABLENETWORKLOCATIONS  0x1

; LinearGradientMode
#define global LinearGradientModeHorizontal  0x0
#define global LinearGradientModeVertical  0x1
#define global LinearGradientModeForwardDiagonal  0x2
#define global LinearGradientModeBackwardDiagonal  0x3

; LineCap
#define global LineCapFlat  0x0
#define global LineCapSquare  0x1
#define global LineCapRound  0x2
#define global LineCapTriangle  0x3
#define global LineCapNoAnchor  0x10
#define global LineCapSquareAnchor  0x11
#define global LineCapRoundAnchor  0x12
#define global LineCapDiamondAnchor  0x13
#define global LineCapArrowAnchor  0x14
#define global LineCapCustom  0xff
#define global LineCapAnchorMask  0xf0

; LineJoin
#define global LineJoinMiter  0x0
#define global LineJoinBevel  0x1
#define global LineJoinRound  0x2
#define global LineJoinMiterClipped  0x3

; LOAD_LIBRARY_FLAGS
#define global DONT_RESOLVE_DLL_REFERENCES  0x1
#define global LOAD_LIBRARY_AS_DATAFILE  0x2
#define global LOAD_WITH_ALTERED_SEARCH_PATH  0x8
#define global LOAD_IGNORE_CODE_AUTHZ_LEVEL  0x10
#define global LOAD_LIBRARY_AS_IMAGE_RESOURCE  0x20
#define global LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE  0x40
#define global LOAD_LIBRARY_REQUIRE_SIGNED_TARGET  0x80
#define global LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR  0x100
#define global LOAD_LIBRARY_SEARCH_APPLICATION_DIR  0x200
#define global LOAD_LIBRARY_SEARCH_USER_DIRS  0x400
#define global LOAD_LIBRARY_SEARCH_SYSTEM32  0x800
#define global LOAD_LIBRARY_SEARCH_DEFAULT_DIRS  0x1000
#define global LOAD_LIBRARY_SAFE_CURRENT_DIRS  0x2000
#define global LOAD_LIBRARY_SEARCH_SYSTEM32_NO_FORWARDER  0x4000

; LOAD_PICTURE_FLAGS
#define global LP_DEFAULT  0x0
#define global LP_MONOCHROME  0x1
#define global LP_VGACOLOR  0x2
#define global LP_COLOR  0x4

; LOCAL_ALLOC_FLAGS
#define global LHND  0x42
#define global LMEM_FIXED  0x0
#define global LMEM_MOVEABLE  0x2
#define global LMEM_ZEROINIT  0x40
#define global LPTR  0x40
#define global NONZEROLHND  0x2
#define global NONZEROLPTR  0x0

; LOCK_FILE_FLAGS
#define global LOCKFILE_EXCLUSIVE_LOCK  0x2
#define global LOCKFILE_FAIL_IMMEDIATELY  0x1

; LOCKTYPE
#define global LOCK_WRITE  0x1
#define global LOCK_EXCLUSIVE  0x2
#define global LOCK_ONLYONCE  0x4

; LOGICAL_PROCESSOR_RELATIONSHIP
#define global RelationProcessorCore  0x0
#define global RelationNumaNode  0x1
#define global RelationCache  0x2
#define global RelationProcessorPackage  0x3
#define global RelationGroup  0x4
#define global RelationProcessorDie  0x5
#define global RelationNumaNodeEx  0x6
#define global RelationProcessorModule  0x7
#define global RelationAll  0xffff

; LOGON32_LOGON
#define global LOGON32_LOGON_BATCH  0x4
#define global LOGON32_LOGON_INTERACTIVE  0x2
#define global LOGON32_LOGON_NETWORK  0x3
#define global LOGON32_LOGON_NETWORK_CLEARTEXT  0x8
#define global LOGON32_LOGON_NEW_CREDENTIALS  0x9
#define global LOGON32_LOGON_SERVICE  0x5
#define global LOGON32_LOGON_UNLOCK  0x7

; LOGON32_PROVIDER
#define global LOGON32_PROVIDER_DEFAULT  0x0
#define global LOGON32_PROVIDER_WINNT50  0x3
#define global LOGON32_PROVIDER_WINNT40  0x2

; LPPROGRESS_ROUTINE_CALLBACK_REASON
#define global CALLBACK_CHUNK_FINISHED  0x0
#define global CALLBACK_STREAM_SWITCH  0x1

; LSA_AUTH_INFORMATION_AUTH_TYPE
#define global TRUST_AUTH_TYPE_NONE  0x0
#define global TRUST_AUTH_TYPE_NT4OWF  0x1
#define global TRUST_AUTH_TYPE_CLEAR  0x2
#define global TRUST_AUTH_TYPE_VERSION  0x3

; LSA_FOREST_TRUST_COLLISION_RECORD_TYPE
#define global CollisionTdo  0x0
#define global CollisionXref  0x1
#define global CollisionOther  0x2

; LSA_FOREST_TRUST_RECORD_TYPE
#define global ForestTrustTopLevelName  0x0
#define global ForestTrustTopLevelNameEx  0x1
#define global ForestTrustDomainInfo  0x2
#define global ForestTrustBinaryInfo  0x3
#define global ForestTrustScannerInfo  0x4
#define global ForestTrustRecordTypeLast  0x4

; LZOPENFILE_STYLE
#define global OF_CANCEL  0x800
#define global OF_CREATE  0x1000
#define global OF_DELETE  0x200
#define global OF_EXIST  0x4000
#define global OF_PARSE  0x100
#define global OF_PROMPT  0x2000
#define global OF_READ  0x0
#define global OF_READWRITE  0x2
#define global OF_REOPEN  0x8000
#define global OF_SHARE_DENY_NONE  0x40
#define global OF_SHARE_DENY_READ  0x30
#define global OF_SHARE_DENY_WRITE  0x20
#define global OF_SHARE_EXCLUSIVE  0x10
#define global OF_WRITE  0x1
#define global OF_SHARE_COMPAT  0x0
#define global OF_VERIFY  0x400

; MAP_VIRTUAL_KEY_TYPE
#define global MAPVK_VK_TO_VSC  0x0
#define global MAPVK_VSC_TO_VK  0x1
#define global MAPVK_VK_TO_CHAR  0x2
#define global MAPVK_VSC_TO_VK_EX  0x3
#define global MAPVK_VK_TO_VSC_EX  0x4

; MatrixOrder
#define global MatrixOrderPrepend  0x0
#define global MatrixOrderAppend  0x1

; MEDIA_EVENT_GENERATOR_GET_EVENT_FLAGS
#define global MF_EVENT_FLAG_NONE  0x0
#define global MF_EVENT_FLAG_NO_WAIT  0x1

; MEMORY_RESOURCE_NOTIFICATION_TYPE
#define global LowMemoryResourceNotification  0x0
#define global HighMemoryResourceNotification  0x1

; MENU_ITEM_FLAGS
#define global MF_BYCOMMAND  0x0
#define global MF_BYPOSITION  0x400
#define global MF_BITMAP  0x4
#define global MF_CHECKED  0x8
#define global MF_DISABLED  0x2
#define global MF_ENABLED  0x0
#define global MF_GRAYED  0x1
#define global MF_MENUBARBREAK  0x20
#define global MF_MENUBREAK  0x40
#define global MF_OWNERDRAW  0x100
#define global MF_POPUP  0x10
#define global MF_SEPARATOR  0x800
#define global MF_STRING  0x0
#define global MF_UNCHECKED  0x0
#define global MF_INSERT  0x0
#define global MF_CHANGE  0x80
#define global MF_APPEND  0x100
#define global MF_DELETE  0x200
#define global MF_REMOVE  0x1000
#define global MF_USECHECKBITMAPS  0x200
#define global MF_UNHILITE  0x0
#define global MF_HILITE  0x80
#define global MF_DEFAULT  0x1000
#define global MF_SYSMENU  0x2000
#define global MF_HELP  0x4000
#define global MF_RIGHTJUSTIFY  0x4000
#define global MF_MOUSESELECT  0x8000
#define global MF_END  0x80

; MENU_ITEM_MASK
#define global MIIM_BITMAP  0x80
#define global MIIM_CHECKMARKS  0x8
#define global MIIM_DATA  0x20
#define global MIIM_FTYPE  0x100
#define global MIIM_ID  0x2
#define global MIIM_STATE  0x1
#define global MIIM_STRING  0x40
#define global MIIM_SUBMENU  0x4
#define global MIIM_TYPE  0x10

; MENU_ITEM_STATE
#define global MFS_GRAYED  0x3
#define global MFS_DISABLED  0x3
#define global MFS_CHECKED  0x8
#define global MFS_HILITE  0x80
#define global MFS_ENABLED  0x0
#define global MFS_UNCHECKED  0x0
#define global MFS_UNHILITE  0x0
#define global MFS_DEFAULT  0x1000

; MENU_ITEM_TYPE
#define global MFT_BITMAP  0x4
#define global MFT_MENUBARBREAK  0x20
#define global MFT_MENUBREAK  0x40
#define global MFT_OWNERDRAW  0x100
#define global MFT_RADIOCHECK  0x200
#define global MFT_RIGHTJUSTIFY  0x4000
#define global MFT_RIGHTORDER  0x2000
#define global MFT_SEPARATOR  0x800
#define global MFT_STRING  0x0

; MENUINFO_MASK
#define global MIM_APPLYTOSUBMENUS  0x80000000
#define global MIM_BACKGROUND  0x2
#define global MIM_HELPID  0x4
#define global MIM_MAXHEIGHT  0x1
#define global MIM_MENUDATA  0x8
#define global MIM_STYLE  0x10

; MENUINFO_STYLE
#define global MNS_AUTODISMISS  0x10000000
#define global MNS_CHECKORBMP  0x4000000
#define global MNS_DRAGDROP  0x20000000
#define global MNS_MODELESS  0x40000000
#define global MNS_NOCHECK  0x80000000
#define global MNS_NOTIFYBYPOS  0x8000000

; MESSAGEBOX_RESULT
#define global IDOK  0x1
#define global IDCANCEL  0x2
#define global IDABORT  0x3
#define global IDRETRY  0x4
#define global IDIGNORE  0x5
#define global IDYES  0x6
#define global IDNO  0x7
#define global IDCLOSE  0x8
#define global IDHELP  0x9
#define global IDTRYAGAIN  0xa
#define global IDCONTINUE  0xb
#define global IDASYNC  0x7d01
#define global IDTIMEOUT  0x7d00

; MESSAGEBOX_STYLE
#define global MB_ABORTRETRYIGNORE  0x2
#define global MB_CANCELTRYCONTINUE  0x6
#define global MB_HELP  0x4000
#define global MB_OK  0x0
#define global MB_OKCANCEL  0x1
#define global MB_RETRYCANCEL  0x5
#define global MB_YESNO  0x4
#define global MB_YESNOCANCEL  0x3
#define global MB_ICONHAND  0x10
#define global MB_ICONQUESTION  0x20
#define global MB_ICONEXCLAMATION  0x30
#define global MB_ICONASTERISK  0x40
#define global MB_USERICON  0x80
#define global MB_ICONWARNING  0x30
#define global MB_ICONERROR  0x10
#define global MB_ICONINFORMATION  0x40
#define global MB_ICONSTOP  0x10
#define global MB_DEFBUTTON1  0x0
#define global MB_DEFBUTTON2  0x100
#define global MB_DEFBUTTON3  0x200
#define global MB_DEFBUTTON4  0x300
#define global MB_APPLMODAL  0x0
#define global MB_SYSTEMMODAL  0x1000
#define global MB_TASKMODAL  0x2000
#define global MB_NOFOCUS  0x8000
#define global MB_SETFOREGROUND  0x10000
#define global MB_DEFAULT_DESKTOP_ONLY  0x20000
#define global MB_TOPMOST  0x40000
#define global MB_RIGHT  0x80000
#define global MB_RTLREADING  0x100000
#define global MB_SERVICE_NOTIFICATION  0x200000
#define global MB_SERVICE_NOTIFICATION_NT3X  0x40000
#define global MB_TYPEMASK  0xf
#define global MB_ICONMASK  0xf0
#define global MB_DEFMASK  0xf00
#define global MB_MODEMASK  0x3000
#define global MB_MISCMASK  0xc000

; MetafileFrameUnit
#define global MetafileFrameUnitPixel  0x2
#define global MetafileFrameUnitPoint  0x3
#define global MetafileFrameUnitInch  0x4
#define global MetafileFrameUnitDocument  0x5
#define global MetafileFrameUnitMillimeter  0x6
#define global MetafileFrameUnitGdi  0x7

; MetafileType
#define global MetafileTypeInvalid  0x0
#define global MetafileTypeWmf  0x1
#define global MetafileTypeWmfPlaceable  0x2
#define global MetafileTypeEmf  0x3
#define global MetafileTypeEmfPlusOnly  0x4
#define global MetafileTypeEmfPlusDual  0x5

; MF_ATTRIBUTE_TYPE
#define global MF_ATTRIBUTE_UINT32  0x13
#define global MF_ATTRIBUTE_UINT64  0x15
#define global MF_ATTRIBUTE_DOUBLE  0x5
#define global MF_ATTRIBUTE_GUID  0x48
#define global MF_ATTRIBUTE_STRING  0x1f
#define global MF_ATTRIBUTE_BLOB  0x1011
#define global MF_ATTRIBUTE_IUNKNOWN  0xd

; MF_ATTRIBUTES_MATCH_TYPE
#define global MF_ATTRIBUTES_MATCH_OUR_ITEMS  0x0
#define global MF_ATTRIBUTES_MATCH_THEIR_ITEMS  0x1
#define global MF_ATTRIBUTES_MATCH_ALL_ITEMS  0x2
#define global MF_ATTRIBUTES_MATCH_INTERSECTION  0x3
#define global MF_ATTRIBUTES_MATCH_SMALLER  0x4

; MF_FILE_ACCESSMODE
#define global MF_ACCESSMODE_READ  0x1
#define global MF_ACCESSMODE_WRITE  0x2
#define global MF_ACCESSMODE_READWRITE  0x3

; MF_FILE_FLAGS
#define global MF_FILEFLAGS_NONE  0x0
#define global MF_FILEFLAGS_NOBUFFERING  0x1
#define global MF_FILEFLAGS_ALLOW_WRITE_SHARING  0x2

; MF_FILE_OPENMODE
#define global MF_OPENMODE_FAIL_IF_NOT_EXIST  0x0
#define global MF_OPENMODE_FAIL_IF_EXIST  0x1
#define global MF_OPENMODE_RESET_IF_EXIST  0x2
#define global MF_OPENMODE_APPEND_IF_EXIST  0x3
#define global MF_OPENMODE_DELETE_IF_EXIST  0x4

; MF_OBJECT_TYPE
#define global MF_OBJECT_MEDIASOURCE  0x0
#define global MF_OBJECT_BYTESTREAM  0x1
#define global MF_OBJECT_INVALID  0x2

; MF_TOPOLOGY_TYPE
#define global MF_TOPOLOGY_OUTPUT_NODE  0x0
#define global MF_TOPOLOGY_SOURCESTREAM_NODE  0x1
#define global MF_TOPOLOGY_TRANSFORM_NODE  0x2
#define global MF_TOPOLOGY_TEE_NODE  0x3
#define global MF_TOPOLOGY_MAX  -1

; MFBYTESTREAM_SEEK_ORIGIN
#define global msoBegin  0x0
#define global msoCurrent  0x1

; MFCLOCK_STATE
#define global MFCLOCK_STATE_INVALID  0x0
#define global MFCLOCK_STATE_RUNNING  0x1
#define global MFCLOCK_STATE_STOPPED  0x2
#define global MFCLOCK_STATE_PAUSED  0x3

; MFNominalRange
#define global MFNominalRange_Unknown  0x0
#define global MFNominalRange_Normal  0x1
#define global MFNominalRange_Wide  0x2
#define global MFNominalRange_0_255  0x1
#define global MFNominalRange_16_235  0x2
#define global MFNominalRange_48_208  0x3
#define global MFNominalRange_64_127  0x4
#define global MFNominalRange_Last  0x5
#define global MFNominalRange_ForceDWORD  0x7fffffff

; MFStandardVideoFormat
#define global MFStdVideoFormat_reserved  0x0
#define global MFStdVideoFormat_NTSC  0x1
#define global MFStdVideoFormat_PAL  0x2
#define global MFStdVideoFormat_DVD_NTSC  0x3
#define global MFStdVideoFormat_DVD_PAL  0x4
#define global MFStdVideoFormat_DV_PAL  0x5
#define global MFStdVideoFormat_DV_NTSC  0x6
#define global MFStdVideoFormat_ATSC_SD480i  0x7
#define global MFStdVideoFormat_ATSC_HD1080i  0x8
#define global MFStdVideoFormat_ATSC_HD720p  0x9

; MFSTREAMSINK_MARKER_TYPE
#define global MFSTREAMSINK_MARKER_DEFAULT  0x0
#define global MFSTREAMSINK_MARKER_ENDOFSEGMENT  0x1
#define global MFSTREAMSINK_MARKER_TICK  0x2
#define global MFSTREAMSINK_MARKER_EVENT  0x3

; MFT_ENUM_FLAG
#define global MFT_ENUM_FLAG_SYNCMFT  0x1
#define global MFT_ENUM_FLAG_ASYNCMFT  0x2
#define global MFT_ENUM_FLAG_HARDWARE  0x4
#define global MFT_ENUM_FLAG_FIELDOFUSE  0x8
#define global MFT_ENUM_FLAG_LOCALMFT  0x10
#define global MFT_ENUM_FLAG_TRANSCODE_ONLY  0x20
#define global MFT_ENUM_FLAG_SORTANDFILTER  0x40
#define global MFT_ENUM_FLAG_SORTANDFILTER_APPROVED_ONLY  0xc0
#define global MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY  0x140
#define global MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY_EDGEMODE  0x240
#define global MFT_ENUM_FLAG_UNTRUSTED_STOREMFT  0x400
#define global MFT_ENUM_FLAG_ALL  0x3f

; MFVideoChromaSubsampling
#define global MFVideoChromaSubsampling_Unknown  0x0
#define global MFVideoChromaSubsampling_ProgressiveChroma  0x8
#define global MFVideoChromaSubsampling_Horizontally_Cosited  0x4
#define global MFVideoChromaSubsampling_Vertically_Cosited  0x2
#define global MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes  0x1
#define global MFVideoChromaSubsampling_MPEG2  0x5
#define global MFVideoChromaSubsampling_MPEG1  0x1
#define global MFVideoChromaSubsampling_DV_PAL  0x6
#define global MFVideoChromaSubsampling_Cosited  0x7
#define global MFVideoChromaSubsampling_Last  0x8
#define global MFVideoChromaSubsampling_ForceDWORD  0x7fffffff

; MFVideoInterlaceMode
#define global MFVideoInterlace_Unknown  0x0
#define global MFVideoInterlace_Progressive  0x2
#define global MFVideoInterlace_FieldInterleavedUpperFirst  0x3
#define global MFVideoInterlace_FieldInterleavedLowerFirst  0x4
#define global MFVideoInterlace_FieldSingleUpper  0x5
#define global MFVideoInterlace_FieldSingleLower  0x6
#define global MFVideoInterlace_MixedInterlaceOrProgressive  0x7
#define global MFVideoInterlace_Last  0x8
#define global MFVideoInterlace_ForceDWORD  0x7fffffff

; MFVideoLighting
#define global MFVideoLighting_Unknown  0x0
#define global MFVideoLighting_bright  0x1
#define global MFVideoLighting_office  0x2
#define global MFVideoLighting_dim  0x3
#define global MFVideoLighting_dark  0x4
#define global MFVideoLighting_Last  0x5
#define global MFVideoLighting_ForceDWORD  0x7fffffff

; MFVideoPrimaries
#define global MFVideoPrimaries_Unknown  0x0
#define global MFVideoPrimaries_reserved  0x1
#define global MFVideoPrimaries_BT709  0x2
#define global MFVideoPrimaries_BT470_2_SysM  0x3
#define global MFVideoPrimaries_BT470_2_SysBG  0x4
#define global MFVideoPrimaries_SMPTE170M  0x5
#define global MFVideoPrimaries_SMPTE240M  0x6
#define global MFVideoPrimaries_EBU3213  0x7
#define global MFVideoPrimaries_SMPTE_C  0x8
#define global MFVideoPrimaries_BT2020  0x9
#define global MFVideoPrimaries_XYZ  0xa
#define global MFVideoPrimaries_DCI_P3  0xb
#define global MFVideoPrimaries_ACES  0xc
#define global MFVideoPrimaries_Last  0xd
#define global MFVideoPrimaries_ForceDWORD  0x7fffffff

; MFVideoTransferFunction
#define global MFVideoTransFunc_Unknown  0x0
#define global MFVideoTransFunc_10  0x1
#define global MFVideoTransFunc_18  0x2
#define global MFVideoTransFunc_20  0x3
#define global MFVideoTransFunc_22  0x4
#define global MFVideoTransFunc_709  0x5
#define global MFVideoTransFunc_240M  0x6
#define global MFVideoTransFunc_sRGB  0x7
#define global MFVideoTransFunc_28  0x8
#define global MFVideoTransFunc_Log_100  0x9
#define global MFVideoTransFunc_Log_316  0xa
#define global MFVideoTransFunc_709_sym  0xb
#define global MFVideoTransFunc_2020_const  0xc
#define global MFVideoTransFunc_2020  0xd
#define global MFVideoTransFunc_26  0xe
#define global MFVideoTransFunc_2084  0xf
#define global MFVideoTransFunc_HLG  0x10
#define global MFVideoTransFunc_10_rel  0x11
#define global MFVideoTransFunc_Last  0x12
#define global MFVideoTransFunc_ForceDWORD  0x7fffffff

; MFVideoTransferMatrix
#define global MFVideoTransferMatrix_Unknown  0x0
#define global MFVideoTransferMatrix_BT709  0x1
#define global MFVideoTransferMatrix_BT601  0x2
#define global MFVideoTransferMatrix_SMPTE240M  0x3
#define global MFVideoTransferMatrix_BT2020_10  0x4
#define global MFVideoTransferMatrix_BT2020_12  0x5
#define global MFVideoTransferMatrix_Last  0x6
#define global MFVideoTransferMatrix_ForceDWORD  0x7fffffff

; MIB_IF_ENTRY_LEVEL
#define global MibIfEntryNormal  0x0
#define global MibIfEntryNormalWithoutStatistics  0x2

; MIB_IF_TABLE_LEVEL
#define global MibIfTableNormal  0x0
#define global MibIfTableRaw  0x1
#define global MibIfTableNormalWithoutStatistics  0x2

; MIB_IPFORWARD_TYPE
#define global MIB_IPROUTE_TYPE_OTHER  0x1
#define global MIB_IPROUTE_TYPE_INVALID  0x2
#define global MIB_IPROUTE_TYPE_DIRECT  0x3
#define global MIB_IPROUTE_TYPE_INDIRECT  0x4

; MIB_IPNET_TYPE
#define global MIB_IPNET_TYPE_OTHER  0x1
#define global MIB_IPNET_TYPE_INVALID  0x2
#define global MIB_IPNET_TYPE_DYNAMIC  0x3
#define global MIB_IPNET_TYPE_STATIC  0x4

; MIB_IPSTATS_FORWARDING
#define global MIB_IP_FORWARDING  0x1
#define global MIB_IP_NOT_FORWARDING  0x2

; MIB_NOTIFICATION_TYPE
#define global MibParameterNotification  0x0
#define global MibAddInstance  0x1
#define global MibDeleteInstance  0x2
#define global MibInitialNotification  0x3

; MIB_TCP_STATE
#define global MIB_TCP_STATE_CLOSED  0x1
#define global MIB_TCP_STATE_LISTEN  0x2
#define global MIB_TCP_STATE_SYN_SENT  0x3
#define global MIB_TCP_STATE_SYN_RCVD  0x4
#define global MIB_TCP_STATE_ESTAB  0x5
#define global MIB_TCP_STATE_FIN_WAIT1  0x6
#define global MIB_TCP_STATE_FIN_WAIT2  0x7
#define global MIB_TCP_STATE_CLOSE_WAIT  0x8
#define global MIB_TCP_STATE_CLOSING  0x9
#define global MIB_TCP_STATE_LAST_ACK  0xa
#define global MIB_TCP_STATE_TIME_WAIT  0xb
#define global MIB_TCP_STATE_DELETE_TCB  0xc
#define global MIB_TCP_STATE_RESERVED  0x64

; MIDI_WAVE_OPEN_TYPE
#define global CALLBACK_TYPEMASK  0x70000
#define global CALLBACK_NULL  0x0
#define global CALLBACK_WINDOW  0x10000
#define global CALLBACK_TASK  0x20000
#define global CALLBACK_FUNCTION  0x30000
#define global CALLBACK_THREAD  0x20000
#define global CALLBACK_EVENT  0x50000
#define global WAVE_FORMAT_QUERY  0x1
#define global WAVE_ALLOWSYNC  0x2
#define global WAVE_MAPPED  0x4
#define global WAVE_FORMAT_DIRECT  0x8
#define global WAVE_FORMAT_DIRECT_QUERY  0x9
#define global WAVE_MAPPED_DEFAULT_COMMUNICATION_DEVICE  0x10
#define global MIDI_IO_STATUS  0x20

; MIXERLINE_COMPONENTTYPE
#define global MIXERLINE_COMPONENTTYPE_DST_DIGITAL  0x1
#define global MIXERLINE_COMPONENTTYPE_DST_HEADPHONES  0x5
#define global MIXERLINE_COMPONENTTYPE_DST_LINE  0x2
#define global MIXERLINE_COMPONENTTYPE_DST_MONITOR  0x3
#define global MIXERLINE_COMPONENTTYPE_DST_SPEAKERS  0x4
#define global MIXERLINE_COMPONENTTYPE_DST_TELEPHONE  0x6
#define global MIXERLINE_COMPONENTTYPE_DST_UNDEFINED  0x0
#define global MIXERLINE_COMPONENTTYPE_DST_VOICEIN  0x8
#define global MIXERLINE_COMPONENTTYPE_DST_WAVEIN  0x7
#define global MIXERLINE_COMPONENTTYPE_SRC_ANALOG  0x100a
#define global MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY  0x1009
#define global MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC  0x1005
#define global MIXERLINE_COMPONENTTYPE_SRC_DIGITAL  0x1001
#define global MIXERLINE_COMPONENTTYPE_SRC_LINE  0x1002
#define global MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE  0x1003
#define global MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER  0x1007
#define global MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER  0x1004
#define global MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE  0x1006
#define global MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED  0x1000
#define global MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT  0x1008

; MM_FLAGS
#define global MM_ADDSEPARATOR  0x1
#define global MM_SUBMENUSHAVEIDS  0x2
#define global MM_DONTREMOVESEPS  0x4

; MODEM_STATUS_FLAGS
#define global MS_CTS_ON  0x10
#define global MS_DSR_ON  0x20
#define global MS_RING_ON  0x40
#define global MS_RLSD_ON  0x80

; MODIFIERKEYS_FLAGS
#define global MK_LBUTTON  0x1
#define global MK_RBUTTON  0x2
#define global MK_SHIFT  0x4
#define global MK_CONTROL  0x8
#define global MK_MBUTTON  0x10
#define global MK_XBUTTON1  0x20
#define global MK_XBUTTON2  0x40

; MODIFY_WORLD_TRANSFORM_MODE
#define global MWT_IDENTITY  0x1
#define global MWT_LEFTMULTIPLY  0x2
#define global MWT_RIGHTMULTIPLY  0x3

; MODLOAD_DATA_TYPE
#define global DBHHEADER_DEBUGDIRS  0x1
#define global DBHHEADER_CVMISC  0x2

; MONITOR_FROM_FLAGS
#define global MONITOR_DEFAULTTONEAREST  0x2
#define global MONITOR_DEFAULTTONULL  0x0
#define global MONITOR_DEFAULTTOPRIMARY  0x1

; MOUSE_EVENT_FLAGS
#define global MOUSEEVENTF_ABSOLUTE  0x8000
#define global MOUSEEVENTF_LEFTDOWN  0x2
#define global MOUSEEVENTF_LEFTUP  0x4
#define global MOUSEEVENTF_MIDDLEDOWN  0x20
#define global MOUSEEVENTF_MIDDLEUP  0x40
#define global MOUSEEVENTF_MOVE  0x1
#define global MOUSEEVENTF_RIGHTDOWN  0x8
#define global MOUSEEVENTF_RIGHTUP  0x10
#define global MOUSEEVENTF_WHEEL  0x800
#define global MOUSEEVENTF_XDOWN  0x80
#define global MOUSEEVENTF_XUP  0x100
#define global MOUSEEVENTF_HWHEEL  0x1000
#define global MOUSEEVENTF_MOVE_NOCOALESCE  0x2000
#define global MOUSEEVENTF_VIRTUALDESK  0x4000

; MOUSE_STATE
#define global MOUSE_MOVE_RELATIVE  0x0
#define global MOUSE_MOVE_ABSOLUTE  0x1
#define global MOUSE_VIRTUAL_DESKTOP  0x2
#define global MOUSE_ATTRIBUTES_CHANGED  0x4
#define global MOUSE_MOVE_NOCOALESCE  0x8

; MOVE_FILE_FLAGS
#define global MOVEFILE_COPY_ALLOWED  0x2
#define global MOVEFILE_CREATE_HARDLINK  0x10
#define global MOVEFILE_DELAY_UNTIL_REBOOT  0x4
#define global MOVEFILE_REPLACE_EXISTING  0x1
#define global MOVEFILE_WRITE_THROUGH  0x8
#define global MOVEFILE_FAIL_IF_NOT_TRACKABLE  0x20

; MPEG2VIDEOINFO_FLAGS
#define global AMMPEG2_DoPanScan  0x1
#define global AMMPEG2_DVDLine21Field1  0x2
#define global AMMPEG2_DVDLine21Field2  0x4
#define global AMMPEG2_SourceIsLetterboxed  0x8
#define global AMMPEG2_FilmCameraMode  0x10
#define global AMMPEG2_LetterboxAnalogOut  0x20
#define global AMMPEG2_DSS_UserData  0x40
#define global AMMPEG2_DVB_UserData  0x80
#define global AMMPEG2_27MhzTimebase  0x100
#define global AMMPEG2_WidescreenAnalogOut  0x200

; MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS
#define global MWMO_NONE  0x0
#define global MWMO_ALERTABLE  0x2
#define global MWMO_INPUTAVAILABLE  0x4
#define global MWMO_WAITALL  0x1

; MSGFLTINFO_STATUS
#define global MSGFLTINFO_NONE  0x0
#define global MSGFLTINFO_ALLOWED_HIGHER  0x3
#define global MSGFLTINFO_ALREADYALLOWED_FORWND  0x1
#define global MSGFLTINFO_ALREADYDISALLOWED_FORWND  0x2

; MULTI_BYTE_TO_WIDE_CHAR_FLAGS
#define global MB_COMPOSITE  0x2
#define global MB_ERR_INVALID_CHARS  0x8
#define global MB_PRECOMPOSED  0x1
#define global MB_USEGLYPHCHARS  0x4

; MULTIPLE_TRUSTEE_OPERATION
#define global NO_MULTIPLE_TRUSTEE  0x0
#define global TRUSTEE_IS_IMPERSONATE  0x1

; NAMED_PIPE_MODE
#define global PIPE_WAIT  0x0
#define global PIPE_NOWAIT  0x1
#define global PIPE_READMODE_BYTE  0x0
#define global PIPE_READMODE_MESSAGE  0x2
#define global PIPE_CLIENT_END  0x0
#define global PIPE_SERVER_END  0x1
#define global PIPE_TYPE_BYTE  0x0
#define global PIPE_TYPE_MESSAGE  0x4
#define global PIPE_ACCEPT_REMOTE_CLIENTS  0x0
#define global PIPE_REJECT_REMOTE_CLIENTS  0x8

; NDIS_MEDIUM
#define global NdisMedium802_3  0x0
#define global NdisMedium802_5  0x1
#define global NdisMediumFddi  0x2
#define global NdisMediumWan  0x3
#define global NdisMediumLocalTalk  0x4
#define global NdisMediumDix  0x5
#define global NdisMediumArcnetRaw  0x6
#define global NdisMediumArcnet878_2  0x7
#define global NdisMediumAtm  0x8
#define global NdisMediumWirelessWan  0x9
#define global NdisMediumIrda  0xa
#define global NdisMediumBpc  0xb
#define global NdisMediumCoWan  0xc
#define global NdisMedium1394  0xd
#define global NdisMediumInfiniBand  0xe
#define global NdisMediumTunnel  0xf
#define global NdisMediumNative802_11  0x10
#define global NdisMediumLoopback  0x11
#define global NdisMediumWiMAX  0x12
#define global NdisMediumIP  0x13
#define global NdisMediumMax  0x14

; NDIS_PHYSICAL_MEDIUM
#define global NdisPhysicalMediumUnspecified  0x0
#define global NdisPhysicalMediumWirelessLan  0x1
#define global NdisPhysicalMediumCableModem  0x2
#define global NdisPhysicalMediumPhoneLine  0x3
#define global NdisPhysicalMediumPowerLine  0x4
#define global NdisPhysicalMediumDSL  0x5
#define global NdisPhysicalMediumFibreChannel  0x6
#define global NdisPhysicalMedium1394  0x7
#define global NdisPhysicalMediumWirelessWan  0x8
#define global NdisPhysicalMediumNative802_11  0x9
#define global NdisPhysicalMediumBluetooth  0xa
#define global NdisPhysicalMediumInfiniband  0xb
#define global NdisPhysicalMediumWiMax  0xc
#define global NdisPhysicalMediumUWB  0xd
#define global NdisPhysicalMedium802_3  0xe
#define global NdisPhysicalMedium802_5  0xf
#define global NdisPhysicalMediumIrda  0x10
#define global NdisPhysicalMediumWiredWAN  0x11
#define global NdisPhysicalMediumWiredCoWan  0x12
#define global NdisPhysicalMediumOther  0x13
#define global NdisPhysicalMediumNative802_15_4  0x14
#define global NdisPhysicalMediumMax  0x15

; NET_ADDRESS_FORMAT
#define global NET_ADDRESS_FORMAT_UNSPECIFIED  0x0
#define global NET_ADDRESS_DNS_NAME  0x1
#define global NET_ADDRESS_IPV4  0x2
#define global NET_ADDRESS_IPV6  0x3

; NET_IF_ACCESS_TYPE
#define global NET_IF_ACCESS_LOOPBACK  0x1
#define global NET_IF_ACCESS_BROADCAST  0x2
#define global NET_IF_ACCESS_POINT_TO_POINT  0x3
#define global NET_IF_ACCESS_POINT_TO_MULTI_POINT  0x4
#define global NET_IF_ACCESS_MAXIMUM  0x5

; NET_IF_ADMIN_STATUS
#define global NET_IF_ADMIN_STATUS_UP  0x1
#define global NET_IF_ADMIN_STATUS_DOWN  0x2
#define global NET_IF_ADMIN_STATUS_TESTING  0x3

; NET_IF_CONNECTION_TYPE
#define global NET_IF_CONNECTION_DEDICATED  0x1
#define global NET_IF_CONNECTION_PASSIVE  0x2
#define global NET_IF_CONNECTION_DEMAND  0x3
#define global NET_IF_CONNECTION_MAXIMUM  0x4

; NET_IF_DIRECTION_TYPE
#define global NET_IF_DIRECTION_SENDRECEIVE  0x0
#define global NET_IF_DIRECTION_SENDONLY  0x1
#define global NET_IF_DIRECTION_RECEIVEONLY  0x2
#define global NET_IF_DIRECTION_MAXIMUM  0x3

; NET_IF_MEDIA_CONNECT_STATE
#define global MediaConnectStateUnknown  0x0
#define global MediaConnectStateConnected  0x1
#define global MediaConnectStateDisconnected  0x2

; NET_SERVER_TYPE
#define global SV_TYPE_WORKSTATION  0x1
#define global SV_TYPE_SERVER  0x2
#define global SV_TYPE_SQLSERVER  0x4
#define global SV_TYPE_DOMAIN_CTRL  0x8
#define global SV_TYPE_DOMAIN_BAKCTRL  0x10
#define global SV_TYPE_TIME_SOURCE  0x20
#define global SV_TYPE_AFP  0x40
#define global SV_TYPE_NOVELL  0x80
#define global SV_TYPE_DOMAIN_MEMBER  0x100
#define global SV_TYPE_PRINTQ_SERVER  0x200
#define global SV_TYPE_DIALIN_SERVER  0x400
#define global SV_TYPE_XENIX_SERVER  0x800
#define global SV_TYPE_SERVER_UNIX  0x800
#define global SV_TYPE_NT  0x1000
#define global SV_TYPE_WFW  0x2000
#define global SV_TYPE_SERVER_MFPN  0x4000
#define global SV_TYPE_SERVER_NT  0x8000
#define global SV_TYPE_POTENTIAL_BROWSER  0x10000
#define global SV_TYPE_BACKUP_BROWSER  0x20000
#define global SV_TYPE_MASTER_BROWSER  0x40000
#define global SV_TYPE_DOMAIN_MASTER  0x80000
#define global SV_TYPE_SERVER_OSF  0x100000
#define global SV_TYPE_SERVER_VMS  0x200000
#define global SV_TYPE_WINDOWS  0x400000
#define global SV_TYPE_DFS  0x800000
#define global SV_TYPE_CLUSTER_NT  0x1000000
#define global SV_TYPE_TERMINALSERVER  0x2000000
#define global SV_TYPE_CLUSTER_VS_NT  0x4000000
#define global SV_TYPE_DCE  0x10000000
#define global SV_TYPE_ALTERNATE_XPORT  0x20000000
#define global SV_TYPE_LOCAL_LIST_ONLY  0x40000000
#define global SV_TYPE_DOMAIN_ENUM  0x80000000
#define global SV_TYPE_ALL  0xffffffff

; NL_DAD_STATE
#define global NldsInvalid  0x0
#define global NldsTentative  0x1
#define global NldsDuplicate  0x2
#define global NldsDeprecated  0x3
#define global NldsPreferred  0x4
#define global IpDadStateInvalid  0x0
#define global IpDadStateTentative  0x1
#define global IpDadStateDuplicate  0x2
#define global IpDadStateDeprecated  0x3
#define global IpDadStatePreferred  0x4

; NL_LINK_LOCAL_ADDRESS_BEHAVIOR
#define global LinkLocalAlwaysOff  0x0
#define global LinkLocalDelayed  0x1
#define global LinkLocalAlwaysOn  0x2
#define global LinkLocalUnchanged  -1

; NL_NEIGHBOR_STATE
#define global NlnsUnreachable  0x0
#define global NlnsIncomplete  0x1
#define global NlnsProbe  0x2
#define global NlnsDelay  0x3
#define global NlnsStale  0x4
#define global NlnsReachable  0x5
#define global NlnsPermanent  0x6
#define global NlnsMaximum  0x7

; NL_NETWORK_CONNECTIVITY_COST_HINT
#define global NetworkConnectivityCostHintUnknown  0x0
#define global NetworkConnectivityCostHintUnrestricted  0x1
#define global NetworkConnectivityCostHintFixed  0x2
#define global NetworkConnectivityCostHintVariable  0x3

; NL_NETWORK_CONNECTIVITY_LEVEL_HINT
#define global NetworkConnectivityLevelHintUnknown  0x0
#define global NetworkConnectivityLevelHintNone  0x1
#define global NetworkConnectivityLevelHintLocalAccess  0x2
#define global NetworkConnectivityLevelHintInternetAccess  0x3
#define global NetworkConnectivityLevelHintConstrainedInternetAccess  0x4
#define global NetworkConnectivityLevelHintHidden  0x5

; NL_PREFIX_ORIGIN
#define global IpPrefixOriginOther  0x0
#define global IpPrefixOriginManual  0x1
#define global IpPrefixOriginWellKnown  0x2
#define global IpPrefixOriginDhcp  0x3
#define global IpPrefixOriginRouterAdvertisement  0x4
#define global IpPrefixOriginUnchanged  0x10

; NL_ROUTE_ORIGIN
#define global NlroManual  0x0
#define global NlroWellKnown  0x1
#define global NlroDHCP  0x2
#define global NlroRouterAdvertisement  0x3
#define global Nlro6to4  0x4

; NL_ROUTE_PROTOCOL
#define global RouteProtocolOther  0x1
#define global RouteProtocolLocal  0x2
#define global RouteProtocolNetMgmt  0x3
#define global RouteProtocolIcmp  0x4
#define global RouteProtocolEgp  0x5
#define global RouteProtocolGgp  0x6
#define global RouteProtocolHello  0x7
#define global RouteProtocolRip  0x8
#define global RouteProtocolIsIs  0x9
#define global RouteProtocolEsIs  0xa
#define global RouteProtocolCisco  0xb
#define global RouteProtocolBbn  0xc
#define global RouteProtocolOspf  0xd
#define global RouteProtocolBgp  0xe
#define global RouteProtocolIdpr  0xf
#define global RouteProtocolEigrp  0x10
#define global RouteProtocolDvmrp  0x11
#define global RouteProtocolRpl  0x12
#define global RouteProtocolDhcp  0x13
#define global MIB_IPPROTO_OTHER  0x1
#define global PROTO_IP_OTHER  0x1
#define global MIB_IPPROTO_LOCAL  0x2
#define global PROTO_IP_LOCAL  0x2
#define global MIB_IPPROTO_NETMGMT  0x3
#define global PROTO_IP_NETMGMT  0x3
#define global MIB_IPPROTO_ICMP  0x4
#define global PROTO_IP_ICMP  0x4
#define global MIB_IPPROTO_EGP  0x5
#define global PROTO_IP_EGP  0x5
#define global MIB_IPPROTO_GGP  0x6
#define global PROTO_IP_GGP  0x6
#define global MIB_IPPROTO_HELLO  0x7
#define global PROTO_IP_HELLO  0x7
#define global MIB_IPPROTO_RIP  0x8
#define global PROTO_IP_RIP  0x8
#define global MIB_IPPROTO_IS_IS  0x9
#define global PROTO_IP_IS_IS  0x9
#define global MIB_IPPROTO_ES_IS  0xa
#define global PROTO_IP_ES_IS  0xa
#define global MIB_IPPROTO_CISCO  0xb
#define global PROTO_IP_CISCO  0xb
#define global MIB_IPPROTO_BBN  0xc
#define global PROTO_IP_BBN  0xc
#define global MIB_IPPROTO_OSPF  0xd
#define global PROTO_IP_OSPF  0xd
#define global MIB_IPPROTO_BGP  0xe
#define global PROTO_IP_BGP  0xe
#define global MIB_IPPROTO_IDPR  0xf
#define global PROTO_IP_IDPR  0xf
#define global MIB_IPPROTO_EIGRP  0x10
#define global PROTO_IP_EIGRP  0x10
#define global MIB_IPPROTO_DVMRP  0x11
#define global PROTO_IP_DVMRP  0x11
#define global MIB_IPPROTO_RPL  0x12
#define global PROTO_IP_RPL  0x12
#define global MIB_IPPROTO_DHCP  0x13
#define global PROTO_IP_DHCP  0x13
#define global MIB_IPPROTO_NT_AUTOSTATIC  0x2712
#define global PROTO_IP_NT_AUTOSTATIC  0x2712
#define global MIB_IPPROTO_NT_STATIC  0x2716
#define global PROTO_IP_NT_STATIC  0x2716
#define global MIB_IPPROTO_NT_STATIC_NON_DOD  0x2717
#define global PROTO_IP_NT_STATIC_NON_DOD  0x2717

; NL_ROUTER_DISCOVERY_BEHAVIOR
#define global RouterDiscoveryDisabled  0x0
#define global RouterDiscoveryEnabled  0x1
#define global RouterDiscoveryDhcp  0x2
#define global RouterDiscoveryUnchanged  -1

; NL_SUFFIX_ORIGIN
#define global NlsoOther  0x0
#define global NlsoManual  0x1
#define global NlsoWellKnown  0x2
#define global NlsoDhcp  0x3
#define global NlsoLinkLayerAddress  0x4
#define global NlsoRandom  0x5
#define global IpSuffixOriginOther  0x0
#define global IpSuffixOriginManual  0x1
#define global IpSuffixOriginWellKnown  0x2
#define global IpSuffixOriginDhcp  0x3
#define global IpSuffixOriginLinkLayerAddress  0x4
#define global IpSuffixOriginRandom  0x5
#define global IpSuffixOriginUnchanged  0x10

; NORM_FORM
#define global NormalizationOther  0x0
#define global NormalizationC  0x1
#define global NormalizationD  0x2
#define global NormalizationKC  0x5
#define global NormalizationKD  0x6

; NOTIFY_IME_ACTION
#define global NI_CHANGECANDIDATELIST  0x13
#define global NI_CLOSECANDIDATE  0x11
#define global NI_COMPOSITIONSTR  0x15
#define global NI_IMEMENUSELECTED  0x18
#define global NI_OPENCANDIDATE  0x10
#define global NI_SELECTCANDIDATESTR  0x12
#define global NI_SETCANDIDATE_PAGESIZE  0x17
#define global NI_SETCANDIDATE_PAGESTART  0x16

; NOTIFY_IME_INDEX
#define global CPS_CANCEL  0x4
#define global CPS_COMPLETE  0x1
#define global CPS_CONVERT  0x2
#define global CPS_REVERT  0x3

; Severity
#define global Success  0x0
#define global Informational  0x1
#define global Warning  0x2
#define global Error  0x3

; NUMPARSE_FLAGS
#define global NUMPRS_LEADING_WHITE  0x1
#define global NUMPRS_TRAILING_WHITE  0x2
#define global NUMPRS_LEADING_PLUS  0x4
#define global NUMPRS_TRAILING_PLUS  0x8
#define global NUMPRS_LEADING_MINUS  0x10
#define global NUMPRS_TRAILING_MINUS  0x20
#define global NUMPRS_HEX_OCT  0x40
#define global NUMPRS_PARENS  0x80
#define global NUMPRS_DECIMAL  0x100
#define global NUMPRS_THOUSANDS  0x200
#define global NUMPRS_CURRENCY  0x400
#define global NUMPRS_EXPONENT  0x800
#define global NUMPRS_USE_ALL  0x1000
#define global NUMPRS_STD  0x1fff
#define global NUMPRS_NEG  0x10000
#define global NUMPRS_INEXACT  0x20000

; OBJ_TYPE
#define global OBJ_PEN  0x1
#define global OBJ_BRUSH  0x2
#define global OBJ_DC  0x3
#define global OBJ_METADC  0x4
#define global OBJ_PAL  0x5
#define global OBJ_FONT  0x6
#define global OBJ_BITMAP  0x7
#define global OBJ_REGION  0x8
#define global OBJ_METAFILE  0x9
#define global OBJ_MEMDC  0xa
#define global OBJ_EXTPEN  0xb
#define global OBJ_ENHMETADC  0xc
#define global OBJ_ENHMETAFILE  0xd
#define global OBJ_COLORSPACE  0xe

; OBJECT_IDENTIFIER
#define global OBJID_WINDOW  0x0
#define global OBJID_SYSMENU  -1
#define global OBJID_TITLEBAR  -2
#define global OBJID_MENU  -3
#define global OBJID_CLIENT  -4
#define global OBJID_VSCROLL  -5
#define global OBJID_HSCROLL  -6
#define global OBJID_SIZEGRIP  -7
#define global OBJID_CARET  -8
#define global OBJID_CURSOR  -9
#define global OBJID_ALERT  -10
#define global OBJID_SOUND  -11
#define global OBJID_QUERYCLASSNAMEIDX  -12
#define global OBJID_NATIVEOM  -16

; OBJECT_SECURITY_INFORMATION
#define global ATTRIBUTE_SECURITY_INFORMATION  0x20
#define global BACKUP_SECURITY_INFORMATION  0x10000
#define global DACL_SECURITY_INFORMATION  0x4
#define global GROUP_SECURITY_INFORMATION  0x2
#define global LABEL_SECURITY_INFORMATION  0x10
#define global OWNER_SECURITY_INFORMATION  0x1
#define global PROTECTED_DACL_SECURITY_INFORMATION  0x80000000
#define global PROTECTED_SACL_SECURITY_INFORMATION  0x40000000
#define global SACL_SECURITY_INFORMATION  0x8
#define global SCOPE_SECURITY_INFORMATION  0x40
#define global UNPROTECTED_DACL_SECURITY_INFORMATION  0x20000000
#define global UNPROTECTED_SACL_SECURITY_INFORMATION  0x10000000

; OLECREATE
#define global OLECREATE_ZERO  0x0
#define global OLECREATE_LEAVERUNNING  0x1

; OLEIVERB
#define global OLEIVERB_PRIMARY  0x0
#define global OLEIVERB_SHOW  -1
#define global OLEIVERB_OPEN  -2
#define global OLEIVERB_HIDE  -3
#define global OLEIVERB_UIACTIVATE  -4
#define global OLEIVERB_INPLACEACTIVATE  -5
#define global OLEIVERB_DISCARDUNDOSTATE  -6

; OLEMISC
#define global OLEMISC_RECOMPOSEONRESIZE  0x1
#define global OLEMISC_ONLYICONIC  0x2
#define global OLEMISC_INSERTNOTREPLACE  0x4
#define global OLEMISC_STATIC  0x8
#define global OLEMISC_CANTLINKINSIDE  0x10
#define global OLEMISC_CANLINKBYOLE1  0x20
#define global OLEMISC_ISLINKOBJECT  0x40
#define global OLEMISC_INSIDEOUT  0x80
#define global OLEMISC_ACTIVATEWHENVISIBLE  0x100
#define global OLEMISC_RENDERINGISDEVICEINDEPENDENT  0x200
#define global OLEMISC_INVISIBLEATRUNTIME  0x400
#define global OLEMISC_ALWAYSRUN  0x800
#define global OLEMISC_ACTSLIKEBUTTON  0x1000
#define global OLEMISC_ACTSLIKELABEL  0x2000
#define global OLEMISC_NOUIACTIVATE  0x4000
#define global OLEMISC_ALIGNABLE  0x8000
#define global OLEMISC_SIMPLEFRAME  0x10000
#define global OLEMISC_SETCLIENTSITEFIRST  0x20000
#define global OLEMISC_IMEMODE  0x40000
#define global OLEMISC_IGNOREACTIVATEWHENVISIBLE  0x80000
#define global OLEMISC_WANTSTOMENUMERGE  0x100000
#define global OLEMISC_SUPPORTSMULTILEVELUNDO  0x200000

; OLERENDER
#define global OLERENDER_NONE  0x0
#define global OLERENDER_DRAW  0x1
#define global OLERENDER_FORMAT  0x2
#define global OLERENDER_ASIS  0x3

; OLEVERBATTRIB
#define global OLEVERBATTRIB_NEVERDIRTIES  0x1
#define global OLEVERBATTRIB_ONCONTAINERMENU  0x2

; OPEN_AS_INFO_FLAGS
#define global OAIF_ALLOW_REGISTRATION  0x1
#define global OAIF_REGISTER_EXT  0x2
#define global OAIF_EXEC  0x4
#define global OAIF_FORCE_REGISTRATION  0x8
#define global OAIF_HIDE_REGISTRATION  0x20
#define global OAIF_URL_PROTOCOL  0x40
#define global OAIF_FILE_IS_URI  0x80

; OPEN_THEME_DATA_FLAGS
#define global OTD_FORCE_RECT_SIZING  0x1
#define global OTD_NONCLIENT  0x2

; OPEN_THREAD_WAIT_CHAIN_SESSION_FLAGS
#define global WCT_ASYNC_OPEN_FLAG  0x1

; OPERATION_END_PARAMETERS_FLAGS
#define global OPERATION_END_DISCARD  0x1

; OPERATION_START_FLAGS
#define global OPERATION_START_TRACE_CURRENT_THREAD  0x1

; ORIENTATION_PREFERENCE
#define global ORIENTATION_PREFERENCE_NONE  0x0
#define global ORIENTATION_PREFERENCE_LANDSCAPE  0x1
#define global ORIENTATION_PREFERENCE_PORTRAIT  0x2
#define global ORIENTATION_PREFERENCE_LANDSCAPE_FLIPPED  0x4
#define global ORIENTATION_PREFERENCE_PORTRAIT_FLIPPED  0x8

; OS_PRODUCT_TYPE
#define global PRODUCT_BUSINESS  0x6
#define global PRODUCT_BUSINESS_N  0x10
#define global PRODUCT_CLUSTER_SERVER  0x12
#define global PRODUCT_CLUSTER_SERVER_V  0x40
#define global PRODUCT_CORE  0x65
#define global PRODUCT_CORE_COUNTRYSPECIFIC  0x63
#define global PRODUCT_CORE_N  0x62
#define global PRODUCT_CORE_SINGLELANGUAGE  0x64
#define global PRODUCT_DATACENTER_EVALUATION_SERVER  0x50
#define global PRODUCT_DATACENTER_A_SERVER_CORE  0x91
#define global PRODUCT_STANDARD_A_SERVER_CORE  0x92
#define global PRODUCT_DATACENTER_SERVER  0x8
#define global PRODUCT_DATACENTER_SERVER_CORE  0xc
#define global PRODUCT_DATACENTER_SERVER_CORE_V  0x27
#define global PRODUCT_DATACENTER_SERVER_V  0x25
#define global PRODUCT_EDUCATION  0x79
#define global PRODUCT_EDUCATION_N  0x7a
#define global PRODUCT_ENTERPRISE  0x4
#define global PRODUCT_ENTERPRISE_E  0x46
#define global PRODUCT_ENTERPRISE_EVALUATION  0x48
#define global PRODUCT_ENTERPRISE_N  0x1b
#define global PRODUCT_ENTERPRISE_N_EVALUATION  0x54
#define global PRODUCT_ENTERPRISE_S  0x7d
#define global PRODUCT_ENTERPRISE_S_EVALUATION  0x81
#define global PRODUCT_ENTERPRISE_S_N  0x7e
#define global PRODUCT_ENTERPRISE_S_N_EVALUATION  0x82
#define global PRODUCT_ENTERPRISE_SERVER  0xa
#define global PRODUCT_ENTERPRISE_SERVER_CORE  0xe
#define global PRODUCT_ENTERPRISE_SERVER_CORE_V  0x29
#define global PRODUCT_ENTERPRISE_SERVER_IA64  0xf
#define global PRODUCT_ENTERPRISE_SERVER_V  0x26
#define global PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL  0x3c
#define global PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC  0x3e
#define global PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT  0x3b
#define global PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC  0x3d
#define global PRODUCT_HOME_BASIC  0x2
#define global PRODUCT_HOME_BASIC_E  0x43
#define global PRODUCT_HOME_BASIC_N  0x5
#define global PRODUCT_HOME_PREMIUM  0x3
#define global PRODUCT_HOME_PREMIUM_E  0x44
#define global PRODUCT_HOME_PREMIUM_N  0x1a
#define global PRODUCT_HOME_PREMIUM_SERVER  0x22
#define global PRODUCT_HOME_SERVER  0x13
#define global PRODUCT_HYPERV  0x2a
#define global PRODUCT_IOTUAP  0x7b
#define global PRODUCT_IOTUAPCOMMERCIAL  0x83
#define global PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT  0x1e
#define global PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING  0x20
#define global PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY  0x1f
#define global PRODUCT_MOBILE_CORE  0x68
#define global PRODUCT_MOBILE_ENTERPRISE  0x85
#define global PRODUCT_MULTIPOINT_PREMIUM_SERVER  0x4d
#define global PRODUCT_MULTIPOINT_STANDARD_SERVER  0x4c
#define global PRODUCT_PRO_WORKSTATION  0xa1
#define global PRODUCT_PRO_WORKSTATION_N  0xa2
#define global PRODUCT_PROFESSIONAL  0x30
#define global PRODUCT_PROFESSIONAL_E  0x45
#define global PRODUCT_PROFESSIONAL_N  0x31
#define global PRODUCT_PROFESSIONAL_WMC  0x67
#define global PRODUCT_SB_SOLUTION_SERVER  0x32
#define global PRODUCT_SB_SOLUTION_SERVER_EM  0x36
#define global PRODUCT_SERVER_FOR_SB_SOLUTIONS  0x33
#define global PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM  0x37
#define global PRODUCT_SERVER_FOR_SMALLBUSINESS  0x18
#define global PRODUCT_SERVER_FOR_SMALLBUSINESS_V  0x23
#define global PRODUCT_SERVER_FOUNDATION  0x21
#define global PRODUCT_SMALLBUSINESS_SERVER  0x9
#define global PRODUCT_SMALLBUSINESS_SERVER_PREMIUM  0x19
#define global PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE  0x3f
#define global PRODUCT_SOLUTION_EMBEDDEDSERVER  0x38
#define global PRODUCT_STANDARD_EVALUATION_SERVER  0x4f
#define global PRODUCT_STANDARD_SERVER  0x7
#define global PRODUCT_STANDARD_SERVER_CORE_  0xd
#define global PRODUCT_STANDARD_SERVER_CORE_V  0x28
#define global PRODUCT_STANDARD_SERVER_V  0x24
#define global PRODUCT_STANDARD_SERVER_SOLUTIONS  0x34
#define global PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE  0x35
#define global PRODUCT_STARTER  0xb
#define global PRODUCT_STARTER_E  0x42
#define global PRODUCT_STARTER_N  0x2f
#define global PRODUCT_STORAGE_ENTERPRISE_SERVER  0x17
#define global PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE  0x2e
#define global PRODUCT_STORAGE_EXPRESS_SERVER  0x14
#define global PRODUCT_STORAGE_EXPRESS_SERVER_CORE  0x2b
#define global PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER  0x60
#define global PRODUCT_STORAGE_STANDARD_SERVER  0x15
#define global PRODUCT_STORAGE_STANDARD_SERVER_CORE  0x2c
#define global PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER  0x5f
#define global PRODUCT_STORAGE_WORKGROUP_SERVER  0x16
#define global PRODUCT_STORAGE_WORKGROUP_SERVER_CORE  0x2d
#define global PRODUCT_ULTIMATE  0x1
#define global PRODUCT_ULTIMATE_E  0x47
#define global PRODUCT_ULTIMATE_N  0x1c
#define global PRODUCT_UNDEFINED  0x0
#define global PRODUCT_WEB_SERVER  0x11
#define global PRODUCT_WEB_SERVER_CORE  0x1d

; PAGE_PROTECTION_FLAGS
#define global PAGE_NOACCESS  0x1
#define global PAGE_READONLY  0x2
#define global PAGE_READWRITE  0x4
#define global PAGE_WRITECOPY  0x8
#define global PAGE_EXECUTE  0x10
#define global PAGE_EXECUTE_READ  0x20
#define global PAGE_EXECUTE_READWRITE  0x40
#define global PAGE_EXECUTE_WRITECOPY  0x80
#define global PAGE_GUARD  0x100
#define global PAGE_NOCACHE  0x200
#define global PAGE_WRITECOMBINE  0x400
#define global PAGE_GRAPHICS_NOACCESS  0x800
#define global PAGE_GRAPHICS_READONLY  0x1000
#define global PAGE_GRAPHICS_READWRITE  0x2000
#define global PAGE_GRAPHICS_EXECUTE  0x4000
#define global PAGE_GRAPHICS_EXECUTE_READ  0x8000
#define global PAGE_GRAPHICS_EXECUTE_READWRITE  0x10000
#define global PAGE_GRAPHICS_COHERENT  0x20000
#define global PAGE_GRAPHICS_NOCACHE  0x40000
#define global PAGE_ENCLAVE_THREAD_CONTROL  0x80000000
#define global PAGE_REVERT_TO_FILE_MAP  0x80000000
#define global PAGE_TARGETS_NO_UPDATE  0x40000000
#define global PAGE_TARGETS_INVALID  0x40000000
#define global PAGE_ENCLAVE_UNVALIDATED  0x20000000
#define global PAGE_ENCLAVE_MASK  0x10000000
#define global PAGE_ENCLAVE_DECOMMIT  0x10000000
#define global PAGE_ENCLAVE_SS_FIRST  0x10000001
#define global PAGE_ENCLAVE_SS_REST  0x10000002
#define global SEC_PARTITION_OWNER_HANDLE  0x40000
#define global SEC_64K_PAGES  0x80000
#define global SEC_FILE  0x800000
#define global SEC_IMAGE  0x1000000
#define global SEC_PROTECTED_IMAGE  0x2000000
#define global SEC_RESERVE  0x4000000
#define global SEC_COMMIT  0x8000000
#define global SEC_NOCACHE  0x10000000
#define global SEC_WRITECOMBINE  0x40000000
#define global SEC_LARGE_PAGES  0x80000000
#define global SEC_IMAGE_NO_EXECUTE  0x11000000

; PaletteType
#define global PaletteTypeCustom  0x0
#define global PaletteTypeOptimal  0x1
#define global PaletteTypeFixedBW  0x2
#define global PaletteTypeFixedHalftone8  0x3
#define global PaletteTypeFixedHalftone27  0x4
#define global PaletteTypeFixedHalftone64  0x5
#define global PaletteTypeFixedHalftone125  0x6
#define global PaletteTypeFixedHalftone216  0x7
#define global PaletteTypeFixedHalftone252  0x8
#define global PaletteTypeFixedHalftone256  0x9

; PAN_ARM_STYLE
#define global PAN_ARM_ANY  0x0
#define global PAN_ARM_NO_FIT  0x1
#define global PAN_STRAIGHT_ARMS_HORZ  0x2
#define global PAN_STRAIGHT_ARMS_WEDGE  0x3
#define global PAN_STRAIGHT_ARMS_VERT  0x4
#define global PAN_STRAIGHT_ARMS_SINGLE_SERIF  0x5
#define global PAN_STRAIGHT_ARMS_DOUBLE_SERIF  0x6
#define global PAN_BENT_ARMS_HORZ  0x7
#define global PAN_BENT_ARMS_WEDGE  0x8
#define global PAN_BENT_ARMS_VERT  0x9
#define global PAN_BENT_ARMS_SINGLE_SERIF  0xa
#define global PAN_BENT_ARMS_DOUBLE_SERIF  0xb

; PAN_CONTRAST
#define global PAN_CONTRAST_ANY  0x0
#define global PAN_CONTRAST_NO_FIT  0x1
#define global PAN_CONTRAST_INDEX  0x4
#define global PAN_CONTRAST_NONE  0x2
#define global PAN_CONTRAST_VERY_LOW  0x3
#define global PAN_CONTRAST_LOW  0x4
#define global PAN_CONTRAST_MEDIUM_LOW  0x5
#define global PAN_CONTRAST_MEDIUM  0x6
#define global PAN_CONTRAST_MEDIUM_HIGH  0x7
#define global PAN_CONTRAST_HIGH  0x8
#define global PAN_CONTRAST_VERY_HIGH  0x9

; PAN_FAMILY_TYPE
#define global PAN_FAMILY_ANY  0x0
#define global PAN_FAMILY_NO_FIT  0x1
#define global PAN_FAMILY_TEXT_DISPLAY  0x2
#define global PAN_FAMILY_SCRIPT  0x3
#define global PAN_FAMILY_DECORATIVE  0x4
#define global PAN_FAMILY_PICTORIAL  0x5

; PAN_LETT_FORM
#define global PAN_LETT_FORM_ANY  0x0
#define global PAN_LETT_FORM_NO_FIT  0x1
#define global PAN_LETT_NORMAL_CONTACT  0x2
#define global PAN_LETT_NORMAL_WEIGHTED  0x3
#define global PAN_LETT_NORMAL_BOXED  0x4
#define global PAN_LETT_NORMAL_FLATTENED  0x5
#define global PAN_LETT_NORMAL_ROUNDED  0x6
#define global PAN_LETT_NORMAL_OFF_CENTER  0x7
#define global PAN_LETT_NORMAL_SQUARE  0x8
#define global PAN_LETT_OBLIQUE_CONTACT  0x9
#define global PAN_LETT_OBLIQUE_WEIGHTED  0xa
#define global PAN_LETT_OBLIQUE_BOXED  0xb
#define global PAN_LETT_OBLIQUE_FLATTENED  0xc
#define global PAN_LETT_OBLIQUE_ROUNDED  0xd
#define global PAN_LETT_OBLIQUE_OFF_CENTER  0xe
#define global PAN_LETT_OBLIQUE_SQUARE  0xf

; PAN_MIDLINE
#define global PAN_MIDLINE_ANY  0x0
#define global PAN_MIDLINE_NO_FIT  0x1
#define global PAN_MIDLINE_INDEX  0x8
#define global PAN_MIDLINE_STANDARD_TRIMMED  0x2
#define global PAN_MIDLINE_STANDARD_POINTED  0x3
#define global PAN_MIDLINE_STANDARD_SERIFED  0x4
#define global PAN_MIDLINE_HIGH_TRIMMED  0x5
#define global PAN_MIDLINE_HIGH_POINTED  0x6
#define global PAN_MIDLINE_HIGH_SERIFED  0x7
#define global PAN_MIDLINE_CONSTANT_TRIMMED  0x8
#define global PAN_MIDLINE_CONSTANT_POINTED  0x9
#define global PAN_MIDLINE_CONSTANT_SERIFED  0xa
#define global PAN_MIDLINE_LOW_TRIMMED  0xb
#define global PAN_MIDLINE_LOW_POINTED  0xc
#define global PAN_MIDLINE_LOW_SERIFED  0xd

; PAN_PROPORTION
#define global PAN_PROP_ANY  0x0
#define global PAN_PROP_NO_FIT  0x1
#define global PAN_PROP_OLD_STYLE  0x2
#define global PAN_PROP_MODERN  0x3
#define global PAN_PROP_EVEN_WIDTH  0x4
#define global PAN_PROP_EXPANDED  0x5
#define global PAN_PROP_CONDENSED  0x6
#define global PAN_PROP_VERY_EXPANDED  0x7
#define global PAN_PROP_VERY_CONDENSED  0x8
#define global PAN_PROP_MONOSPACED  0x9

; PAN_SERIF_STYLE
#define global PAN_SERIF_ANY  0x0
#define global PAN_SERIF_NO_FIT  0x1
#define global PAN_SERIF_COVE  0x2
#define global PAN_SERIF_OBTUSE_COVE  0x3
#define global PAN_SERIF_SQUARE_COVE  0x4
#define global PAN_SERIF_OBTUSE_SQUARE_COVE  0x5
#define global PAN_SERIF_SQUARE  0x6
#define global PAN_SERIF_THIN  0x7
#define global PAN_SERIF_BONE  0x8
#define global PAN_SERIF_EXAGGERATED  0x9
#define global PAN_SERIF_TRIANGLE  0xa
#define global PAN_SERIF_NORMAL_SANS  0xb
#define global PAN_SERIF_OBTUSE_SANS  0xc
#define global PAN_SERIF_PERP_SANS  0xd
#define global PAN_SERIF_FLARED  0xe
#define global PAN_SERIF_ROUNDED  0xf

; PAN_STROKE_VARIATION
#define global PAN_STROKE_ANY  0x0
#define global PAN_STROKE_NO_FIT  0x1
#define global PAN_STROKE_GRADUAL_DIAG  0x2
#define global PAN_STROKE_GRADUAL_TRAN  0x3
#define global PAN_STROKE_GRADUAL_VERT  0x4
#define global PAN_STROKE_GRADUAL_HORZ  0x5
#define global PAN_STROKE_RAPID_VERT  0x6
#define global PAN_STROKE_RAPID_HORZ  0x7
#define global PAN_STROKE_INSTANT_VERT  0x8

; PAN_WEIGHT
#define global PAN_WEIGHT_ANY  0x0
#define global PAN_WEIGHT_NO_FIT  0x1
#define global PAN_WEIGHT_INDEX  0x2
#define global PAN_WEIGHT_VERY_LIGHT  0x2
#define global PAN_WEIGHT_LIGHT  0x3
#define global PAN_WEIGHT_THIN  0x4
#define global PAN_WEIGHT_BOOK  0x5
#define global PAN_WEIGHT_MEDIUM  0x6
#define global PAN_WEIGHT_DEMI  0x7
#define global PAN_WEIGHT_BOLD  0x8
#define global PAN_WEIGHT_HEAVY  0x9
#define global PAN_WEIGHT_BLACK  0xa
#define global PAN_WEIGHT_NORD  0xb

; PAN_XHEIGHT
#define global PAN_XHEIGHT_ANY  0x0
#define global PAN_XHEIGHT_NO_FIT  0x1
#define global PAN_XHEIGHT_INDEX  0x9
#define global PAN_XHEIGHT_CONSTANT_SMALL  0x2
#define global PAN_XHEIGHT_CONSTANT_STD  0x3
#define global PAN_XHEIGHT_CONSTANT_LARGE  0x4
#define global PAN_XHEIGHT_DUCKING_SMALL  0x5
#define global PAN_XHEIGHT_DUCKING_STD  0x6
#define global PAN_XHEIGHT_DUCKING_LARGE  0x7

; PARAMFLAGS
#define global PARAMFLAG_NONE  0x0
#define global PARAMFLAG_FIN  0x1
#define global PARAMFLAG_FOUT  0x2
#define global PARAMFLAG_FLCID  0x4
#define global PARAMFLAG_FRETVAL  0x8
#define global PARAMFLAG_FOPT  0x10
#define global PARAMFLAG_FHASDEFAULT  0x20
#define global PARAMFLAG_FHASCUSTDATA  0x40

; PARSEACTION
#define global PARSE_CANONICALIZE  0x1
#define global PARSE_FRIENDLY  0x2
#define global PARSE_SECURITY_URL  0x3
#define global PARSE_ROOTDOCUMENT  0x4
#define global PARSE_DOCUMENT  0x5
#define global PARSE_ANCHOR  0x6
#define global PARSE_ENCODE_IS_UNESCAPE  0x7
#define global PARSE_DECODE_IS_ESCAPE  0x8
#define global PARSE_PATH_FROM_URL  0x9
#define global PARSE_URL_FROM_PATH  0xa
#define global PARSE_MIME  0xb
#define global PARSE_SERVER  0xc
#define global PARSE_SCHEMA  0xd
#define global PARSE_SITE  0xe
#define global PARSE_DOMAIN  0xf
#define global PARSE_LOCATION  0x10
#define global PARSE_SECURITY_DOMAIN  0x11
#define global PARSE_ESCAPE  0x12
#define global PARSE_UNESCAPE  0x13

; PCS_RET
#define global PCS_FATAL  0x80000000
#define global PCS_REPLACEDCHAR  0x1
#define global PCS_REMOVEDCHAR  0x2
#define global PCS_TRUNCATED  0x4
#define global PCS_PATHTOOLONG  0x8

; PDOPSTATUS
#define global PDOPS_RUNNING  0x1
#define global PDOPS_PAUSED  0x2
#define global PDOPS_CANCELLED  0x3
#define global PDOPS_STOPPED  0x4
#define global PDOPS_ERRORS  0x5

; PEEK_MESSAGE_REMOVE_TYPE
#define global PM_NOREMOVE  0x0
#define global PM_REMOVE  0x1
#define global PM_NOYIELD  0x2
#define global PM_QS_INPUT  0x4070000
#define global PM_QS_POSTMESSAGE  0x980000
#define global PM_QS_PAINT  0x200000
#define global PM_QS_SENDMESSAGE  0x400000

; PEN_STYLE
#define global PS_GEOMETRIC  0x10000
#define global PS_COSMETIC  0x0
#define global PS_SOLID  0x0
#define global PS_DASH  0x1
#define global PS_DOT  0x2
#define global PS_DASHDOT  0x3
#define global PS_DASHDOTDOT  0x4
#define global PS_NULL  0x5
#define global PS_INSIDEFRAME  0x6
#define global PS_USERSTYLE  0x7
#define global PS_ALTERNATE  0x8
#define global PS_STYLE_MASK  0xf
#define global PS_ENDCAP_ROUND  0x0
#define global PS_ENDCAP_SQUARE  0x100
#define global PS_ENDCAP_FLAT  0x200
#define global PS_ENDCAP_MASK  0xf00
#define global PS_JOIN_ROUND  0x0
#define global PS_JOIN_BEVEL  0x1000
#define global PS_JOIN_MITER  0x2000
#define global PS_JOIN_MASK  0xf000
#define global PS_TYPE_MASK  0xf0000

; PenAlignment
#define global PenAlignmentCenter  0x0
#define global PenAlignmentInset  0x1

; PenType
#define global PenTypeSolidColor  0x0
#define global PenTypeHatchFill  0x1
#define global PenTypeTextureFill  0x2
#define global PenTypePathGradient  0x3
#define global PenTypeLinearGradient  0x4
#define global PenTypeUnknown  -1

; PerfRegInfoType
#define global PERF_REG_COUNTERSET_STRUCT  0x1
#define global PERF_REG_COUNTER_STRUCT  0x2
#define global PERF_REG_COUNTERSET_NAME_STRING  0x3
#define global PERF_REG_COUNTERSET_HELP_STRING  0x4
#define global PERF_REG_COUNTER_NAME_STRINGS  0x5
#define global PERF_REG_COUNTER_HELP_STRINGS  0x6
#define global PERF_REG_PROVIDER_NAME  0x7
#define global PERF_REG_PROVIDER_GUID  0x8
#define global PERF_REG_COUNTERSET_ENGLISH_NAME  0x9
#define global PERF_REG_COUNTER_ENGLISH_NAMES  0xa

; PFADDRESSTYPE
#define global PF_IPV4  0x0
#define global PF_IPV6  0x1

; PFD_FLAGS
#define global PFD_DOUBLEBUFFER  0x1
#define global PFD_STEREO  0x2
#define global PFD_DRAW_TO_WINDOW  0x4
#define global PFD_DRAW_TO_BITMAP  0x8
#define global PFD_SUPPORT_GDI  0x10
#define global PFD_SUPPORT_OPENGL  0x20
#define global PFD_GENERIC_FORMAT  0x40
#define global PFD_NEED_PALETTE  0x80
#define global PFD_NEED_SYSTEM_PALETTE  0x100
#define global PFD_SWAP_EXCHANGE  0x200
#define global PFD_SWAP_COPY  0x400
#define global PFD_SWAP_LAYER_BUFFERS  0x800
#define global PFD_GENERIC_ACCELERATED  0x1000
#define global PFD_SUPPORT_DIRECTDRAW  0x2000
#define global PFD_DIRECT3D_ACCELERATED  0x4000
#define global PFD_SUPPORT_COMPOSITION  0x8000
#define global PFD_DEPTH_DONTCARE  0x20000000
#define global PFD_DOUBLEBUFFER_DONTCARE  0x40000000
#define global PFD_STEREO_DONTCARE  0x80000000

; PFD_LAYER_TYPE
#define global PFD_UNDERLAY_PLANE  -1
#define global PFD_MAIN_PLANE  0x0
#define global PFD_OVERLAY_PLANE  0x1

; PFD_PIXEL_TYPE
#define global PFD_TYPE_RGBA  0x0
#define global PFD_TYPE_COLORINDEX  0x1

; PFFORWARD_ACTION
#define global PF_ACTION_FORWARD  0x0
#define global PF_ACTION_DROP  0x1

; PICTYPE
#define global PICTYPE_UNINITIALIZED  -1
#define global PICTYPE_NONE  0x0
#define global PICTYPE_BITMAP  0x1
#define global PICTYPE_METAFILE  0x2
#define global PICTYPE_ICON  0x3
#define global PICTYPE_ENHMETAFILE  0x4

; PixelOffsetMode
#define global PixelOffsetModeInvalid  -1
#define global PixelOffsetModeDefault  0x0
#define global PixelOffsetModeHighSpeed  0x1
#define global PixelOffsetModeHighQuality  0x2
#define global PixelOffsetModeNone  0x3
#define global PixelOffsetModeHalf  0x4

; POINTER_BUTTON_CHANGE_TYPE
#define global POINTER_CHANGE_NONE  0x0
#define global POINTER_CHANGE_FIRSTBUTTON_DOWN  0x1
#define global POINTER_CHANGE_FIRSTBUTTON_UP  0x2
#define global POINTER_CHANGE_SECONDBUTTON_DOWN  0x3
#define global POINTER_CHANGE_SECONDBUTTON_UP  0x4
#define global POINTER_CHANGE_THIRDBUTTON_DOWN  0x5
#define global POINTER_CHANGE_THIRDBUTTON_UP  0x6
#define global POINTER_CHANGE_FOURTHBUTTON_DOWN  0x7
#define global POINTER_CHANGE_FOURTHBUTTON_UP  0x8
#define global POINTER_CHANGE_FIFTHBUTTON_DOWN  0x9
#define global POINTER_CHANGE_FIFTHBUTTON_UP  0xa

; POINTER_DEVICE_CURSOR_TYPE
#define global POINTER_DEVICE_CURSOR_TYPE_UNKNOWN  0x0
#define global POINTER_DEVICE_CURSOR_TYPE_TIP  0x1
#define global POINTER_DEVICE_CURSOR_TYPE_ERASER  0x2
#define global POINTER_DEVICE_CURSOR_TYPE_MAX  -1

; POINTER_DEVICE_TYPE
#define global POINTER_DEVICE_TYPE_INTEGRATED_PEN  0x1
#define global POINTER_DEVICE_TYPE_EXTERNAL_PEN  0x2
#define global POINTER_DEVICE_TYPE_TOUCH  0x3
#define global POINTER_DEVICE_TYPE_TOUCH_PAD  0x4
#define global POINTER_DEVICE_TYPE_MAX  -1

; POINTER_FEEDBACK_MODE
#define global POINTER_FEEDBACK_DEFAULT  0x1
#define global POINTER_FEEDBACK_INDIRECT  0x2
#define global POINTER_FEEDBACK_NONE  0x3

; POINTER_FLAGS
#define global POINTER_FLAG_NONE  0x0
#define global POINTER_FLAG_NEW  0x1
#define global POINTER_FLAG_INRANGE  0x2
#define global POINTER_FLAG_INCONTACT  0x4
#define global POINTER_FLAG_FIRSTBUTTON  0x10
#define global POINTER_FLAG_SECONDBUTTON  0x20
#define global POINTER_FLAG_THIRDBUTTON  0x40
#define global POINTER_FLAG_FOURTHBUTTON  0x80
#define global POINTER_FLAG_FIFTHBUTTON  0x100
#define global POINTER_FLAG_PRIMARY  0x2000
#define global POINTER_FLAG_CONFIDENCE  0x4000
#define global POINTER_FLAG_CANCELED  0x8000
#define global POINTER_FLAG_DOWN  0x10000
#define global POINTER_FLAG_UPDATE  0x20000
#define global POINTER_FLAG_UP  0x40000
#define global POINTER_FLAG_WHEEL  0x80000
#define global POINTER_FLAG_HWHEEL  0x100000
#define global POINTER_FLAG_CAPTURECHANGED  0x200000
#define global POINTER_FLAG_HASTRANSFORM  0x400000

; POINTER_INPUT_TYPE
#define global PT_POINTER  0x1
#define global PT_TOUCH  0x2
#define global PT_PEN  0x3
#define global PT_MOUSE  0x4
#define global PT_TOUCHPAD  0x5

; POLICY_AUDIT_EVENT_TYPE
#define global AuditCategorySystem  0x0
#define global AuditCategoryLogon  0x1
#define global AuditCategoryObjectAccess  0x2
#define global AuditCategoryPrivilegeUse  0x3
#define global AuditCategoryDetailedTracking  0x4
#define global AuditCategoryPolicyChange  0x5
#define global AuditCategoryAccountManagement  0x6
#define global AuditCategoryDirectoryServiceAccess  0x7
#define global AuditCategoryAccountLogon  0x8

; POLICY_DOMAIN_INFORMATION_CLASS
#define global PolicyDomainEfsInformation  0x2
#define global PolicyDomainKerberosTicketInformation  0x3

; POLICY_INFORMATION_CLASS
#define global PolicyAuditLogInformation  0x1
#define global PolicyAuditEventsInformation  0x2
#define global PolicyPrimaryDomainInformation  0x3
#define global PolicyPdAccountInformation  0x4
#define global PolicyAccountDomainInformation  0x5
#define global PolicyLsaServerRoleInformation  0x6
#define global PolicyReplicaSourceInformation  0x7
#define global PolicyDefaultQuotaInformation  0x8
#define global PolicyModificationInformation  0x9
#define global PolicyAuditFullSetInformation  0xa
#define global PolicyAuditFullQueryInformation  0xb
#define global PolicyDnsDomainInformation  0xc
#define global PolicyDnsDomainInformationInt  0xd
#define global PolicyLocalAccountDomainInformation  0xe
#define global PolicyMachineAccountInformation  0xf
#define global PolicyMachineAccountInformation2  0x10
#define global PolicyLastEntry  0x11

; POWER_ACTION
#define global PowerActionNone  0x0
#define global PowerActionReserved  0x1
#define global PowerActionSleep  0x2
#define global PowerActionHibernate  0x3
#define global PowerActionShutdown  0x4
#define global PowerActionShutdownReset  0x5
#define global PowerActionShutdownOff  0x6
#define global PowerActionWarmEject  0x7
#define global PowerActionDisplayOff  0x8

; POWER_ACTION_POLICY_EVENT_CODE
#define global POWER_FORCE_TRIGGER_RESET  0x80000000
#define global POWER_LEVEL_USER_NOTIFY_EXEC  0x4
#define global POWER_LEVEL_USER_NOTIFY_SOUND  0x2
#define global POWER_LEVEL_USER_NOTIFY_TEXT  0x1
#define global POWER_USER_NOTIFY_BUTTON  0x8
#define global POWER_USER_NOTIFY_SHUTDOWN  0x10

; POWER_DATA_ACCESSOR
#define global ACCESS_AC_POWER_SETTING_INDEX  0x0
#define global ACCESS_DC_POWER_SETTING_INDEX  0x1
#define global ACCESS_FRIENDLY_NAME  0x2
#define global ACCESS_DESCRIPTION  0x3
#define global ACCESS_POSSIBLE_POWER_SETTING  0x4
#define global ACCESS_POSSIBLE_POWER_SETTING_FRIENDLY_NAME  0x5
#define global ACCESS_POSSIBLE_POWER_SETTING_DESCRIPTION  0x6
#define global ACCESS_DEFAULT_AC_POWER_SETTING  0x7
#define global ACCESS_DEFAULT_DC_POWER_SETTING  0x8
#define global ACCESS_POSSIBLE_VALUE_MIN  0x9
#define global ACCESS_POSSIBLE_VALUE_MAX  0xa
#define global ACCESS_POSSIBLE_VALUE_INCREMENT  0xb
#define global ACCESS_POSSIBLE_VALUE_UNITS  0xc
#define global ACCESS_ICON_RESOURCE  0xd
#define global ACCESS_DEFAULT_SECURITY_DESCRIPTOR  0xe
#define global ACCESS_ATTRIBUTES  0xf
#define global ACCESS_SCHEME  0x10
#define global ACCESS_SUBGROUP  0x11
#define global ACCESS_INDIVIDUAL_SETTING  0x12
#define global ACCESS_ACTIVE_SCHEME  0x13
#define global ACCESS_CREATE_SCHEME  0x14
#define global ACCESS_AC_POWER_SETTING_MAX  0x15
#define global ACCESS_DC_POWER_SETTING_MAX  0x16
#define global ACCESS_AC_POWER_SETTING_MIN  0x17
#define global ACCESS_DC_POWER_SETTING_MIN  0x18
#define global ACCESS_PROFILE  0x19
#define global ACCESS_OVERLAY_SCHEME  0x1a
#define global ACCESS_ACTIVE_OVERLAY_SCHEME  0x1b

; POWER_INFORMATION_LEVEL
#define global SystemPowerPolicyAc  0x0
#define global SystemPowerPolicyDc  0x1
#define global VerifySystemPolicyAc  0x2
#define global VerifySystemPolicyDc  0x3
#define global SystemPowerCapabilities  0x4
#define global SystemBatteryState  0x5
#define global SystemPowerStateHandler  0x6
#define global ProcessorStateHandler  0x7
#define global SystemPowerPolicyCurrent  0x8
#define global AdministratorPowerPolicy  0x9
#define global SystemReserveHiberFile  0xa
#define global ProcessorInformation  0xb
#define global SystemPowerInformation  0xc
#define global ProcessorStateHandler2  0xd
#define global LastWakeTime  0xe
#define global LastSleepTime  0xf
#define global SystemExecutionState  0x10
#define global SystemPowerStateNotifyHandler  0x11
#define global ProcessorPowerPolicyAc  0x12
#define global ProcessorPowerPolicyDc  0x13
#define global VerifyProcessorPowerPolicyAc  0x14
#define global VerifyProcessorPowerPolicyDc  0x15
#define global ProcessorPowerPolicyCurrent  0x16
#define global SystemPowerStateLogging  0x17
#define global SystemPowerLoggingEntry  0x18
#define global SetPowerSettingValue  0x19
#define global NotifyUserPowerSetting  0x1a
#define global PowerInformationLevelUnused0  0x1b
#define global SystemMonitorHiberBootPowerOff  0x1c
#define global SystemVideoState  0x1d
#define global TraceApplicationPowerMessage  0x1e
#define global TraceApplicationPowerMessageEnd  0x1f
#define global ProcessorPerfStates  0x20
#define global ProcessorIdleStates  0x21
#define global ProcessorCap  0x22
#define global SystemWakeSource  0x23
#define global SystemHiberFileInformation  0x24
#define global TraceServicePowerMessage  0x25
#define global ProcessorLoad  0x26
#define global PowerShutdownNotification  0x27
#define global MonitorCapabilities  0x28
#define global SessionPowerInit  0x29
#define global SessionDisplayState  0x2a
#define global PowerRequestCreate  0x2b
#define global PowerRequestAction  0x2c
#define global GetPowerRequestList  0x2d
#define global ProcessorInformationEx  0x2e
#define global NotifyUserModeLegacyPowerEvent  0x2f
#define global GroupPark  0x30
#define global ProcessorIdleDomains  0x31
#define global WakeTimerList  0x32
#define global SystemHiberFileSize  0x33
#define global ProcessorIdleStatesHv  0x34
#define global ProcessorPerfStatesHv  0x35
#define global ProcessorPerfCapHv  0x36
#define global ProcessorSetIdle  0x37
#define global LogicalProcessorIdling  0x38
#define global UserPresence  0x39
#define global PowerSettingNotificationName  0x3a
#define global GetPowerSettingValue  0x3b
#define global IdleResiliency  0x3c
#define global SessionRITState  0x3d
#define global SessionConnectNotification  0x3e
#define global SessionPowerCleanup  0x3f
#define global SessionLockState  0x40
#define global SystemHiberbootState  0x41
#define global PlatformInformation  0x42
#define global PdcInvocation  0x43
#define global MonitorInvocation  0x44
#define global FirmwareTableInformationRegistered  0x45
#define global SetShutdownSelectedTime  0x46
#define global SuspendResumeInvocation  0x47
#define global PlmPowerRequestCreate  0x48
#define global ScreenOff  0x49
#define global CsDeviceNotification  0x4a
#define global PlatformRole  0x4b
#define global LastResumePerformance  0x4c
#define global DisplayBurst  0x4d
#define global ExitLatencySamplingPercentage  0x4e
#define global RegisterSpmPowerSettings  0x4f
#define global PlatformIdleStates  0x50
#define global ProcessorIdleVeto  0x51
#define global PlatformIdleVeto  0x52
#define global SystemBatteryStatePrecise  0x53
#define global ThermalEvent  0x54
#define global PowerRequestActionInternal  0x55
#define global BatteryDeviceState  0x56
#define global PowerInformationInternal  0x57
#define global ThermalStandby  0x58
#define global SystemHiberFileType  0x59
#define global PhysicalPowerButtonPress  0x5a
#define global QueryPotentialDripsConstraint  0x5b
#define global EnergyTrackerCreate  0x5c
#define global EnergyTrackerQuery  0x5d
#define global UpdateBlackBoxRecorder  0x5e
#define global SessionAllowExternalDmaDevices  0x5f
#define global SendSuspendResumeNotification  0x60
#define global BlackBoxRecorderDirectAccessBuffer  0x61
#define global PowerInformationLevelMaximum  0x62

; POWER_PLATFORM_ROLE
#define global PlatformRoleUnspecified  0x0
#define global PlatformRoleDesktop  0x1
#define global PlatformRoleMobile  0x2
#define global PlatformRoleWorkstation  0x3
#define global PlatformRoleEnterpriseServer  0x4
#define global PlatformRoleSOHOServer  0x5
#define global PlatformRoleAppliancePC  0x6
#define global PlatformRolePerformanceServer  0x7
#define global PlatformRoleSlate  0x8
#define global PlatformRoleMaximum  0x9

; POWER_PLATFORM_ROLE_VERSION
#define global POWER_PLATFORM_ROLE_V1  0x1
#define global POWER_PLATFORM_ROLE_V2  0x2

; POWER_REQUEST_CONTEXT_FLAGS
#define global POWER_REQUEST_CONTEXT_DETAILED_STRING  0x2
#define global POWER_REQUEST_CONTEXT_SIMPLE_STRING  0x1

; POWER_REQUEST_TYPE
#define global PowerRequestDisplayRequired  0x0
#define global PowerRequestSystemRequired  0x1
#define global PowerRequestAwayModeRequired  0x2
#define global PowerRequestExecutionRequired  0x3

; PREPARE_TAPE_OPERATION
#define global TAPE_FORMAT  0x5
#define global TAPE_LOAD  0x0
#define global TAPE_LOCK  0x3
#define global TAPE_TENSION  0x2
#define global TAPE_UNLOAD  0x1
#define global TAPE_UNLOCK  0x4

; PRF_FLAGS
#define global PRF_VERIFYEXISTS  0x1
#define global PRF_TRYPROGRAMEXTENSIONS  0x3
#define global PRF_FIRSTDIRDEF  0x4
#define global PRF_DONTFINDLNK  0x8
#define global PRF_REQUIREABSOLUTE  0x10

; PRINT_WINDOW_FLAGS
#define global PW_CLIENTONLY  0x1

; PROCESS_ACCESS_RIGHTS
#define global PROCESS_TERMINATE  0x1
#define global PROCESS_CREATE_THREAD  0x2
#define global PROCESS_SET_SESSIONID  0x4
#define global PROCESS_VM_OPERATION  0x8
#define global PROCESS_VM_READ  0x10
#define global PROCESS_VM_WRITE  0x20
#define global PROCESS_DUP_HANDLE  0x40
#define global PROCESS_CREATE_PROCESS  0x80
#define global PROCESS_SET_QUOTA  0x100
#define global PROCESS_SET_INFORMATION  0x200
#define global PROCESS_QUERY_INFORMATION  0x400
#define global PROCESS_SUSPEND_RESUME  0x800
#define global PROCESS_QUERY_LIMITED_INFORMATION  0x1000
#define global PROCESS_SET_LIMITED_INFORMATION  0x2000
#define global PROCESS_ALL_ACCESS  0x1fffff
#define global PROCESS_DELETE  0x10000
#define global PROCESS_READ_CONTROL  0x20000
#define global PROCESS_WRITE_DAC  0x40000
#define global PROCESS_WRITE_OWNER  0x80000
#define global PROCESS_SYNCHRONIZE  0x100000
#define global PROCESS_STANDARD_RIGHTS_REQUIRED  0xf0000

; PROCESS_AFFINITY_AUTO_UPDATE_FLAGS
#define global PROCESS_AFFINITY_DISABLE_AUTO_UPDATE  0x0
#define global PROCESS_AFFINITY_ENABLE_AUTO_UPDATE  0x1

; PROCESS_CREATION_FLAGS
#define global DEBUG_PROCESS  0x1
#define global DEBUG_ONLY_THIS_PROCESS  0x2
#define global CREATE_SUSPENDED  0x4
#define global DETACHED_PROCESS  0x8
#define global CREATE_NEW_CONSOLE  0x10
#define global NORMAL_PRIORITY_CLASS  0x20
#define global IDLE_PRIORITY_CLASS  0x40
#define global HIGH_PRIORITY_CLASS  0x80
#define global REALTIME_PRIORITY_CLASS  0x100
#define global CREATE_NEW_PROCESS_GROUP  0x200
#define global CREATE_UNICODE_ENVIRONMENT  0x400
#define global CREATE_SEPARATE_WOW_VDM  0x800
#define global CREATE_SHARED_WOW_VDM  0x1000
#define global CREATE_FORCEDOS  0x2000
#define global BELOW_NORMAL_PRIORITY_CLASS  0x4000
#define global ABOVE_NORMAL_PRIORITY_CLASS  0x8000
#define global INHERIT_PARENT_AFFINITY  0x10000
#define global INHERIT_CALLER_PRIORITY  0x20000
#define global CREATE_PROTECTED_PROCESS  0x40000
#define global EXTENDED_STARTUPINFO_PRESENT  0x80000
#define global PROCESS_MODE_BACKGROUND_BEGIN  0x100000
#define global PROCESS_MODE_BACKGROUND_END  0x200000
#define global CREATE_SECURE_PROCESS  0x400000
#define global CREATE_BREAKAWAY_FROM_JOB  0x1000000
#define global CREATE_PRESERVE_CODE_AUTHZ_LEVEL  0x2000000
#define global CREATE_DEFAULT_ERROR_MODE  0x4000000
#define global CREATE_NO_WINDOW  0x8000000
#define global PROFILE_USER  0x10000000
#define global PROFILE_KERNEL  0x20000000
#define global PROFILE_SERVER  0x40000000
#define global CREATE_IGNORE_SYSTEM_DEFAULT  0x80000000

; PROCESS_DEP_FLAGS
#define global PROCESS_DEP_ENABLE  0x1
#define global PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION  0x2
#define global PROCESS_DEP_NONE  0x0

; PROCESS_INFORMATION_CLASS
#define global ProcessMemoryPriority  0x0
#define global ProcessMemoryExhaustionInfo  0x1
#define global ProcessAppMemoryInfo  0x2
#define global ProcessInPrivateInfo  0x3
#define global ProcessPowerThrottling  0x4
#define global ProcessReservedValue1  0x5
#define global ProcessTelemetryCoverageInfo  0x6
#define global ProcessProtectionLevelInfo  0x7
#define global ProcessLeapSecondInfo  0x8
#define global ProcessMachineTypeInfo  0x9
#define global ProcessOverrideSubsequentPrefetchParameter  0xa
#define global ProcessMaxOverridePrefetchParameter  0xb
#define global ProcessInformationClassMax  0xc

; PROCESS_NAME_FORMAT
#define global PROCESS_NAME_WIN32  0x0
#define global PROCESS_NAME_NATIVE  0x1

; PROCESSOR_ARCHITECTURE
#define global PROCESSOR_ARCHITECTURE_INTEL  0x0
#define global PROCESSOR_ARCHITECTURE_MIPS  0x1
#define global PROCESSOR_ARCHITECTURE_ALPHA  0x2
#define global PROCESSOR_ARCHITECTURE_PPC  0x3
#define global PROCESSOR_ARCHITECTURE_SHX  0x4
#define global PROCESSOR_ARCHITECTURE_ARM  0x5
#define global PROCESSOR_ARCHITECTURE_IA64  0x6
#define global PROCESSOR_ARCHITECTURE_ALPHA64  0x7
#define global PROCESSOR_ARCHITECTURE_MSIL  0x8
#define global PROCESSOR_ARCHITECTURE_AMD64  0x9
#define global PROCESSOR_ARCHITECTURE_IA32_ON_WIN64  0xa
#define global PROCESSOR_ARCHITECTURE_NEUTRAL  0xb
#define global PROCESSOR_ARCHITECTURE_ARM64  0xc
#define global PROCESSOR_ARCHITECTURE_ARM32_ON_WIN64  0xd
#define global PROCESSOR_ARCHITECTURE_IA32_ON_ARM64  0xe
#define global PROCESSOR_ARCHITECTURE_UNKNOWN  0xffff

; PROCESSOR_CACHE_TYPE
#define global CacheUnified  0x0
#define global CacheInstruction  0x1
#define global CacheData  0x2
#define global CacheTrace  0x3

; PROCESSOR_FEATURE_ID
#define global PF_FLOATING_POINT_PRECISION_ERRATA  0x0
#define global PF_FLOATING_POINT_EMULATED  0x1
#define global PF_COMPARE_EXCHANGE_DOUBLE  0x2
#define global PF_MMX_INSTRUCTIONS_AVAILABLE  0x3
#define global PF_PPC_MOVEMEM_64BIT_OK  0x4
#define global PF_ALPHA_BYTE_INSTRUCTIONS  0x5
#define global PF_XMMI_INSTRUCTIONS_AVAILABLE  0x6
#define global PF_3DNOW_INSTRUCTIONS_AVAILABLE  0x7
#define global PF_RDTSC_INSTRUCTION_AVAILABLE  0x8
#define global PF_PAE_ENABLED  0x9
#define global PF_XMMI64_INSTRUCTIONS_AVAILABLE  0xa
#define global PF_SSE_DAZ_MODE_AVAILABLE  0xb
#define global PF_NX_ENABLED  0xc
#define global PF_SSE3_INSTRUCTIONS_AVAILABLE  0xd
#define global PF_COMPARE_EXCHANGE128  0xe
#define global PF_COMPARE64_EXCHANGE128  0xf
#define global PF_CHANNELS_ENABLED  0x10
#define global PF_XSAVE_ENABLED  0x11
#define global PF_ARM_VFP_32_REGISTERS_AVAILABLE  0x12
#define global PF_ARM_NEON_INSTRUCTIONS_AVAILABLE  0x13
#define global PF_SECOND_LEVEL_ADDRESS_TRANSLATION  0x14
#define global PF_VIRT_FIRMWARE_ENABLED  0x15
#define global PF_RDWRFSGSBASE_AVAILABLE  0x16
#define global PF_FASTFAIL_AVAILABLE  0x17
#define global PF_ARM_DIVIDE_INSTRUCTION_AVAILABLE  0x18
#define global PF_ARM_64BIT_LOADSTORE_ATOMIC  0x19
#define global PF_ARM_EXTERNAL_CACHE_AVAILABLE  0x1a
#define global PF_ARM_FMAC_INSTRUCTIONS_AVAILABLE  0x1b
#define global PF_RDRAND_INSTRUCTION_AVAILABLE  0x1c
#define global PF_ARM_V8_INSTRUCTIONS_AVAILABLE  0x1d
#define global PF_ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE  0x1e
#define global PF_ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE  0x1f
#define global PF_RDTSCP_INSTRUCTION_AVAILABLE  0x20
#define global PF_RDPID_INSTRUCTION_AVAILABLE  0x21
#define global PF_ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE  0x22
#define global PF_MONITORX_INSTRUCTION_AVAILABLE  0x23
#define global PF_SSSE3_INSTRUCTIONS_AVAILABLE  0x24
#define global PF_SSE4_1_INSTRUCTIONS_AVAILABLE  0x25
#define global PF_SSE4_2_INSTRUCTIONS_AVAILABLE  0x26
#define global PF_AVX_INSTRUCTIONS_AVAILABLE  0x27
#define global PF_AVX2_INSTRUCTIONS_AVAILABLE  0x28
#define global PF_AVX512F_INSTRUCTIONS_AVAILABLE  0x29
#define global PF_ERMS_AVAILABLE  0x2a
#define global PF_ARM_V82_DP_INSTRUCTIONS_AVAILABLE  0x2b
#define global PF_ARM_V83_JSCVT_INSTRUCTIONS_AVAILABLE  0x2c
#define global PF_ARM_V83_LRCPC_INSTRUCTIONS_AVAILABLE  0x2d

; PROG_INVOKE_SETTING
#define global ProgressInvokeNever  0x1
#define global ProgressInvokeEveryObject  0x2
#define global ProgressInvokeOnError  0x3
#define global ProgressCancelOperation  0x4
#define global ProgressRetryOperation  0x5
#define global ProgressInvokePrePostError  0x6

; PROPERTYORIGIN
#define global PO_STATE  0x0
#define global PO_PART  0x1
#define global PO_CLASS  0x2
#define global PO_GLOBAL  0x3
#define global PO_NOTFOUND  0x4

; PROPSPEC_KIND
#define global PRSPEC_LPWSTR  0x0
#define global PRSPEC_PROPID  0x1

; PROPVAR_CHANGE_FLAGS
#define global PVCHF_DEFAULT  0x0
#define global PVCHF_NOVALUEPROP  0x1
#define global PVCHF_ALPHABOOL  0x2
#define global PVCHF_NOUSEROVERRIDE  0x4
#define global PVCHF_LOCALBOOL  0x8
#define global PVCHF_NOHEXSTRING  0x10

; PROXY_AUTO_DETECT_TYPE
#define global PROXY_AUTO_DETECT_TYPE_DHCP  0x1
#define global PROXY_AUTO_DETECT_TYPE_DNS_A  0x2

; PSPCB_MESSAGE
#define global PSPCB_ADDREF  0x0
#define global PSPCB_CREATE  0x2
#define global PSPCB_RELEASE  0x1
#define global PSPCB_SI_INITDIALOG  0x401

; PSUACTION
#define global PSU_DEFAULT  0x1
#define global PSU_SECURITY_URL_ONLY  0x2

; PURGE_COMM_FLAGS
#define global PURGE_RXABORT  0x2
#define global PURGE_RXCLEAR  0x8
#define global PURGE_TXABORT  0x1
#define global PURGE_TXCLEAR  0x4

; QUERY_DISPLAY_CONFIG_FLAGS
#define global QDC_ALL_PATHS  0x1
#define global QDC_ONLY_ACTIVE_PATHS  0x2
#define global QDC_DATABASE_CURRENT  0x4
#define global QDC_VIRTUAL_MODE_AWARE  0x10
#define global QDC_INCLUDE_HMD  0x20
#define global QDC_VIRTUAL_REFRESH_RATE_AWARE  0x40

; QUERY_USER_NOTIFICATION_STATE
#define global QUNS_NOT_PRESENT  0x1
#define global QUNS_BUSY  0x2
#define global QUNS_RUNNING_D3D_FULL_SCREEN  0x3
#define global QUNS_PRESENTATION_MODE  0x4
#define global QUNS_ACCEPTS_NOTIFICATIONS  0x5
#define global QUNS_QUIET_TIME  0x6
#define global QUNS_APP  0x7

; QUERYOPTION
#define global QUERY_EXPIRATION_DATE  0x1
#define global QUERY_TIME_OF_LAST_CHANGE  0x2
#define global QUERY_CONTENT_ENCODING  0x3
#define global QUERY_CONTENT_TYPE  0x4
#define global QUERY_REFRESH  0x5
#define global QUERY_RECOMBINE  0x6
#define global QUERY_CAN_NAVIGATE  0x7
#define global QUERY_USES_NETWORK  0x8
#define global QUERY_IS_CACHED  0x9
#define global QUERY_IS_INSTALLEDENTRY  0xa
#define global QUERY_IS_CACHED_OR_MAPPED  0xb
#define global QUERY_USES_CACHE  0xc
#define global QUERY_IS_SECURE  0xd
#define global QUERY_IS_SAFE  0xe
#define global QUERY_USES_HISTORYFOLDER  0xf
#define global QUERY_IS_CACHED_AND_USABLE_OFFLINE  0x10

; QUEUE_STATUS_FLAGS
#define global QS_ALLEVENTS  0x4bf
#define global QS_ALLINPUT  0x4ff
#define global QS_ALLPOSTMESSAGE  0x100
#define global QS_HOTKEY  0x80
#define global QS_INPUT  0x407
#define global QS_KEY  0x1
#define global QS_MOUSE  0x6
#define global QS_MOUSEBUTTON  0x4
#define global QS_MOUSEMOVE  0x2
#define global QS_PAINT  0x20
#define global QS_POSTMESSAGE  0x8
#define global QS_RAWINPUT  0x400
#define global QS_SENDMESSAGE  0x40
#define global QS_TIMER  0x10

; R2_MODE
#define global R2_BLACK  0x1
#define global R2_NOTMERGEPEN  0x2
#define global R2_MASKNOTPEN  0x3
#define global R2_NOTCOPYPEN  0x4
#define global R2_MASKPENNOT  0x5
#define global R2_NOT  0x6
#define global R2_XORPEN  0x7
#define global R2_NOTMASKPEN  0x8
#define global R2_MASKPEN  0x9
#define global R2_NOTXORPEN  0xa
#define global R2_NOP  0xb
#define global R2_MERGENOTPEN  0xc
#define global R2_COPYPEN  0xd
#define global R2_MERGEPENNOT  0xe
#define global R2_MERGEPEN  0xf
#define global R2_WHITE  0x10
#define global R2_LAST  0x10

; RAW_INPUT_DATA_COMMAND_FLAGS
#define global RID_HEADER  0x10000005
#define global RID_INPUT  0x10000003

; RAW_INPUT_DEVICE_INFO_COMMAND
#define global RIDI_PREPARSEDDATA  0x20000005
#define global RIDI_DEVICENAME  0x20000007
#define global RIDI_DEVICEINFO  0x2000000b

; RAWINPUTDEVICE_FLAGS
#define global RIDEV_REMOVE  0x1
#define global RIDEV_EXCLUDE  0x10
#define global RIDEV_PAGEONLY  0x20
#define global RIDEV_NOLEGACY  0x30
#define global RIDEV_INPUTSINK  0x100
#define global RIDEV_CAPTUREMOUSE  0x200
#define global RIDEV_NOHOTKEYS  0x200
#define global RIDEV_APPKEYS  0x400
#define global RIDEV_EXINPUTSINK  0x1000
#define global RIDEV_DEVNOTIFY  0x2000

; READ_DIRECTORY_NOTIFY_INFORMATION_CLASS
#define global ReadDirectoryNotifyInformation  0x1
#define global ReadDirectoryNotifyExtendedInformation  0x2
#define global ReadDirectoryNotifyFullInformation  0x3
#define global ReadDirectoryNotifyMaximumInformation  0x4

; READ_EVENT_LOG_READ_FLAGS
#define global EVENTLOG_SEEK_READ  0x2
#define global EVENTLOG_SEQUENTIAL_READ  0x1

; REDRAW_WINDOW_FLAGS
#define global RDW_INVALIDATE  0x1
#define global RDW_INTERNALPAINT  0x2
#define global RDW_ERASE  0x4
#define global RDW_VALIDATE  0x8
#define global RDW_NOINTERNALPAINT  0x10
#define global RDW_NOERASE  0x20
#define global RDW_NOCHILDREN  0x40
#define global RDW_ALLCHILDREN  0x80
#define global RDW_UPDATENOW  0x100
#define global RDW_ERASENOW  0x200
#define global RDW_FRAME  0x400
#define global RDW_NOFRAME  0x800

; REG_CREATE_KEY_DISPOSITION
#define global REG_CREATED_NEW_KEY  0x1
#define global REG_OPENED_EXISTING_KEY  0x2

; REG_NOTIFY_FILTER
#define global REG_NOTIFY_CHANGE_NAME  0x1
#define global REG_NOTIFY_CHANGE_ATTRIBUTES  0x2
#define global REG_NOTIFY_CHANGE_LAST_SET  0x4
#define global REG_NOTIFY_CHANGE_SECURITY  0x8
#define global REG_NOTIFY_THREAD_AGNOSTIC  0x10000000

; REG_OPEN_CREATE_OPTIONS
#define global REG_OPTION_RESERVED  0x0
#define global REG_OPTION_NON_VOLATILE  0x0
#define global REG_OPTION_VOLATILE  0x1
#define global REG_OPTION_CREATE_LINK  0x2
#define global REG_OPTION_BACKUP_RESTORE  0x4
#define global REG_OPTION_OPEN_LINK  0x8
#define global REG_OPTION_DONT_VIRTUALIZE  0x10

; REG_RESTORE_KEY_FLAGS
#define global REG_FORCE_RESTORE  0x8
#define global REG_WHOLE_HIVE_VOLATILE  0x1

; REG_ROUTINE_FLAGS
#define global RRF_RT_DWORD  0x18
#define global RRF_RT_QWORD  0x48
#define global RRF_RT_REG_NONE  0x1
#define global RRF_RT_REG_SZ  0x2
#define global RRF_RT_REG_EXPAND_SZ  0x4
#define global RRF_RT_REG_BINARY  0x8
#define global RRF_RT_REG_DWORD  0x10
#define global RRF_RT_REG_MULTI_SZ  0x20
#define global RRF_RT_REG_QWORD  0x40
#define global RRF_RT_ANY  0xffff
#define global RRF_SUBKEY_WOW6464KEY  0x10000
#define global RRF_SUBKEY_WOW6432KEY  0x20000
#define global RRF_WOW64_MASK  0x30000
#define global RRF_NOEXPAND  0x10000000
#define global RRF_ZEROONFAILURE  0x20000000

; REG_SAM_FLAGS
#define global KEY_QUERY_VALUE  0x1
#define global KEY_SET_VALUE  0x2
#define global KEY_CREATE_SUB_KEY  0x4
#define global KEY_ENUMERATE_SUB_KEYS  0x8
#define global KEY_NOTIFY  0x10
#define global KEY_CREATE_LINK  0x20
#define global KEY_WOW64_32KEY  0x200
#define global KEY_WOW64_64KEY  0x100
#define global KEY_WOW64_RES  0x300
#define global KEY_READ  0x20019
#define global KEY_WRITE  0x20006
#define global KEY_EXECUTE  0x20019
#define global KEY_ALL_ACCESS  0xf003f

; REG_SAVE_FORMAT
#define global REG_STANDARD_FORMAT  0x1
#define global REG_LATEST_FORMAT  0x2
#define global REG_NO_COMPRESSION  0x4

; REG_VALUE_TYPE
#define global REG_NONE  0x0
#define global REG_SZ  0x1
#define global REG_EXPAND_SZ  0x2
#define global REG_BINARY  0x3
#define global REG_DWORD  0x4
#define global REG_DWORD_LITTLE_ENDIAN  0x4
#define global REG_DWORD_BIG_ENDIAN  0x5
#define global REG_LINK  0x6
#define global REG_MULTI_SZ  0x7
#define global REG_RESOURCE_LIST  0x8
#define global REG_FULL_RESOURCE_DESCRIPTOR  0x9
#define global REG_RESOURCE_REQUIREMENTS_LIST  0xa
#define global REG_QWORD  0xb
#define global REG_QWORD_LITTLE_ENDIAN  0xb

; REGISTER_APPLICATION_RESTART_FLAGS
#define global RESTART_NO_CRASH  0x1
#define global RESTART_NO_HANG  0x2
#define global RESTART_NO_PATCH  0x4
#define global RESTART_NO_REBOOT  0x8

; REGISTER_NOTIFICATION_FLAGS
#define global DEVICE_NOTIFY_SERVICE_HANDLE  0x1
#define global DEVICE_NOTIFY_CALLBACK  0x2
#define global DEVICE_NOTIFY_WINDOW_HANDLE  0x0
#define global DEVICE_NOTIFY_ALL_INTERFACE_CLASSES  0x4

; REGISTER_TOUCH_WINDOW_FLAGS
#define global TWF_FINETOUCH  0x1
#define global TWF_WANTPALM  0x2

; REGKIND
#define global REGKIND_DEFAULT  0x0
#define global REGKIND_REGISTER  0x1
#define global REGKIND_NONE  0x2

; REPLACE_FILE_FLAGS
#define global REPLACEFILE_WRITE_THROUGH  0x1
#define global REPLACEFILE_IGNORE_MERGE_ERRORS  0x2
#define global REPLACEFILE_IGNORE_ACL_ERRORS  0x4

; REPORT_EVENT_TYPE
#define global EVENTLOG_SUCCESS  0x0
#define global EVENTLOG_AUDIT_FAILURE  0x10
#define global EVENTLOG_AUDIT_SUCCESS  0x8
#define global EVENTLOG_ERROR_TYPE  0x1
#define global EVENTLOG_INFORMATION_TYPE  0x4
#define global EVENTLOG_WARNING_TYPE  0x2

; REPORT_STORE_TYPES
#define global E_STORE_USER_ARCHIVE  0x0
#define global E_STORE_USER_QUEUE  0x1
#define global E_STORE_MACHINE_ARCHIVE  0x2
#define global E_STORE_MACHINE_QUEUE  0x3
#define global E_STORE_INVALID  0x4

; RESTRICTIONS
#define global REST_NONE  0x0
#define global REST_NORUN  0x1
#define global REST_NOCLOSE  0x2
#define global REST_NOSAVESET  0x4
#define global REST_NOFILEMENU  0x8
#define global REST_NOSETFOLDERS  0x10
#define global REST_NOSETTASKBAR  0x20
#define global REST_NODESKTOP  0x40
#define global REST_NOFIND  0x80
#define global REST_NODRIVES  0x100
#define global REST_NODRIVEAUTORUN  0x200
#define global REST_NODRIVETYPEAUTORUN  0x400
#define global REST_NONETHOOD  0x800
#define global REST_STARTBANNER  0x1000
#define global REST_RESTRICTRUN  0x2000
#define global REST_NOPRINTERTABS  0x4000
#define global REST_NOPRINTERDELETE  0x8000
#define global REST_NOPRINTERADD  0x10000
#define global REST_NOSTARTMENUSUBFOLDERS  0x20000
#define global REST_MYDOCSONNET  0x40000
#define global REST_NOEXITTODOS  0x80000
#define global REST_ENFORCESHELLEXTSECURITY  0x100000
#define global REST_LINKRESOLVEIGNORELINKINFO  0x200000
#define global REST_NOCOMMONGROUPS  0x400000
#define global REST_SEPARATEDESKTOPPROCESS  0x800000
#define global REST_NOWEB  0x1000000
#define global REST_NOTRAYCONTEXTMENU  0x2000000
#define global REST_NOVIEWCONTEXTMENU  0x4000000
#define global REST_NONETCONNECTDISCONNECT  0x8000000
#define global REST_STARTMENULOGOFF  0x10000000
#define global REST_NOSETTINGSASSIST  0x20000000
#define global REST_NOINTERNETICON  0x40000001
#define global REST_NORECENTDOCSHISTORY  0x40000002
#define global REST_NORECENTDOCSMENU  0x40000003
#define global REST_NOACTIVEDESKTOP  0x40000004
#define global REST_NOACTIVEDESKTOPCHANGES  0x40000005
#define global REST_NOFAVORITESMENU  0x40000006
#define global REST_CLEARRECENTDOCSONEXIT  0x40000007
#define global REST_CLASSICSHELL  0x40000008
#define global REST_NOCUSTOMIZEWEBVIEW  0x40000009
#define global REST_NOHTMLWALLPAPER  0x40000010
#define global REST_NOCHANGINGWALLPAPER  0x40000011
#define global REST_NODESKCOMP  0x40000012
#define global REST_NOADDDESKCOMP  0x40000013
#define global REST_NODELDESKCOMP  0x40000014
#define global REST_NOCLOSEDESKCOMP  0x40000015
#define global REST_NOCLOSE_DRAGDROPBAND  0x40000016
#define global REST_NOMOVINGBAND  0x40000017
#define global REST_NOEDITDESKCOMP  0x40000018
#define global REST_NORESOLVESEARCH  0x40000019
#define global REST_NORESOLVETRACK  0x4000001a
#define global REST_FORCECOPYACLWITHFILE  0x4000001b
#define global REST_NOFORGETSOFTWAREUPDATE  0x4000001d
#define global REST_NOSETACTIVEDESKTOP  0x4000001e
#define global REST_NOUPDATEWINDOWS  0x4000001f
#define global REST_NOCHANGESTARMENU  0x40000020
#define global REST_NOFOLDEROPTIONS  0x40000021
#define global REST_HASFINDCOMPUTERS  0x40000022
#define global REST_INTELLIMENUS  0x40000023
#define global REST_RUNDLGMEMCHECKBOX  0x40000024
#define global REST_ARP_ShowPostSetup  0x40000025
#define global REST_NOCSC  0x40000026
#define global REST_NOCONTROLPANEL  0x40000027
#define global REST_ENUMWORKGROUP  0x40000028
#define global REST_ARP_NOARP  0x40000029
#define global REST_ARP_NOREMOVEPAGE  0x4000002a
#define global REST_ARP_NOADDPAGE  0x4000002b
#define global REST_ARP_NOWINSETUPPAGE  0x4000002c
#define global REST_GREYMSIADS  0x4000002d
#define global REST_NOCHANGEMAPPEDDRIVELABEL  0x4000002e
#define global REST_NOCHANGEMAPPEDDRIVECOMMENT  0x4000002f
#define global REST_MaxRecentDocs  0x40000030
#define global REST_NONETWORKCONNECTIONS  0x40000031
#define global REST_FORCESTARTMENULOGOFF  0x40000032
#define global REST_NOWEBVIEW  0x40000033
#define global REST_NOCUSTOMIZETHISFOLDER  0x40000034
#define global REST_NOENCRYPTION  0x40000035
#define global REST_DONTSHOWSUPERHIDDEN  0x40000037
#define global REST_NOSHELLSEARCHBUTTON  0x40000038
#define global REST_NOHARDWARETAB  0x40000039
#define global REST_NORUNASINSTALLPROMPT  0x4000003a
#define global REST_PROMPTRUNASINSTALLNETPATH  0x4000003b
#define global REST_NOMANAGEMYCOMPUTERVERB  0x4000003c
#define global REST_DISALLOWRUN  0x4000003e
#define global REST_NOWELCOMESCREEN  0x4000003f
#define global REST_RESTRICTCPL  0x40000040
#define global REST_DISALLOWCPL  0x40000041
#define global REST_NOSMBALLOONTIP  0x40000042
#define global REST_NOSMHELP  0x40000043
#define global REST_NOWINKEYS  0x40000044
#define global REST_NOENCRYPTONMOVE  0x40000045
#define global REST_NOLOCALMACHINERUN  0x40000046
#define global REST_NOCURRENTUSERRUN  0x40000047
#define global REST_NOLOCALMACHINERUNONCE  0x40000048
#define global REST_NOCURRENTUSERRUNONCE  0x40000049
#define global REST_FORCEACTIVEDESKTOPON  0x4000004a
#define global REST_NOVIEWONDRIVE  0x4000004c
#define global REST_NONETCRAWL  0x4000004d
#define global REST_NOSHAREDDOCUMENTS  0x4000004e
#define global REST_NOSMMYDOCS  0x4000004f
#define global REST_NOSMMYPICS  0x40000050
#define global REST_ALLOWBITBUCKDRIVES  0x40000051
#define global REST_NONLEGACYSHELLMODE  0x40000052
#define global REST_NOCONTROLPANELBARRICADE  0x40000053
#define global REST_NOSTARTPAGE  0x40000054
#define global REST_NOAUTOTRAYNOTIFY  0x40000055
#define global REST_NOTASKGROUPING  0x40000056
#define global REST_NOCDBURNING  0x40000057
#define global REST_MYCOMPNOPROP  0x40000058
#define global REST_MYDOCSNOPROP  0x40000059
#define global REST_NOSTARTPANEL  0x4000005a
#define global REST_NODISPLAYAPPEARANCEPAGE  0x4000005b
#define global REST_NOTHEMESTAB  0x4000005c
#define global REST_NOVISUALSTYLECHOICE  0x4000005d
#define global REST_NOSIZECHOICE  0x4000005e
#define global REST_NOCOLORCHOICE  0x4000005f
#define global REST_SETVISUALSTYLE  0x40000060
#define global REST_STARTRUNNOHOMEPATH  0x40000061
#define global REST_NOUSERNAMEINSTARTPANEL  0x40000062
#define global REST_NOMYCOMPUTERICON  0x40000063
#define global REST_NOSMNETWORKPLACES  0x40000064
#define global REST_NOSMPINNEDLIST  0x40000065
#define global REST_NOSMMYMUSIC  0x40000066
#define global REST_NOSMEJECTPC  0x40000067
#define global REST_NOSMMOREPROGRAMS  0x40000068
#define global REST_NOSMMFUPROGRAMS  0x40000069
#define global REST_NOTRAYITEMSDISPLAY  0x4000006a
#define global REST_NOTOOLBARSONTASKBAR  0x4000006b
#define global REST_NOSMCONFIGUREPROGRAMS  0x4000006f
#define global REST_HIDECLOCK  0x40000070
#define global REST_NOLOWDISKSPACECHECKS  0x40000071
#define global REST_NOENTIRENETWORK  0x40000072
#define global REST_NODESKTOPCLEANUP  0x40000073
#define global REST_BITBUCKNUKEONDELETE  0x40000074
#define global REST_BITBUCKCONFIRMDELETE  0x40000075
#define global REST_BITBUCKNOPROP  0x40000076
#define global REST_NODISPBACKGROUND  0x40000077
#define global REST_NODISPSCREENSAVEPG  0x40000078
#define global REST_NODISPSETTINGSPG  0x40000079
#define global REST_NODISPSCREENSAVEPREVIEW  0x4000007a
#define global REST_NODISPLAYCPL  0x4000007b
#define global REST_HIDERUNASVERB  0x4000007c
#define global REST_NOTHUMBNAILCACHE  0x4000007d
#define global REST_NOSTRCMPLOGICAL  0x4000007e
#define global REST_NOPUBLISHWIZARD  0x4000007f
#define global REST_NOONLINEPRINTSWIZARD  0x40000080
#define global REST_NOWEBSERVICES  0x40000081
#define global REST_ALLOWUNHASHEDWEBVIEW  0x40000082
#define global REST_ALLOWLEGACYWEBVIEW  0x40000083
#define global REST_REVERTWEBVIEWSECURITY  0x40000084
#define global REST_INHERITCONSOLEHANDLES  0x40000086
#define global REST_NOREMOTERECURSIVEEVENTS  0x40000089
#define global REST_NOREMOTECHANGENOTIFY  0x40000091
#define global REST_NOENUMENTIRENETWORK  0x40000093
#define global REST_NOINTERNETOPENWITH  0x40000095
#define global REST_DONTRETRYBADNETNAME  0x4000009b

; RGN_COMBINE_MODE
#define global RGN_AND  0x1
#define global RGN_OR  0x2
#define global RGN_XOR  0x3
#define global RGN_DIFF  0x4
#define global RGN_COPY  0x5
#define global RGN_MIN  0x1
#define global RGN_MAX  0x5

; RID_DEVICE_INFO_TYPE
#define global RIM_TYPEMOUSE  0x0
#define global RIM_TYPEKEYBOARD  0x1
#define global RIM_TYPEHID  0x2

; RIP_INFO_TYPE
#define global SLE_ERROR  0x1
#define global SLE_MINORERROR  0x2
#define global SLE_WARNING  0x3

; ROP_CODE
#define global BLACKNESS  0x42
#define global NOTSRCERASE  0x1100a6
#define global NOTSRCCOPY  0x330008
#define global SRCERASE  0x440328
#define global DSTINVERT  0x550009
#define global PATINVERT  0x5a0049
#define global SRCINVERT  0x660046
#define global SRCAND  0x8800c6
#define global MERGEPAINT  0xbb0226
#define global MERGECOPY  0xc000ca
#define global SRCCOPY  0xcc0020
#define global SRCPAINT  0xee0086
#define global PATCOPY  0xf00021
#define global PATPAINT  0xfb0a09
#define global WHITENESS  0xff0062
#define global CAPTUREBLT  0x40000000
#define global NOMIRRORBITMAP  0x80000000

; ROT_FLAGS
#define global ROTFLAGS_REGISTRATIONKEEPSALIVE  0x1
#define global ROTFLAGS_ALLOWANYCLIENT  0x2

; RotateFlipType
#define global RotateNoneFlipNone  0x0
#define global Rotate90FlipNone  0x1
#define global Rotate180FlipNone  0x2
#define global Rotate270FlipNone  0x3
#define global RotateNoneFlipX  0x4
#define global Rotate90FlipX  0x5
#define global Rotate180FlipX  0x6
#define global Rotate270FlipX  0x7
#define global RotateNoneFlipY  0x6
#define global Rotate90FlipY  0x7
#define global Rotate180FlipY  0x4
#define global Rotate270FlipY  0x5
#define global RotateNoneFlipXY  0x2
#define global Rotate90FlipXY  0x3
#define global Rotate180FlipXY  0x0
#define global Rotate270FlipXY  0x1

; RTL_UMS_SCHEDULER_REASON
#define global UmsSchedulerStartup  0x0
#define global UmsSchedulerThreadBlocked  0x1
#define global UmsSchedulerThreadYield  0x2

; SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS
#define global SAFER_TOKEN_NULL_IF_EQUAL  0x1
#define global SAFER_TOKEN_COMPARE_ONLY  0x2
#define global SAFER_TOKEN_MAKE_INERT  0x4
#define global SAFER_TOKEN_WANT_FLAGS  0x8

; SAFER_OBJECT_INFO_CLASS
#define global SaferObjectLevelId  0x1
#define global SaferObjectScopeId  0x2
#define global SaferObjectFriendlyName  0x3
#define global SaferObjectDescription  0x4
#define global SaferObjectBuiltin  0x5
#define global SaferObjectDisallowed  0x6
#define global SaferObjectDisableMaxPrivilege  0x7
#define global SaferObjectInvertDeletedPrivileges  0x8
#define global SaferObjectDeletedPrivileges  0x9
#define global SaferObjectDefaultOwner  0xa
#define global SaferObjectSidsToDisable  0xb
#define global SaferObjectRestrictedSidsInverted  0xc
#define global SaferObjectRestrictedSidsAdded  0xd
#define global SaferObjectAllIdentificationGuids  0xe
#define global SaferObjectSingleIdentification  0xf
#define global SaferObjectExtendedError  0x10

; SAFER_POLICY_INFO_CLASS
#define global SaferPolicyLevelList  0x1
#define global SaferPolicyEnableTransparentEnforcement  0x2
#define global SaferPolicyDefaultLevel  0x3
#define global SaferPolicyEvaluateUserScope  0x4
#define global SaferPolicyScopeFlags  0x5
#define global SaferPolicyDefaultLevelFlags  0x6
#define global SaferPolicyAuthenticodeEnabled  0x7

; SC_ENUM_TYPE
#define global SC_ENUM_PROCESS_INFO  0x0

; SC_STATUS_TYPE
#define global SC_STATUS_PROCESS_INFO  0x0

; SCNRT_STATUS
#define global SCNRT_ENABLE  0x0
#define global SCNRT_DISABLE  0x1

; SCROLL_WINDOW_FLAGS
#define global SW_SCROLLCHILDREN  0x1
#define global SW_INVALIDATE  0x2
#define global SW_ERASE  0x4
#define global SW_SMOOTHSCROLL  0x10

; SCROLLBAR_CONSTANTS
#define global SB_CTL  0x2
#define global SB_HORZ  0x0
#define global SB_VERT  0x1
#define global SB_BOTH  0x3

; SCROLLINFO_MASK
#define global SIF_ALL  0x17
#define global SIF_DISABLENOSCROLL  0x8
#define global SIF_PAGE  0x2
#define global SIF_POS  0x4
#define global SIF_RANGE  0x1
#define global SIF_TRACKPOS  0x10

; SE_OBJECT_TYPE
#define global SE_UNKNOWN_OBJECT_TYPE  0x0
#define global SE_FILE_OBJECT  0x1
#define global SE_SERVICE  0x2
#define global SE_PRINTER  0x3
#define global SE_REGISTRY_KEY  0x4
#define global SE_LMSHARE  0x5
#define global SE_KERNEL_OBJECT  0x6
#define global SE_WINDOW_OBJECT  0x7
#define global SE_DS_OBJECT  0x8
#define global SE_DS_OBJECT_ALL  0x9
#define global SE_PROVIDER_DEFINED_OBJECT  0xa
#define global SE_WMIGUID_OBJECT  0xb
#define global SE_REGISTRY_WOW64_32KEY  0xc
#define global SE_REGISTRY_WOW64_64KEY  0xd

; SECURITY_AUTO_INHERIT_FLAGS
#define global SEF_AVOID_OWNER_CHECK  0x10
#define global SEF_AVOID_OWNER_RESTRICTION  0x1000
#define global SEF_AVOID_PRIVILEGE_CHECK  0x8
#define global SEF_DACL_AUTO_INHERIT  0x1
#define global SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT  0x4
#define global SEF_DEFAULT_GROUP_FROM_PARENT  0x40
#define global SEF_DEFAULT_OWNER_FROM_PARENT  0x20
#define global SEF_MACL_NO_EXECUTE_UP  0x400
#define global SEF_MACL_NO_READ_UP  0x200
#define global SEF_MACL_NO_WRITE_UP  0x100
#define global SEF_SACL_AUTO_INHERIT  0x2

; SECURITY_DESCRIPTOR_CONTROL
#define global SE_OWNER_DEFAULTED  0x1
#define global SE_GROUP_DEFAULTED  0x2
#define global SE_DACL_PRESENT  0x4
#define global SE_DACL_DEFAULTED  0x8
#define global SE_SACL_PRESENT  0x10
#define global SE_SACL_DEFAULTED  0x20
#define global SE_DACL_AUTO_INHERIT_REQ  0x100
#define global SE_SACL_AUTO_INHERIT_REQ  0x200
#define global SE_DACL_AUTO_INHERITED  0x400
#define global SE_SACL_AUTO_INHERITED  0x800
#define global SE_DACL_PROTECTED  0x1000
#define global SE_SACL_PROTECTED  0x2000
#define global SE_RM_CONTROL_VALID  0x4000
#define global SE_SELF_RELATIVE  0x8000

; SECURITY_IMPERSONATION_LEVEL
#define global SecurityAnonymous  0x0
#define global SecurityIdentification  0x1
#define global SecurityImpersonation  0x2
#define global SecurityDelegation  0x3

; SEND_MESSAGE_TIMEOUT_FLAGS
#define global SMTO_ABORTIFHUNG  0x2
#define global SMTO_BLOCK  0x1
#define global SMTO_NORMAL  0x0
#define global SMTO_NOTIMEOUTIFNOTHUNG  0x8
#define global SMTO_ERRORONEXIT  0x20

; SERVICE_CONFIG
#define global SERVICE_CONFIG_DELAYED_AUTO_START_INFO  0x3
#define global SERVICE_CONFIG_DESCRIPTION  0x1
#define global SERVICE_CONFIG_FAILURE_ACTIONS  0x2
#define global SERVICE_CONFIG_FAILURE_ACTIONS_FLAG  0x4
#define global SERVICE_CONFIG_PREFERRED_NODE  0x9
#define global SERVICE_CONFIG_PRESHUTDOWN_INFO  0x7
#define global SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO  0x6
#define global SERVICE_CONFIG_SERVICE_SID_INFO  0x5
#define global SERVICE_CONFIG_TRIGGER_INFO  0x8
#define global SERVICE_CONFIG_LAUNCH_PROTECTED  0xc

; SERVICE_ERROR
#define global SERVICE_ERROR_CRITICAL  0x3
#define global SERVICE_ERROR_IGNORE  0x0
#define global SERVICE_ERROR_NORMAL  0x1
#define global SERVICE_ERROR_SEVERE  0x2

; SERVICE_NOTIFY
#define global SERVICE_NOTIFY_CREATED  0x80
#define global SERVICE_NOTIFY_CONTINUE_PENDING  0x10
#define global SERVICE_NOTIFY_DELETE_PENDING  0x200
#define global SERVICE_NOTIFY_DELETED  0x100
#define global SERVICE_NOTIFY_PAUSE_PENDING  0x20
#define global SERVICE_NOTIFY_PAUSED  0x40
#define global SERVICE_NOTIFY_RUNNING  0x8
#define global SERVICE_NOTIFY_START_PENDING  0x2
#define global SERVICE_NOTIFY_STOP_PENDING  0x4
#define global SERVICE_NOTIFY_STOPPED  0x1

; SERVICE_RUNS_IN_PROCESS
#define global SERVICE_RUNS_IN_NON_SYSTEM_OR_NOT_RUNNING  0x0
#define global SERVICE_RUNS_IN_SYSTEM_PROCESS  0x1

; SERVICE_START_TYPE
#define global SERVICE_AUTO_START  0x2
#define global SERVICE_BOOT_START  0x0
#define global SERVICE_DEMAND_START  0x3
#define global SERVICE_DISABLED  0x4
#define global SERVICE_SYSTEM_START  0x1

; SERVICE_STATUS_CURRENT_STATE
#define global SERVICE_CONTINUE_PENDING  0x5
#define global SERVICE_PAUSE_PENDING  0x6
#define global SERVICE_PAUSED  0x7
#define global SERVICE_RUNNING  0x4
#define global SERVICE_START_PENDING  0x2
#define global SERVICE_STOP_PENDING  0x3
#define global SERVICE_STOPPED  0x1

; SET_BOUNDS_RECT_FLAGS
#define global DCB_ACCUMULATE  0x2
#define global DCB_DISABLE  0x8
#define global DCB_ENABLE  0x4
#define global DCB_RESET  0x1

; SET_COMPOSITION_STRING_TYPE
#define global SCS_SETSTR  0x9
#define global SCS_CHANGEATTR  0x12
#define global SCS_CHANGECLAUSE  0x24
#define global SCS_SETRECONVERTSTRING  0x10000
#define global SCS_QUERYRECONVERTSTRING  0x20000

; SET_DISPLAY_CONFIG_FLAGS
#define global SDC_USE_DATABASE_CURRENT  0xf
#define global SDC_TOPOLOGY_INTERNAL  0x1
#define global SDC_TOPOLOGY_CLONE  0x2
#define global SDC_TOPOLOGY_EXTEND  0x4
#define global SDC_TOPOLOGY_EXTERNAL  0x8
#define global SDC_TOPOLOGY_SUPPLIED  0x10
#define global SDC_USE_SUPPLIED_DISPLAY_CONFIG  0x20
#define global SDC_VALIDATE  0x40
#define global SDC_APPLY  0x80
#define global SDC_NO_OPTIMIZATION  0x100
#define global SDC_SAVE_TO_DATABASE  0x200
#define global SDC_ALLOW_CHANGES  0x400
#define global SDC_PATH_PERSIST_IF_REQUIRED  0x800
#define global SDC_FORCE_MODE_ENUMERATION  0x1000
#define global SDC_ALLOW_PATH_ORDER_CHANGES  0x2000
#define global SDC_VIRTUAL_MODE_AWARE  0x8000
#define global SDC_VIRTUAL_REFRESH_RATE_AWARE  0x20000

; SET_FILE_POINTER_MOVE_METHOD
#define global FILE_BEGIN  0x0
#define global FILE_CURRENT  0x1
#define global FILE_END  0x2

; SET_THEME_APP_PROPERTIES_FLAGS
#define global ALLOW_NONCLIENT  0x1
#define global ALLOW_CONTROLS  0x2
#define global ALLOW_WEBCONTENT  0x4
#define global VALIDBITS  0x7

; SET_WINDOW_POS_FLAGS
#define global SWP_ASYNCWINDOWPOS  0x4000
#define global SWP_DEFERERASE  0x2000
#define global SWP_DRAWFRAME  0x20
#define global SWP_FRAMECHANGED  0x20
#define global SWP_HIDEWINDOW  0x80
#define global SWP_NOACTIVATE  0x10
#define global SWP_NOCOPYBITS  0x100
#define global SWP_NOMOVE  0x2
#define global SWP_NOOWNERZORDER  0x200
#define global SWP_NOREDRAW  0x8
#define global SWP_NOREPOSITION  0x200
#define global SWP_NOSENDCHANGING  0x400
#define global SWP_NOSIZE  0x1
#define global SWP_NOZORDER  0x4
#define global SWP_SHOWWINDOW  0x40

; SETPROCESSWORKINGSETSIZEEX_FLAGS
#define global QUOTA_LIMITS_HARDWS_MIN_ENABLE  0x1
#define global QUOTA_LIMITS_HARDWS_MIN_DISABLE  0x2
#define global QUOTA_LIMITS_HARDWS_MAX_ENABLE  0x4
#define global QUOTA_LIMITS_HARDWS_MAX_DISABLE  0x8

; SETTINGSTATUS
#define global RSOPUnspecified  0x0
#define global RSOPApplied  0x1
#define global RSOPIgnored  0x2
#define global RSOPFailed  0x3
#define global RSOPSubsettingFailed  0x4

; SFGAO_FLAGS
#define global SFGAO_CANCOPY  0x1
#define global SFGAO_CANMOVE  0x2
#define global SFGAO_CANLINK  0x4
#define global SFGAO_STORAGE  0x8
#define global SFGAO_CANRENAME  0x10
#define global SFGAO_CANDELETE  0x20
#define global SFGAO_HASPROPSHEET  0x40
#define global SFGAO_DROPTARGET  0x100
#define global SFGAO_CAPABILITYMASK  0x177
#define global SFGAO_PLACEHOLDER  0x800
#define global SFGAO_SYSTEM  0x1000
#define global SFGAO_ENCRYPTED  0x2000
#define global SFGAO_ISSLOW  0x4000
#define global SFGAO_GHOSTED  0x8000
#define global SFGAO_LINK  0x10000
#define global SFGAO_SHARE  0x20000
#define global SFGAO_READONLY  0x40000
#define global SFGAO_HIDDEN  0x80000
#define global SFGAO_DISPLAYATTRMASK  0xfc000
#define global SFGAO_FILESYSANCESTOR  0x10000000
#define global SFGAO_FOLDER  0x20000000
#define global SFGAO_FILESYSTEM  0x40000000
#define global SFGAO_HASSUBFOLDER  0x80000000
#define global SFGAO_CONTENTSMASK  0x80000000
#define global SFGAO_VALIDATE  0x1000000
#define global SFGAO_REMOVABLE  0x2000000
#define global SFGAO_COMPRESSED  0x4000000
#define global SFGAO_BROWSABLE  0x8000000
#define global SFGAO_NONENUMERATED  0x100000
#define global SFGAO_NEWCONTENT  0x200000
#define global SFGAO_CANMONIKER  0x400000
#define global SFGAO_HASSTORAGE  0x400000
#define global SFGAO_STREAM  0x400000
#define global SFGAO_STORAGEANCESTOR  0x800000
#define global SFGAO_STORAGECAPMASK  0x70c50008
#define global SFGAO_PKEYSFGAOMASK  0x81044000

; SHCNE_ID
#define global SHCNE_RENAMEITEM  0x1
#define global SHCNE_CREATE  0x2
#define global SHCNE_DELETE  0x4
#define global SHCNE_MKDIR  0x8
#define global SHCNE_RMDIR  0x10
#define global SHCNE_MEDIAINSERTED  0x20
#define global SHCNE_MEDIAREMOVED  0x40
#define global SHCNE_DRIVEREMOVED  0x80
#define global SHCNE_DRIVEADD  0x100
#define global SHCNE_NETSHARE  0x200
#define global SHCNE_NETUNSHARE  0x400
#define global SHCNE_ATTRIBUTES  0x800
#define global SHCNE_UPDATEDIR  0x1000
#define global SHCNE_UPDATEITEM  0x2000
#define global SHCNE_SERVERDISCONNECT  0x4000
#define global SHCNE_UPDATEIMAGE  0x8000
#define global SHCNE_DRIVEADDGUI  0x10000
#define global SHCNE_RENAMEFOLDER  0x20000
#define global SHCNE_FREESPACE  0x40000
#define global SHCNE_EXTENDED_EVENT  0x4000000
#define global SHCNE_ASSOCCHANGED  0x8000000
#define global SHCNE_DISKEVENTS  0x2381f
#define global SHCNE_GLOBALEVENTS  0xc0581e0
#define global SHCNE_ALLEVENTS  0x7fffffff
#define global SHCNE_INTERRUPT  0x80000000

; SHCNF_FLAGS
#define global SHCNF_IDLIST  0x0
#define global SHCNF_PATHA  0x1
#define global SHCNF_PRINTERA  0x2
#define global SHCNF_DWORD  0x3
#define global SHCNF_PATHW  0x5
#define global SHCNF_PRINTERW  0x6
#define global SHCNF_TYPE  0xff
#define global SHCNF_FLUSH  0x1000
#define global SHCNF_FLUSHNOWAIT  0x3000
#define global SHCNF_NOTIFYRECURSIVE  0x10000
#define global SHCNF_PATH  0x5
#define global SHCNF_PRINTER  0x6

; SHCNRF_SOURCE
#define global SHCNRF_InterruptLevel  0x1
#define global SHCNRF_ShellLevel  0x2
#define global SHCNRF_RecursiveInterrupt  0x1000
#define global SHCNRF_NewDelivery  0x8000

; SHFMT_ID
#define global SHFMT_ID_DEFAULT  0xffff

; SHFMT_OPT
#define global SHFMT_OPT_NONE  0x0
#define global SHFMT_OPT_FULL  0x1
#define global SHFMT_OPT_SYSONLY  0x2

; SHGDFIL_FORMAT
#define global SHGDFIL_FINDDATA  0x1
#define global SHGDFIL_NETRESOURCE  0x2
#define global SHGDFIL_DESCRIPTIONID  0x3

; SHGDNF
#define global SHGDN_NORMAL  0x0
#define global SHGDN_INFOLDER  0x1
#define global SHGDN_FOREDITING  0x1000
#define global SHGDN_FORADDRESSBAR  0x4000
#define global SHGDN_FORPARSING  0x8000

; SHOP_TYPE
#define global SHOP_PRINTERNAME  0x1
#define global SHOP_FILEPATH  0x2
#define global SHOP_VOLUMEGUID  0x4

; SHOW_WINDOW_CMD
#define global SW_HIDE  0x0
#define global SW_SHOWNORMAL  0x1
#define global SW_NORMAL  0x1
#define global SW_SHOWMINIMIZED  0x2
#define global SW_SHOWMAXIMIZED  0x3
#define global SW_MAXIMIZE  0x3
#define global SW_SHOWNOACTIVATE  0x4
#define global SW_SHOW  0x5
#define global SW_MINIMIZE  0x6
#define global SW_SHOWMINNOACTIVE  0x7
#define global SW_SHOWNA  0x8
#define global SW_RESTORE  0x9
#define global SW_SHOWDEFAULT  0xa
#define global SW_FORCEMINIMIZE  0xb
#define global SW_MAX  0xb

; SHUTDOWN_FLAGS
#define global SHUTDOWN_FORCE_OTHERS  0x1
#define global SHUTDOWN_FORCE_SELF  0x2
#define global SHUTDOWN_RESTART  0x4
#define global SHUTDOWN_POWEROFF  0x8
#define global SHUTDOWN_NOREBOOT  0x10
#define global SHUTDOWN_GRACE_OVERRIDE  0x20
#define global SHUTDOWN_INSTALL_UPDATES  0x40
#define global SHUTDOWN_RESTARTAPPS  0x80
#define global SHUTDOWN_SKIP_SVC_PRESHUTDOWN  0x100
#define global SHUTDOWN_HYBRID  0x200
#define global SHUTDOWN_RESTART_BOOTOPTIONS  0x400
#define global SHUTDOWN_SOFT_REBOOT  0x800
#define global SHUTDOWN_MOBILE_UI  0x1000
#define global SHUTDOWN_ARSO  0x2000
#define global SHUTDOWN_CHECK_SAFE_FOR_SERVER  0x4000
#define global SHUTDOWN_VAIL_CONTAINER  0x8000
#define global SHUTDOWN_SYSTEM_INITIATED  0x10000

; SHUTDOWN_REASON
#define global SHTDN_REASON_NONE  0x0
#define global SHTDN_REASON_FLAG_COMMENT_REQUIRED  0x1000000
#define global SHTDN_REASON_FLAG_DIRTY_PROBLEM_ID_REQUIRED  0x2000000
#define global SHTDN_REASON_FLAG_CLEAN_UI  0x4000000
#define global SHTDN_REASON_FLAG_DIRTY_UI  0x8000000
#define global SHTDN_REASON_FLAG_MOBILE_UI_RESERVED  0x10000000
#define global SHTDN_REASON_FLAG_USER_DEFINED  0x40000000
#define global SHTDN_REASON_FLAG_PLANNED  0x80000000
#define global SHTDN_REASON_MAJOR_OTHER  0x0
#define global SHTDN_REASON_MAJOR_NONE  0x0
#define global SHTDN_REASON_MAJOR_HARDWARE  0x10000
#define global SHTDN_REASON_MAJOR_OPERATINGSYSTEM  0x20000
#define global SHTDN_REASON_MAJOR_SOFTWARE  0x30000
#define global SHTDN_REASON_MAJOR_APPLICATION  0x40000
#define global SHTDN_REASON_MAJOR_SYSTEM  0x50000
#define global SHTDN_REASON_MAJOR_POWER  0x60000
#define global SHTDN_REASON_MAJOR_LEGACY_API  0x70000
#define global SHTDN_REASON_MINOR_OTHER  0x0
#define global SHTDN_REASON_MINOR_NONE  0xff
#define global SHTDN_REASON_MINOR_MAINTENANCE  0x1
#define global SHTDN_REASON_MINOR_INSTALLATION  0x2
#define global SHTDN_REASON_MINOR_UPGRADE  0x3
#define global SHTDN_REASON_MINOR_RECONFIG  0x4
#define global SHTDN_REASON_MINOR_HUNG  0x5
#define global SHTDN_REASON_MINOR_UNSTABLE  0x6
#define global SHTDN_REASON_MINOR_DISK  0x7
#define global SHTDN_REASON_MINOR_PROCESSOR  0x8
#define global SHTDN_REASON_MINOR_NETWORKCARD  0x9
#define global SHTDN_REASON_MINOR_POWER_SUPPLY  0xa
#define global SHTDN_REASON_MINOR_CORDUNPLUGGED  0xb
#define global SHTDN_REASON_MINOR_ENVIRONMENT  0xc
#define global SHTDN_REASON_MINOR_HARDWARE_DRIVER  0xd
#define global SHTDN_REASON_MINOR_OTHERDRIVER  0xe
#define global SHTDN_REASON_MINOR_BLUESCREEN  0xf
#define global SHTDN_REASON_MINOR_SERVICEPACK  0x10
#define global SHTDN_REASON_MINOR_HOTFIX  0x11
#define global SHTDN_REASON_MINOR_SECURITYFIX  0x12
#define global SHTDN_REASON_MINOR_SECURITY  0x13
#define global SHTDN_REASON_MINOR_NETWORK_CONNECTIVITY  0x14
#define global SHTDN_REASON_MINOR_WMI  0x15
#define global SHTDN_REASON_MINOR_SERVICEPACK_UNINSTALL  0x16
#define global SHTDN_REASON_MINOR_HOTFIX_UNINSTALL  0x17
#define global SHTDN_REASON_MINOR_SECURITYFIX_UNINSTALL  0x18
#define global SHTDN_REASON_MINOR_MMC  0x19
#define global SHTDN_REASON_MINOR_SYSTEMRESTORE  0x1a
#define global SHTDN_REASON_MINOR_TERMSRV  0x20
#define global SHTDN_REASON_MINOR_DC_PROMOTION  0x21
#define global SHTDN_REASON_MINOR_DC_DEMOTION  0x22
#define global SHTDN_REASON_UNKNOWN  0xff
#define global SHTDN_REASON_LEGACY_API  0x80070000
#define global SHTDN_REASON_VALID_BIT_MASK  0xc0ffffff

; SIATTRIBFLAGS
#define global SIATTRIBFLAGS_AND  0x1
#define global SIATTRIBFLAGS_OR  0x2
#define global SIATTRIBFLAGS_APPCOMPAT  0x3
#define global SIATTRIBFLAGS_MASK  0x3
#define global SIATTRIBFLAGS_ALLITEMS  0x4000

; SID_NAME_USE
#define global SidTypeUser  0x1
#define global SidTypeGroup  0x2
#define global SidTypeDomain  0x3
#define global SidTypeAlias  0x4
#define global SidTypeWellKnownGroup  0x5
#define global SidTypeDeletedAccount  0x6
#define global SidTypeInvalid  0x7
#define global SidTypeUnknown  0x8
#define global SidTypeComputer  0x9
#define global SidTypeLabel  0xa
#define global SidTypeLogonSession  0xb

; SIGDN
#define global SIGDN_NORMALDISPLAY  0x0
#define global SIGDN_PARENTRELATIVEPARSING  -2147385343
#define global SIGDN_DESKTOPABSOLUTEPARSING  -2147319808
#define global SIGDN_PARENTRELATIVEEDITING  -2147282943
#define global SIGDN_DESKTOPABSOLUTEEDITING  -2147172352
#define global SIGDN_FILESYSPATH  -2147123200
#define global SIGDN_URL  -2147057664
#define global SIGDN_PARENTRELATIVEFORADDRESSBAR  -2146975743
#define global SIGDN_PARENTRELATIVE  -2146959359
#define global SIGDN_PARENTRELATIVEFORUI  -2146877439

; SmoothingMode
#define global SmoothingModeInvalid  -1
#define global SmoothingModeDefault  0x0
#define global SmoothingModeHighSpeed  0x1
#define global SmoothingModeHighQuality  0x2
#define global SmoothingModeNone  0x3
#define global SmoothingModeAntiAlias  0x4
#define global SmoothingModeAntiAlias8x4  0x4
#define global SmoothingModeAntiAlias8x8  0x5

; SND_FLAGS
#define global SND_APPLICATION  0x80
#define global SND_ALIAS  0x10000
#define global SND_ALIAS_ID  0x110000
#define global SND_FILENAME  0x20000
#define global SND_RESOURCE  0x40004
#define global SND_ASYNC  0x1
#define global SND_NODEFAULT  0x2
#define global SND_LOOP  0x8
#define global SND_MEMORY  0x4
#define global SND_NOSTOP  0x10
#define global SND_NOWAIT  0x2000
#define global SND_PURGE  0x40
#define global SND_SENTRY  0x80000
#define global SND_SYNC  0x0
#define global SND_SYSTEM  0x200000

; SPACTION
#define global SPACTION_NONE  0x0
#define global SPACTION_MOVING  0x1
#define global SPACTION_COPYING  0x2
#define global SPACTION_RECYCLING  0x3
#define global SPACTION_APPLYINGATTRIBS  0x4
#define global SPACTION_DOWNLOADING  0x5
#define global SPACTION_SEARCHING_INTERNET  0x6
#define global SPACTION_CALCULATING  0x7
#define global SPACTION_UPLOADING  0x8
#define global SPACTION_SEARCHING_FILES  0x9
#define global SPACTION_DELETING  0xa
#define global SPACTION_RENAMING  0xb
#define global SPACTION_FORMATTING  0xc
#define global SPACTION_COPY_MOVING  0xd

; SSF_MASK
#define global SSF_SHOWALLOBJECTS  0x1
#define global SSF_SHOWEXTENSIONS  0x2
#define global SSF_HIDDENFILEEXTS  0x4
#define global SSF_SERVERADMINUI  0x4
#define global SSF_SHOWCOMPCOLOR  0x8
#define global SSF_SORTCOLUMNS  0x10
#define global SSF_SHOWSYSFILES  0x20
#define global SSF_DOUBLECLICKINWEBVIEW  0x80
#define global SSF_SHOWATTRIBCOL  0x100
#define global SSF_DESKTOPHTML  0x200
#define global SSF_WIN95CLASSIC  0x400
#define global SSF_DONTPRETTYPATH  0x800
#define global SSF_SHOWINFOTIP  0x2000
#define global SSF_MAPNETDRVBUTTON  0x1000
#define global SSF_NOCONFIRMRECYCLE  0x8000
#define global SSF_HIDEICONS  0x4000
#define global SSF_FILTER  0x10000
#define global SSF_WEBVIEW  0x20000
#define global SSF_SHOWSUPERHIDDEN  0x40000
#define global SSF_SEPPROCESS  0x80000
#define global SSF_NONETCRAWLING  0x100000
#define global SSF_STARTPANELON  0x200000
#define global SSF_SHOWSTARTPAGE  0x400000
#define global SSF_AUTOCHECKSELECT  0x800000
#define global SSF_ICONSONLY  0x1000000
#define global SSF_SHOWTYPEOVERLAY  0x2000000
#define global SSF_SHOWSTATUSBAR  0x4000000

; STARTUPINFOW_FLAGS
#define global STARTF_FORCEONFEEDBACK  0x40
#define global STARTF_FORCEOFFFEEDBACK  0x80
#define global STARTF_PREVENTPINNING  0x2000
#define global STARTF_RUNFULLSCREEN  0x20
#define global STARTF_TITLEISAPPID  0x1000
#define global STARTF_TITLEISLINKNAME  0x800
#define global STARTF_UNTRUSTEDSOURCE  0x8000
#define global STARTF_USECOUNTCHARS  0x8
#define global STARTF_USEFILLATTRIBUTE  0x10
#define global STARTF_USEHOTKEY  0x200
#define global STARTF_USEPOSITION  0x4
#define global STARTF_USESHOWWINDOW  0x1
#define global STARTF_USESIZE  0x2
#define global STARTF_USESTDHANDLES  0x100

; Status
#define global Ok  0x0
#define global GenericError  0x1
#define global InvalidParameter  0x2
#define global OutOfMemory  0x3
#define global ObjectBusy  0x4
#define global InsufficientBuffer  0x5
#define global NotImplemented  0x6
#define global Win32Error  0x7
#define global WrongState  0x8
#define global Aborted  0x9
#define global FileNotFound  0xa
#define global ValueOverflow  0xb
#define global AccessDenied  0xc
#define global UnknownImageFormat  0xd
#define global FontFamilyNotFound  0xe
#define global FontStyleNotFound  0xf
#define global NotTrueTypeFont  0x10
#define global UnsupportedGdiplusVersion  0x11
#define global GdiplusNotInitialized  0x12
#define global PropertyNotFound  0x13
#define global PropertyNotSupported  0x14
#define global ProfileNotFound  0x15

; STD_HANDLE
#define global STD_INPUT_HANDLE  0xfffffff6
#define global STD_OUTPUT_HANDLE  0xfffffff5
#define global STD_ERROR_HANDLE  0xfffffff4

; STGFMT
#define global STGFMT_STORAGE  0x0
#define global STGFMT_NATIVE  0x1
#define global STGFMT_FILE  0x3
#define global STGFMT_ANY  0x4
#define global STGFMT_DOCFILE  0x5
#define global STGFMT_DOCUMENT  0x0

; STGM
#define global STGM_DIRECT  0x0
#define global STGM_TRANSACTED  0x10000
#define global STGM_SIMPLE  0x8000000
#define global STGM_READ  0x0
#define global STGM_WRITE  0x1
#define global STGM_READWRITE  0x2
#define global STGM_SHARE_DENY_NONE  0x40
#define global STGM_SHARE_DENY_READ  0x30
#define global STGM_SHARE_DENY_WRITE  0x20
#define global STGM_SHARE_EXCLUSIVE  0x10
#define global STGM_PRIORITY  0x40000
#define global STGM_DELETEONRELEASE  0x4000000
#define global STGM_NOSCRATCH  0x100000
#define global STGM_CREATE  0x1000
#define global STGM_CONVERT  0x20000
#define global STGM_FAILIFTHERE  0x0
#define global STGM_NOSNAPSHOT  0x200000
#define global STGM_DIRECT_SWMR  0x400000

; STREAM_INFO_LEVELS
#define global FindStreamInfoStandard  0x0
#define global FindStreamInfoMaxInfoLevel  0x1

; STRETCH_BLT_MODE
#define global BLACKONWHITE  0x1
#define global COLORONCOLOR  0x3
#define global HALFTONE  0x4
#define global STRETCH_ANDSCANS  0x1
#define global STRETCH_DELETESCANS  0x3
#define global STRETCH_HALFTONE  0x4
#define global STRETCH_ORSCANS  0x2
#define global WHITEONBLACK  0x2

; StringAlignment
#define global StringAlignmentNear  0x0
#define global StringAlignmentCenter  0x1
#define global StringAlignmentFar  0x2

; StringDigitSubstitute
#define global StringDigitSubstituteUser  0x0
#define global StringDigitSubstituteNone  0x1
#define global StringDigitSubstituteNational  0x2
#define global StringDigitSubstituteTraditional  0x3

; StringTrimming
#define global StringTrimmingNone  0x0
#define global StringTrimmingCharacter  0x1
#define global StringTrimmingWord  0x2
#define global StringTrimmingEllipsisCharacter  0x3
#define global StringTrimmingEllipsisWord  0x4
#define global StringTrimmingEllipsisPath  0x5

; SYM_FIND_ID_OPTION
#define global SSRVOPT_DWORD  0x2
#define global SSRVOPT_DWORDPTR  0x4
#define global SSRVOPT_GUIDPTR  0x8

; SYM_LOAD_FLAGS
#define global SLMFLAG_NONE  0x0
#define global SLMFLAG_VIRTUAL  0x1
#define global SLMFLAG_ALT_INDEX  0x2
#define global SLMFLAG_NO_SYMBOLS  0x4

; SYM_SRV_STORE_FILE_FLAGS
#define global SYMSTOREOPT_COMPRESS  0x1
#define global SYMSTOREOPT_OVERWRITE  0x2
#define global SYMSTOREOPT_PASS_IF_EXISTS  0x40
#define global SYMSTOREOPT_POINTER  0x8
#define global SYMSTOREOPT_RETURNINDEX  0x4

; SYM_TYPE
#define global SymNone  0x0
#define global SymCoff  0x1
#define global SymCv  0x2
#define global SymPdb  0x3
#define global SymExport  0x4
#define global SymDeferred  0x5
#define global SymSym  0x6
#define global SymDia  0x7
#define global SymVirtual  0x8
#define global NumSymTypes  0x9

; SYMBOL_INFO_FLAGS
#define global SYMFLAG_CLR_TOKEN  0x40000
#define global SYMFLAG_CONSTANT  0x100
#define global SYMFLAG_EXPORT  0x200
#define global SYMFLAG_FORWARDER  0x400
#define global SYMFLAG_FRAMEREL  0x20
#define global SYMFLAG_FUNCTION  0x800
#define global SYMFLAG_ILREL  0x10000
#define global SYMFLAG_LOCAL  0x80
#define global SYMFLAG_METADATA  0x20000
#define global SYMFLAG_PARAMETER  0x40
#define global SYMFLAG_REGISTER  0x8
#define global SYMFLAG_REGREL  0x10
#define global SYMFLAG_SLOT  0x8000
#define global SYMFLAG_THUNK  0x2000
#define global SYMFLAG_TLSREL  0x4000
#define global SYMFLAG_VALUEPRESENT  0x1
#define global SYMFLAG_VIRTUAL  0x1000

; SYMBOLIC_LINK_FLAGS
#define global SYMBOLIC_LINK_FLAG_DIRECTORY  0x1
#define global SYMBOLIC_LINK_FLAG_ALLOW_UNPRIVILEGED_CREATE  0x2

; SYNCHRONIZATION_ACCESS_RIGHTS
#define global EVENT_ALL_ACCESS  0x1f0003
#define global EVENT_MODIFY_STATE  0x2
#define global MUTEX_ALL_ACCESS  0x1f0001
#define global MUTEX_MODIFY_STATE  0x1
#define global SEMAPHORE_ALL_ACCESS  0x1f0003
#define global SEMAPHORE_MODIFY_STATE  0x2
#define global TIMER_ALL_ACCESS  0x1f0003
#define global TIMER_MODIFY_STATE  0x2
#define global TIMER_QUERY_STATE  0x1
#define global SYNCHRONIZATION_DELETE  0x10000
#define global SYNCHRONIZATION_READ_CONTROL  0x20000
#define global SYNCHRONIZATION_WRITE_DAC  0x40000
#define global SYNCHRONIZATION_WRITE_OWNER  0x80000
#define global SYNCHRONIZATION_SYNCHRONIZE  0x100000

; SYS_COLOR_INDEX
#define global COLOR_SCROLLBAR  0x0
#define global COLOR_BACKGROUND  0x1
#define global COLOR_ACTIVECAPTION  0x2
#define global COLOR_INACTIVECAPTION  0x3
#define global COLOR_MENU  0x4
#define global COLOR_WINDOW  0x5
#define global COLOR_WINDOWFRAME  0x6
#define global COLOR_MENUTEXT  0x7
#define global COLOR_WINDOWTEXT  0x8
#define global COLOR_CAPTIONTEXT  0x9
#define global COLOR_ACTIVEBORDER  0xa
#define global COLOR_INACTIVEBORDER  0xb
#define global COLOR_APPWORKSPACE  0xc
#define global COLOR_HIGHLIGHT  0xd
#define global COLOR_HIGHLIGHTTEXT  0xe
#define global COLOR_BTNFACE  0xf
#define global COLOR_BTNSHADOW  0x10
#define global COLOR_GRAYTEXT  0x11
#define global COLOR_BTNTEXT  0x12
#define global COLOR_INACTIVECAPTIONTEXT  0x13
#define global COLOR_BTNHIGHLIGHT  0x14
#define global COLOR_3DDKSHADOW  0x15
#define global COLOR_3DLIGHT  0x16
#define global COLOR_INFOTEXT  0x17
#define global COLOR_INFOBK  0x18
#define global COLOR_HOTLIGHT  0x1a
#define global COLOR_GRADIENTACTIVECAPTION  0x1b
#define global COLOR_GRADIENTINACTIVECAPTION  0x1c
#define global COLOR_MENUHILIGHT  0x1d
#define global COLOR_MENUBAR  0x1e
#define global COLOR_DESKTOP  0x1
#define global COLOR_3DFACE  0xf
#define global COLOR_3DSHADOW  0x10
#define global COLOR_3DHIGHLIGHT  0x14
#define global COLOR_3DHILIGHT  0x14
#define global COLOR_BTNHILIGHT  0x14

; SYSGEOCLASS
#define global GEOCLASS_NATION  0x10
#define global GEOCLASS_REGION  0xe
#define global GEOCLASS_ALL  0x0

; SYSGEOTYPE
#define global GEO_NATION  0x1
#define global GEO_LATITUDE  0x2
#define global GEO_LONGITUDE  0x3
#define global GEO_ISO2  0x4
#define global GEO_ISO3  0x5
#define global GEO_RFC1766  0x6
#define global GEO_LCID  0x7
#define global GEO_FRIENDLYNAME  0x8
#define global GEO_OFFICIALNAME  0x9
#define global GEO_TIMEZONES  0xa
#define global GEO_OFFICIALLANGUAGES  0xb
#define global GEO_ISO_UN_NUMBER  0xc
#define global GEO_PARENT  0xd
#define global GEO_DIALINGCODE  0xe
#define global GEO_CURRENCYCODE  0xf
#define global GEO_CURRENCYSYMBOL  0x10
#define global GEO_NAME  0x11
#define global GEO_ID  0x12

; SYSKIND
#define global SYS_WIN16  0x0
#define global SYS_WIN32  0x1
#define global SYS_MAC  0x2
#define global SYS_WIN64  0x3

; SYSTEM_AUDIT_OBJECT_ACE_FLAGS
#define global ACE_OBJECT_TYPE_PRESENT  0x1
#define global ACE_INHERITED_OBJECT_TYPE_PRESENT  0x2

; SYSTEM_CURSOR_ID
#define global OCR_APPSTARTING  0x7f8a
#define global OCR_NORMAL  0x7f00
#define global OCR_CROSS  0x7f03
#define global OCR_HAND  0x7f89
#define global OCR_HELP  0x7f8b
#define global OCR_IBEAM  0x7f01
#define global OCR_NO  0x7f88
#define global OCR_SIZEALL  0x7f86
#define global OCR_SIZENESW  0x7f83
#define global OCR_SIZENS  0x7f85
#define global OCR_SIZENWSE  0x7f82
#define global OCR_SIZEWE  0x7f84
#define global OCR_UP  0x7f04
#define global OCR_WAIT  0x7f02

; SYSTEM_METRICS_INDEX
#define global SM_ARRANGE  0x38
#define global SM_CLEANBOOT  0x43
#define global SM_CMONITORS  0x50
#define global SM_CMOUSEBUTTONS  0x2b
#define global SM_CONVERTIBLESLATEMODE  0x2003
#define global SM_CXBORDER  0x5
#define global SM_CXCURSOR  0xd
#define global SM_CXDLGFRAME  0x7
#define global SM_CXDOUBLECLK  0x24
#define global SM_CXDRAG  0x44
#define global SM_CXEDGE  0x2d
#define global SM_CXFIXEDFRAME  0x7
#define global SM_CXFOCUSBORDER  0x53
#define global SM_CXFRAME  0x20
#define global SM_CXFULLSCREEN  0x10
#define global SM_CXHSCROLL  0x15
#define global SM_CXHTHUMB  0xa
#define global SM_CXICON  0xb
#define global SM_CXICONSPACING  0x26
#define global SM_CXMAXIMIZED  0x3d
#define global SM_CXMAXTRACK  0x3b
#define global SM_CXMENUCHECK  0x47
#define global SM_CXMENUSIZE  0x36
#define global SM_CXMIN  0x1c
#define global SM_CXMINIMIZED  0x39
#define global SM_CXMINSPACING  0x2f
#define global SM_CXMINTRACK  0x22
#define global SM_CXPADDEDBORDER  0x5c
#define global SM_CXSCREEN  0x0
#define global SM_CXSIZE  0x1e
#define global SM_CXSIZEFRAME  0x20
#define global SM_CXSMICON  0x31
#define global SM_CXSMSIZE  0x34
#define global SM_CXVIRTUALSCREEN  0x4e
#define global SM_CXVSCROLL  0x2
#define global SM_CYBORDER  0x6
#define global SM_CYCAPTION  0x4
#define global SM_CYCURSOR  0xe
#define global SM_CYDLGFRAME  0x8
#define global SM_CYDOUBLECLK  0x25
#define global SM_CYDRAG  0x45
#define global SM_CYEDGE  0x2e
#define global SM_CYFIXEDFRAME  0x8
#define global SM_CYFOCUSBORDER  0x54
#define global SM_CYFRAME  0x21
#define global SM_CYFULLSCREEN  0x11
#define global SM_CYHSCROLL  0x3
#define global SM_CYICON  0xc
#define global SM_CYICONSPACING  0x27
#define global SM_CYKANJIWINDOW  0x12
#define global SM_CYMAXIMIZED  0x3e
#define global SM_CYMAXTRACK  0x3c
#define global SM_CYMENU  0xf
#define global SM_CYMENUCHECK  0x48
#define global SM_CYMENUSIZE  0x37
#define global SM_CYMIN  0x1d
#define global SM_CYMINIMIZED  0x3a
#define global SM_CYMINSPACING  0x30
#define global SM_CYMINTRACK  0x23
#define global SM_CYSCREEN  0x1
#define global SM_CYSIZE  0x1f
#define global SM_CYSIZEFRAME  0x21
#define global SM_CYSMCAPTION  0x33
#define global SM_CYSMICON  0x32
#define global SM_CYSMSIZE  0x35
#define global SM_CYVIRTUALSCREEN  0x4f
#define global SM_CYVSCROLL  0x14
#define global SM_CYVTHUMB  0x9
#define global SM_DBCSENABLED  0x2a
#define global SM_DEBUG  0x16
#define global SM_DIGITIZER  0x5e
#define global SM_IMMENABLED  0x52
#define global SM_MAXIMUMTOUCHES  0x5f
#define global SM_MEDIACENTER  0x57
#define global SM_MENUDROPALIGNMENT  0x28
#define global SM_MIDEASTENABLED  0x4a
#define global SM_MOUSEPRESENT  0x13
#define global SM_MOUSEHORIZONTALWHEELPRESENT  0x5b
#define global SM_MOUSEWHEELPRESENT  0x4b
#define global SM_NETWORK  0x3f
#define global SM_PENWINDOWS  0x29
#define global SM_REMOTECONTROL  0x2001
#define global SM_REMOTESESSION  0x1000
#define global SM_SAMEDISPLAYFORMAT  0x51
#define global SM_SECURE  0x2c
#define global SM_SERVERR2  0x59
#define global SM_SHOWSOUNDS  0x46
#define global SM_SHUTTINGDOWN  0x2000
#define global SM_SLOWMACHINE  0x49
#define global SM_STARTER  0x58
#define global SM_SWAPBUTTON  0x17
#define global SM_SYSTEMDOCKED  0x2004
#define global SM_TABLETPC  0x56
#define global SM_XVIRTUALSCREEN  0x4c
#define global SM_YVIRTUALSCREEN  0x4d

; SYSTEM_PALETTE_USE
#define global SYSPAL_NOSTATIC  0x2
#define global SYSPAL_NOSTATIC256  0x3
#define global SYSPAL_STATIC  0x1

; SYSTEM_PARAMETERS_INFO_ACTION
#define global SPI_GETBEEP  0x1
#define global SPI_SETBEEP  0x2
#define global SPI_GETMOUSE  0x3
#define global SPI_SETMOUSE  0x4
#define global SPI_GETBORDER  0x5
#define global SPI_SETBORDER  0x6
#define global SPI_GETKEYBOARDSPEED  0xa
#define global SPI_SETKEYBOARDSPEED  0xb
#define global SPI_LANGDRIVER  0xc
#define global SPI_ICONHORIZONTALSPACING  0xd
#define global SPI_GETSCREENSAVETIMEOUT  0xe
#define global SPI_SETSCREENSAVETIMEOUT  0xf
#define global SPI_GETSCREENSAVEACTIVE  0x10
#define global SPI_SETSCREENSAVEACTIVE  0x11
#define global SPI_GETGRIDGRANULARITY  0x12
#define global SPI_SETGRIDGRANULARITY  0x13
#define global SPI_SETDESKWALLPAPER  0x14
#define global SPI_SETDESKPATTERN  0x15
#define global SPI_GETKEYBOARDDELAY  0x16
#define global SPI_SETKEYBOARDDELAY  0x17
#define global SPI_ICONVERTICALSPACING  0x18
#define global SPI_GETICONTITLEWRAP  0x19
#define global SPI_SETICONTITLEWRAP  0x1a
#define global SPI_GETMENUDROPALIGNMENT  0x1b
#define global SPI_SETMENUDROPALIGNMENT  0x1c
#define global SPI_SETDOUBLECLKWIDTH  0x1d
#define global SPI_SETDOUBLECLKHEIGHT  0x1e
#define global SPI_GETICONTITLELOGFONT  0x1f
#define global SPI_SETDOUBLECLICKTIME  0x20
#define global SPI_SETMOUSEBUTTONSWAP  0x21
#define global SPI_SETICONTITLELOGFONT  0x22
#define global SPI_GETFASTTASKSWITCH  0x23
#define global SPI_SETFASTTASKSWITCH  0x24
#define global SPI_SETDRAGFULLWINDOWS  0x25
#define global SPI_GETDRAGFULLWINDOWS  0x26
#define global SPI_GETNONCLIENTMETRICS  0x29
#define global SPI_SETNONCLIENTMETRICS  0x2a
#define global SPI_GETMINIMIZEDMETRICS  0x2b
#define global SPI_SETMINIMIZEDMETRICS  0x2c
#define global SPI_GETICONMETRICS  0x2d
#define global SPI_SETICONMETRICS  0x2e
#define global SPI_SETWORKAREA  0x2f
#define global SPI_GETWORKAREA  0x30
#define global SPI_SETPENWINDOWS  0x31
#define global SPI_GETHIGHCONTRAST  0x42
#define global SPI_SETHIGHCONTRAST  0x43
#define global SPI_GETKEYBOARDPREF  0x44
#define global SPI_SETKEYBOARDPREF  0x45
#define global SPI_GETSCREENREADER  0x46
#define global SPI_SETSCREENREADER  0x47
#define global SPI_GETANIMATION  0x48
#define global SPI_SETANIMATION  0x49
#define global SPI_GETFONTSMOOTHING  0x4a
#define global SPI_SETFONTSMOOTHING  0x4b
#define global SPI_SETDRAGWIDTH  0x4c
#define global SPI_SETDRAGHEIGHT  0x4d
#define global SPI_SETHANDHELD  0x4e
#define global SPI_GETLOWPOWERTIMEOUT  0x4f
#define global SPI_GETPOWEROFFTIMEOUT  0x50
#define global SPI_SETLOWPOWERTIMEOUT  0x51
#define global SPI_SETPOWEROFFTIMEOUT  0x52
#define global SPI_GETLOWPOWERACTIVE  0x53
#define global SPI_GETPOWEROFFACTIVE  0x54
#define global SPI_SETLOWPOWERACTIVE  0x55
#define global SPI_SETPOWEROFFACTIVE  0x56
#define global SPI_SETCURSORS  0x57
#define global SPI_SETICONS  0x58
#define global SPI_GETDEFAULTINPUTLANG  0x59
#define global SPI_SETDEFAULTINPUTLANG  0x5a
#define global SPI_SETLANGTOGGLE  0x5b
#define global SPI_GETWINDOWSEXTENSION  0x5c
#define global SPI_SETMOUSETRAILS  0x5d
#define global SPI_GETMOUSETRAILS  0x5e
#define global SPI_SETSCREENSAVERRUNNING  0x61
#define global SPI_SCREENSAVERRUNNING  0x61
#define global SPI_GETFILTERKEYS  0x32
#define global SPI_SETFILTERKEYS  0x33
#define global SPI_GETTOGGLEKEYS  0x34
#define global SPI_SETTOGGLEKEYS  0x35
#define global SPI_GETMOUSEKEYS  0x36
#define global SPI_SETMOUSEKEYS  0x37
#define global SPI_GETSHOWSOUNDS  0x38
#define global SPI_SETSHOWSOUNDS  0x39
#define global SPI_GETSTICKYKEYS  0x3a
#define global SPI_SETSTICKYKEYS  0x3b
#define global SPI_GETACCESSTIMEOUT  0x3c
#define global SPI_SETACCESSTIMEOUT  0x3d
#define global SPI_GETSERIALKEYS  0x3e
#define global SPI_SETSERIALKEYS  0x3f
#define global SPI_GETSOUNDSENTRY  0x40
#define global SPI_SETSOUNDSENTRY  0x41
#define global SPI_GETSNAPTODEFBUTTON  0x5f
#define global SPI_SETSNAPTODEFBUTTON  0x60
#define global SPI_GETMOUSEHOVERWIDTH  0x62
#define global SPI_SETMOUSEHOVERWIDTH  0x63
#define global SPI_GETMOUSEHOVERHEIGHT  0x64
#define global SPI_SETMOUSEHOVERHEIGHT  0x65
#define global SPI_GETMOUSEHOVERTIME  0x66
#define global SPI_SETMOUSEHOVERTIME  0x67
#define global SPI_GETWHEELSCROLLLINES  0x68
#define global SPI_SETWHEELSCROLLLINES  0x69
#define global SPI_GETMENUSHOWDELAY  0x6a
#define global SPI_SETMENUSHOWDELAY  0x6b
#define global SPI_GETWHEELSCROLLCHARS  0x6c
#define global SPI_SETWHEELSCROLLCHARS  0x6d
#define global SPI_GETSHOWIMEUI  0x6e
#define global SPI_SETSHOWIMEUI  0x6f
#define global SPI_GETMOUSESPEED  0x70
#define global SPI_SETMOUSESPEED  0x71
#define global SPI_GETSCREENSAVERRUNNING  0x72
#define global SPI_GETDESKWALLPAPER  0x73
#define global SPI_GETAUDIODESCRIPTION  0x74
#define global SPI_SETAUDIODESCRIPTION  0x75
#define global SPI_GETSCREENSAVESECURE  0x76
#define global SPI_SETSCREENSAVESECURE  0x77
#define global SPI_GETHUNGAPPTIMEOUT  0x78
#define global SPI_SETHUNGAPPTIMEOUT  0x79
#define global SPI_GETWAITTOKILLTIMEOUT  0x7a
#define global SPI_SETWAITTOKILLTIMEOUT  0x7b
#define global SPI_GETWAITTOKILLSERVICETIMEOUT  0x7c
#define global SPI_SETWAITTOKILLSERVICETIMEOUT  0x7d
#define global SPI_GETMOUSEDOCKTHRESHOLD  0x7e
#define global SPI_SETMOUSEDOCKTHRESHOLD  0x7f
#define global SPI_GETPENDOCKTHRESHOLD  0x80
#define global SPI_SETPENDOCKTHRESHOLD  0x81
#define global SPI_GETWINARRANGING  0x82
#define global SPI_SETWINARRANGING  0x83
#define global SPI_GETMOUSEDRAGOUTTHRESHOLD  0x84
#define global SPI_SETMOUSEDRAGOUTTHRESHOLD  0x85
#define global SPI_GETPENDRAGOUTTHRESHOLD  0x86
#define global SPI_SETPENDRAGOUTTHRESHOLD  0x87
#define global SPI_GETMOUSESIDEMOVETHRESHOLD  0x88
#define global SPI_SETMOUSESIDEMOVETHRESHOLD  0x89
#define global SPI_GETPENSIDEMOVETHRESHOLD  0x8a
#define global SPI_SETPENSIDEMOVETHRESHOLD  0x8b
#define global SPI_GETDRAGFROMMAXIMIZE  0x8c
#define global SPI_SETDRAGFROMMAXIMIZE  0x8d
#define global SPI_GETSNAPSIZING  0x8e
#define global SPI_SETSNAPSIZING  0x8f
#define global SPI_GETDOCKMOVING  0x90
#define global SPI_SETDOCKMOVING  0x91
#define global SPI_GETTOUCHPREDICTIONPARAMETERS  0x9c
#define global SPI_SETTOUCHPREDICTIONPARAMETERS  0x9d
#define global SPI_GETLOGICALDPIOVERRIDE  0x9e
#define global SPI_SETLOGICALDPIOVERRIDE  0x9f
#define global SPI_GETMENURECT  0xa2
#define global SPI_SETMENURECT  0xa3
#define global SPI_GETACTIVEWINDOWTRACKING  0x1000
#define global SPI_SETACTIVEWINDOWTRACKING  0x1001
#define global SPI_GETMENUANIMATION  0x1002
#define global SPI_SETMENUANIMATION  0x1003
#define global SPI_GETCOMBOBOXANIMATION  0x1004
#define global SPI_SETCOMBOBOXANIMATION  0x1005
#define global SPI_GETLISTBOXSMOOTHSCROLLING  0x1006
#define global SPI_SETLISTBOXSMOOTHSCROLLING  0x1007
#define global SPI_GETGRADIENTCAPTIONS  0x1008
#define global SPI_SETGRADIENTCAPTIONS  0x1009
#define global SPI_GETKEYBOARDCUES  0x100a
#define global SPI_SETKEYBOARDCUES  0x100b
#define global SPI_GETMENUUNDERLINES  0x100a
#define global SPI_SETMENUUNDERLINES  0x100b
#define global SPI_GETACTIVEWNDTRKZORDER  0x100c
#define global SPI_SETACTIVEWNDTRKZORDER  0x100d
#define global SPI_GETHOTTRACKING  0x100e
#define global SPI_SETHOTTRACKING  0x100f
#define global SPI_GETMENUFADE  0x1012
#define global SPI_SETMENUFADE  0x1013
#define global SPI_GETSELECTIONFADE  0x1014
#define global SPI_SETSELECTIONFADE  0x1015
#define global SPI_GETTOOLTIPANIMATION  0x1016
#define global SPI_SETTOOLTIPANIMATION  0x1017
#define global SPI_GETTOOLTIPFADE  0x1018
#define global SPI_SETTOOLTIPFADE  0x1019
#define global SPI_GETCURSORSHADOW  0x101a
#define global SPI_SETCURSORSHADOW  0x101b
#define global SPI_GETMOUSESONAR  0x101c
#define global SPI_SETMOUSESONAR  0x101d
#define global SPI_GETMOUSECLICKLOCK  0x101e
#define global SPI_SETMOUSECLICKLOCK  0x101f
#define global SPI_GETMOUSEVANISH  0x1020
#define global SPI_SETMOUSEVANISH  0x1021
#define global SPI_GETFLATMENU  0x1022
#define global SPI_SETFLATMENU  0x1023
#define global SPI_GETDROPSHADOW  0x1024
#define global SPI_SETDROPSHADOW  0x1025
#define global SPI_GETBLOCKSENDINPUTRESETS  0x1026
#define global SPI_SETBLOCKSENDINPUTRESETS  0x1027
#define global SPI_GETUIEFFECTS  0x103e
#define global SPI_SETUIEFFECTS  0x103f
#define global SPI_GETDISABLEOVERLAPPEDCONTENT  0x1040
#define global SPI_SETDISABLEOVERLAPPEDCONTENT  0x1041
#define global SPI_GETCLIENTAREAANIMATION  0x1042
#define global SPI_SETCLIENTAREAANIMATION  0x1043
#define global SPI_GETCLEARTYPE  0x1048
#define global SPI_SETCLEARTYPE  0x1049
#define global SPI_GETSPEECHRECOGNITION  0x104a
#define global SPI_SETSPEECHRECOGNITION  0x104b
#define global SPI_GETCARETBROWSING  0x104c
#define global SPI_SETCARETBROWSING  0x104d
#define global SPI_GETTHREADLOCALINPUTSETTINGS  0x104e
#define global SPI_SETTHREADLOCALINPUTSETTINGS  0x104f
#define global SPI_GETSYSTEMLANGUAGEBAR  0x1050
#define global SPI_SETSYSTEMLANGUAGEBAR  0x1051
#define global SPI_GETFOREGROUNDLOCKTIMEOUT  0x2000
#define global SPI_SETFOREGROUNDLOCKTIMEOUT  0x2001
#define global SPI_GETACTIVEWNDTRKTIMEOUT  0x2002
#define global SPI_SETACTIVEWNDTRKTIMEOUT  0x2003
#define global SPI_GETFOREGROUNDFLASHCOUNT  0x2004
#define global SPI_SETFOREGROUNDFLASHCOUNT  0x2005
#define global SPI_GETCARETWIDTH  0x2006
#define global SPI_SETCARETWIDTH  0x2007
#define global SPI_GETMOUSECLICKLOCKTIME  0x2008
#define global SPI_SETMOUSECLICKLOCKTIME  0x2009
#define global SPI_GETFONTSMOOTHINGTYPE  0x200a
#define global SPI_SETFONTSMOOTHINGTYPE  0x200b
#define global SPI_GETFONTSMOOTHINGCONTRAST  0x200c
#define global SPI_SETFONTSMOOTHINGCONTRAST  0x200d
#define global SPI_GETFOCUSBORDERWIDTH  0x200e
#define global SPI_SETFOCUSBORDERWIDTH  0x200f
#define global SPI_GETFOCUSBORDERHEIGHT  0x2010
#define global SPI_SETFOCUSBORDERHEIGHT  0x2011
#define global SPI_GETFONTSMOOTHINGORIENTATION  0x2012
#define global SPI_SETFONTSMOOTHINGORIENTATION  0x2013
#define global SPI_GETMINIMUMHITRADIUS  0x2014
#define global SPI_SETMINIMUMHITRADIUS  0x2015
#define global SPI_GETMESSAGEDURATION  0x2016
#define global SPI_SETMESSAGEDURATION  0x2017
#define global SPI_GETCONTACTVISUALIZATION  0x2018
#define global SPI_SETCONTACTVISUALIZATION  0x2019
#define global SPI_GETGESTUREVISUALIZATION  0x201a
#define global SPI_SETGESTUREVISUALIZATION  0x201b
#define global SPI_GETMOUSEWHEELROUTING  0x201c
#define global SPI_SETMOUSEWHEELROUTING  0x201d
#define global SPI_GETPENVISUALIZATION  0x201e
#define global SPI_SETPENVISUALIZATION  0x201f
#define global SPI_GETPENARBITRATIONTYPE  0x2020
#define global SPI_SETPENARBITRATIONTYPE  0x2021
#define global SPI_GETCARETTIMEOUT  0x2022
#define global SPI_SETCARETTIMEOUT  0x2023
#define global SPI_GETHANDEDNESS  0x2024
#define global SPI_SETHANDEDNESS  0x2025

; SYSTEM_PARAMETERS_INFO_UPDATE_FLAGS
#define global SPIF_UPDATEINIFILE  0x1
#define global SPIF_SENDCHANGE  0x2
#define global SPIF_SENDWININICHANGE  0x2

; SYSTEM_POWER_STATE
#define global PowerSystemUnspecified  0x0
#define global PowerSystemWorking  0x1
#define global PowerSystemSleeping1  0x2
#define global PowerSystemSleeping2  0x3
#define global PowerSystemSleeping3  0x4
#define global PowerSystemHibernate  0x5
#define global PowerSystemShutdown  0x6
#define global PowerSystemMaximum  0x7

; TA_PROPERTY
#define global TAP_FLAGS  0x0
#define global TAP_TRANSFORMCOUNT  0x1
#define global TAP_STAGGERDELAY  0x2
#define global TAP_STAGGERDELAYCAP  0x3
#define global TAP_STAGGERDELAYFACTOR  0x4
#define global TAP_ZORDER  0x5

; TA_TIMINGFUNCTION_TYPE
#define global TTFT_UNDEFINED  0x0
#define global TTFT_CUBIC_BEZIER  0x1

; TA_TRANSFORM_FLAG
#define global TATF_NONE  0x0
#define global TATF_TARGETVALUES_USER  0x1
#define global TATF_HASINITIALVALUES  0x2
#define global TATF_HASORIGINVALUES  0x4

; TA_TRANSFORM_TYPE
#define global TATT_TRANSLATE_2D  0x0
#define global TATT_SCALE_2D  0x1
#define global TATT_OPACITY  0x2
#define global TATT_CLIP  0x3

; TAPE_INFORMATION_TYPE
#define global SET_TAPE_DRIVE_INFORMATION  0x1
#define global SET_TAPE_MEDIA_INFORMATION  0x0

; TAPE_POSITION_METHOD
#define global TAPE_ABSOLUTE_BLOCK  0x1
#define global TAPE_LOGICAL_BLOCK  0x2
#define global TAPE_REWIND  0x0
#define global TAPE_SPACE_END_OF_DATA  0x4
#define global TAPE_SPACE_FILEMARKS  0x6
#define global TAPE_SPACE_RELATIVE_BLOCKS  0x5
#define global TAPE_SPACE_SEQUENTIAL_FMKS  0x7
#define global TAPE_SPACE_SEQUENTIAL_SMKS  0x9
#define global TAPE_SPACE_SETMARKS  0x8

; TAPE_POSITION_TYPE
#define global TAPE_ABSOLUTE_POSITION  0x0
#define global TAPE_LOGICAL_POSITION  0x1

; TAPEMARK_TYPE
#define global TAPE_FILEMARKS  0x1
#define global TAPE_LONG_FILEMARKS  0x3
#define global TAPE_SETMARKS  0x0
#define global TAPE_SHORT_FILEMARKS  0x2

; TCP_CONNECTION_OFFLOAD_STATE
#define global TcpConnectionOffloadStateInHost  0x0
#define global TcpConnectionOffloadStateOffloading  0x1
#define global TcpConnectionOffloadStateOffloaded  0x2
#define global TcpConnectionOffloadStateUploading  0x3
#define global TcpConnectionOffloadStateMax  0x4

; TCP_ESTATS_TYPE
#define global TcpConnectionEstatsSynOpts  0x0
#define global TcpConnectionEstatsData  0x1
#define global TcpConnectionEstatsSndCong  0x2
#define global TcpConnectionEstatsPath  0x3
#define global TcpConnectionEstatsSendBuff  0x4
#define global TcpConnectionEstatsRec  0x5
#define global TcpConnectionEstatsObsRec  0x6
#define global TcpConnectionEstatsBandwidth  0x7
#define global TcpConnectionEstatsFineRtt  0x8
#define global TcpConnectionEstatsMaximum  0x9

; TCP_RTO_ALGORITHM
#define global TcpRtoAlgorithmOther  0x1
#define global TcpRtoAlgorithmConstant  0x2
#define global TcpRtoAlgorithmRsre  0x3
#define global TcpRtoAlgorithmVanj  0x4
#define global MIB_TCP_RTO_OTHER  0x1
#define global MIB_TCP_RTO_CONSTANT  0x2
#define global MIB_TCP_RTO_RSRE  0x3
#define global MIB_TCP_RTO_VANJ  0x4

; TCP_TABLE_CLASS
#define global TCP_TABLE_BASIC_LISTENER  0x0
#define global TCP_TABLE_BASIC_CONNECTIONS  0x1
#define global TCP_TABLE_BASIC_ALL  0x2
#define global TCP_TABLE_OWNER_PID_LISTENER  0x3
#define global TCP_TABLE_OWNER_PID_CONNECTIONS  0x4
#define global TCP_TABLE_OWNER_PID_ALL  0x5
#define global TCP_TABLE_OWNER_MODULE_LISTENER  0x6
#define global TCP_TABLE_OWNER_MODULE_CONNECTIONS  0x7
#define global TCP_TABLE_OWNER_MODULE_ALL  0x8

; TCPIP_OWNER_MODULE_INFO_CLASS
#define global TCPIP_OWNER_MODULE_INFO_BASIC  0x0

; TEXT_ALIGN_OPTIONS
#define global TA_NOUPDATECP  0x0
#define global TA_UPDATECP  0x1
#define global TA_LEFT  0x0
#define global TA_RIGHT  0x2
#define global TA_CENTER  0x6
#define global TA_TOP  0x0
#define global TA_BOTTOM  0x8
#define global TA_BASELINE  0x18
#define global TA_RTLREADING  0x100
#define global TA_MASK  0x11f
#define global VTA_BASELINE  0x18
#define global VTA_LEFT  0x8
#define global VTA_RIGHT  0x0
#define global VTA_CENTER  0x6
#define global VTA_BOTTOM  0x2
#define global VTA_TOP  0x0

; TextRenderingHint
#define global TextRenderingHintSystemDefault  0x0
#define global TextRenderingHintSingleBitPerPixelGridFit  0x1
#define global TextRenderingHintSingleBitPerPixel  0x2
#define global TextRenderingHintAntiAliasGridFit  0x3
#define global TextRenderingHintAntiAlias  0x4
#define global TextRenderingHintClearTypeGridFit  0x5

; THEME_PROPERTY_SYMBOL_ID
#define global TMT_RESERVEDLOW  0x0
#define global TMT_RESERVEDHIGH  0x1f3f
#define global TMT_DIBDATA  0x2
#define global TMT_GLYPHDIBDATA  0x8
#define global TMT_ENUM  0xc8
#define global TMT_STRING  0xc9
#define global TMT_INT  0xca
#define global TMT_BOOL  0xcb
#define global TMT_COLOR  0xcc
#define global TMT_MARGINS  0xcd
#define global TMT_FILENAME  0xce
#define global TMT_SIZE  0xcf
#define global TMT_POSITION  0xd0
#define global TMT_RECT  0xd1
#define global TMT_FONT  0xd2
#define global TMT_INTLIST  0xd3
#define global TMT_HBITMAP  0xd4
#define global TMT_DISKSTREAM  0xd5
#define global TMT_STREAM  0xd6
#define global TMT_BITMAPREF  0xd7
#define global TMT_FLOAT  0xd8
#define global TMT_FLOATLIST  0xd9
#define global TMT_COLORSCHEMES  0x191
#define global TMT_SIZES  0x192
#define global TMT_CHARSET  0x193
#define global TMT_NAME  0x258
#define global TMT_DISPLAYNAME  0x259
#define global TMT_TOOLTIP  0x25a
#define global TMT_COMPANY  0x25b
#define global TMT_AUTHOR  0x25c
#define global TMT_COPYRIGHT  0x25d
#define global TMT_URL  0x25e
#define global TMT_VERSION  0x25f
#define global TMT_DESCRIPTION  0x260
#define global TMT_FIRST_RCSTRING_NAME  0x259
#define global TMT_LAST_RCSTRING_NAME  0x260
#define global TMT_CAPTIONFONT  0x321
#define global TMT_SMALLCAPTIONFONT  0x322
#define global TMT_MENUFONT  0x323
#define global TMT_STATUSFONT  0x324
#define global TMT_MSGBOXFONT  0x325
#define global TMT_ICONTITLEFONT  0x326
#define global TMT_HEADING1FONT  0x327
#define global TMT_HEADING2FONT  0x328
#define global TMT_BODYFONT  0x329
#define global TMT_FIRSTFONT  0x321
#define global TMT_LASTFONT  0x329
#define global TMT_FLATMENUS  0x3e9
#define global TMT_FIRSTBOOL  0x3e9
#define global TMT_LASTBOOL  0x3e9
#define global TMT_SIZINGBORDERWIDTH  0x4b1
#define global TMT_SCROLLBARWIDTH  0x4b2
#define global TMT_SCROLLBARHEIGHT  0x4b3
#define global TMT_CAPTIONBARWIDTH  0x4b4
#define global TMT_CAPTIONBARHEIGHT  0x4b5
#define global TMT_SMCAPTIONBARWIDTH  0x4b6
#define global TMT_SMCAPTIONBARHEIGHT  0x4b7
#define global TMT_MENUBARWIDTH  0x4b8
#define global TMT_MENUBARHEIGHT  0x4b9
#define global TMT_PADDEDBORDERWIDTH  0x4ba
#define global TMT_FIRSTSIZE  0x4b1
#define global TMT_LASTSIZE  0x4ba
#define global TMT_MINCOLORDEPTH  0x515
#define global TMT_FIRSTINT  0x515
#define global TMT_LASTINT  0x515
#define global TMT_CSSNAME  0x579
#define global TMT_XMLNAME  0x57a
#define global TMT_LASTUPDATED  0x57b
#define global TMT_ALIAS  0x57c
#define global TMT_FIRSTSTRING  0x579
#define global TMT_LASTSTRING  0x57c
#define global TMT_SCROLLBAR  0x641
#define global TMT_BACKGROUND  0x642
#define global TMT_ACTIVECAPTION  0x643
#define global TMT_INACTIVECAPTION  0x644
#define global TMT_MENU  0x645
#define global TMT_WINDOW  0x646
#define global TMT_WINDOWFRAME  0x647
#define global TMT_MENUTEXT  0x648
#define global TMT_WINDOWTEXT  0x649
#define global TMT_CAPTIONTEXT  0x64a
#define global TMT_ACTIVEBORDER  0x64b
#define global TMT_INACTIVEBORDER  0x64c
#define global TMT_APPWORKSPACE  0x64d
#define global TMT_HIGHLIGHT  0x64e
#define global TMT_HIGHLIGHTTEXT  0x64f
#define global TMT_BTNFACE  0x650
#define global TMT_BTNSHADOW  0x651
#define global TMT_GRAYTEXT  0x652
#define global TMT_BTNTEXT  0x653
#define global TMT_INACTIVECAPTIONTEXT  0x654
#define global TMT_BTNHIGHLIGHT  0x655
#define global TMT_DKSHADOW3D  0x656
#define global TMT_LIGHT3D  0x657
#define global TMT_INFOTEXT  0x658
#define global TMT_INFOBK  0x659
#define global TMT_BUTTONALTERNATEFACE  0x65a
#define global TMT_HOTTRACKING  0x65b
#define global TMT_GRADIENTACTIVECAPTION  0x65c
#define global TMT_GRADIENTINACTIVECAPTION  0x65d
#define global TMT_MENUHILIGHT  0x65e
#define global TMT_MENUBAR  0x65f
#define global TMT_FIRSTCOLOR  0x641
#define global TMT_LASTCOLOR  0x65f
#define global TMT_FROMHUE1  0x709
#define global TMT_FROMHUE2  0x70a
#define global TMT_FROMHUE3  0x70b
#define global TMT_FROMHUE4  0x70c
#define global TMT_FROMHUE5  0x70d
#define global TMT_TOHUE1  0x70e
#define global TMT_TOHUE2  0x70f
#define global TMT_TOHUE3  0x710
#define global TMT_TOHUE4  0x711
#define global TMT_TOHUE5  0x712
#define global TMT_FROMCOLOR1  0x7d1
#define global TMT_FROMCOLOR2  0x7d2
#define global TMT_FROMCOLOR3  0x7d3
#define global TMT_FROMCOLOR4  0x7d4
#define global TMT_FROMCOLOR5  0x7d5
#define global TMT_TOCOLOR1  0x7d6
#define global TMT_TOCOLOR2  0x7d7
#define global TMT_TOCOLOR3  0x7d8
#define global TMT_TOCOLOR4  0x7d9
#define global TMT_TOCOLOR5  0x7da
#define global TMT_TRANSPARENT  0x899
#define global TMT_AUTOSIZE  0x89a
#define global TMT_BORDERONLY  0x89b
#define global TMT_COMPOSITED  0x89c
#define global TMT_BGFILL  0x89d
#define global TMT_GLYPHTRANSPARENT  0x89e
#define global TMT_GLYPHONLY  0x89f
#define global TMT_ALWAYSSHOWSIZINGBAR  0x8a0
#define global TMT_MIRRORIMAGE  0x8a1
#define global TMT_UNIFORMSIZING  0x8a2
#define global TMT_INTEGRALSIZING  0x8a3
#define global TMT_SOURCEGROW  0x8a4
#define global TMT_SOURCESHRINK  0x8a5
#define global TMT_DRAWBORDERS  0x8a6
#define global TMT_NOETCHEDEFFECT  0x8a7
#define global TMT_TEXTAPPLYOVERLAY  0x8a8
#define global TMT_TEXTGLOW  0x8a9
#define global TMT_TEXTITALIC  0x8aa
#define global TMT_COMPOSITEDOPAQUE  0x8ab
#define global TMT_LOCALIZEDMIRRORIMAGE  0x8ac
#define global TMT_IMAGECOUNT  0x961
#define global TMT_ALPHALEVEL  0x962
#define global TMT_BORDERSIZE  0x963
#define global TMT_ROUNDCORNERWIDTH  0x964
#define global TMT_ROUNDCORNERHEIGHT  0x965
#define global TMT_GRADIENTRATIO1  0x966
#define global TMT_GRADIENTRATIO2  0x967
#define global TMT_GRADIENTRATIO3  0x968
#define global TMT_GRADIENTRATIO4  0x969
#define global TMT_GRADIENTRATIO5  0x96a
#define global TMT_PROGRESSCHUNKSIZE  0x96b
#define global TMT_PROGRESSSPACESIZE  0x96c
#define global TMT_SATURATION  0x96d
#define global TMT_TEXTBORDERSIZE  0x96e
#define global TMT_ALPHATHRESHOLD  0x96f
#define global TMT_WIDTH  0x970
#define global TMT_HEIGHT  0x971
#define global TMT_GLYPHINDEX  0x972
#define global TMT_TRUESIZESTRETCHMARK  0x973
#define global TMT_MINDPI1  0x974
#define global TMT_MINDPI2  0x975
#define global TMT_MINDPI3  0x976
#define global TMT_MINDPI4  0x977
#define global TMT_MINDPI5  0x978
#define global TMT_TEXTGLOWSIZE  0x979
#define global TMT_FRAMESPERSECOND  0x97a
#define global TMT_PIXELSPERFRAME  0x97b
#define global TMT_ANIMATIONDELAY  0x97c
#define global TMT_GLOWINTENSITY  0x97d
#define global TMT_OPACITY  0x97e
#define global TMT_COLORIZATIONCOLOR  0x97f
#define global TMT_COLORIZATIONOPACITY  0x980
#define global TMT_MINDPI6  0x981
#define global TMT_MINDPI7  0x982
#define global TMT_GLYPHFONT  0xa29
#define global TMT_IMAGEFILE  0xbb9
#define global TMT_IMAGEFILE1  0xbba
#define global TMT_IMAGEFILE2  0xbbb
#define global TMT_IMAGEFILE3  0xbbc
#define global TMT_IMAGEFILE4  0xbbd
#define global TMT_IMAGEFILE5  0xbbe
#define global TMT_GLYPHIMAGEFILE  0xbc0
#define global TMT_IMAGEFILE6  0xbc1
#define global TMT_IMAGEFILE7  0xbc2
#define global TMT_TEXT  0xc81
#define global TMT_CLASSICVALUE  0xc82
#define global TMT_OFFSET  0xd49
#define global TMT_TEXTSHADOWOFFSET  0xd4a
#define global TMT_MINSIZE  0xd4b
#define global TMT_MINSIZE1  0xd4c
#define global TMT_MINSIZE2  0xd4d
#define global TMT_MINSIZE3  0xd4e
#define global TMT_MINSIZE4  0xd4f
#define global TMT_MINSIZE5  0xd50
#define global TMT_NORMALSIZE  0xd51
#define global TMT_MINSIZE6  0xd52
#define global TMT_MINSIZE7  0xd53
#define global TMT_SIZINGMARGINS  0xe11
#define global TMT_CONTENTMARGINS  0xe12
#define global TMT_CAPTIONMARGINS  0xe13
#define global TMT_BORDERCOLOR  0xed9
#define global TMT_FILLCOLOR  0xeda
#define global TMT_TEXTCOLOR  0xedb
#define global TMT_EDGELIGHTCOLOR  0xedc
#define global TMT_EDGEHIGHLIGHTCOLOR  0xedd
#define global TMT_EDGESHADOWCOLOR  0xede
#define global TMT_EDGEDKSHADOWCOLOR  0xedf
#define global TMT_EDGEFILLCOLOR  0xee0
#define global TMT_TRANSPARENTCOLOR  0xee1
#define global TMT_GRADIENTCOLOR1  0xee2
#define global TMT_GRADIENTCOLOR2  0xee3
#define global TMT_GRADIENTCOLOR3  0xee4
#define global TMT_GRADIENTCOLOR4  0xee5
#define global TMT_GRADIENTCOLOR5  0xee6
#define global TMT_SHADOWCOLOR  0xee7
#define global TMT_GLOWCOLOR  0xee8
#define global TMT_TEXTBORDERCOLOR  0xee9
#define global TMT_TEXTSHADOWCOLOR  0xeea
#define global TMT_GLYPHTEXTCOLOR  0xeeb
#define global TMT_GLYPHTRANSPARENTCOLOR  0xeec
#define global TMT_FILLCOLORHINT  0xeed
#define global TMT_BORDERCOLORHINT  0xeee
#define global TMT_ACCENTCOLORHINT  0xeef
#define global TMT_TEXTCOLORHINT  0xef0
#define global TMT_HEADING1TEXTCOLOR  0xef1
#define global TMT_HEADING2TEXTCOLOR  0xef2
#define global TMT_BODYTEXTCOLOR  0xef3
#define global TMT_BGTYPE  0xfa1
#define global TMT_BORDERTYPE  0xfa2
#define global TMT_FILLTYPE  0xfa3
#define global TMT_SIZINGTYPE  0xfa4
#define global TMT_HALIGN  0xfa5
#define global TMT_CONTENTALIGNMENT  0xfa6
#define global TMT_VALIGN  0xfa7
#define global TMT_OFFSETTYPE  0xfa8
#define global TMT_ICONEFFECT  0xfa9
#define global TMT_TEXTSHADOWTYPE  0xfaa
#define global TMT_IMAGELAYOUT  0xfab
#define global TMT_GLYPHTYPE  0xfac
#define global TMT_IMAGESELECTTYPE  0xfad
#define global TMT_GLYPHFONTSIZINGTYPE  0xfae
#define global TMT_TRUESIZESCALINGTYPE  0xfaf
#define global TMT_USERPICTURE  0x1389
#define global TMT_DEFAULTPANESIZE  0x138a
#define global TMT_BLENDCOLOR  0x138b
#define global TMT_CUSTOMSPLITRECT  0x138c
#define global TMT_ANIMATIONBUTTONRECT  0x138d
#define global TMT_ANIMATIONDURATION  0x138e
#define global TMT_TRANSITIONDURATIONS  0x1770
#define global TMT_SCALEDBACKGROUND  0x1b59
#define global TMT_ATLASIMAGE  0x1f40
#define global TMT_ATLASINPUTIMAGE  0x1f41
#define global TMT_ATLASRECT  0x1f42

; THEMESIZE
#define global TS_MIN  0x0
#define global TS_TRUE  0x1
#define global TS_DRAW  0x2

; THREAD_ACCESS_RIGHTS
#define global THREAD_TERMINATE  0x1
#define global THREAD_SUSPEND_RESUME  0x2
#define global THREAD_GET_CONTEXT  0x8
#define global THREAD_SET_CONTEXT  0x10
#define global THREAD_SET_INFORMATION  0x20
#define global THREAD_QUERY_INFORMATION  0x40
#define global THREAD_SET_THREAD_TOKEN  0x80
#define global THREAD_IMPERSONATE  0x100
#define global THREAD_DIRECT_IMPERSONATION  0x200
#define global THREAD_SET_LIMITED_INFORMATION  0x400
#define global THREAD_QUERY_LIMITED_INFORMATION  0x800
#define global THREAD_RESUME  0x1000
#define global THREAD_ALL_ACCESS  0x1fffff
#define global THREAD_DELETE  0x10000
#define global THREAD_READ_CONTROL  0x20000
#define global THREAD_WRITE_DAC  0x40000
#define global THREAD_WRITE_OWNER  0x80000
#define global THREAD_SYNCHRONIZE  0x100000
#define global THREAD_STANDARD_RIGHTS_REQUIRED  0xf0000

; THREAD_CREATION_FLAGS
#define global THREAD_CREATE_RUN_IMMEDIATELY  0x0
#define global THREAD_CREATE_SUSPENDED  0x4
#define global STACK_SIZE_PARAM_IS_A_RESERVATION  0x10000

; THREAD_ERROR_MODE
#define global SEM_ALL_ERRORS  0x0
#define global SEM_FAILCRITICALERRORS  0x1
#define global SEM_NOGPFAULTERRORBOX  0x2
#define global SEM_NOOPENFILEERRORBOX  0x8000
#define global SEM_NOALIGNMENTFAULTEXCEPT  0x4

; THREAD_INFORMATION_CLASS
#define global ThreadMemoryPriority  0x0
#define global ThreadAbsoluteCpuPriority  0x1
#define global ThreadDynamicCodePolicy  0x2
#define global ThreadPowerThrottling  0x3
#define global ThreadInformationClassMax  0x4

; THREAD_PRIORITY
#define global THREAD_MODE_BACKGROUND_BEGIN  0x10000
#define global THREAD_MODE_BACKGROUND_END  0x20000
#define global THREAD_PRIORITY_ABOVE_NORMAL  0x1
#define global THREAD_PRIORITY_BELOW_NORMAL  -1
#define global THREAD_PRIORITY_HIGHEST  0x2
#define global THREAD_PRIORITY_IDLE  -15
#define global THREAD_PRIORITY_MIN  -2
#define global THREAD_PRIORITY_LOWEST  -2
#define global THREAD_PRIORITY_NORMAL  0x0
#define global THREAD_PRIORITY_TIME_CRITICAL  0xf

; TILE_WINDOWS_HOW
#define global MDITILE_HORIZONTAL  0x1
#define global MDITILE_VERTICAL  0x0

; TIME_FORMAT_FLAGS
#define global TIME_NOMINUTESORSECONDS  0x1
#define global TIME_NOSECONDS  0x2
#define global TIME_NOTIMEMARKER  0x4
#define global TIME_FORCE24HOURFORMAT  0x8

; TMPF_FLAGS
#define global TMPF_FIXED_PITCH  0x1
#define global TMPF_VECTOR  0x2
#define global TMPF_DEVICE  0x8
#define global TMPF_TRUETYPE  0x4

; TOKEN_ACCESS_MASK
#define global TOKEN_DELETE  0x10000
#define global TOKEN_READ_CONTROL  0x20000
#define global TOKEN_WRITE_DAC  0x40000
#define global TOKEN_WRITE_OWNER  0x80000
#define global TOKEN_ACCESS_SYSTEM_SECURITY  0x1000000
#define global TOKEN_ASSIGN_PRIMARY  0x1
#define global TOKEN_DUPLICATE  0x2
#define global TOKEN_IMPERSONATE  0x4
#define global TOKEN_QUERY  0x8
#define global TOKEN_QUERY_SOURCE  0x10
#define global TOKEN_ADJUST_PRIVILEGES  0x20
#define global TOKEN_ADJUST_GROUPS  0x40
#define global TOKEN_ADJUST_DEFAULT  0x80
#define global TOKEN_ADJUST_SESSIONID  0x100
#define global TOKEN_READ  0x20008
#define global TOKEN_WRITE  0x200e0
#define global TOKEN_EXECUTE  0x20000
#define global TOKEN_TRUST_CONSTRAINT_MASK  0x20018
#define global TOKEN_ACCESS_PSEUDO_HANDLE_WIN8  0x18
#define global TOKEN_ACCESS_PSEUDO_HANDLE  0x18
#define global TOKEN_ALL_ACCESS  0xf01ff

; TOKEN_INFORMATION_CLASS
#define global TokenUser  0x1
#define global TokenGroups  0x2
#define global TokenPrivileges  0x3
#define global TokenOwner  0x4
#define global TokenPrimaryGroup  0x5
#define global TokenDefaultDacl  0x6
#define global TokenSource  0x7
#define global TokenType  0x8
#define global TokenImpersonationLevel  0x9
#define global TokenStatistics  0xa
#define global TokenRestrictedSids  0xb
#define global TokenSessionId  0xc
#define global TokenGroupsAndPrivileges  0xd
#define global TokenSessionReference  0xe
#define global TokenSandBoxInert  0xf
#define global TokenAuditPolicy  0x10
#define global TokenOrigin  0x11
#define global TokenElevationType  0x12
#define global TokenLinkedToken  0x13
#define global TokenElevation  0x14
#define global TokenHasRestrictions  0x15
#define global TokenAccessInformation  0x16
#define global TokenVirtualizationAllowed  0x17
#define global TokenVirtualizationEnabled  0x18
#define global TokenIntegrityLevel  0x19
#define global TokenUIAccess  0x1a
#define global TokenMandatoryPolicy  0x1b
#define global TokenLogonSid  0x1c
#define global TokenIsAppContainer  0x1d
#define global TokenCapabilities  0x1e
#define global TokenAppContainerSid  0x1f
#define global TokenAppContainerNumber  0x20
#define global TokenUserClaimAttributes  0x21
#define global TokenDeviceClaimAttributes  0x22
#define global TokenRestrictedUserClaimAttributes  0x23
#define global TokenRestrictedDeviceClaimAttributes  0x24
#define global TokenDeviceGroups  0x25
#define global TokenRestrictedDeviceGroups  0x26
#define global TokenSecurityAttributes  0x27
#define global TokenIsRestricted  0x28
#define global TokenProcessTrustLevel  0x29
#define global TokenPrivateNameSpace  0x2a
#define global TokenSingletonAttributes  0x2b
#define global TokenBnoIsolation  0x2c
#define global TokenChildProcessFlags  0x2d
#define global TokenIsLessPrivilegedAppContainer  0x2e
#define global TokenIsSandboxed  0x2f
#define global TokenIsAppSilo  0x30
#define global MaxTokenInfoClass  0x31

; TOKEN_PRIVILEGES_ATTRIBUTES
#define global SE_PRIVILEGE_ENABLED  0x2
#define global SE_PRIVILEGE_ENABLED_BY_DEFAULT  0x1
#define global SE_PRIVILEGE_REMOVED  0x4
#define global SE_PRIVILEGE_USED_FOR_ACCESS  0x80000000

; TOKEN_TYPE
#define global TokenPrimary  0x1
#define global TokenImpersonation  0x2

; TOUCH_FEEDBACK_MODE
#define global TOUCH_FEEDBACK_DEFAULT  0x1
#define global TOUCH_FEEDBACK_INDIRECT  0x2
#define global TOUCH_FEEDBACK_NONE  0x3

; TOUCHEVENTF_FLAGS
#define global TOUCHEVENTF_MOVE  0x1
#define global TOUCHEVENTF_DOWN  0x2
#define global TOUCHEVENTF_UP  0x4
#define global TOUCHEVENTF_INRANGE  0x8
#define global TOUCHEVENTF_PRIMARY  0x10
#define global TOUCHEVENTF_NOCOALESCE  0x20
#define global TOUCHEVENTF_PEN  0x40
#define global TOUCHEVENTF_PALM  0x80

; TOUCHINPUTMASKF_MASK
#define global TOUCHINPUTMASKF_TIMEFROMSYSTEM  0x1
#define global TOUCHINPUTMASKF_EXTRAINFO  0x2
#define global TOUCHINPUTMASKF_CONTACTAREA  0x4

; TP_CALLBACK_PRIORITY
#define global TP_CALLBACK_PRIORITY_HIGH  0x0
#define global TP_CALLBACK_PRIORITY_NORMAL  0x1
#define global TP_CALLBACK_PRIORITY_LOW  0x2
#define global TP_CALLBACK_PRIORITY_INVALID  0x3
#define global TP_CALLBACK_PRIORITY_COUNT  0x3

; TRACE_QUERY_INFO_CLASS
#define global TraceGuidQueryList  0x0
#define global TraceGuidQueryInfo  0x1
#define global TraceGuidQueryProcess  0x2
#define global TraceStackTracingInfo  0x3
#define global TraceSystemTraceEnableFlagsInfo  0x4
#define global TraceSampledProfileIntervalInfo  0x5
#define global TraceProfileSourceConfigInfo  0x6
#define global TraceProfileSourceListInfo  0x7
#define global TracePmcEventListInfo  0x8
#define global TracePmcCounterListInfo  0x9
#define global TraceSetDisallowList  0xa
#define global TraceVersionInfo  0xb
#define global TraceGroupQueryList  0xc
#define global TraceGroupQueryInfo  0xd
#define global TraceDisallowListQuery  0xe
#define global TraceInfoReserved15  0xf
#define global TracePeriodicCaptureStateListInfo  0x10
#define global TracePeriodicCaptureStateInfo  0x11
#define global TraceProviderBinaryTracking  0x12
#define global TraceMaxLoggersQuery  0x13
#define global TraceLbrConfigurationInfo  0x14
#define global TraceLbrEventListInfo  0x15
#define global TraceMaxPmcCounterQuery  0x16
#define global TraceStreamCount  0x17
#define global TraceStackCachingInfo  0x18
#define global TracePmcCounterOwners  0x19
#define global TraceUnifiedStackCachingInfo  0x1a
#define global TracePmcSessionInformation  0x1b
#define global MaxTraceSetInfoClass  0x1c

; TRACK_POPUP_MENU_FLAGS
#define global TPM_LEFTBUTTON  0x0
#define global TPM_RIGHTBUTTON  0x2
#define global TPM_LEFTALIGN  0x0
#define global TPM_CENTERALIGN  0x4
#define global TPM_RIGHTALIGN  0x8
#define global TPM_TOPALIGN  0x0
#define global TPM_VCENTERALIGN  0x10
#define global TPM_BOTTOMALIGN  0x20
#define global TPM_HORIZONTAL  0x0
#define global TPM_VERTICAL  0x40
#define global TPM_NONOTIFY  0x80
#define global TPM_RETURNCMD  0x100
#define global TPM_RECURSE  0x1
#define global TPM_HORPOSANIMATION  0x400
#define global TPM_HORNEGANIMATION  0x800
#define global TPM_VERPOSANIMATION  0x1000
#define global TPM_VERNEGANIMATION  0x2000
#define global TPM_NOANIMATION  0x4000
#define global TPM_LAYOUTRTL  0x8000
#define global TPM_WORKAREA  0x10000

; TRACKMOUSEEVENT_FLAGS
#define global TME_CANCEL  0x80000000
#define global TME_HOVER  0x1
#define global TME_LEAVE  0x2
#define global TME_NONCLIENT  0x10
#define global TME_QUERY  0x40000000

; TRANSLATE_CHARSET_INFO_FLAGS
#define global TCI_SRCCHARSET  0x1
#define global TCI_SRCCODEPAGE  0x2
#define global TCI_SRCFONTSIG  0x3
#define global TCI_SRCLOCALE  0x1000

; TREE_SEC_INFO
#define global TREE_SEC_INFO_SET  0x1
#define global TREE_SEC_INFO_RESET  0x2
#define global TREE_SEC_INFO_RESET_KEEP_EXPLICIT  0x3

; TRUSTED_DOMAIN_TRUST_ATTRIBUTES
#define global TRUST_ATTRIBUTE_NON_TRANSITIVE  0x1
#define global TRUST_ATTRIBUTE_UPLEVEL_ONLY  0x2
#define global TRUST_ATTRIBUTE_FILTER_SIDS  0x4
#define global TRUST_ATTRIBUTE_FOREST_TRANSITIVE  0x8
#define global TRUST_ATTRIBUTE_CROSS_ORGANIZATION  0x10
#define global TRUST_ATTRIBUTE_TREAT_AS_EXTERNAL  0x40
#define global TRUST_ATTRIBUTE_WITHIN_FOREST  0x20

; TRUSTED_DOMAIN_TRUST_DIRECTION
#define global TRUST_DIRECTION_DISABLED  0x0
#define global TRUST_DIRECTION_INBOUND  0x1
#define global TRUST_DIRECTION_OUTBOUND  0x2
#define global TRUST_DIRECTION_BIDIRECTIONAL  0x3

; TRUSTED_DOMAIN_TRUST_TYPE
#define global TRUST_TYPE_DOWNLEVEL  0x1
#define global TRUST_TYPE_UPLEVEL  0x2
#define global TRUST_TYPE_MIT  0x3
#define global TRUST_TYPE_DCE  0x4

; TRUSTED_INFORMATION_CLASS
#define global TrustedDomainNameInformation  0x1
#define global TrustedControllersInformation  0x2
#define global TrustedPosixOffsetInformation  0x3
#define global TrustedPasswordInformation  0x4
#define global TrustedDomainInformationBasic  0x5
#define global TrustedDomainInformationEx  0x6
#define global TrustedDomainAuthInformation  0x7
#define global TrustedDomainFullInformation  0x8
#define global TrustedDomainAuthInformationInternal  0x9
#define global TrustedDomainFullInformationInternal  0xa
#define global TrustedDomainInformationEx2Internal  0xb
#define global TrustedDomainFullInformation2Internal  0xc
#define global TrustedDomainSupportedEncryptionTypes  0xd
#define global TrustedDomainAuthInformationInternalAes  0xe
#define global TrustedDomainFullInformationInternalAes  0xf

; TRUSTEE_FORM
#define global TRUSTEE_IS_SID  0x0
#define global TRUSTEE_IS_NAME  0x1
#define global TRUSTEE_BAD_FORM  0x2
#define global TRUSTEE_IS_OBJECTS_AND_SID  0x3
#define global TRUSTEE_IS_OBJECTS_AND_NAME  0x4

; TRUSTEE_TYPE
#define global TRUSTEE_IS_UNKNOWN  0x0
#define global TRUSTEE_IS_USER  0x1
#define global TRUSTEE_IS_GROUP  0x2
#define global TRUSTEE_IS_DOMAIN  0x3
#define global TRUSTEE_IS_ALIAS  0x4
#define global TRUSTEE_IS_WELL_KNOWN_GROUP  0x5
#define global TRUSTEE_IS_DELETED  0x6
#define global TRUSTEE_IS_INVALID  0x7
#define global TRUSTEE_IS_COMPUTER  0x8

; TrustLevel
#define global BaseTrust  0x0
#define global PartialTrust  0x1
#define global FullTrust  0x2

; TUNNEL_TYPE
#define global TUNNEL_TYPE_NONE  0x0
#define global TUNNEL_TYPE_OTHER  0x1
#define global TUNNEL_TYPE_DIRECT  0x2
#define global TUNNEL_TYPE_6TO4  0xb
#define global TUNNEL_TYPE_ISATAP  0xd
#define global TUNNEL_TYPE_TEREDO  0xe
#define global TUNNEL_TYPE_IPHTTPS  0xf

; TXFS_MINIVERSION
#define global TXFS_MINIVERSION_COMMITTED_VIEW  0x0
#define global TXFS_MINIVERSION_DIRTY_VIEW  0xffff
#define global TXFS_MINIVERSION_DEFAULT_VIEW  0xfffe

; TYMED
#define global TYMED_HGLOBAL  0x1
#define global TYMED_FILE  0x2
#define global TYMED_ISTREAM  0x4
#define global TYMED_ISTORAGE  0x8
#define global TYMED_GDI  0x10
#define global TYMED_MFPICT  0x20
#define global TYMED_ENHMF  0x40
#define global TYMED_NULL  0x0

; TYPEKIND
#define global TKIND_ENUM  0x0
#define global TKIND_RECORD  0x1
#define global TKIND_MODULE  0x2
#define global TKIND_INTERFACE  0x3
#define global TKIND_DISPATCH  0x4
#define global TKIND_COCLASS  0x5
#define global TKIND_ALIAS  0x6
#define global TKIND_UNION  0x7
#define global TKIND_MAX  0x8

; UDP_TABLE_CLASS
#define global UDP_TABLE_BASIC  0x0
#define global UDP_TABLE_OWNER_PID  0x1
#define global UDP_TABLE_OWNER_MODULE  0x2

; UMS_THREAD_INFO_CLASS
#define global UmsThreadInvalidInfoClass  0x0
#define global UmsThreadUserContext  0x1
#define global UmsThreadPriority  0x2
#define global UmsThreadAffinity  0x3
#define global UmsThreadTeb  0x4
#define global UmsThreadIsSuspended  0x5
#define global UmsThreadIsTerminated  0x6
#define global UmsThreadMaxInfoClass  0x7

; Unit
#define global UnitWorld  0x0
#define global UnitDisplay  0x1
#define global UnitPixel  0x2
#define global UnitPoint  0x3
#define global UnitInch  0x4
#define global UnitDocument  0x5
#define global UnitMillimeter  0x6

; UPDATE_LAYERED_WINDOW_FLAGS
#define global ULW_ALPHA  0x2
#define global ULW_COLORKEY  0x1
#define global ULW_OPAQUE  0x4
#define global ULW_EX_NORESIZE  0x8

; URI_CREATE_FLAGS
#define global Uri_CREATE_ALLOW_RELATIVE  0x1
#define global Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME  0x2
#define global Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME  0x4
#define global Uri_CREATE_NOFRAG  0x8
#define global Uri_CREATE_NO_CANONICALIZE  0x10
#define global Uri_CREATE_CANONICALIZE  0x100
#define global Uri_CREATE_FILE_USE_DOS_PATH  0x20
#define global Uri_CREATE_DECODE_EXTRA_INFO  0x40
#define global Uri_CREATE_NO_DECODE_EXTRA_INFO  0x80
#define global Uri_CREATE_CRACK_UNKNOWN_SCHEMES  0x200
#define global Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES  0x400
#define global Uri_CREATE_PRE_PROCESS_HTML_URI  0x800
#define global Uri_CREATE_NO_PRE_PROCESS_HTML_URI  0x1000
#define global Uri_CREATE_IE_SETTINGS  0x2000
#define global Uri_CREATE_NO_IE_SETTINGS  0x4000
#define global Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS  0x8000
#define global Uri_CREATE_NORMALIZE_INTL_CHARACTERS  0x10000
#define global Uri_CREATE_CANONICALIZE_ABSOLUTE  0x20000

; Uri_PROPERTY
#define global Uri_PROPERTY_ABSOLUTE_URI  0x0
#define global Uri_PROPERTY_STRING_START  0x0
#define global Uri_PROPERTY_AUTHORITY  0x1
#define global Uri_PROPERTY_DISPLAY_URI  0x2
#define global Uri_PROPERTY_DOMAIN  0x3
#define global Uri_PROPERTY_EXTENSION  0x4
#define global Uri_PROPERTY_FRAGMENT  0x5
#define global Uri_PROPERTY_HOST  0x6
#define global Uri_PROPERTY_PASSWORD  0x7
#define global Uri_PROPERTY_PATH  0x8
#define global Uri_PROPERTY_PATH_AND_QUERY  0x9
#define global Uri_PROPERTY_QUERY  0xa
#define global Uri_PROPERTY_RAW_URI  0xb
#define global Uri_PROPERTY_SCHEME_NAME  0xc
#define global Uri_PROPERTY_USER_INFO  0xd
#define global Uri_PROPERTY_USER_NAME  0xe
#define global Uri_PROPERTY_STRING_LAST  0xe
#define global Uri_PROPERTY_HOST_TYPE  0xf
#define global Uri_PROPERTY_DWORD_START  0xf
#define global Uri_PROPERTY_PORT  0x10
#define global Uri_PROPERTY_SCHEME  0x11
#define global Uri_PROPERTY_ZONE  0x12
#define global Uri_PROPERTY_DWORD_LAST  0x12

; URL_CACHE_LIMIT_TYPE
#define global UrlCacheLimitTypeIE  0x0
#define global UrlCacheLimitTypeIETotal  0x1
#define global UrlCacheLimitTypeAppContainer  0x2
#define global UrlCacheLimitTypeAppContainerTotal  0x3
#define global UrlCacheLimitTypeNum  0x4

; URLZONEREG
#define global URLZONEREG_DEFAULT  0x0
#define global URLZONEREG_HKLM  0x1
#define global URLZONEREG_HKCU  0x2

; USER_OBJECT_INFORMATION_INDEX
#define global UOI_FLAGS  0x1
#define global UOI_HEAPSIZE  0x5
#define global UOI_IO  0x6
#define global UOI_NAME  0x2
#define global UOI_TYPE  0x3
#define global UOI_USER_SID  0x4

; USERCLASSTYPE
#define global USERCLASSTYPE_FULL  0x1
#define global USERCLASSTYPE_SHORT  0x2
#define global USERCLASSTYPE_APPNAME  0x3

; VALIDATEUNC_OPTION
#define global VALIDATEUNC_CONNECT  0x1
#define global VALIDATEUNC_NOUI  0x2
#define global VALIDATEUNC_PRINT  0x4
#define global VALIDATEUNC_PERSIST  0x8
#define global VALIDATEUNC_VALID  0xf

; VAR_CHANGE_FLAGS
#define global VARIANT_NOVALUEPROP  0x1
#define global VARIANT_ALPHABOOL  0x2
#define global VARIANT_NOUSEROVERRIDE  0x4
#define global VARIANT_CALENDAR_HIJRI  0x8
#define global VARIANT_LOCALBOOL  0x10
#define global VARIANT_CALENDAR_THAI  0x20
#define global VARIANT_CALENDAR_GREGORIAN  0x40
#define global VARIANT_USE_NLS  0x80

; VARCMP
#define global VARCMP_LT  0x0
#define global VARCMP_EQ  0x1
#define global VARCMP_GT  0x2
#define global VARCMP_NULL  0x3

; VARENUM
#define global VT_EMPTY  0x0
#define global VT_NULL  0x1
#define global VT_I2  0x2
#define global VT_I4  0x3
#define global VT_R4  0x4
#define global VT_R8  0x5
#define global VT_CY  0x6
#define global VT_DATE  0x7
#define global VT_BSTR  0x8
#define global VT_DISPATCH  0x9
#define global VT_ERROR  0xa
#define global VT_BOOL  0xb
#define global VT_VARIANT  0xc
#define global VT_UNKNOWN  0xd
#define global VT_DECIMAL  0xe
#define global VT_I1  0x10
#define global VT_UI1  0x11
#define global VT_UI2  0x12
#define global VT_UI4  0x13
#define global VT_I8  0x14
#define global VT_UI8  0x15
#define global VT_INT  0x16
#define global VT_UINT  0x17
#define global VT_VOID  0x18
#define global VT_HRESULT  0x19
#define global VT_PTR  0x1a
#define global VT_SAFEARRAY  0x1b
#define global VT_CARRAY  0x1c
#define global VT_USERDEFINED  0x1d
#define global VT_LPSTR  0x1e
#define global VT_LPWSTR  0x1f
#define global VT_RECORD  0x24
#define global VT_INT_PTR  0x25
#define global VT_UINT_PTR  0x26
#define global VT_FILETIME  0x40
#define global VT_BLOB  0x41
#define global VT_STREAM  0x42
#define global VT_STORAGE  0x43
#define global VT_STREAMED_OBJECT  0x44
#define global VT_STORED_OBJECT  0x45
#define global VT_BLOB_OBJECT  0x46
#define global VT_CF  0x47
#define global VT_CLSID  0x48
#define global VT_VERSIONED_STREAM  0x49
#define global VT_BSTR_BLOB  0xfff
#define global VT_VECTOR  0x1000
#define global VT_ARRAY  0x2000
#define global VT_BYREF  0x4000
#define global VT_RESERVED  0x8000
#define global VT_ILLEGAL  0xffff
#define global VT_ILLEGALMASKED  0xfff
#define global VT_TYPEMASK  0xfff

; VARFLAGS
#define global VARFLAG_FREADONLY  0x1
#define global VARFLAG_FSOURCE  0x2
#define global VARFLAG_FBINDABLE  0x4
#define global VARFLAG_FREQUESTEDIT  0x8
#define global VARFLAG_FDISPLAYBIND  0x10
#define global VARFLAG_FDEFAULTBIND  0x20
#define global VARFLAG_FHIDDEN  0x40
#define global VARFLAG_FRESTRICTED  0x80
#define global VARFLAG_FDEFAULTCOLLELEM  0x100
#define global VARFLAG_FUIDEFAULT  0x200
#define global VARFLAG_FNONBROWSABLE  0x400
#define global VARFLAG_FREPLACEABLE  0x800
#define global VARFLAG_FIMMEDIATEBIND  0x1000

; VARFORMAT_FIRST_DAY
#define global VARFORMAT_FIRST_DAY_SYSTEMDEFAULT  0x0
#define global VARFORMAT_FIRST_DAY_MONDAY  0x1
#define global VARFORMAT_FIRST_DAY_TUESDAY  0x2
#define global VARFORMAT_FIRST_DAY_WEDNESDAY  0x3
#define global VARFORMAT_FIRST_DAY_THURSDAY  0x4
#define global VARFORMAT_FIRST_DAY_FRIDAY  0x5
#define global VARFORMAT_FIRST_DAY_SATURDAY  0x6
#define global VARFORMAT_FIRST_DAY_SUNDAY  0x7

; VARFORMAT_FIRST_WEEK
#define global VARFORMAT_FIRST_WEEK_SYSTEMDEFAULT  0x0
#define global VARFORMAT_FIRST_WEEK_CONTAINS_JANUARY_FIRST  0x1
#define global VARFORMAT_FIRST_WEEK_LARGER_HALF_IN_CURRENT_YEAR  0x2
#define global VARFORMAT_FIRST_WEEK_HAS_SEVEN_DAYS  0x3

; VARFORMAT_GROUP
#define global VARFORMAT_GROUP_SYSTEMDEFAULT  -2
#define global VARFORMAT_GROUP_THOUSANDS  -1
#define global VARFORMAT_GROUP_NOTTHOUSANDS  0x0

; VARFORMAT_LEADING_DIGIT
#define global VARFORMAT_LEADING_DIGIT_SYSTEMDEFAULT  -2
#define global VARFORMAT_LEADING_DIGIT_INCLUDED  -1
#define global VARFORMAT_LEADING_DIGIT_NOTINCLUDED  0x0

; VARFORMAT_NAMED_FORMAT
#define global VARFORMAT_NAMED_FORMAT_GENERALDATE  0x0
#define global VARFORMAT_NAMED_FORMAT_LONGDATE  0x1
#define global VARFORMAT_NAMED_FORMAT_SHORTDATE  0x2
#define global VARFORMAT_NAMED_FORMAT_LONGTIME  0x3
#define global VARFORMAT_NAMED_FORMAT_SHORTTIME  0x4

; VARFORMAT_PARENTHESES
#define global VARFORMAT_PARENTHESES_SYSTEMDEFAULT  -2
#define global VARFORMAT_PARENTHESES_USED  -1
#define global VARFORMAT_PARENTHESES_NOTUSED  0x0

; VARKIND
#define global VAR_PERINSTANCE  0x0
#define global VAR_STATIC  0x1
#define global VAR_CONST  0x2
#define global VAR_DISPATCH  0x3

; VER_FIND_FILE_FLAGS
#define global VFFF_ISSHAREDFILE  0x1

; VER_FIND_FILE_STATUS
#define global VFF_CURNEDEST  0x1
#define global VFF_FILEINUSE  0x2
#define global VFF_BUFFTOOSMALL  0x4

; VER_FLAGS
#define global VER_MINORVERSION  0x1
#define global VER_MAJORVERSION  0x2
#define global VER_BUILDNUMBER  0x4
#define global VER_PLATFORMID  0x8
#define global VER_SERVICEPACKMINOR  0x10
#define global VER_SERVICEPACKMAJOR  0x20
#define global VER_SUITENAME  0x40
#define global VER_PRODUCT_TYPE  0x80

; VER_INSTALL_FILE_FLAGS
#define global VIFF_FORCEINSTALL  0x1
#define global VIFF_DONTDELETEOLD  0x2

; VER_INSTALL_FILE_STATUS
#define global VIF_TEMPFILE  0x1
#define global VIF_MISMATCH  0x2
#define global VIF_SRCOLD  0x4
#define global VIF_DIFFLANG  0x8
#define global VIF_DIFFCODEPG  0x10
#define global VIF_DIFFTYPE  0x20
#define global VIF_WRITEPROT  0x40
#define global VIF_FILEINUSE  0x80
#define global VIF_OUTOFSPACE  0x100
#define global VIF_ACCESSVIOLATION  0x200
#define global VIF_SHARINGVIOLATION  0x400
#define global VIF_CANNOTCREATE  0x800
#define global VIF_CANNOTDELETE  0x1000
#define global VIF_CANNOTRENAME  0x2000
#define global VIF_CANNOTDELETECUR  0x4000
#define global VIF_OUTOFMEMORY  0x8000
#define global VIF_CANNOTREADSRC  0x10000
#define global VIF_CANNOTREADDST  0x20000
#define global VIF_BUFFTOOSMALL  0x40000
#define global VIF_CANNOTLOADLZ32  0x80000
#define global VIF_CANNOTLOADCABINET  0x100000

; VIRTUAL_ALLOCATION_TYPE
#define global MEM_COMMIT  0x1000
#define global MEM_RESERVE  0x2000
#define global MEM_RESET  0x80000
#define global MEM_RESET_UNDO  0x1000000
#define global MEM_REPLACE_PLACEHOLDER  0x4000
#define global MEM_LARGE_PAGES  0x20000000
#define global MEM_RESERVE_PLACEHOLDER  0x40000
#define global MEM_FREE  0x10000

; VIRTUAL_FREE_TYPE
#define global MEM_DECOMMIT  0x4000
#define global MEM_RELEASE  0x8000

; VIRTUAL_KEY
#define global VK_0  0x30
#define global VK_1  0x31
#define global VK_2  0x32
#define global VK_3  0x33
#define global VK_4  0x34
#define global VK_5  0x35
#define global VK_6  0x36
#define global VK_7  0x37
#define global VK_8  0x38
#define global VK_9  0x39
#define global VK_A  0x41
#define global VK_B  0x42
#define global VK_C  0x43
#define global VK_D  0x44
#define global VK_E  0x45
#define global VK_F  0x46
#define global VK_G  0x47
#define global VK_H  0x48
#define global VK_I  0x49
#define global VK_J  0x4a
#define global VK_K  0x4b
#define global VK_L  0x4c
#define global VK_M  0x4d
#define global VK_N  0x4e
#define global VK_O  0x4f
#define global VK_P  0x50
#define global VK_Q  0x51
#define global VK_R  0x52
#define global VK_S  0x53
#define global VK_T  0x54
#define global VK_U  0x55
#define global VK_V  0x56
#define global VK_W  0x57
#define global VK_X  0x58
#define global VK_Y  0x59
#define global VK_Z  0x5a
#define global VK_ABNT_C1  0xc1
#define global VK_ABNT_C2  0xc2
#define global VK_DBE_ALPHANUMERIC  0xf0
#define global VK_DBE_CODEINPUT  0xfa
#define global VK_DBE_DBCSCHAR  0xf4
#define global VK_DBE_DETERMINESTRING  0xfc
#define global VK_DBE_ENTERDLGCONVERSIONMODE  0xfd
#define global VK_DBE_ENTERIMECONFIGMODE  0xf8
#define global VK_DBE_ENTERWORDREGISTERMODE  0xf7
#define global VK_DBE_FLUSHSTRING  0xf9
#define global VK_DBE_HIRAGANA  0xf2
#define global VK_DBE_KATAKANA  0xf1
#define global VK_DBE_NOCODEINPUT  0xfb
#define global VK_DBE_NOROMAN  0xf6
#define global VK_DBE_ROMAN  0xf5
#define global VK_DBE_SBCSCHAR  0xf3
#define global VK__none_  0xff
#define global VK_LBUTTON  0x1
#define global VK_RBUTTON  0x2
#define global VK_CANCEL  0x3
#define global VK_MBUTTON  0x4
#define global VK_XBUTTON1  0x5
#define global VK_XBUTTON2  0x6
#define global VK_BACK  0x8
#define global VK_TAB  0x9
#define global VK_CLEAR  0xc
#define global VK_RETURN  0xd
#define global VK_SHIFT  0x10
#define global VK_CONTROL  0x11
#define global VK_MENU  0x12
#define global VK_PAUSE  0x13
#define global VK_CAPITAL  0x14
#define global VK_KANA  0x15
#define global VK_HANGEUL  0x15
#define global VK_HANGUL  0x15
#define global VK_IME_ON  0x16
#define global VK_JUNJA  0x17
#define global VK_FINAL  0x18
#define global VK_HANJA  0x19
#define global VK_KANJI  0x19
#define global VK_IME_OFF  0x1a
#define global VK_ESCAPE  0x1b
#define global VK_CONVERT  0x1c
#define global VK_NONCONVERT  0x1d
#define global VK_ACCEPT  0x1e
#define global VK_MODECHANGE  0x1f
#define global VK_SPACE  0x20
#define global VK_PRIOR  0x21
#define global VK_NEXT  0x22
#define global VK_END  0x23
#define global VK_HOME  0x24
#define global VK_LEFT  0x25
#define global VK_UP  0x26
#define global VK_RIGHT  0x27
#define global VK_DOWN  0x28
#define global VK_SELECT  0x29
#define global VK_PRINT  0x2a
#define global VK_EXECUTE  0x2b
#define global VK_SNAPSHOT  0x2c
#define global VK_INSERT  0x2d
#define global VK_DELETE  0x2e
#define global VK_HELP  0x2f
#define global VK_LWIN  0x5b
#define global VK_RWIN  0x5c
#define global VK_APPS  0x5d
#define global VK_SLEEP  0x5f
#define global VK_NUMPAD0  0x60
#define global VK_NUMPAD1  0x61
#define global VK_NUMPAD2  0x62
#define global VK_NUMPAD3  0x63
#define global VK_NUMPAD4  0x64
#define global VK_NUMPAD5  0x65
#define global VK_NUMPAD6  0x66
#define global VK_NUMPAD7  0x67
#define global VK_NUMPAD8  0x68
#define global VK_NUMPAD9  0x69
#define global VK_MULTIPLY  0x6a
#define global VK_ADD  0x6b
#define global VK_SEPARATOR  0x6c
#define global VK_SUBTRACT  0x6d
#define global VK_DECIMAL  0x6e
#define global VK_DIVIDE  0x6f
#define global VK_F1  0x70
#define global VK_F2  0x71
#define global VK_F3  0x72
#define global VK_F4  0x73
#define global VK_F5  0x74
#define global VK_F6  0x75
#define global VK_F7  0x76
#define global VK_F8  0x77
#define global VK_F9  0x78
#define global VK_F10  0x79
#define global VK_F11  0x7a
#define global VK_F12  0x7b
#define global VK_F13  0x7c
#define global VK_F14  0x7d
#define global VK_F15  0x7e
#define global VK_F16  0x7f
#define global VK_F17  0x80
#define global VK_F18  0x81
#define global VK_F19  0x82
#define global VK_F20  0x83
#define global VK_F21  0x84
#define global VK_F22  0x85
#define global VK_F23  0x86
#define global VK_F24  0x87
#define global VK_NAVIGATION_VIEW  0x88
#define global VK_NAVIGATION_MENU  0x89
#define global VK_NAVIGATION_UP  0x8a
#define global VK_NAVIGATION_DOWN  0x8b
#define global VK_NAVIGATION_LEFT  0x8c
#define global VK_NAVIGATION_RIGHT  0x8d
#define global VK_NAVIGATION_ACCEPT  0x8e
#define global VK_NAVIGATION_CANCEL  0x8f
#define global VK_NUMLOCK  0x90
#define global VK_SCROLL  0x91
#define global VK_OEM_NEC_EQUAL  0x92
#define global VK_OEM_FJ_JISHO  0x92
#define global VK_OEM_FJ_MASSHOU  0x93
#define global VK_OEM_FJ_TOUROKU  0x94
#define global VK_OEM_FJ_LOYA  0x95
#define global VK_OEM_FJ_ROYA  0x96
#define global VK_LSHIFT  0xa0
#define global VK_RSHIFT  0xa1
#define global VK_LCONTROL  0xa2
#define global VK_RCONTROL  0xa3
#define global VK_LMENU  0xa4
#define global VK_RMENU  0xa5
#define global VK_BROWSER_BACK  0xa6
#define global VK_BROWSER_FORWARD  0xa7
#define global VK_BROWSER_REFRESH  0xa8
#define global VK_BROWSER_STOP  0xa9
#define global VK_BROWSER_SEARCH  0xaa
#define global VK_BROWSER_FAVORITES  0xab
#define global VK_BROWSER_HOME  0xac
#define global VK_VOLUME_MUTE  0xad
#define global VK_VOLUME_DOWN  0xae
#define global VK_VOLUME_UP  0xaf
#define global VK_MEDIA_NEXT_TRACK  0xb0
#define global VK_MEDIA_PREV_TRACK  0xb1
#define global VK_MEDIA_STOP  0xb2
#define global VK_MEDIA_PLAY_PAUSE  0xb3
#define global VK_LAUNCH_MAIL  0xb4
#define global VK_LAUNCH_MEDIA_SELECT  0xb5
#define global VK_LAUNCH_APP1  0xb6
#define global VK_LAUNCH_APP2  0xb7
#define global VK_OEM_1  0xba
#define global VK_OEM_PLUS  0xbb
#define global VK_OEM_COMMA  0xbc
#define global VK_OEM_MINUS  0xbd
#define global VK_OEM_PERIOD  0xbe
#define global VK_OEM_2  0xbf
#define global VK_OEM_3  0xc0
#define global VK_GAMEPAD_A  0xc3
#define global VK_GAMEPAD_B  0xc4
#define global VK_GAMEPAD_X  0xc5
#define global VK_GAMEPAD_Y  0xc6
#define global VK_GAMEPAD_RIGHT_SHOULDER  0xc7
#define global VK_GAMEPAD_LEFT_SHOULDER  0xc8
#define global VK_GAMEPAD_LEFT_TRIGGER  0xc9
#define global VK_GAMEPAD_RIGHT_TRIGGER  0xca
#define global VK_GAMEPAD_DPAD_UP  0xcb
#define global VK_GAMEPAD_DPAD_DOWN  0xcc
#define global VK_GAMEPAD_DPAD_LEFT  0xcd
#define global VK_GAMEPAD_DPAD_RIGHT  0xce
#define global VK_GAMEPAD_MENU  0xcf
#define global VK_GAMEPAD_VIEW  0xd0
#define global VK_GAMEPAD_LEFT_THUMBSTICK_BUTTON  0xd1
#define global VK_GAMEPAD_RIGHT_THUMBSTICK_BUTTON  0xd2
#define global VK_GAMEPAD_LEFT_THUMBSTICK_UP  0xd3
#define global VK_GAMEPAD_LEFT_THUMBSTICK_DOWN  0xd4
#define global VK_GAMEPAD_LEFT_THUMBSTICK_RIGHT  0xd5
#define global VK_GAMEPAD_LEFT_THUMBSTICK_LEFT  0xd6
#define global VK_GAMEPAD_RIGHT_THUMBSTICK_UP  0xd7
#define global VK_GAMEPAD_RIGHT_THUMBSTICK_DOWN  0xd8
#define global VK_GAMEPAD_RIGHT_THUMBSTICK_RIGHT  0xd9
#define global VK_GAMEPAD_RIGHT_THUMBSTICK_LEFT  0xda
#define global VK_OEM_4  0xdb
#define global VK_OEM_5  0xdc
#define global VK_OEM_6  0xdd
#define global VK_OEM_7  0xde
#define global VK_OEM_8  0xdf
#define global VK_OEM_AX  0xe1
#define global VK_OEM_102  0xe2
#define global VK_ICO_HELP  0xe3
#define global VK_ICO_00  0xe4
#define global VK_PROCESSKEY  0xe5
#define global VK_ICO_CLEAR  0xe6
#define global VK_PACKET  0xe7
#define global VK_OEM_RESET  0xe9
#define global VK_OEM_JUMP  0xea
#define global VK_OEM_PA1  0xeb
#define global VK_OEM_PA2  0xec
#define global VK_OEM_PA3  0xed
#define global VK_OEM_WSCTRL  0xee
#define global VK_OEM_CUSEL  0xef
#define global VK_OEM_ATTN  0xf0
#define global VK_OEM_FINISH  0xf1
#define global VK_OEM_COPY  0xf2
#define global VK_OEM_AUTO  0xf3
#define global VK_OEM_ENLW  0xf4
#define global VK_OEM_BACKTAB  0xf5
#define global VK_ATTN  0xf6
#define global VK_CRSEL  0xf7
#define global VK_EXSEL  0xf8
#define global VK_EREOF  0xf9
#define global VK_PLAY  0xfa
#define global VK_ZOOM  0xfb
#define global VK_NONAME  0xfc
#define global VK_PA1  0xfd
#define global VK_OEM_CLEAR  0xfe

; WAIT_CHAIN_THREAD_OPTIONS
#define global WCT_OUT_OF_PROC_COM_FLAG  0x2
#define global WCT_OUT_OF_PROC_CS_FLAG  0x4
#define global WCT_OUT_OF_PROC_FLAG  0x1

; WAIT_EVENT
#define global WAIT_OBJECT_0  0x0
#define global WAIT_ABANDONED  0x80
#define global WAIT_ABANDONED_0  0x80
#define global WAIT_IO_COMPLETION  0xc0
#define global WAIT_TIMEOUT  0x102
#define global WAIT_FAILED  0xffffffff

; WarpMode
#define global WarpModePerspective  0x0
#define global WarpModeBilinear  0x1

; WBEM_COMPARISON_FLAG
#define global WBEM_COMPARISON_INCLUDE_ALL  0x0
#define global WBEM_FLAG_IGNORE_QUALIFIERS  0x1
#define global WBEM_FLAG_IGNORE_OBJECT_SOURCE  0x2
#define global WBEM_FLAG_IGNORE_DEFAULT_VALUES  0x4
#define global WBEM_FLAG_IGNORE_CLASS  0x8
#define global WBEM_FLAG_IGNORE_CASE  0x10
#define global WBEM_FLAG_IGNORE_FLAVOR  0x20

; WBEM_CONDITION_FLAG_TYPE
#define global WBEM_FLAG_ALWAYS  0x0
#define global WBEM_FLAG_ONLY_IF_TRUE  0x1
#define global WBEM_FLAG_ONLY_IF_FALSE  0x2
#define global WBEM_FLAG_ONLY_IF_IDENTICAL  0x3
#define global WBEM_MASK_PRIMARY_CONDITION  0x3
#define global WBEM_FLAG_KEYS_ONLY  0x4
#define global WBEM_FLAG_REFS_ONLY  0x8
#define global WBEM_FLAG_LOCAL_ONLY  0x10
#define global WBEM_FLAG_PROPAGATED_ONLY  0x20
#define global WBEM_FLAG_SYSTEM_ONLY  0x30
#define global WBEM_FLAG_NONSYSTEM_ONLY  0x40
#define global WBEM_MASK_CONDITION_ORIGIN  0x70
#define global WBEM_FLAG_CLASS_OVERRIDES_ONLY  0x100
#define global WBEM_FLAG_CLASS_LOCAL_AND_OVERRIDES  0x200
#define global WBEM_MASK_CLASS_CONDITION  0x300

; WBEM_GENERIC_FLAG_TYPE
#define global WBEM_FLAG_RETURN_IMMEDIATELY  0x10
#define global WBEM_FLAG_RETURN_WBEM_COMPLETE  0x0
#define global WBEM_FLAG_BIDIRECTIONAL  0x0
#define global WBEM_FLAG_FORWARD_ONLY  0x20
#define global WBEM_FLAG_NO_ERROR_OBJECT  0x40
#define global WBEM_FLAG_RETURN_ERROR_OBJECT  0x0
#define global WBEM_FLAG_SEND_STATUS  0x80
#define global WBEM_FLAG_DONT_SEND_STATUS  0x0
#define global WBEM_FLAG_ENSURE_LOCATABLE  0x100
#define global WBEM_FLAG_DIRECT_READ  0x200
#define global WBEM_FLAG_SEND_ONLY_SELECTED  0x0
#define global WBEM_RETURN_WHEN_COMPLETE  0x0
#define global WBEM_RETURN_IMMEDIATELY  0x10
#define global WBEM_MASK_RESERVED_FLAGS  0x1f000
#define global WBEM_FLAG_USE_AMENDED_QUALIFIERS  0x20000
#define global WBEM_FLAG_STRONG_VALIDATION  0x100000

; WCT_OBJECT_STATUS
#define global WctStatusNoAccess  0x1
#define global WctStatusRunning  0x2
#define global WctStatusBlocked  0x3
#define global WctStatusPidOnly  0x4
#define global WctStatusPidOnlyRpcss  0x5
#define global WctStatusOwned  0x6
#define global WctStatusNotOwned  0x7
#define global WctStatusAbandoned  0x8
#define global WctStatusUnknown  0x9
#define global WctStatusError  0xa
#define global WctStatusMax  0xb

; WCT_OBJECT_TYPE
#define global WctCriticalSectionType  0x1
#define global WctSendMessageType  0x2
#define global WctMutexType  0x3
#define global WctAlpcType  0x4
#define global WctComType  0x5
#define global WctThreadWaitType  0x6
#define global WctProcessWaitType  0x7
#define global WctThreadType  0x8
#define global WctComActivationType  0x9
#define global WctUnknownType  0xa
#define global WctSocketIoType  0xb
#define global WctSmbIoType  0xc
#define global WctMaxType  0xd

; WELL_KNOWN_SID_TYPE
#define global WinNullSid  0x0
#define global WinWorldSid  0x1
#define global WinLocalSid  0x2
#define global WinCreatorOwnerSid  0x3
#define global WinCreatorGroupSid  0x4
#define global WinCreatorOwnerServerSid  0x5
#define global WinCreatorGroupServerSid  0x6
#define global WinNtAuthoritySid  0x7
#define global WinDialupSid  0x8
#define global WinNetworkSid  0x9
#define global WinBatchSid  0xa
#define global WinInteractiveSid  0xb
#define global WinServiceSid  0xc
#define global WinAnonymousSid  0xd
#define global WinProxySid  0xe
#define global WinEnterpriseControllersSid  0xf
#define global WinSelfSid  0x10
#define global WinAuthenticatedUserSid  0x11
#define global WinRestrictedCodeSid  0x12
#define global WinTerminalServerSid  0x13
#define global WinRemoteLogonIdSid  0x14
#define global WinLogonIdsSid  0x15
#define global WinLocalSystemSid  0x16
#define global WinLocalServiceSid  0x17
#define global WinNetworkServiceSid  0x18
#define global WinBuiltinDomainSid  0x19
#define global WinBuiltinAdministratorsSid  0x1a
#define global WinBuiltinUsersSid  0x1b
#define global WinBuiltinGuestsSid  0x1c
#define global WinBuiltinPowerUsersSid  0x1d
#define global WinBuiltinAccountOperatorsSid  0x1e
#define global WinBuiltinSystemOperatorsSid  0x1f
#define global WinBuiltinPrintOperatorsSid  0x20
#define global WinBuiltinBackupOperatorsSid  0x21
#define global WinBuiltinReplicatorSid  0x22
#define global WinBuiltinPreWindows2000CompatibleAccessSid  0x23
#define global WinBuiltinRemoteDesktopUsersSid  0x24
#define global WinBuiltinNetworkConfigurationOperatorsSid  0x25
#define global WinAccountAdministratorSid  0x26
#define global WinAccountGuestSid  0x27
#define global WinAccountKrbtgtSid  0x28
#define global WinAccountDomainAdminsSid  0x29
#define global WinAccountDomainUsersSid  0x2a
#define global WinAccountDomainGuestsSid  0x2b
#define global WinAccountComputersSid  0x2c
#define global WinAccountControllersSid  0x2d
#define global WinAccountCertAdminsSid  0x2e
#define global WinAccountSchemaAdminsSid  0x2f
#define global WinAccountEnterpriseAdminsSid  0x30
#define global WinAccountPolicyAdminsSid  0x31
#define global WinAccountRasAndIasServersSid  0x32
#define global WinNTLMAuthenticationSid  0x33
#define global WinDigestAuthenticationSid  0x34
#define global WinSChannelAuthenticationSid  0x35
#define global WinThisOrganizationSid  0x36
#define global WinOtherOrganizationSid  0x37
#define global WinBuiltinIncomingForestTrustBuildersSid  0x38
#define global WinBuiltinPerfMonitoringUsersSid  0x39
#define global WinBuiltinPerfLoggingUsersSid  0x3a
#define global WinBuiltinAuthorizationAccessSid  0x3b
#define global WinBuiltinTerminalServerLicenseServersSid  0x3c
#define global WinBuiltinDCOMUsersSid  0x3d
#define global WinBuiltinIUsersSid  0x3e
#define global WinIUserSid  0x3f
#define global WinBuiltinCryptoOperatorsSid  0x40
#define global WinUntrustedLabelSid  0x41
#define global WinLowLabelSid  0x42
#define global WinMediumLabelSid  0x43
#define global WinHighLabelSid  0x44
#define global WinSystemLabelSid  0x45
#define global WinWriteRestrictedCodeSid  0x46
#define global WinCreatorOwnerRightsSid  0x47
#define global WinCacheablePrincipalsGroupSid  0x48
#define global WinNonCacheablePrincipalsGroupSid  0x49
#define global WinEnterpriseReadonlyControllersSid  0x4a
#define global WinAccountReadonlyControllersSid  0x4b
#define global WinBuiltinEventLogReadersGroup  0x4c
#define global WinNewEnterpriseReadonlyControllersSid  0x4d
#define global WinBuiltinCertSvcDComAccessGroup  0x4e
#define global WinMediumPlusLabelSid  0x4f
#define global WinLocalLogonSid  0x50
#define global WinConsoleLogonSid  0x51
#define global WinThisOrganizationCertificateSid  0x52
#define global WinApplicationPackageAuthoritySid  0x53
#define global WinBuiltinAnyPackageSid  0x54
#define global WinCapabilityInternetClientSid  0x55
#define global WinCapabilityInternetClientServerSid  0x56
#define global WinCapabilityPrivateNetworkClientServerSid  0x57
#define global WinCapabilityPicturesLibrarySid  0x58
#define global WinCapabilityVideosLibrarySid  0x59
#define global WinCapabilityMusicLibrarySid  0x5a
#define global WinCapabilityDocumentsLibrarySid  0x5b
#define global WinCapabilitySharedUserCertificatesSid  0x5c
#define global WinCapabilityEnterpriseAuthenticationSid  0x5d
#define global WinCapabilityRemovableStorageSid  0x5e
#define global WinBuiltinRDSRemoteAccessServersSid  0x5f
#define global WinBuiltinRDSEndpointServersSid  0x60
#define global WinBuiltinRDSManagementServersSid  0x61
#define global WinUserModeDriversSid  0x62
#define global WinBuiltinHyperVAdminsSid  0x63
#define global WinAccountCloneableControllersSid  0x64
#define global WinBuiltinAccessControlAssistanceOperatorsSid  0x65
#define global WinBuiltinRemoteManagementUsersSid  0x66
#define global WinAuthenticationAuthorityAssertedSid  0x67
#define global WinAuthenticationServiceAssertedSid  0x68
#define global WinLocalAccountSid  0x69
#define global WinLocalAccountAndAdministratorSid  0x6a
#define global WinAccountProtectedUsersSid  0x6b
#define global WinCapabilityAppointmentsSid  0x6c
#define global WinCapabilityContactsSid  0x6d
#define global WinAccountDefaultSystemManagedSid  0x6e
#define global WinBuiltinDefaultSystemManagedGroupSid  0x6f
#define global WinBuiltinStorageReplicaAdminsSid  0x70
#define global WinAccountKeyAdminsSid  0x71
#define global WinAccountEnterpriseKeyAdminsSid  0x72
#define global WinAuthenticationKeyTrustSid  0x73
#define global WinAuthenticationKeyPropertyMFASid  0x74
#define global WinAuthenticationKeyPropertyAttestationSid  0x75
#define global WinAuthenticationFreshKeyAuthSid  0x76
#define global WinBuiltinDeviceOwnersSid  0x77

; WER_CONSENT
#define global WerConsentNotAsked  0x1
#define global WerConsentApproved  0x2
#define global WerConsentDenied  0x3
#define global WerConsentAlwaysPrompt  0x4
#define global WerConsentMax  0x5

; WER_FAULT_REPORTING
#define global WER_FAULT_REPORTING_FLAG_DISABLE_THREAD_SUSPENSION  0x4
#define global WER_FAULT_REPORTING_FLAG_NOHEAP  0x1
#define global WER_FAULT_REPORTING_FLAG_QUEUE  0x2
#define global WER_FAULT_REPORTING_FLAG_QUEUE_UPLOAD  0x8
#define global WER_FAULT_REPORTING_ALWAYS_SHOW_UI  0x10

; WER_FILE
#define global WER_FILE_ANONYMOUS_DATA  0x2
#define global WER_FILE_DELETE_WHEN_DONE  0x1

; WER_FILE_TYPE
#define global WerFileTypeMicrodump  0x1
#define global WerFileTypeMinidump  0x2
#define global WerFileTypeHeapdump  0x3
#define global WerFileTypeUserDocument  0x4
#define global WerFileTypeOther  0x5
#define global WerFileTypeTriagedump  0x6
#define global WerFileTypeCustomDump  0x7
#define global WerFileTypeAuxiliaryDump  0x8
#define global WerFileTypeEtlTrace  0x9
#define global WerFileTypeMax  0xa

; WER_REGISTER_FILE_TYPE
#define global WerRegFileTypeUserDocument  0x1
#define global WerRegFileTypeOther  0x2
#define global WerRegFileTypeMax  0x3

; WER_REPORT_TYPE
#define global WerReportNonCritical  0x0
#define global WerReportCritical  0x1
#define global WerReportApplicationCrash  0x2
#define global WerReportApplicationHang  0x3
#define global WerReportKernel  0x4
#define global WerReportInvalid  0x5

; WER_REPORT_UI
#define global WerUIAdditionalDataDlgHeader  0x1
#define global WerUIIconFilePath  0x2
#define global WerUIConsentDlgHeader  0x3
#define global WerUIConsentDlgBody  0x4
#define global WerUIOnlineSolutionCheckText  0x5
#define global WerUIOfflineSolutionCheckText  0x6
#define global WerUICloseText  0x7
#define global WerUICloseDlgHeader  0x8
#define global WerUICloseDlgBody  0x9
#define global WerUICloseDlgButtonText  0xa
#define global WerUIMax  0xb

; WER_SUBMIT_FLAGS
#define global WER_SUBMIT_ADD_REGISTERED_DATA  0x10
#define global WER_SUBMIT_HONOR_RECOVERY  0x1
#define global WER_SUBMIT_HONOR_RESTART  0x2
#define global WER_SUBMIT_NO_ARCHIVE  0x100
#define global WER_SUBMIT_NO_CLOSE_UI  0x40
#define global WER_SUBMIT_NO_QUEUE  0x80
#define global WER_SUBMIT_OUTOFPROCESS  0x20
#define global WER_SUBMIT_OUTOFPROCESS_ASYNC  0x400
#define global WER_SUBMIT_QUEUE  0x4
#define global WER_SUBMIT_SHOW_DEBUG  0x8
#define global WER_SUBMIT_START_MINIMIZED  0x200
#define global WER_SUBMIT_BYPASS_DATA_THROTTLING  0x800
#define global WER_SUBMIT_ARCHIVE_PARAMETERS_ONLY  0x1000
#define global WER_SUBMIT_REPORT_MACHINE_ID  0x2000

; WER_SUBMIT_RESULT
#define global WerReportQueued  0x1
#define global WerReportUploaded  0x2
#define global WerReportDebug  0x3
#define global WerReportFailed  0x4
#define global WerDisabled  0x5
#define global WerReportCancelled  0x6
#define global WerDisabledQueue  0x7
#define global WerReportAsync  0x8
#define global WerCustomAction  0x9
#define global WerThrottled  0xa
#define global WerReportUploadedCab  0xb
#define global WerStorageLocationNotFound  0xc
#define global WerSubmitResultMax  0xd

; WICBitmapAlphaChannelOption
#define global WICBitmapUseAlpha  0x0
#define global WICBitmapUsePremultipliedAlpha  0x1
#define global WICBitmapIgnoreAlpha  0x2

; WICBitmapCreateCacheOption
#define global WICBitmapNoCache  0x0
#define global WICBitmapCacheOnDemand  0x1
#define global WICBitmapCacheOnLoad  0x2

; WICBitmapDitherType
#define global WICBitmapDitherTypeNone  0x0
#define global WICBitmapDitherTypeSolid  0x0
#define global WICBitmapDitherTypeOrdered4x4  0x1
#define global WICBitmapDitherTypeOrdered8x8  0x2
#define global WICBitmapDitherTypeOrdered16x16  0x3
#define global WICBitmapDitherTypeSpiral4x4  0x4
#define global WICBitmapDitherTypeSpiral8x8  0x5
#define global WICBitmapDitherTypeDualSpiral4x4  0x6
#define global WICBitmapDitherTypeDualSpiral8x8  0x7
#define global WICBitmapDitherTypeErrorDiffusion  0x8

; WICBitmapEncoderCacheOption
#define global WICBitmapEncoderCacheInMemory  0x0
#define global WICBitmapEncoderCacheTempFile  0x1
#define global WICBitmapEncoderNoCache  0x2

; WICBitmapInterpolationMode
#define global WICBitmapInterpolationModeNearestNeighbor  0x0
#define global WICBitmapInterpolationModeLinear  0x1
#define global WICBitmapInterpolationModeCubic  0x2
#define global WICBitmapInterpolationModeFant  0x3
#define global WICBitmapInterpolationModeHighQualityCubic  0x4

; WICBitmapPaletteType
#define global WICBitmapPaletteTypeCustom  0x0
#define global WICBitmapPaletteTypeMedianCut  0x1
#define global WICBitmapPaletteTypeFixedBW  0x2
#define global WICBitmapPaletteTypeFixedHalftone8  0x3
#define global WICBitmapPaletteTypeFixedHalftone27  0x4
#define global WICBitmapPaletteTypeFixedHalftone64  0x5
#define global WICBitmapPaletteTypeFixedHalftone125  0x6
#define global WICBitmapPaletteTypeFixedHalftone216  0x7
#define global WICBitmapPaletteTypeFixedWebPalette  0x7
#define global WICBitmapPaletteTypeFixedHalftone252  0x8
#define global WICBitmapPaletteTypeFixedHalftone256  0x9
#define global WICBitmapPaletteTypeFixedGray4  0xa
#define global WICBitmapPaletteTypeFixedGray16  0xb
#define global WICBitmapPaletteTypeFixedGray256  0xc

; WICBitmapTransformOptions
#define global WICBitmapTransformRotate0  0x0
#define global WICBitmapTransformRotate90  0x1
#define global WICBitmapTransformRotate180  0x2
#define global WICBitmapTransformRotate270  0x3
#define global WICBitmapTransformFlipHorizontal  0x8
#define global WICBitmapTransformFlipVertical  0x10

; WICColorContextType
#define global WICColorContextUninitialized  0x0
#define global WICColorContextProfile  0x1
#define global WICColorContextExifColorSpace  0x2

; WICComponentType
#define global WICDecoder  0x1
#define global WICEncoder  0x2
#define global WICPixelFormatConverter  0x4
#define global WICMetadataReader  0x8
#define global WICMetadataWriter  0x10
#define global WICPixelFormat  0x20
#define global WICAllComponents  0x3f

; WICDecodeOptions
#define global WICDecodeMetadataCacheOnDemand  0x0
#define global WICDecodeMetadataCacheOnLoad  0x1

; WICSectionAccessLevel
#define global WICSectionAccessLevelRead  0x1
#define global WICSectionAccessLevelReadWrite  0x3

; WIN32_ERROR
#define global NO_ERROR  0x0
#define global ERROR_EXPECTED_SECTION_NAME  0xe0000000
#define global ERROR_BAD_SECTION_NAME_LINE  0xe0000001
#define global ERROR_SECTION_NAME_TOO_LONG  0xe0000002
#define global ERROR_GENERAL_SYNTAX  0xe0000003
#define global ERROR_WRONG_INF_STYLE  0xe0000100
#define global ERROR_SECTION_NOT_FOUND  0xe0000101
#define global ERROR_LINE_NOT_FOUND  0xe0000102
#define global ERROR_NO_BACKUP  0xe0000103
#define global ERROR_NO_ASSOCIATED_CLASS  0xe0000200
#define global ERROR_CLASS_MISMATCH  0xe0000201
#define global ERROR_DUPLICATE_FOUND  0xe0000202
#define global ERROR_NO_DRIVER_SELECTED  0xe0000203
#define global ERROR_KEY_DOES_NOT_EXIST  0xe0000204
#define global ERROR_INVALID_DEVINST_NAME  0xe0000205
#define global ERROR_INVALID_CLASS  0xe0000206
#define global ERROR_DEVINST_ALREADY_EXISTS  0xe0000207
#define global ERROR_DEVINFO_NOT_REGISTERED  0xe0000208
#define global ERROR_INVALID_REG_PROPERTY  0xe0000209
#define global ERROR_NO_INF  0xe000020a
#define global ERROR_NO_SUCH_DEVINST  0xe000020b
#define global ERROR_CANT_LOAD_CLASS_ICON  0xe000020c
#define global ERROR_INVALID_CLASS_INSTALLER  0xe000020d
#define global ERROR_DI_DO_DEFAULT  0xe000020e
#define global ERROR_DI_NOFILECOPY  0xe000020f
#define global ERROR_INVALID_HWPROFILE  0xe0000210
#define global ERROR_NO_DEVICE_SELECTED  0xe0000211
#define global ERROR_DEVINFO_LIST_LOCKED  0xe0000212
#define global ERROR_DEVINFO_DATA_LOCKED  0xe0000213
#define global ERROR_DI_BAD_PATH  0xe0000214
#define global ERROR_NO_CLASSINSTALL_PARAMS  0xe0000215
#define global ERROR_FILEQUEUE_LOCKED  0xe0000216
#define global ERROR_BAD_SERVICE_INSTALLSECT  0xe0000217
#define global ERROR_NO_CLASS_DRIVER_LIST  0xe0000218
#define global ERROR_NO_ASSOCIATED_SERVICE  0xe0000219
#define global ERROR_NO_DEFAULT_DEVICE_INTERFACE  0xe000021a
#define global ERROR_DEVICE_INTERFACE_ACTIVE  0xe000021b
#define global ERROR_DEVICE_INTERFACE_REMOVED  0xe000021c
#define global ERROR_BAD_INTERFACE_INSTALLSECT  0xe000021d
#define global ERROR_NO_SUCH_INTERFACE_CLASS  0xe000021e
#define global ERROR_INVALID_REFERENCE_STRING  0xe000021f
#define global ERROR_INVALID_MACHINENAME  0xe0000220
#define global ERROR_REMOTE_COMM_FAILURE  0xe0000221
#define global ERROR_MACHINE_UNAVAILABLE  0xe0000222
#define global ERROR_NO_CONFIGMGR_SERVICES  0xe0000223
#define global ERROR_INVALID_PROPPAGE_PROVIDER  0xe0000224
#define global ERROR_NO_SUCH_DEVICE_INTERFACE  0xe0000225
#define global ERROR_DI_POSTPROCESSING_REQUIRED  0xe0000226
#define global ERROR_INVALID_COINSTALLER  0xe0000227
#define global ERROR_NO_COMPAT_DRIVERS  0xe0000228
#define global ERROR_NO_DEVICE_ICON  0xe0000229
#define global ERROR_INVALID_INF_LOGCONFIG  0xe000022a
#define global ERROR_DI_DONT_INSTALL  0xe000022b
#define global ERROR_INVALID_FILTER_DRIVER  0xe000022c
#define global ERROR_NON_WINDOWS_NT_DRIVER  0xe000022d
#define global ERROR_NON_WINDOWS_DRIVER  0xe000022e
#define global ERROR_NO_CATALOG_FOR_OEM_INF  0xe000022f
#define global ERROR_DEVINSTALL_QUEUE_NONNATIVE  0xe0000230
#define global ERROR_NOT_DISABLEABLE  0xe0000231
#define global ERROR_CANT_REMOVE_DEVINST  0xe0000232
#define global ERROR_INVALID_TARGET  0xe0000233
#define global ERROR_DRIVER_NONNATIVE  0xe0000234
#define global ERROR_IN_WOW64  0xe0000235
#define global ERROR_SET_SYSTEM_RESTORE_POINT  0xe0000236
#define global ERROR_SCE_DISABLED  0xe0000238
#define global ERROR_UNKNOWN_EXCEPTION  0xe0000239
#define global ERROR_PNP_REGISTRY_ERROR  0xe000023a
#define global ERROR_REMOTE_REQUEST_UNSUPPORTED  0xe000023b
#define global ERROR_NOT_AN_INSTALLED_OEM_INF  0xe000023c
#define global ERROR_INF_IN_USE_BY_DEVICES  0xe000023d
#define global ERROR_DI_FUNCTION_OBSOLETE  0xe000023e
#define global ERROR_NO_AUTHENTICODE_CATALOG  0xe000023f
#define global ERROR_AUTHENTICODE_DISALLOWED  0xe0000240
#define global ERROR_AUTHENTICODE_TRUSTED_PUBLISHER  0xe0000241
#define global ERROR_AUTHENTICODE_TRUST_NOT_ESTABLISHED  0xe0000242
#define global ERROR_AUTHENTICODE_PUBLISHER_NOT_TRUSTED  0xe0000243
#define global ERROR_SIGNATURE_OSATTRIBUTE_MISMATCH  0xe0000244
#define global ERROR_ONLY_VALIDATE_VIA_AUTHENTICODE  0xe0000245
#define global ERROR_DEVICE_INSTALLER_NOT_READY  0xe0000246
#define global ERROR_DRIVER_STORE_ADD_FAILED  0xe0000247
#define global ERROR_DEVICE_INSTALL_BLOCKED  0xe0000248
#define global ERROR_DRIVER_INSTALL_BLOCKED  0xe0000249
#define global ERROR_WRONG_INF_TYPE  0xe000024a
#define global ERROR_FILE_HASH_NOT_IN_CATALOG  0xe000024b
#define global ERROR_DRIVER_STORE_DELETE_FAILED  0xe000024c
#define global ERROR_UNRECOVERABLE_STACK_OVERFLOW  0xe0000300
#define global ERROR_NO_DEFAULT_INTERFACE_DEVICE  0xe000021a
#define global ERROR_INTERFACE_DEVICE_ACTIVE  0xe000021b
#define global ERROR_INTERFACE_DEVICE_REMOVED  0xe000021c
#define global ERROR_NO_SUCH_INTERFACE_DEVICE  0xe0000225
#define global ERROR_NOT_INSTALLED  0xe0001000
#define global ERROR_SUCCESS  0x0
#define global ERROR_INVALID_FUNCTION  0x1
#define global ERROR_FILE_NOT_FOUND  0x2
#define global ERROR_PATH_NOT_FOUND  0x3
#define global ERROR_TOO_MANY_OPEN_FILES  0x4
#define global ERROR_ACCESS_DENIED  0x5
#define global ERROR_INVALID_HANDLE  0x6
#define global ERROR_ARENA_TRASHED  0x7
#define global ERROR_NOT_ENOUGH_MEMORY  0x8
#define global ERROR_INVALID_BLOCK  0x9
#define global ERROR_BAD_ENVIRONMENT  0xa
#define global ERROR_BAD_FORMAT  0xb
#define global ERROR_INVALID_ACCESS  0xc
#define global ERROR_INVALID_DATA  0xd
#define global ERROR_OUTOFMEMORY  0xe
#define global ERROR_INVALID_DRIVE  0xf
#define global ERROR_CURRENT_DIRECTORY  0x10
#define global ERROR_NOT_SAME_DEVICE  0x11
#define global ERROR_NO_MORE_FILES  0x12
#define global ERROR_WRITE_PROTECT  0x13
#define global ERROR_BAD_UNIT  0x14
#define global ERROR_NOT_READY  0x15
#define global ERROR_BAD_COMMAND  0x16
#define global ERROR_CRC  0x17
#define global ERROR_BAD_LENGTH  0x18
#define global ERROR_SEEK  0x19
#define global ERROR_NOT_DOS_DISK  0x1a
#define global ERROR_SECTOR_NOT_FOUND  0x1b
#define global ERROR_OUT_OF_PAPER  0x1c
#define global ERROR_WRITE_FAULT  0x1d
#define global ERROR_READ_FAULT  0x1e
#define global ERROR_GEN_FAILURE  0x1f
#define global ERROR_SHARING_VIOLATION  0x20
#define global ERROR_LOCK_VIOLATION  0x21
#define global ERROR_WRONG_DISK  0x22
#define global ERROR_SHARING_BUFFER_EXCEEDED  0x24
#define global ERROR_HANDLE_EOF  0x26
#define global ERROR_HANDLE_DISK_FULL  0x27
#define global ERROR_NOT_SUPPORTED  0x32
#define global ERROR_REM_NOT_LIST  0x33
#define global ERROR_DUP_NAME  0x34
#define global ERROR_BAD_NETPATH  0x35
#define global ERROR_NETWORK_BUSY  0x36
#define global ERROR_DEV_NOT_EXIST  0x37
#define global ERROR_TOO_MANY_CMDS  0x38
#define global ERROR_ADAP_HDW_ERR  0x39
#define global ERROR_BAD_NET_RESP  0x3a
#define global ERROR_UNEXP_NET_ERR  0x3b
#define global ERROR_BAD_REM_ADAP  0x3c
#define global ERROR_PRINTQ_FULL  0x3d
#define global ERROR_NO_SPOOL_SPACE  0x3e
#define global ERROR_PRINT_CANCELLED  0x3f
#define global ERROR_NETNAME_DELETED  0x40
#define global ERROR_NETWORK_ACCESS_DENIED  0x41
#define global ERROR_BAD_DEV_TYPE  0x42
#define global ERROR_BAD_NET_NAME  0x43
#define global ERROR_TOO_MANY_NAMES  0x44
#define global ERROR_TOO_MANY_SESS  0x45
#define global ERROR_SHARING_PAUSED  0x46
#define global ERROR_REQ_NOT_ACCEP  0x47
#define global ERROR_REDIR_PAUSED  0x48
#define global ERROR_FILE_EXISTS  0x50
#define global ERROR_CANNOT_MAKE  0x52
#define global ERROR_FAIL_I24  0x53
#define global ERROR_OUT_OF_STRUCTURES  0x54
#define global ERROR_ALREADY_ASSIGNED  0x55
#define global ERROR_INVALID_PASSWORD  0x56
#define global ERROR_INVALID_PARAMETER  0x57
#define global ERROR_NET_WRITE_FAULT  0x58
#define global ERROR_NO_PROC_SLOTS  0x59
#define global ERROR_TOO_MANY_SEMAPHORES  0x64
#define global ERROR_EXCL_SEM_ALREADY_OWNED  0x65
#define global ERROR_SEM_IS_SET  0x66
#define global ERROR_TOO_MANY_SEM_REQUESTS  0x67
#define global ERROR_INVALID_AT_INTERRUPT_TIME  0x68
#define global ERROR_SEM_OWNER_DIED  0x69
#define global ERROR_SEM_USER_LIMIT  0x6a
#define global ERROR_DISK_CHANGE  0x6b
#define global ERROR_DRIVE_LOCKED  0x6c
#define global ERROR_BROKEN_PIPE  0x6d
#define global ERROR_OPEN_FAILED  0x6e
#define global ERROR_BUFFER_OVERFLOW  0x6f
#define global ERROR_DISK_FULL  0x70
#define global ERROR_NO_MORE_SEARCH_HANDLES  0x71
#define global ERROR_INVALID_TARGET_HANDLE  0x72
#define global ERROR_INVALID_CATEGORY  0x75
#define global ERROR_INVALID_VERIFY_SWITCH  0x76
#define global ERROR_BAD_DRIVER_LEVEL  0x77
#define global ERROR_CALL_NOT_IMPLEMENTED  0x78
#define global ERROR_SEM_TIMEOUT  0x79
#define global ERROR_INSUFFICIENT_BUFFER  0x7a
#define global ERROR_INVALID_NAME  0x7b
#define global ERROR_INVALID_LEVEL  0x7c
#define global ERROR_NO_VOLUME_LABEL  0x7d
#define global ERROR_MOD_NOT_FOUND  0x7e
#define global ERROR_PROC_NOT_FOUND  0x7f
#define global ERROR_WAIT_NO_CHILDREN  0x80
#define global ERROR_CHILD_NOT_COMPLETE  0x81
#define global ERROR_DIRECT_ACCESS_HANDLE  0x82
#define global ERROR_NEGATIVE_SEEK  0x83
#define global ERROR_SEEK_ON_DEVICE  0x84
#define global ERROR_IS_JOIN_TARGET  0x85
#define global ERROR_IS_JOINED  0x86
#define global ERROR_IS_SUBSTED  0x87
#define global ERROR_NOT_JOINED  0x88
#define global ERROR_NOT_SUBSTED  0x89
#define global ERROR_JOIN_TO_JOIN  0x8a
#define global ERROR_SUBST_TO_SUBST  0x8b
#define global ERROR_JOIN_TO_SUBST  0x8c
#define global ERROR_SUBST_TO_JOIN  0x8d
#define global ERROR_BUSY_DRIVE  0x8e
#define global ERROR_SAME_DRIVE  0x8f
#define global ERROR_DIR_NOT_ROOT  0x90
#define global ERROR_DIR_NOT_EMPTY  0x91
#define global ERROR_IS_SUBST_PATH  0x92
#define global ERROR_IS_JOIN_PATH  0x93
#define global ERROR_PATH_BUSY  0x94
#define global ERROR_IS_SUBST_TARGET  0x95
#define global ERROR_SYSTEM_TRACE  0x96
#define global ERROR_INVALID_EVENT_COUNT  0x97
#define global ERROR_TOO_MANY_MUXWAITERS  0x98
#define global ERROR_INVALID_LIST_FORMAT  0x99
#define global ERROR_LABEL_TOO_LONG  0x9a
#define global ERROR_TOO_MANY_TCBS  0x9b
#define global ERROR_SIGNAL_REFUSED  0x9c
#define global ERROR_DISCARDED  0x9d
#define global ERROR_NOT_LOCKED  0x9e
#define global ERROR_BAD_THREADID_ADDR  0x9f
#define global ERROR_BAD_ARGUMENTS  0xa0
#define global ERROR_BAD_PATHNAME  0xa1
#define global ERROR_SIGNAL_PENDING  0xa2
#define global ERROR_MAX_THRDS_REACHED  0xa4
#define global ERROR_LOCK_FAILED  0xa7
#define global ERROR_BUSY  0xaa
#define global ERROR_DEVICE_SUPPORT_IN_PROGRESS  0xab
#define global ERROR_CANCEL_VIOLATION  0xad
#define global ERROR_ATOMIC_LOCKS_NOT_SUPPORTED  0xae
#define global ERROR_INVALID_SEGMENT_NUMBER  0xb4
#define global ERROR_INVALID_ORDINAL  0xb6
#define global ERROR_ALREADY_EXISTS  0xb7
#define global ERROR_INVALID_FLAG_NUMBER  0xba
#define global ERROR_SEM_NOT_FOUND  0xbb
#define global ERROR_INVALID_STARTING_CODESEG  0xbc
#define global ERROR_INVALID_STACKSEG  0xbd
#define global ERROR_INVALID_MODULETYPE  0xbe
#define global ERROR_INVALID_EXE_SIGNATURE  0xbf
#define global ERROR_EXE_MARKED_INVALID  0xc0
#define global ERROR_BAD_EXE_FORMAT  0xc1
#define global ERROR_ITERATED_DATA_EXCEEDS_64k  0xc2
#define global ERROR_INVALID_MINALLOCSIZE  0xc3
#define global ERROR_DYNLINK_FROM_INVALID_RING  0xc4
#define global ERROR_IOPL_NOT_ENABLED  0xc5
#define global ERROR_INVALID_SEGDPL  0xc6
#define global ERROR_AUTODATASEG_EXCEEDS_64k  0xc7
#define global ERROR_RING2SEG_MUST_BE_MOVABLE  0xc8
#define global ERROR_RELOC_CHAIN_XEEDS_SEGLIM  0xc9
#define global ERROR_INFLOOP_IN_RELOC_CHAIN  0xca
#define global ERROR_ENVVAR_NOT_FOUND  0xcb
#define global ERROR_NO_SIGNAL_SENT  0xcd
#define global ERROR_FILENAME_EXCED_RANGE  0xce
#define global ERROR_RING2_STACK_IN_USE  0xcf
#define global ERROR_META_EXPANSION_TOO_LONG  0xd0
#define global ERROR_INVALID_SIGNAL_NUMBER  0xd1
#define global ERROR_THREAD_1_INACTIVE  0xd2
#define global ERROR_LOCKED  0xd4
#define global ERROR_TOO_MANY_MODULES  0xd6
#define global ERROR_NESTING_NOT_ALLOWED  0xd7
#define global ERROR_EXE_MACHINE_TYPE_MISMATCH  0xd8
#define global ERROR_EXE_CANNOT_MODIFY_SIGNED_BINARY  0xd9
#define global ERROR_EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY  0xda
#define global ERROR_FILE_CHECKED_OUT  0xdc
#define global ERROR_CHECKOUT_REQUIRED  0xdd
#define global ERROR_BAD_FILE_TYPE  0xde
#define global ERROR_FILE_TOO_LARGE  0xdf
#define global ERROR_FORMS_AUTH_REQUIRED  0xe0
#define global ERROR_VIRUS_INFECTED  0xe1
#define global ERROR_VIRUS_DELETED  0xe2
#define global ERROR_PIPE_LOCAL  0xe5
#define global ERROR_BAD_PIPE  0xe6
#define global ERROR_PIPE_BUSY  0xe7
#define global ERROR_NO_DATA  0xe8
#define global ERROR_PIPE_NOT_CONNECTED  0xe9
#define global ERROR_MORE_DATA  0xea
#define global ERROR_NO_WORK_DONE  0xeb
#define global ERROR_VC_DISCONNECTED  0xf0
#define global ERROR_INVALID_EA_NAME  0xfe
#define global ERROR_EA_LIST_INCONSISTENT  0xff
#define global ERROR_NO_MORE_ITEMS  0x103
#define global ERROR_CANNOT_COPY  0x10a
#define global ERROR_DIRECTORY  0x10b
#define global ERROR_EAS_DIDNT_FIT  0x113
#define global ERROR_EA_FILE_CORRUPT  0x114
#define global ERROR_EA_TABLE_FULL  0x115
#define global ERROR_INVALID_EA_HANDLE  0x116
#define global ERROR_EAS_NOT_SUPPORTED  0x11a
#define global ERROR_NOT_OWNER  0x120
#define global ERROR_TOO_MANY_POSTS  0x12a
#define global ERROR_PARTIAL_COPY  0x12b
#define global ERROR_OPLOCK_NOT_GRANTED  0x12c
#define global ERROR_INVALID_OPLOCK_PROTOCOL  0x12d
#define global ERROR_DISK_TOO_FRAGMENTED  0x12e
#define global ERROR_DELETE_PENDING  0x12f
#define global ERROR_INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING  0x130
#define global ERROR_SHORT_NAMES_NOT_ENABLED_ON_VOLUME  0x131
#define global ERROR_SECURITY_STREAM_IS_INCONSISTENT  0x132
#define global ERROR_INVALID_LOCK_RANGE  0x133
#define global ERROR_IMAGE_SUBSYSTEM_NOT_PRESENT  0x134
#define global ERROR_NOTIFICATION_GUID_ALREADY_DEFINED  0x135
#define global ERROR_INVALID_EXCEPTION_HANDLER  0x136
#define global ERROR_DUPLICATE_PRIVILEGES  0x137
#define global ERROR_NO_RANGES_PROCESSED  0x138
#define global ERROR_NOT_ALLOWED_ON_SYSTEM_FILE  0x139
#define global ERROR_DISK_RESOURCES_EXHAUSTED  0x13a
#define global ERROR_INVALID_TOKEN  0x13b
#define global ERROR_DEVICE_FEATURE_NOT_SUPPORTED  0x13c
#define global ERROR_MR_MID_NOT_FOUND  0x13d
#define global ERROR_SCOPE_NOT_FOUND  0x13e
#define global ERROR_UNDEFINED_SCOPE  0x13f
#define global ERROR_INVALID_CAP  0x140
#define global ERROR_DEVICE_UNREACHABLE  0x141
#define global ERROR_DEVICE_NO_RESOURCES  0x142
#define global ERROR_DATA_CHECKSUM_ERROR  0x143
#define global ERROR_INTERMIXED_KERNEL_EA_OPERATION  0x144
#define global ERROR_FILE_LEVEL_TRIM_NOT_SUPPORTED  0x146
#define global ERROR_OFFSET_ALIGNMENT_VIOLATION  0x147
#define global ERROR_INVALID_FIELD_IN_PARAMETER_LIST  0x148
#define global ERROR_OPERATION_IN_PROGRESS  0x149
#define global ERROR_BAD_DEVICE_PATH  0x14a
#define global ERROR_TOO_MANY_DESCRIPTORS  0x14b
#define global ERROR_SCRUB_DATA_DISABLED  0x14c
#define global ERROR_NOT_REDUNDANT_STORAGE  0x14d
#define global ERROR_RESIDENT_FILE_NOT_SUPPORTED  0x14e
#define global ERROR_COMPRESSED_FILE_NOT_SUPPORTED  0x14f
#define global ERROR_DIRECTORY_NOT_SUPPORTED  0x150
#define global ERROR_NOT_READ_FROM_COPY  0x151
#define global ERROR_FT_WRITE_FAILURE  0x152
#define global ERROR_FT_DI_SCAN_REQUIRED  0x153
#define global ERROR_INVALID_KERNEL_INFO_VERSION  0x154
#define global ERROR_INVALID_PEP_INFO_VERSION  0x155
#define global ERROR_OBJECT_NOT_EXTERNALLY_BACKED  0x156
#define global ERROR_EXTERNAL_BACKING_PROVIDER_UNKNOWN  0x157
#define global ERROR_COMPRESSION_NOT_BENEFICIAL  0x158
#define global ERROR_STORAGE_TOPOLOGY_ID_MISMATCH  0x159
#define global ERROR_BLOCKED_BY_PARENTAL_CONTROLS  0x15a
#define global ERROR_BLOCK_TOO_MANY_REFERENCES  0x15b
#define global ERROR_MARKED_TO_DISALLOW_WRITES  0x15c
#define global ERROR_ENCLAVE_FAILURE  0x15d
#define global ERROR_FAIL_NOACTION_REBOOT  0x15e
#define global ERROR_FAIL_SHUTDOWN  0x15f
#define global ERROR_FAIL_RESTART  0x160
#define global ERROR_MAX_SESSIONS_REACHED  0x161
#define global ERROR_NETWORK_ACCESS_DENIED_EDP  0x162
#define global ERROR_DEVICE_HINT_NAME_BUFFER_TOO_SMALL  0x163
#define global ERROR_EDP_POLICY_DENIES_OPERATION  0x164
#define global ERROR_EDP_DPL_POLICY_CANT_BE_SATISFIED  0x165
#define global ERROR_CLOUD_FILE_SYNC_ROOT_METADATA_CORRUPT  0x166
#define global ERROR_DEVICE_IN_MAINTENANCE  0x167
#define global ERROR_NOT_SUPPORTED_ON_DAX  0x168
#define global ERROR_DAX_MAPPING_EXISTS  0x169
#define global ERROR_CLOUD_FILE_PROVIDER_NOT_RUNNING  0x16a
#define global ERROR_CLOUD_FILE_METADATA_CORRUPT  0x16b
#define global ERROR_CLOUD_FILE_METADATA_TOO_LARGE  0x16c
#define global ERROR_CLOUD_FILE_PROPERTY_BLOB_TOO_LARGE  0x16d
#define global ERROR_CLOUD_FILE_PROPERTY_BLOB_CHECKSUM_MISMATCH  0x16e
#define global ERROR_CHILD_PROCESS_BLOCKED  0x16f
#define global ERROR_STORAGE_LOST_DATA_PERSISTENCE  0x170
#define global ERROR_FILE_SYSTEM_VIRTUALIZATION_UNAVAILABLE  0x171
#define global ERROR_FILE_SYSTEM_VIRTUALIZATION_METADATA_CORRUPT  0x172
#define global ERROR_FILE_SYSTEM_VIRTUALIZATION_BUSY  0x173
#define global ERROR_FILE_SYSTEM_VIRTUALIZATION_PROVIDER_UNKNOWN  0x174
#define global ERROR_GDI_HANDLE_LEAK  0x175
#define global ERROR_CLOUD_FILE_TOO_MANY_PROPERTY_BLOBS  0x176
#define global ERROR_CLOUD_FILE_PROPERTY_VERSION_NOT_SUPPORTED  0x177
#define global ERROR_NOT_A_CLOUD_FILE  0x178
#define global ERROR_CLOUD_FILE_NOT_IN_SYNC  0x179
#define global ERROR_CLOUD_FILE_ALREADY_CONNECTED  0x17a
#define global ERROR_CLOUD_FILE_NOT_SUPPORTED  0x17b
#define global ERROR_CLOUD_FILE_INVALID_REQUEST  0x17c
#define global ERROR_CLOUD_FILE_READ_ONLY_VOLUME  0x17d
#define global ERROR_CLOUD_FILE_CONNECTED_PROVIDER_ONLY  0x17e
#define global ERROR_CLOUD_FILE_VALIDATION_FAILED  0x17f
#define global ERROR_SMB1_NOT_AVAILABLE  0x180
#define global ERROR_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION  0x181
#define global ERROR_CLOUD_FILE_AUTHENTICATION_FAILED  0x182
#define global ERROR_CLOUD_FILE_INSUFFICIENT_RESOURCES  0x183
#define global ERROR_CLOUD_FILE_NETWORK_UNAVAILABLE  0x184
#define global ERROR_CLOUD_FILE_UNSUCCESSFUL  0x185
#define global ERROR_CLOUD_FILE_NOT_UNDER_SYNC_ROOT  0x186
#define global ERROR_CLOUD_FILE_IN_USE  0x187
#define global ERROR_CLOUD_FILE_PINNED  0x188
#define global ERROR_CLOUD_FILE_REQUEST_ABORTED  0x189
#define global ERROR_CLOUD_FILE_PROPERTY_CORRUPT  0x18a
#define global ERROR_CLOUD_FILE_ACCESS_DENIED  0x18b
#define global ERROR_CLOUD_FILE_INCOMPATIBLE_HARDLINKS  0x18c
#define global ERROR_CLOUD_FILE_PROPERTY_LOCK_CONFLICT  0x18d
#define global ERROR_CLOUD_FILE_REQUEST_CANCELED  0x18e
#define global ERROR_EXTERNAL_SYSKEY_NOT_SUPPORTED  0x18f
#define global ERROR_THREAD_MODE_ALREADY_BACKGROUND  0x190
#define global ERROR_THREAD_MODE_NOT_BACKGROUND  0x191
#define global ERROR_PROCESS_MODE_ALREADY_BACKGROUND  0x192
#define global ERROR_PROCESS_MODE_NOT_BACKGROUND  0x193
#define global ERROR_CLOUD_FILE_PROVIDER_TERMINATED  0x194
#define global ERROR_NOT_A_CLOUD_SYNC_ROOT  0x195
#define global ERROR_FILE_PROTECTED_UNDER_DPL  0x196
#define global ERROR_VOLUME_NOT_CLUSTER_ALIGNED  0x197
#define global ERROR_NO_PHYSICALLY_ALIGNED_FREE_SPACE_FOUND  0x198
#define global ERROR_APPX_FILE_NOT_ENCRYPTED  0x199
#define global ERROR_RWRAW_ENCRYPTED_FILE_NOT_ENCRYPTED  0x19a
#define global ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILEOFFSET  0x19b
#define global ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILERANGE  0x19c
#define global ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_PARAMETER  0x19d
#define global ERROR_LINUX_SUBSYSTEM_NOT_PRESENT  0x19e
#define global ERROR_FT_READ_FAILURE  0x19f
#define global ERROR_STORAGE_RESERVE_ID_INVALID  0x1a0
#define global ERROR_STORAGE_RESERVE_DOES_NOT_EXIST  0x1a1
#define global ERROR_STORAGE_RESERVE_ALREADY_EXISTS  0x1a2
#define global ERROR_STORAGE_RESERVE_NOT_EMPTY  0x1a3
#define global ERROR_NOT_A_DAX_VOLUME  0x1a4
#define global ERROR_NOT_DAX_MAPPABLE  0x1a5
#define global ERROR_TIME_SENSITIVE_THREAD  0x1a6
#define global ERROR_DPL_NOT_SUPPORTED_FOR_USER  0x1a7
#define global ERROR_CASE_DIFFERING_NAMES_IN_DIR  0x1a8
#define global ERROR_FILE_NOT_SUPPORTED  0x1a9
#define global ERROR_CLOUD_FILE_REQUEST_TIMEOUT  0x1aa
#define global ERROR_NO_TASK_QUEUE  0x1ab
#define global ERROR_SRC_SRV_DLL_LOAD_FAILED  0x1ac
#define global ERROR_NOT_SUPPORTED_WITH_BTT  0x1ad
#define global ERROR_ENCRYPTION_DISABLED  0x1ae
#define global ERROR_ENCRYPTING_METADATA_DISALLOWED  0x1af
#define global ERROR_CANT_CLEAR_ENCRYPTION_FLAG  0x1b0
#define global ERROR_NO_SUCH_DEVICE  0x1b1
#define global ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED  0x1b2
#define global ERROR_FILE_SNAP_IN_PROGRESS  0x1b3
#define global ERROR_FILE_SNAP_USER_SECTION_NOT_SUPPORTED  0x1b4
#define global ERROR_FILE_SNAP_MODIFY_NOT_SUPPORTED  0x1b5
#define global ERROR_FILE_SNAP_IO_NOT_COORDINATED  0x1b6
#define global ERROR_FILE_SNAP_UNEXPECTED_ERROR  0x1b7
#define global ERROR_FILE_SNAP_INVALID_PARAMETER  0x1b8
#define global ERROR_UNSATISFIED_DEPENDENCIES  0x1b9
#define global ERROR_CASE_SENSITIVE_PATH  0x1ba
#define global ERROR_UNEXPECTED_NTCACHEMANAGER_ERROR  0x1bb
#define global ERROR_LINUX_SUBSYSTEM_UPDATE_REQUIRED  0x1bc
#define global ERROR_DLP_POLICY_WARNS_AGAINST_OPERATION  0x1bd
#define global ERROR_DLP_POLICY_DENIES_OPERATION  0x1be
#define global ERROR_SECURITY_DENIES_OPERATION  0x1bf
#define global ERROR_UNTRUSTED_MOUNT_POINT  0x1c0
#define global ERROR_DLP_POLICY_SILENTLY_FAIL  0x1c1
#define global ERROR_CAPAUTHZ_NOT_DEVUNLOCKED  0x1c2
#define global ERROR_CAPAUTHZ_CHANGE_TYPE  0x1c3
#define global ERROR_CAPAUTHZ_NOT_PROVISIONED  0x1c4
#define global ERROR_CAPAUTHZ_NOT_AUTHORIZED  0x1c5
#define global ERROR_CAPAUTHZ_NO_POLICY  0x1c6
#define global ERROR_CAPAUTHZ_DB_CORRUPTED  0x1c7
#define global ERROR_CAPAUTHZ_SCCD_INVALID_CATALOG  0x1c8
#define global ERROR_CAPAUTHZ_SCCD_NO_AUTH_ENTITY  0x1c9
#define global ERROR_CAPAUTHZ_SCCD_PARSE_ERROR  0x1ca
#define global ERROR_CAPAUTHZ_SCCD_DEV_MODE_REQUIRED  0x1cb
#define global ERROR_CAPAUTHZ_SCCD_NO_CAPABILITY_MATCH  0x1cc
#define global ERROR_CIMFS_IMAGE_CORRUPT  0x1d6
#define global ERROR_CIMFS_IMAGE_VERSION_NOT_SUPPORTED  0x1d7
#define global ERROR_STORAGE_STACK_ACCESS_DENIED  0x1d8
#define global ERROR_INSUFFICIENT_VIRTUAL_ADDR_RESOURCES  0x1d9
#define global ERROR_INDEX_OUT_OF_BOUNDS  0x1da
#define global ERROR_CLOUD_FILE_US_MESSAGE_TIMEOUT  0x1db
#define global ERROR_NOT_A_DEV_VOLUME  0x1dc
#define global ERROR_FS_GUID_MISMATCH  0x1dd
#define global ERROR_CANT_ATTACH_TO_DEV_VOLUME  0x1de
#define global ERROR_INVALID_CONFIG_VALUE  0x1df
#define global ERROR_PNP_QUERY_REMOVE_DEVICE_TIMEOUT  0x1e0
#define global ERROR_PNP_QUERY_REMOVE_RELATED_DEVICE_TIMEOUT  0x1e1
#define global ERROR_PNP_QUERY_REMOVE_UNRELATED_DEVICE_TIMEOUT  0x1e2
#define global ERROR_DEVICE_HARDWARE_ERROR  0x1e3
#define global ERROR_INVALID_ADDRESS  0x1e7
#define global ERROR_HAS_SYSTEM_CRITICAL_FILES  0x1e8
#define global ERROR_ENCRYPTED_FILE_NOT_SUPPORTED  0x1e9
#define global ERROR_SPARSE_FILE_NOT_SUPPORTED  0x1ea
#define global ERROR_PAGEFILE_NOT_SUPPORTED  0x1eb
#define global ERROR_VOLUME_NOT_SUPPORTED  0x1ec
#define global ERROR_NOT_SUPPORTED_WITH_BYPASSIO  0x1ed
#define global ERROR_NO_BYPASSIO_DRIVER_SUPPORT  0x1ee
#define global ERROR_NOT_SUPPORTED_WITH_ENCRYPTION  0x1ef
#define global ERROR_NOT_SUPPORTED_WITH_COMPRESSION  0x1f0
#define global ERROR_NOT_SUPPORTED_WITH_REPLICATION  0x1f1
#define global ERROR_NOT_SUPPORTED_WITH_DEDUPLICATION  0x1f2
#define global ERROR_NOT_SUPPORTED_WITH_AUDITING  0x1f3
#define global ERROR_USER_PROFILE_LOAD  0x1f4
#define global ERROR_SESSION_KEY_TOO_SHORT  0x1f5
#define global ERROR_ACCESS_DENIED_APPDATA  0x1f6
#define global ERROR_NOT_SUPPORTED_WITH_MONITORING  0x1f7
#define global ERROR_NOT_SUPPORTED_WITH_SNAPSHOT  0x1f8
#define global ERROR_NOT_SUPPORTED_WITH_VIRTUALIZATION  0x1f9
#define global ERROR_BYPASSIO_FLT_NOT_SUPPORTED  0x1fa
#define global ERROR_DEVICE_RESET_REQUIRED  0x1fb
#define global ERROR_VOLUME_WRITE_ACCESS_DENIED  0x1fc
#define global ERROR_NOT_SUPPORTED_WITH_CACHED_HANDLE  0x1fd
#define global ERROR_FS_METADATA_INCONSISTENT  0x1fe
#define global ERROR_BLOCK_WEAK_REFERENCE_INVALID  0x1ff
#define global ERROR_BLOCK_SOURCE_WEAK_REFERENCE_INVALID  0x200
#define global ERROR_BLOCK_TARGET_WEAK_REFERENCE_INVALID  0x201
#define global ERROR_BLOCK_SHARED  0x202
#define global ERROR_VOLUME_UPGRADE_NOT_NEEDED  0x203
#define global ERROR_VOLUME_UPGRADE_PENDING  0x204
#define global ERROR_VOLUME_UPGRADE_DISABLED  0x205
#define global ERROR_VOLUME_UPGRADE_DISABLED_TILL_OS_DOWNGRADE_EXPIRED  0x206
#define global ERROR_ARITHMETIC_OVERFLOW  0x216
#define global ERROR_PIPE_CONNECTED  0x217
#define global ERROR_PIPE_LISTENING  0x218
#define global ERROR_VERIFIER_STOP  0x219
#define global ERROR_ABIOS_ERROR  0x21a
#define global ERROR_WX86_WARNING  0x21b
#define global ERROR_WX86_ERROR  0x21c
#define global ERROR_TIMER_NOT_CANCELED  0x21d
#define global ERROR_UNWIND  0x21e
#define global ERROR_BAD_STACK  0x21f
#define global ERROR_INVALID_UNWIND_TARGET  0x220
#define global ERROR_INVALID_PORT_ATTRIBUTES  0x221
#define global ERROR_PORT_MESSAGE_TOO_LONG  0x222
#define global ERROR_INVALID_QUOTA_LOWER  0x223
#define global ERROR_DEVICE_ALREADY_ATTACHED  0x224
#define global ERROR_INSTRUCTION_MISALIGNMENT  0x225
#define global ERROR_PROFILING_NOT_STARTED  0x226
#define global ERROR_PROFILING_NOT_STOPPED  0x227
#define global ERROR_COULD_NOT_INTERPRET  0x228
#define global ERROR_PROFILING_AT_LIMIT  0x229
#define global ERROR_CANT_WAIT  0x22a
#define global ERROR_CANT_TERMINATE_SELF  0x22b
#define global ERROR_UNEXPECTED_MM_CREATE_ERR  0x22c
#define global ERROR_UNEXPECTED_MM_MAP_ERROR  0x22d
#define global ERROR_UNEXPECTED_MM_EXTEND_ERR  0x22e
#define global ERROR_BAD_FUNCTION_TABLE  0x22f
#define global ERROR_NO_GUID_TRANSLATION  0x230
#define global ERROR_INVALID_LDT_SIZE  0x231
#define global ERROR_INVALID_LDT_OFFSET  0x233
#define global ERROR_INVALID_LDT_DESCRIPTOR  0x234
#define global ERROR_TOO_MANY_THREADS  0x235
#define global ERROR_THREAD_NOT_IN_PROCESS  0x236
#define global ERROR_PAGEFILE_QUOTA_EXCEEDED  0x237
#define global ERROR_LOGON_SERVER_CONFLICT  0x238
#define global ERROR_SYNCHRONIZATION_REQUIRED  0x239
#define global ERROR_NET_OPEN_FAILED  0x23a
#define global ERROR_IO_PRIVILEGE_FAILED  0x23b
#define global ERROR_CONTROL_C_EXIT  0x23c
#define global ERROR_MISSING_SYSTEMFILE  0x23d
#define global ERROR_UNHANDLED_EXCEPTION  0x23e
#define global ERROR_APP_INIT_FAILURE  0x23f
#define global ERROR_PAGEFILE_CREATE_FAILED  0x240
#define global ERROR_INVALID_IMAGE_HASH  0x241
#define global ERROR_NO_PAGEFILE  0x242
#define global ERROR_ILLEGAL_FLOAT_CONTEXT  0x243
#define global ERROR_NO_EVENT_PAIR  0x244
#define global ERROR_DOMAIN_CTRLR_CONFIG_ERROR  0x245
#define global ERROR_ILLEGAL_CHARACTER  0x246
#define global ERROR_UNDEFINED_CHARACTER  0x247
#define global ERROR_FLOPPY_VOLUME  0x248
#define global ERROR_BIOS_FAILED_TO_CONNECT_INTERRUPT  0x249
#define global ERROR_BACKUP_CONTROLLER  0x24a
#define global ERROR_MUTANT_LIMIT_EXCEEDED  0x24b
#define global ERROR_FS_DRIVER_REQUIRED  0x24c
#define global ERROR_CANNOT_LOAD_REGISTRY_FILE  0x24d
#define global ERROR_DEBUG_ATTACH_FAILED  0x24e
#define global ERROR_SYSTEM_PROCESS_TERMINATED  0x24f
#define global ERROR_DATA_NOT_ACCEPTED  0x250
#define global ERROR_VDM_HARD_ERROR  0x251
#define global ERROR_DRIVER_CANCEL_TIMEOUT  0x252
#define global ERROR_REPLY_MESSAGE_MISMATCH  0x253
#define global ERROR_LOST_WRITEBEHIND_DATA  0x254
#define global ERROR_CLIENT_SERVER_PARAMETERS_INVALID  0x255
#define global ERROR_NOT_TINY_STREAM  0x256
#define global ERROR_STACK_OVERFLOW_READ  0x257
#define global ERROR_CONVERT_TO_LARGE  0x258
#define global ERROR_FOUND_OUT_OF_SCOPE  0x259
#define global ERROR_ALLOCATE_BUCKET  0x25a
#define global ERROR_MARSHALL_OVERFLOW  0x25b
#define global ERROR_INVALID_VARIANT  0x25c
#define global ERROR_BAD_COMPRESSION_BUFFER  0x25d
#define global ERROR_AUDIT_FAILED  0x25e
#define global ERROR_TIMER_RESOLUTION_NOT_SET  0x25f
#define global ERROR_INSUFFICIENT_LOGON_INFO  0x260
#define global ERROR_BAD_DLL_ENTRYPOINT  0x261
#define global ERROR_BAD_SERVICE_ENTRYPOINT  0x262
#define global ERROR_IP_ADDRESS_CONFLICT1  0x263
#define global ERROR_IP_ADDRESS_CONFLICT2  0x264
#define global ERROR_REGISTRY_QUOTA_LIMIT  0x265
#define global ERROR_NO_CALLBACK_ACTIVE  0x266
#define global ERROR_PWD_TOO_SHORT  0x267
#define global ERROR_PWD_TOO_RECENT  0x268
#define global ERROR_PWD_HISTORY_CONFLICT  0x269
#define global ERROR_UNSUPPORTED_COMPRESSION  0x26a
#define global ERROR_INVALID_HW_PROFILE  0x26b
#define global ERROR_INVALID_PLUGPLAY_DEVICE_PATH  0x26c
#define global ERROR_QUOTA_LIST_INCONSISTENT  0x26d
#define global ERROR_EVALUATION_EXPIRATION  0x26e
#define global ERROR_ILLEGAL_DLL_RELOCATION  0x26f
#define global ERROR_DLL_INIT_FAILED_LOGOFF  0x270
#define global ERROR_VALIDATE_CONTINUE  0x271
#define global ERROR_NO_MORE_MATCHES  0x272
#define global ERROR_RANGE_LIST_CONFLICT  0x273
#define global ERROR_SERVER_SID_MISMATCH  0x274
#define global ERROR_CANT_ENABLE_DENY_ONLY  0x275
#define global ERROR_FLOAT_MULTIPLE_FAULTS  0x276
#define global ERROR_FLOAT_MULTIPLE_TRAPS  0x277
#define global ERROR_NOINTERFACE  0x278
#define global ERROR_DRIVER_FAILED_SLEEP  0x279
#define global ERROR_CORRUPT_SYSTEM_FILE  0x27a
#define global ERROR_COMMITMENT_MINIMUM  0x27b
#define global ERROR_PNP_RESTART_ENUMERATION  0x27c
#define global ERROR_SYSTEM_IMAGE_BAD_SIGNATURE  0x27d
#define global ERROR_PNP_REBOOT_REQUIRED  0x27e
#define global ERROR_INSUFFICIENT_POWER  0x27f
#define global ERROR_MULTIPLE_FAULT_VIOLATION  0x280
#define global ERROR_SYSTEM_SHUTDOWN  0x281
#define global ERROR_PORT_NOT_SET  0x282
#define global ERROR_DS_VERSION_CHECK_FAILURE  0x283
#define global ERROR_RANGE_NOT_FOUND  0x284
#define global ERROR_NOT_SAFE_MODE_DRIVER  0x286
#define global ERROR_FAILED_DRIVER_ENTRY  0x287
#define global ERROR_DEVICE_ENUMERATION_ERROR  0x288
#define global ERROR_MOUNT_POINT_NOT_RESOLVED  0x289
#define global ERROR_INVALID_DEVICE_OBJECT_PARAMETER  0x28a
#define global ERROR_MCA_OCCURED  0x28b
#define global ERROR_DRIVER_DATABASE_ERROR  0x28c
#define global ERROR_SYSTEM_HIVE_TOO_LARGE  0x28d
#define global ERROR_DRIVER_FAILED_PRIOR_UNLOAD  0x28e
#define global ERROR_VOLSNAP_PREPARE_HIBERNATE  0x28f
#define global ERROR_HIBERNATION_FAILURE  0x290
#define global ERROR_PWD_TOO_LONG  0x291
#define global ERROR_FILE_SYSTEM_LIMITATION  0x299
#define global ERROR_ASSERTION_FAILURE  0x29c
#define global ERROR_ACPI_ERROR  0x29d
#define global ERROR_WOW_ASSERTION  0x29e
#define global ERROR_PNP_BAD_MPS_TABLE  0x29f
#define global ERROR_PNP_TRANSLATION_FAILED  0x2a0
#define global ERROR_PNP_IRQ_TRANSLATION_FAILED  0x2a1
#define global ERROR_PNP_INVALID_ID  0x2a2
#define global ERROR_WAKE_SYSTEM_DEBUGGER  0x2a3
#define global ERROR_HANDLES_CLOSED  0x2a4
#define global ERROR_EXTRANEOUS_INFORMATION  0x2a5
#define global ERROR_RXACT_COMMIT_NECESSARY  0x2a6
#define global ERROR_MEDIA_CHECK  0x2a7
#define global ERROR_GUID_SUBSTITUTION_MADE  0x2a8
#define global ERROR_STOPPED_ON_SYMLINK  0x2a9
#define global ERROR_LONGJUMP  0x2aa
#define global ERROR_PLUGPLAY_QUERY_VETOED  0x2ab
#define global ERROR_UNWIND_CONSOLIDATE  0x2ac
#define global ERROR_REGISTRY_HIVE_RECOVERED  0x2ad
#define global ERROR_DLL_MIGHT_BE_INSECURE  0x2ae
#define global ERROR_DLL_MIGHT_BE_INCOMPATIBLE  0x2af
#define global ERROR_DBG_EXCEPTION_NOT_HANDLED  0x2b0
#define global ERROR_DBG_REPLY_LATER  0x2b1
#define global ERROR_DBG_UNABLE_TO_PROVIDE_HANDLE  0x2b2
#define global ERROR_DBG_TERMINATE_THREAD  0x2b3
#define global ERROR_DBG_TERMINATE_PROCESS  0x2b4
#define global ERROR_DBG_CONTROL_C  0x2b5
#define global ERROR_DBG_PRINTEXCEPTION_C  0x2b6
#define global ERROR_DBG_RIPEXCEPTION  0x2b7
#define global ERROR_DBG_CONTROL_BREAK  0x2b8
#define global ERROR_DBG_COMMAND_EXCEPTION  0x2b9
#define global ERROR_OBJECT_NAME_EXISTS  0x2ba
#define global ERROR_THREAD_WAS_SUSPENDED  0x2bb
#define global ERROR_IMAGE_NOT_AT_BASE  0x2bc
#define global ERROR_RXACT_STATE_CREATED  0x2bd
#define global ERROR_SEGMENT_NOTIFICATION  0x2be
#define global ERROR_BAD_CURRENT_DIRECTORY  0x2bf
#define global ERROR_FT_READ_RECOVERY_FROM_BACKUP  0x2c0
#define global ERROR_FT_WRITE_RECOVERY  0x2c1
#define global ERROR_IMAGE_MACHINE_TYPE_MISMATCH  0x2c2
#define global ERROR_RECEIVE_PARTIAL  0x2c3
#define global ERROR_RECEIVE_EXPEDITED  0x2c4
#define global ERROR_RECEIVE_PARTIAL_EXPEDITED  0x2c5
#define global ERROR_EVENT_DONE  0x2c6
#define global ERROR_EVENT_PENDING  0x2c7
#define global ERROR_CHECKING_FILE_SYSTEM  0x2c8
#define global ERROR_FATAL_APP_EXIT  0x2c9
#define global ERROR_PREDEFINED_HANDLE  0x2ca
#define global ERROR_WAS_UNLOCKED  0x2cb
#define global ERROR_SERVICE_NOTIFICATION  0x2cc
#define global ERROR_WAS_LOCKED  0x2cd
#define global ERROR_LOG_HARD_ERROR  0x2ce
#define global ERROR_ALREADY_WIN32  0x2cf
#define global ERROR_IMAGE_MACHINE_TYPE_MISMATCH_EXE  0x2d0
#define global ERROR_NO_YIELD_PERFORMED  0x2d1
#define global ERROR_TIMER_RESUME_IGNORED  0x2d2
#define global ERROR_ARBITRATION_UNHANDLED  0x2d3
#define global ERROR_CARDBUS_NOT_SUPPORTED  0x2d4
#define global ERROR_MP_PROCESSOR_MISMATCH  0x2d5
#define global ERROR_HIBERNATED  0x2d6
#define global ERROR_RESUME_HIBERNATION  0x2d7
#define global ERROR_FIRMWARE_UPDATED  0x2d8
#define global ERROR_DRIVERS_LEAKING_LOCKED_PAGES  0x2d9
#define global ERROR_WAKE_SYSTEM  0x2da
#define global ERROR_WAIT_1  0x2db
#define global ERROR_WAIT_2  0x2dc
#define global ERROR_WAIT_3  0x2dd
#define global ERROR_WAIT_63  0x2de
#define global ERROR_ABANDONED_WAIT_0  0x2df
#define global ERROR_ABANDONED_WAIT_63  0x2e0
#define global ERROR_USER_APC  0x2e1
#define global ERROR_KERNEL_APC  0x2e2
#define global ERROR_ALERTED  0x2e3
#define global ERROR_ELEVATION_REQUIRED  0x2e4
#define global ERROR_REPARSE  0x2e5
#define global ERROR_OPLOCK_BREAK_IN_PROGRESS  0x2e6
#define global ERROR_VOLUME_MOUNTED  0x2e7
#define global ERROR_RXACT_COMMITTED  0x2e8
#define global ERROR_NOTIFY_CLEANUP  0x2e9
#define global ERROR_PRIMARY_TRANSPORT_CONNECT_FAILED  0x2ea
#define global ERROR_PAGE_FAULT_TRANSITION  0x2eb
#define global ERROR_PAGE_FAULT_DEMAND_ZERO  0x2ec
#define global ERROR_PAGE_FAULT_COPY_ON_WRITE  0x2ed
#define global ERROR_PAGE_FAULT_GUARD_PAGE  0x2ee
#define global ERROR_PAGE_FAULT_PAGING_FILE  0x2ef
#define global ERROR_CACHE_PAGE_LOCKED  0x2f0
#define global ERROR_CRASH_DUMP  0x2f1
#define global ERROR_BUFFER_ALL_ZEROS  0x2f2
#define global ERROR_REPARSE_OBJECT  0x2f3
#define global ERROR_RESOURCE_REQUIREMENTS_CHANGED  0x2f4
#define global ERROR_TRANSLATION_COMPLETE  0x2f5
#define global ERROR_NOTHING_TO_TERMINATE  0x2f6
#define global ERROR_PROCESS_NOT_IN_JOB  0x2f7
#define global ERROR_PROCESS_IN_JOB  0x2f8
#define global ERROR_VOLSNAP_HIBERNATE_READY  0x2f9
#define global ERROR_FSFILTER_OP_COMPLETED_SUCCESSFULLY  0x2fa
#define global ERROR_INTERRUPT_VECTOR_ALREADY_CONNECTED  0x2fb
#define global ERROR_INTERRUPT_STILL_CONNECTED  0x2fc
#define global ERROR_WAIT_FOR_OPLOCK  0x2fd
#define global ERROR_DBG_EXCEPTION_HANDLED  0x2fe
#define global ERROR_DBG_CONTINUE  0x2ff
#define global ERROR_CALLBACK_POP_STACK  0x300
#define global ERROR_COMPRESSION_DISABLED  0x301
#define global ERROR_CANTFETCHBACKWARDS  0x302
#define global ERROR_CANTSCROLLBACKWARDS  0x303
#define global ERROR_ROWSNOTRELEASED  0x304
#define global ERROR_BAD_ACCESSOR_FLAGS  0x305
#define global ERROR_ERRORS_ENCOUNTERED  0x306
#define global ERROR_NOT_CAPABLE  0x307
#define global ERROR_REQUEST_OUT_OF_SEQUENCE  0x308
#define global ERROR_VERSION_PARSE_ERROR  0x309
#define global ERROR_BADSTARTPOSITION  0x30a
#define global ERROR_MEMORY_HARDWARE  0x30b
#define global ERROR_DISK_REPAIR_DISABLED  0x30c
#define global ERROR_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE  0x30d
#define global ERROR_SYSTEM_POWERSTATE_TRANSITION  0x30e
#define global ERROR_SYSTEM_POWERSTATE_COMPLEX_TRANSITION  0x30f
#define global ERROR_MCA_EXCEPTION  0x310
#define global ERROR_ACCESS_AUDIT_BY_POLICY  0x311
#define global ERROR_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY  0x312
#define global ERROR_ABANDON_HIBERFILE  0x313
#define global ERROR_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED  0x314
#define global ERROR_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR  0x315
#define global ERROR_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR  0x316
#define global ERROR_BAD_MCFG_TABLE  0x317
#define global ERROR_DISK_REPAIR_REDIRECTED  0x318
#define global ERROR_DISK_REPAIR_UNSUCCESSFUL  0x319
#define global ERROR_CORRUPT_LOG_OVERFULL  0x31a
#define global ERROR_CORRUPT_LOG_CORRUPTED  0x31b
#define global ERROR_CORRUPT_LOG_UNAVAILABLE  0x31c
#define global ERROR_CORRUPT_LOG_DELETED_FULL  0x31d
#define global ERROR_CORRUPT_LOG_CLEARED  0x31e
#define global ERROR_ORPHAN_NAME_EXHAUSTED  0x31f
#define global ERROR_OPLOCK_SWITCHED_TO_NEW_HANDLE  0x320
#define global ERROR_CANNOT_GRANT_REQUESTED_OPLOCK  0x321
#define global ERROR_CANNOT_BREAK_OPLOCK  0x322
#define global ERROR_OPLOCK_HANDLE_CLOSED  0x323
#define global ERROR_NO_ACE_CONDITION  0x324
#define global ERROR_INVALID_ACE_CONDITION  0x325
#define global ERROR_FILE_HANDLE_REVOKED  0x326
#define global ERROR_IMAGE_AT_DIFFERENT_BASE  0x327
#define global ERROR_ENCRYPTED_IO_NOT_POSSIBLE  0x328
#define global ERROR_FILE_METADATA_OPTIMIZATION_IN_PROGRESS  0x329
#define global ERROR_QUOTA_ACTIVITY  0x32a
#define global ERROR_HANDLE_REVOKED  0x32b
#define global ERROR_CALLBACK_INVOKE_INLINE  0x32c
#define global ERROR_CPU_SET_INVALID  0x32d
#define global ERROR_ENCLAVE_NOT_TERMINATED  0x32e
#define global ERROR_ENCLAVE_VIOLATION  0x32f
#define global ERROR_SERVER_TRANSPORT_CONFLICT  0x330
#define global ERROR_CERTIFICATE_VALIDATION_PREFERENCE_CONFLICT  0x331
#define global ERROR_FT_READ_FROM_COPY_FAILURE  0x332
#define global ERROR_SECTION_DIRECT_MAP_ONLY  0x333
#define global ERROR_EA_ACCESS_DENIED  0x3e2
#define global ERROR_OPERATION_ABORTED  0x3e3
#define global ERROR_IO_INCOMPLETE  0x3e4
#define global ERROR_IO_PENDING  0x3e5
#define global ERROR_NOACCESS  0x3e6
#define global ERROR_SWAPERROR  0x3e7
#define global ERROR_STACK_OVERFLOW  0x3e9
#define global ERROR_INVALID_MESSAGE  0x3ea
#define global ERROR_CAN_NOT_COMPLETE  0x3eb
#define global ERROR_INVALID_FLAGS  0x3ec
#define global ERROR_UNRECOGNIZED_VOLUME  0x3ed
#define global ERROR_FILE_INVALID  0x3ee
#define global ERROR_FULLSCREEN_MODE  0x3ef
#define global ERROR_NO_TOKEN  0x3f0
#define global ERROR_BADDB  0x3f1
#define global ERROR_BADKEY  0x3f2
#define global ERROR_CANTOPEN  0x3f3
#define global ERROR_CANTREAD  0x3f4
#define global ERROR_CANTWRITE  0x3f5
#define global ERROR_REGISTRY_RECOVERED  0x3f6
#define global ERROR_REGISTRY_CORRUPT  0x3f7
#define global ERROR_REGISTRY_IO_FAILED  0x3f8
#define global ERROR_NOT_REGISTRY_FILE  0x3f9
#define global ERROR_KEY_DELETED  0x3fa
#define global ERROR_NO_LOG_SPACE  0x3fb
#define global ERROR_KEY_HAS_CHILDREN  0x3fc
#define global ERROR_CHILD_MUST_BE_VOLATILE  0x3fd
#define global ERROR_NOTIFY_ENUM_DIR  0x3fe
#define global ERROR_DEPENDENT_SERVICES_RUNNING  0x41b
#define global ERROR_INVALID_SERVICE_CONTROL  0x41c
#define global ERROR_SERVICE_REQUEST_TIMEOUT  0x41d
#define global ERROR_SERVICE_NO_THREAD  0x41e
#define global ERROR_SERVICE_DATABASE_LOCKED  0x41f
#define global ERROR_SERVICE_ALREADY_RUNNING  0x420
#define global ERROR_INVALID_SERVICE_ACCOUNT  0x421
#define global ERROR_SERVICE_DISABLED  0x422
#define global ERROR_CIRCULAR_DEPENDENCY  0x423
#define global ERROR_SERVICE_DOES_NOT_EXIST  0x424
#define global ERROR_SERVICE_CANNOT_ACCEPT_CTRL  0x425
#define global ERROR_SERVICE_NOT_ACTIVE  0x426
#define global ERROR_FAILED_SERVICE_CONTROLLER_CONNECT  0x427
#define global ERROR_EXCEPTION_IN_SERVICE  0x428
#define global ERROR_DATABASE_DOES_NOT_EXIST  0x429
#define global ERROR_SERVICE_SPECIFIC_ERROR  0x42a
#define global ERROR_PROCESS_ABORTED  0x42b
#define global ERROR_SERVICE_DEPENDENCY_FAIL  0x42c
#define global ERROR_SERVICE_LOGON_FAILED  0x42d
#define global ERROR_SERVICE_START_HANG  0x42e
#define global ERROR_INVALID_SERVICE_LOCK  0x42f
#define global ERROR_SERVICE_MARKED_FOR_DELETE  0x430
#define global ERROR_SERVICE_EXISTS  0x431
#define global ERROR_ALREADY_RUNNING_LKG  0x432
#define global ERROR_SERVICE_DEPENDENCY_DELETED  0x433
#define global ERROR_BOOT_ALREADY_ACCEPTED  0x434
#define global ERROR_SERVICE_NEVER_STARTED  0x435
#define global ERROR_DUPLICATE_SERVICE_NAME  0x436
#define global ERROR_DIFFERENT_SERVICE_ACCOUNT  0x437
#define global ERROR_CANNOT_DETECT_DRIVER_FAILURE  0x438
#define global ERROR_CANNOT_DETECT_PROCESS_ABORT  0x439
#define global ERROR_NO_RECOVERY_PROGRAM  0x43a
#define global ERROR_SERVICE_NOT_IN_EXE  0x43b
#define global ERROR_NOT_SAFEBOOT_SERVICE  0x43c
#define global ERROR_END_OF_MEDIA  0x44c
#define global ERROR_FILEMARK_DETECTED  0x44d
#define global ERROR_BEGINNING_OF_MEDIA  0x44e
#define global ERROR_SETMARK_DETECTED  0x44f
#define global ERROR_NO_DATA_DETECTED  0x450
#define global ERROR_PARTITION_FAILURE  0x451
#define global ERROR_INVALID_BLOCK_LENGTH  0x452
#define global ERROR_DEVICE_NOT_PARTITIONED  0x453
#define global ERROR_UNABLE_TO_LOCK_MEDIA  0x454
#define global ERROR_UNABLE_TO_UNLOAD_MEDIA  0x455
#define global ERROR_MEDIA_CHANGED  0x456
#define global ERROR_BUS_RESET  0x457
#define global ERROR_NO_MEDIA_IN_DRIVE  0x458
#define global ERROR_NO_UNICODE_TRANSLATION  0x459
#define global ERROR_DLL_INIT_FAILED  0x45a
#define global ERROR_SHUTDOWN_IN_PROGRESS  0x45b
#define global ERROR_NO_SHUTDOWN_IN_PROGRESS  0x45c
#define global ERROR_IO_DEVICE  0x45d
#define global ERROR_SERIAL_NO_DEVICE  0x45e
#define global ERROR_IRQ_BUSY  0x45f
#define global ERROR_MORE_WRITES  0x460
#define global ERROR_COUNTER_TIMEOUT  0x461
#define global ERROR_FLOPPY_ID_MARK_NOT_FOUND  0x462
#define global ERROR_FLOPPY_WRONG_CYLINDER  0x463
#define global ERROR_FLOPPY_UNKNOWN_ERROR  0x464
#define global ERROR_FLOPPY_BAD_REGISTERS  0x465
#define global ERROR_DISK_RECALIBRATE_FAILED  0x466
#define global ERROR_DISK_OPERATION_FAILED  0x467
#define global ERROR_DISK_RESET_FAILED  0x468
#define global ERROR_EOM_OVERFLOW  0x469
#define global ERROR_NOT_ENOUGH_SERVER_MEMORY  0x46a
#define global ERROR_POSSIBLE_DEADLOCK  0x46b
#define global ERROR_MAPPED_ALIGNMENT  0x46c
#define global ERROR_SET_POWER_STATE_VETOED  0x474
#define global ERROR_SET_POWER_STATE_FAILED  0x475
#define global ERROR_TOO_MANY_LINKS  0x476
#define global ERROR_OLD_WIN_VERSION  0x47e
#define global ERROR_APP_WRONG_OS  0x47f
#define global ERROR_SINGLE_INSTANCE_APP  0x480
#define global ERROR_RMODE_APP  0x481
#define global ERROR_INVALID_DLL  0x482
#define global ERROR_NO_ASSOCIATION  0x483
#define global ERROR_DDE_FAIL  0x484
#define global ERROR_DLL_NOT_FOUND  0x485
#define global ERROR_NO_MORE_USER_HANDLES  0x486
#define global ERROR_MESSAGE_SYNC_ONLY  0x487
#define global ERROR_SOURCE_ELEMENT_EMPTY  0x488
#define global ERROR_DESTINATION_ELEMENT_FULL  0x489
#define global ERROR_ILLEGAL_ELEMENT_ADDRESS  0x48a
#define global ERROR_MAGAZINE_NOT_PRESENT  0x48b
#define global ERROR_DEVICE_REINITIALIZATION_NEEDED  0x48c
#define global ERROR_DEVICE_REQUIRES_CLEANING  0x48d
#define global ERROR_DEVICE_DOOR_OPEN  0x48e
#define global ERROR_DEVICE_NOT_CONNECTED  0x48f
#define global ERROR_NOT_FOUND  0x490
#define global ERROR_NO_MATCH  0x491
#define global ERROR_SET_NOT_FOUND  0x492
#define global ERROR_POINT_NOT_FOUND  0x493
#define global ERROR_NO_TRACKING_SERVICE  0x494
#define global ERROR_NO_VOLUME_ID  0x495
#define global ERROR_UNABLE_TO_REMOVE_REPLACED  0x497
#define global ERROR_UNABLE_TO_MOVE_REPLACEMENT  0x498
#define global ERROR_UNABLE_TO_MOVE_REPLACEMENT_2  0x499
#define global ERROR_JOURNAL_DELETE_IN_PROGRESS  0x49a
#define global ERROR_JOURNAL_NOT_ACTIVE  0x49b
#define global ERROR_POTENTIAL_FILE_FOUND  0x49c
#define global ERROR_JOURNAL_ENTRY_DELETED  0x49d
#define global ERROR_PARTITION_TERMINATING  0x4a0
#define global ERROR_SHUTDOWN_IS_SCHEDULED  0x4a6
#define global ERROR_SHUTDOWN_USERS_LOGGED_ON  0x4a7
#define global ERROR_SHUTDOWN_DISKS_NOT_IN_MAINTENANCE_MODE  0x4a8
#define global ERROR_BAD_DEVICE  0x4b0
#define global ERROR_CONNECTION_UNAVAIL  0x4b1
#define global ERROR_DEVICE_ALREADY_REMEMBERED  0x4b2
#define global ERROR_NO_NET_OR_BAD_PATH  0x4b3
#define global ERROR_BAD_PROVIDER  0x4b4
#define global ERROR_CANNOT_OPEN_PROFILE  0x4b5
#define global ERROR_BAD_PROFILE  0x4b6
#define global ERROR_NOT_CONTAINER  0x4b7
#define global ERROR_EXTENDED_ERROR  0x4b8
#define global ERROR_INVALID_GROUPNAME  0x4b9
#define global ERROR_INVALID_COMPUTERNAME  0x4ba
#define global ERROR_INVALID_EVENTNAME  0x4bb
#define global ERROR_INVALID_DOMAINNAME  0x4bc
#define global ERROR_INVALID_SERVICENAME  0x4bd
#define global ERROR_INVALID_NETNAME  0x4be
#define global ERROR_INVALID_SHARENAME  0x4bf
#define global ERROR_INVALID_PASSWORDNAME  0x4c0
#define global ERROR_INVALID_MESSAGENAME  0x4c1
#define global ERROR_INVALID_MESSAGEDEST  0x4c2
#define global ERROR_SESSION_CREDENTIAL_CONFLICT  0x4c3
#define global ERROR_REMOTE_SESSION_LIMIT_EXCEEDED  0x4c4
#define global ERROR_DUP_DOMAINNAME  0x4c5
#define global ERROR_NO_NETWORK  0x4c6
#define global ERROR_CANCELLED  0x4c7
#define global ERROR_USER_MAPPED_FILE  0x4c8
#define global ERROR_CONNECTION_REFUSED  0x4c9
#define global ERROR_GRACEFUL_DISCONNECT  0x4ca
#define global ERROR_ADDRESS_ALREADY_ASSOCIATED  0x4cb
#define global ERROR_ADDRESS_NOT_ASSOCIATED  0x4cc
#define global ERROR_CONNECTION_INVALID  0x4cd
#define global ERROR_CONNECTION_ACTIVE  0x4ce
#define global ERROR_NETWORK_UNREACHABLE  0x4cf
#define global ERROR_HOST_UNREACHABLE  0x4d0
#define global ERROR_PROTOCOL_UNREACHABLE  0x4d1
#define global ERROR_PORT_UNREACHABLE  0x4d2
#define global ERROR_REQUEST_ABORTED  0x4d3
#define global ERROR_CONNECTION_ABORTED  0x4d4
#define global ERROR_RETRY  0x4d5
#define global ERROR_CONNECTION_COUNT_LIMIT  0x4d6
#define global ERROR_LOGIN_TIME_RESTRICTION  0x4d7
#define global ERROR_LOGIN_WKSTA_RESTRICTION  0x4d8
#define global ERROR_INCORRECT_ADDRESS  0x4d9
#define global ERROR_ALREADY_REGISTERED  0x4da
#define global ERROR_SERVICE_NOT_FOUND  0x4db
#define global ERROR_NOT_AUTHENTICATED  0x4dc
#define global ERROR_NOT_LOGGED_ON  0x4dd
#define global ERROR_CONTINUE  0x4de
#define global ERROR_ALREADY_INITIALIZED  0x4df
#define global ERROR_NO_MORE_DEVICES  0x4e0
#define global ERROR_NO_SUCH_SITE  0x4e1
#define global ERROR_DOMAIN_CONTROLLER_EXISTS  0x4e2
#define global ERROR_ONLY_IF_CONNECTED  0x4e3
#define global ERROR_OVERRIDE_NOCHANGES  0x4e4
#define global ERROR_BAD_USER_PROFILE  0x4e5
#define global ERROR_NOT_SUPPORTED_ON_SBS  0x4e6
#define global ERROR_SERVER_SHUTDOWN_IN_PROGRESS  0x4e7
#define global ERROR_HOST_DOWN  0x4e8
#define global ERROR_NON_ACCOUNT_SID  0x4e9
#define global ERROR_NON_DOMAIN_SID  0x4ea
#define global ERROR_APPHELP_BLOCK  0x4eb
#define global ERROR_ACCESS_DISABLED_BY_POLICY  0x4ec
#define global ERROR_REG_NAT_CONSUMPTION  0x4ed
#define global ERROR_CSCSHARE_OFFLINE  0x4ee
#define global ERROR_PKINIT_FAILURE  0x4ef
#define global ERROR_SMARTCARD_SUBSYSTEM_FAILURE  0x4f0
#define global ERROR_DOWNGRADE_DETECTED  0x4f1
#define global ERROR_MACHINE_LOCKED  0x4f7
#define global ERROR_SMB_GUEST_LOGON_BLOCKED  0x4f8
#define global ERROR_CALLBACK_SUPPLIED_INVALID_DATA  0x4f9
#define global ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED  0x4fa
#define global ERROR_DRIVER_BLOCKED  0x4fb
#define global ERROR_INVALID_IMPORT_OF_NON_DLL  0x4fc
#define global ERROR_ACCESS_DISABLED_WEBBLADE  0x4fd
#define global ERROR_ACCESS_DISABLED_WEBBLADE_TAMPER  0x4fe
#define global ERROR_RECOVERY_FAILURE  0x4ff
#define global ERROR_ALREADY_FIBER  0x500
#define global ERROR_ALREADY_THREAD  0x501
#define global ERROR_STACK_BUFFER_OVERRUN  0x502
#define global ERROR_PARAMETER_QUOTA_EXCEEDED  0x503
#define global ERROR_DEBUGGER_INACTIVE  0x504
#define global ERROR_DELAY_LOAD_FAILED  0x505
#define global ERROR_VDM_DISALLOWED  0x506
#define global ERROR_UNIDENTIFIED_ERROR  0x507
#define global ERROR_INVALID_CRUNTIME_PARAMETER  0x508
#define global ERROR_BEYOND_VDL  0x509
#define global ERROR_INCOMPATIBLE_SERVICE_SID_TYPE  0x50a
#define global ERROR_DRIVER_PROCESS_TERMINATED  0x50b
#define global ERROR_IMPLEMENTATION_LIMIT  0x50c
#define global ERROR_PROCESS_IS_PROTECTED  0x50d
#define global ERROR_SERVICE_NOTIFY_CLIENT_LAGGING  0x50e
#define global ERROR_DISK_QUOTA_EXCEEDED  0x50f
#define global ERROR_CONTENT_BLOCKED  0x510
#define global ERROR_INCOMPATIBLE_SERVICE_PRIVILEGE  0x511
#define global ERROR_APP_HANG  0x512
#define global ERROR_INVALID_LABEL  0x513
#define global ERROR_NOT_ALL_ASSIGNED  0x514
#define global ERROR_SOME_NOT_MAPPED  0x515
#define global ERROR_NO_QUOTAS_FOR_ACCOUNT  0x516
#define global ERROR_LOCAL_USER_SESSION_KEY  0x517
#define global ERROR_NULL_LM_PASSWORD  0x518
#define global ERROR_UNKNOWN_REVISION  0x519
#define global ERROR_REVISION_MISMATCH  0x51a
#define global ERROR_INVALID_OWNER  0x51b
#define global ERROR_INVALID_PRIMARY_GROUP  0x51c
#define global ERROR_NO_IMPERSONATION_TOKEN  0x51d
#define global ERROR_CANT_DISABLE_MANDATORY  0x51e
#define global ERROR_NO_LOGON_SERVERS  0x51f
#define global ERROR_NO_SUCH_LOGON_SESSION  0x520
#define global ERROR_NO_SUCH_PRIVILEGE  0x521
#define global ERROR_PRIVILEGE_NOT_HELD  0x522
#define global ERROR_INVALID_ACCOUNT_NAME  0x523
#define global ERROR_USER_EXISTS  0x524
#define global ERROR_NO_SUCH_USER  0x525
#define global ERROR_GROUP_EXISTS  0x526
#define global ERROR_NO_SUCH_GROUP  0x527
#define global ERROR_MEMBER_IN_GROUP  0x528
#define global ERROR_MEMBER_NOT_IN_GROUP  0x529
#define global ERROR_LAST_ADMIN  0x52a
#define global ERROR_WRONG_PASSWORD  0x52b
#define global ERROR_ILL_FORMED_PASSWORD  0x52c
#define global ERROR_PASSWORD_RESTRICTION  0x52d
#define global ERROR_LOGON_FAILURE  0x52e
#define global ERROR_ACCOUNT_RESTRICTION  0x52f
#define global ERROR_INVALID_LOGON_HOURS  0x530
#define global ERROR_INVALID_WORKSTATION  0x531
#define global ERROR_PASSWORD_EXPIRED  0x532
#define global ERROR_ACCOUNT_DISABLED  0x533
#define global ERROR_NONE_MAPPED  0x534
#define global ERROR_TOO_MANY_LUIDS_REQUESTED  0x535
#define global ERROR_LUIDS_EXHAUSTED  0x536
#define global ERROR_INVALID_SUB_AUTHORITY  0x537
#define global ERROR_INVALID_ACL  0x538
#define global ERROR_INVALID_SID  0x539
#define global ERROR_INVALID_SECURITY_DESCR  0x53a
#define global ERROR_BAD_INHERITANCE_ACL  0x53c
#define global ERROR_SERVER_DISABLED  0x53d
#define global ERROR_SERVER_NOT_DISABLED  0x53e
#define global ERROR_INVALID_ID_AUTHORITY  0x53f
#define global ERROR_ALLOTTED_SPACE_EXCEEDED  0x540
#define global ERROR_INVALID_GROUP_ATTRIBUTES  0x541
#define global ERROR_BAD_IMPERSONATION_LEVEL  0x542
#define global ERROR_CANT_OPEN_ANONYMOUS  0x543
#define global ERROR_BAD_VALIDATION_CLASS  0x544
#define global ERROR_BAD_TOKEN_TYPE  0x545
#define global ERROR_NO_SECURITY_ON_OBJECT  0x546
#define global ERROR_CANT_ACCESS_DOMAIN_INFO  0x547
#define global ERROR_INVALID_SERVER_STATE  0x548
#define global ERROR_INVALID_DOMAIN_STATE  0x549
#define global ERROR_INVALID_DOMAIN_ROLE  0x54a
#define global ERROR_NO_SUCH_DOMAIN  0x54b
#define global ERROR_DOMAIN_EXISTS  0x54c
#define global ERROR_DOMAIN_LIMIT_EXCEEDED  0x54d
#define global ERROR_INTERNAL_DB_CORRUPTION  0x54e
#define global ERROR_INTERNAL_ERROR  0x54f
#define global ERROR_GENERIC_NOT_MAPPED  0x550
#define global ERROR_BAD_DESCRIPTOR_FORMAT  0x551
#define global ERROR_NOT_LOGON_PROCESS  0x552
#define global ERROR_LOGON_SESSION_EXISTS  0x553
#define global ERROR_NO_SUCH_PACKAGE  0x554
#define global ERROR_BAD_LOGON_SESSION_STATE  0x555
#define global ERROR_LOGON_SESSION_COLLISION  0x556
#define global ERROR_INVALID_LOGON_TYPE  0x557
#define global ERROR_CANNOT_IMPERSONATE  0x558
#define global ERROR_RXACT_INVALID_STATE  0x559
#define global ERROR_RXACT_COMMIT_FAILURE  0x55a
#define global ERROR_SPECIAL_ACCOUNT  0x55b
#define global ERROR_SPECIAL_GROUP  0x55c
#define global ERROR_SPECIAL_USER  0x55d
#define global ERROR_MEMBERS_PRIMARY_GROUP  0x55e
#define global ERROR_TOKEN_ALREADY_IN_USE  0x55f
#define global ERROR_NO_SUCH_ALIAS  0x560
#define global ERROR_MEMBER_NOT_IN_ALIAS  0x561
#define global ERROR_MEMBER_IN_ALIAS  0x562
#define global ERROR_ALIAS_EXISTS  0x563
#define global ERROR_LOGON_NOT_GRANTED  0x564
#define global ERROR_TOO_MANY_SECRETS  0x565
#define global ERROR_SECRET_TOO_LONG  0x566
#define global ERROR_INTERNAL_DB_ERROR  0x567
#define global ERROR_TOO_MANY_CONTEXT_IDS  0x568
#define global ERROR_LOGON_TYPE_NOT_GRANTED  0x569
#define global ERROR_NT_CROSS_ENCRYPTION_REQUIRED  0x56a
#define global ERROR_NO_SUCH_MEMBER  0x56b
#define global ERROR_INVALID_MEMBER  0x56c
#define global ERROR_TOO_MANY_SIDS  0x56d
#define global ERROR_LM_CROSS_ENCRYPTION_REQUIRED  0x56e
#define global ERROR_NO_INHERITANCE  0x56f
#define global ERROR_FILE_CORRUPT  0x570
#define global ERROR_DISK_CORRUPT  0x571
#define global ERROR_NO_USER_SESSION_KEY  0x572
#define global ERROR_LICENSE_QUOTA_EXCEEDED  0x573
#define global ERROR_WRONG_TARGET_NAME  0x574
#define global ERROR_MUTUAL_AUTH_FAILED  0x575
#define global ERROR_TIME_SKEW  0x576
#define global ERROR_CURRENT_DOMAIN_NOT_ALLOWED  0x577
#define global ERROR_INVALID_WINDOW_HANDLE  0x578
#define global ERROR_INVALID_MENU_HANDLE  0x579
#define global ERROR_INVALID_CURSOR_HANDLE  0x57a
#define global ERROR_INVALID_ACCEL_HANDLE  0x57b
#define global ERROR_INVALID_HOOK_HANDLE  0x57c
#define global ERROR_INVALID_DWP_HANDLE  0x57d
#define global ERROR_TLW_WITH_WSCHILD  0x57e
#define global ERROR_CANNOT_FIND_WND_CLASS  0x57f
#define global ERROR_WINDOW_OF_OTHER_THREAD  0x580
#define global ERROR_HOTKEY_ALREADY_REGISTERED  0x581
#define global ERROR_CLASS_ALREADY_EXISTS  0x582
#define global ERROR_CLASS_DOES_NOT_EXIST  0x583
#define global ERROR_CLASS_HAS_WINDOWS  0x584
#define global ERROR_INVALID_INDEX  0x585
#define global ERROR_INVALID_ICON_HANDLE  0x586
#define global ERROR_PRIVATE_DIALOG_INDEX  0x587
#define global ERROR_LISTBOX_ID_NOT_FOUND  0x588
#define global ERROR_NO_WILDCARD_CHARACTERS  0x589
#define global ERROR_CLIPBOARD_NOT_OPEN  0x58a
#define global ERROR_HOTKEY_NOT_REGISTERED  0x58b
#define global ERROR_WINDOW_NOT_DIALOG  0x58c
#define global ERROR_CONTROL_ID_NOT_FOUND  0x58d
#define global ERROR_INVALID_COMBOBOX_MESSAGE  0x58e
#define global ERROR_WINDOW_NOT_COMBOBOX  0x58f
#define global ERROR_INVALID_EDIT_HEIGHT  0x590
#define global ERROR_DC_NOT_FOUND  0x591
#define global ERROR_INVALID_HOOK_FILTER  0x592
#define global ERROR_INVALID_FILTER_PROC  0x593
#define global ERROR_HOOK_NEEDS_HMOD  0x594
#define global ERROR_GLOBAL_ONLY_HOOK  0x595
#define global ERROR_JOURNAL_HOOK_SET  0x596
#define global ERROR_HOOK_NOT_INSTALLED  0x597
#define global ERROR_INVALID_LB_MESSAGE  0x598
#define global ERROR_SETCOUNT_ON_BAD_LB  0x599
#define global ERROR_LB_WITHOUT_TABSTOPS  0x59a
#define global ERROR_DESTROY_OBJECT_OF_OTHER_THREAD  0x59b
#define global ERROR_CHILD_WINDOW_MENU  0x59c
#define global ERROR_NO_SYSTEM_MENU  0x59d
#define global ERROR_INVALID_MSGBOX_STYLE  0x59e
#define global ERROR_INVALID_SPI_VALUE  0x59f
#define global ERROR_SCREEN_ALREADY_LOCKED  0x5a0
#define global ERROR_HWNDS_HAVE_DIFF_PARENT  0x5a1
#define global ERROR_NOT_CHILD_WINDOW  0x5a2
#define global ERROR_INVALID_GW_COMMAND  0x5a3
#define global ERROR_INVALID_THREAD_ID  0x5a4
#define global ERROR_NON_MDICHILD_WINDOW  0x5a5
#define global ERROR_POPUP_ALREADY_ACTIVE  0x5a6
#define global ERROR_NO_SCROLLBARS  0x5a7
#define global ERROR_INVALID_SCROLLBAR_RANGE  0x5a8
#define global ERROR_INVALID_SHOWWIN_COMMAND  0x5a9
#define global ERROR_NO_SYSTEM_RESOURCES  0x5aa
#define global ERROR_NONPAGED_SYSTEM_RESOURCES  0x5ab
#define global ERROR_PAGED_SYSTEM_RESOURCES  0x5ac
#define global ERROR_WORKING_SET_QUOTA  0x5ad
#define global ERROR_PAGEFILE_QUOTA  0x5ae
#define global ERROR_COMMITMENT_LIMIT  0x5af
#define global ERROR_MENU_ITEM_NOT_FOUND  0x5b0
#define global ERROR_INVALID_KEYBOARD_HANDLE  0x5b1
#define global ERROR_HOOK_TYPE_NOT_ALLOWED  0x5b2
#define global ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION  0x5b3
#define global ERROR_TIMEOUT  0x5b4
#define global ERROR_INVALID_MONITOR_HANDLE  0x5b5
#define global ERROR_INCORRECT_SIZE  0x5b6
#define global ERROR_SYMLINK_CLASS_DISABLED  0x5b7
#define global ERROR_SYMLINK_NOT_SUPPORTED  0x5b8
#define global ERROR_XML_PARSE_ERROR  0x5b9
#define global ERROR_XMLDSIG_ERROR  0x5ba
#define global ERROR_RESTART_APPLICATION  0x5bb
#define global ERROR_WRONG_COMPARTMENT  0x5bc
#define global ERROR_AUTHIP_FAILURE  0x5bd
#define global ERROR_NO_NVRAM_RESOURCES  0x5be
#define global ERROR_NOT_GUI_PROCESS  0x5bf
#define global ERROR_EVENTLOG_FILE_CORRUPT  0x5dc
#define global ERROR_EVENTLOG_CANT_START  0x5dd
#define global ERROR_LOG_FILE_FULL  0x5de
#define global ERROR_EVENTLOG_FILE_CHANGED  0x5df
#define global ERROR_CONTAINER_ASSIGNED  0x5e0
#define global ERROR_JOB_NO_CONTAINER  0x5e1
#define global ERROR_INVALID_TASK_NAME  0x60e
#define global ERROR_INVALID_TASK_INDEX  0x60f
#define global ERROR_THREAD_ALREADY_IN_TASK  0x610
#define global ERROR_INSTALL_SERVICE_FAILURE  0x641
#define global ERROR_INSTALL_USEREXIT  0x642
#define global ERROR_INSTALL_FAILURE  0x643
#define global ERROR_INSTALL_SUSPEND  0x644
#define global ERROR_UNKNOWN_PRODUCT  0x645
#define global ERROR_UNKNOWN_FEATURE  0x646
#define global ERROR_UNKNOWN_COMPONENT  0x647
#define global ERROR_UNKNOWN_PROPERTY  0x648
#define global ERROR_INVALID_HANDLE_STATE  0x649
#define global ERROR_BAD_CONFIGURATION  0x64a
#define global ERROR_INDEX_ABSENT  0x64b
#define global ERROR_INSTALL_SOURCE_ABSENT  0x64c
#define global ERROR_INSTALL_PACKAGE_VERSION  0x64d
#define global ERROR_PRODUCT_UNINSTALLED  0x64e
#define global ERROR_BAD_QUERY_SYNTAX  0x64f
#define global ERROR_INVALID_FIELD  0x650
#define global ERROR_DEVICE_REMOVED  0x651
#define global ERROR_INSTALL_ALREADY_RUNNING  0x652
#define global ERROR_INSTALL_PACKAGE_OPEN_FAILED  0x653
#define global ERROR_INSTALL_PACKAGE_INVALID  0x654
#define global ERROR_INSTALL_UI_FAILURE  0x655
#define global ERROR_INSTALL_LOG_FAILURE  0x656
#define global ERROR_INSTALL_LANGUAGE_UNSUPPORTED  0x657
#define global ERROR_INSTALL_TRANSFORM_FAILURE  0x658
#define global ERROR_INSTALL_PACKAGE_REJECTED  0x659
#define global ERROR_FUNCTION_NOT_CALLED  0x65a
#define global ERROR_FUNCTION_FAILED  0x65b
#define global ERROR_INVALID_TABLE  0x65c
#define global ERROR_DATATYPE_MISMATCH  0x65d
#define global ERROR_UNSUPPORTED_TYPE  0x65e
#define global ERROR_CREATE_FAILED  0x65f
#define global ERROR_INSTALL_TEMP_UNWRITABLE  0x660
#define global ERROR_INSTALL_PLATFORM_UNSUPPORTED  0x661
#define global ERROR_INSTALL_NOTUSED  0x662
#define global ERROR_PATCH_PACKAGE_OPEN_FAILED  0x663
#define global ERROR_PATCH_PACKAGE_INVALID  0x664
#define global ERROR_PATCH_PACKAGE_UNSUPPORTED  0x665
#define global ERROR_PRODUCT_VERSION  0x666
#define global ERROR_INVALID_COMMAND_LINE  0x667
#define global ERROR_INSTALL_REMOTE_DISALLOWED  0x668
#define global ERROR_SUCCESS_REBOOT_INITIATED  0x669
#define global ERROR_PATCH_TARGET_NOT_FOUND  0x66a
#define global ERROR_PATCH_PACKAGE_REJECTED  0x66b
#define global ERROR_INSTALL_TRANSFORM_REJECTED  0x66c
#define global ERROR_INSTALL_REMOTE_PROHIBITED  0x66d
#define global ERROR_PATCH_REMOVAL_UNSUPPORTED  0x66e
#define global ERROR_UNKNOWN_PATCH  0x66f
#define global ERROR_PATCH_NO_SEQUENCE  0x670
#define global ERROR_PATCH_REMOVAL_DISALLOWED  0x671
#define global ERROR_INVALID_PATCH_XML  0x672
#define global ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT  0x673
#define global ERROR_INSTALL_SERVICE_SAFEBOOT  0x674
#define global ERROR_FAIL_FAST_EXCEPTION  0x675
#define global ERROR_INSTALL_REJECTED  0x676
#define global ERROR_DYNAMIC_CODE_BLOCKED  0x677
#define global ERROR_NOT_SAME_OBJECT  0x678
#define global ERROR_STRICT_CFG_VIOLATION  0x679
#define global ERROR_SET_CONTEXT_DENIED  0x67c
#define global ERROR_CROSS_PARTITION_VIOLATION  0x67d
#define global ERROR_RETURN_ADDRESS_HIJACK_ATTEMPT  0x67e
#define global ERROR_INVALID_USER_BUFFER  0x6f8
#define global ERROR_UNRECOGNIZED_MEDIA  0x6f9
#define global ERROR_NO_TRUST_LSA_SECRET  0x6fa
#define global ERROR_NO_TRUST_SAM_ACCOUNT  0x6fb
#define global ERROR_TRUSTED_DOMAIN_FAILURE  0x6fc
#define global ERROR_TRUSTED_RELATIONSHIP_FAILURE  0x6fd
#define global ERROR_TRUST_FAILURE  0x6fe
#define global ERROR_NETLOGON_NOT_STARTED  0x700
#define global ERROR_ACCOUNT_EXPIRED  0x701
#define global ERROR_REDIRECTOR_HAS_OPEN_HANDLES  0x702
#define global ERROR_PRINTER_DRIVER_ALREADY_INSTALLED  0x703
#define global ERROR_UNKNOWN_PORT  0x704
#define global ERROR_UNKNOWN_PRINTER_DRIVER  0x705
#define global ERROR_UNKNOWN_PRINTPROCESSOR  0x706
#define global ERROR_INVALID_SEPARATOR_FILE  0x707
#define global ERROR_INVALID_PRIORITY  0x708
#define global ERROR_INVALID_PRINTER_NAME  0x709
#define global ERROR_PRINTER_ALREADY_EXISTS  0x70a
#define global ERROR_INVALID_PRINTER_COMMAND  0x70b
#define global ERROR_INVALID_DATATYPE  0x70c
#define global ERROR_INVALID_ENVIRONMENT  0x70d
#define global ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT  0x70f
#define global ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT  0x710
#define global ERROR_NOLOGON_SERVER_TRUST_ACCOUNT  0x711
#define global ERROR_DOMAIN_TRUST_INCONSISTENT  0x712
#define global ERROR_SERVER_HAS_OPEN_HANDLES  0x713
#define global ERROR_RESOURCE_DATA_NOT_FOUND  0x714
#define global ERROR_RESOURCE_TYPE_NOT_FOUND  0x715
#define global ERROR_RESOURCE_NAME_NOT_FOUND  0x716
#define global ERROR_RESOURCE_LANG_NOT_FOUND  0x717
#define global ERROR_NOT_ENOUGH_QUOTA  0x718
#define global ERROR_INVALID_TIME  0x76d
#define global ERROR_INVALID_FORM_NAME  0x76e
#define global ERROR_INVALID_FORM_SIZE  0x76f
#define global ERROR_ALREADY_WAITING  0x770
#define global ERROR_PRINTER_DELETED  0x771
#define global ERROR_INVALID_PRINTER_STATE  0x772
#define global ERROR_PASSWORD_MUST_CHANGE  0x773
#define global ERROR_DOMAIN_CONTROLLER_NOT_FOUND  0x774
#define global ERROR_ACCOUNT_LOCKED_OUT  0x775
#define global ERROR_NO_SITENAME  0x77f
#define global ERROR_CANT_ACCESS_FILE  0x780
#define global ERROR_CANT_RESOLVE_FILENAME  0x781
#define global ERROR_KM_DRIVER_BLOCKED  0x78a
#define global ERROR_CONTEXT_EXPIRED  0x78b
#define global ERROR_PER_USER_TRUST_QUOTA_EXCEEDED  0x78c
#define global ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED  0x78d
#define global ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED  0x78e
#define global ERROR_AUTHENTICATION_FIREWALL_FAILED  0x78f
#define global ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED  0x790
#define global ERROR_NTLM_BLOCKED  0x791
#define global ERROR_PASSWORD_CHANGE_REQUIRED  0x792
#define global ERROR_LOST_MODE_LOGON_RESTRICTION  0x793
#define global ERROR_INVALID_PIXEL_FORMAT  0x7d0
#define global ERROR_BAD_DRIVER  0x7d1
#define global ERROR_INVALID_WINDOW_STYLE  0x7d2
#define global ERROR_METAFILE_NOT_SUPPORTED  0x7d3
#define global ERROR_TRANSFORM_NOT_SUPPORTED  0x7d4
#define global ERROR_CLIPPING_NOT_SUPPORTED  0x7d5
#define global ERROR_INVALID_CMM  0x7da
#define global ERROR_INVALID_PROFILE  0x7db
#define global ERROR_TAG_NOT_FOUND  0x7dc
#define global ERROR_TAG_NOT_PRESENT  0x7dd
#define global ERROR_DUPLICATE_TAG  0x7de
#define global ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE  0x7df
#define global ERROR_PROFILE_NOT_FOUND  0x7e0
#define global ERROR_INVALID_COLORSPACE  0x7e1
#define global ERROR_ICM_NOT_ENABLED  0x7e2
#define global ERROR_DELETING_ICM_XFORM  0x7e3
#define global ERROR_INVALID_TRANSFORM  0x7e4
#define global ERROR_COLORSPACE_MISMATCH  0x7e5
#define global ERROR_INVALID_COLORINDEX  0x7e6
#define global ERROR_PROFILE_DOES_NOT_MATCH_DEVICE  0x7e7
#define global ERROR_CONNECTED_OTHER_PASSWORD  0x83c
#define global ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT  0x83d
#define global ERROR_BAD_USERNAME  0x89a
#define global ERROR_NOT_CONNECTED  0x8ca
#define global ERROR_OPEN_FILES  0x961
#define global ERROR_ACTIVE_CONNECTIONS  0x962
#define global ERROR_DEVICE_IN_USE  0x964
#define global ERROR_UNKNOWN_PRINT_MONITOR  0xbb8
#define global ERROR_PRINTER_DRIVER_IN_USE  0xbb9
#define global ERROR_SPOOL_FILE_NOT_FOUND  0xbba
#define global ERROR_SPL_NO_STARTDOC  0xbbb
#define global ERROR_SPL_NO_ADDJOB  0xbbc
#define global ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED  0xbbd
#define global ERROR_PRINT_MONITOR_ALREADY_INSTALLED  0xbbe
#define global ERROR_INVALID_PRINT_MONITOR  0xbbf
#define global ERROR_PRINT_MONITOR_IN_USE  0xbc0
#define global ERROR_PRINTER_HAS_JOBS_QUEUED  0xbc1
#define global ERROR_SUCCESS_REBOOT_REQUIRED  0xbc2
#define global ERROR_SUCCESS_RESTART_REQUIRED  0xbc3
#define global ERROR_PRINTER_NOT_FOUND  0xbc4
#define global ERROR_PRINTER_DRIVER_WARNED  0xbc5
#define global ERROR_PRINTER_DRIVER_BLOCKED  0xbc6
#define global ERROR_PRINTER_DRIVER_PACKAGE_IN_USE  0xbc7
#define global ERROR_CORE_DRIVER_PACKAGE_NOT_FOUND  0xbc8
#define global ERROR_FAIL_REBOOT_REQUIRED  0xbc9
#define global ERROR_FAIL_REBOOT_INITIATED  0xbca
#define global ERROR_PRINTER_DRIVER_DOWNLOAD_NEEDED  0xbcb
#define global ERROR_PRINT_JOB_RESTART_REQUIRED  0xbcc
#define global ERROR_INVALID_PRINTER_DRIVER_MANIFEST  0xbcd
#define global ERROR_PRINTER_NOT_SHAREABLE  0xbce
#define global ERROR_SERVER_SERVICE_CALL_REQUIRES_SMB1  0xbcf
#define global ERROR_NETWORK_AUTHENTICATION_PROMPT_CANCELED  0xbd0
#define global ERROR_REQUEST_PAUSED  0xbea
#define global ERROR_APPEXEC_CONDITION_NOT_SATISFIED  0xbf4
#define global ERROR_APPEXEC_HANDLE_INVALIDATED  0xbf5
#define global ERROR_APPEXEC_INVALID_HOST_GENERATION  0xbf6
#define global ERROR_APPEXEC_UNEXPECTED_PROCESS_REGISTRATION  0xbf7
#define global ERROR_APPEXEC_INVALID_HOST_STATE  0xbf8
#define global ERROR_APPEXEC_NO_DONOR  0xbf9
#define global ERROR_APPEXEC_HOST_ID_MISMATCH  0xbfa
#define global ERROR_APPEXEC_UNKNOWN_USER  0xbfb
#define global ERROR_APPEXEC_APP_COMPAT_BLOCK  0xbfc
#define global ERROR_APPEXEC_CALLER_WAIT_TIMEOUT  0xbfd
#define global ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_TERMINATION  0xbfe
#define global ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_LICENSING  0xbff
#define global ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_RESOURCES  0xc00
#define global ERROR_VRF_VOLATILE_CFG_AND_IO_ENABLED  0xc08
#define global ERROR_VRF_VOLATILE_NOT_STOPPABLE  0xc09
#define global ERROR_VRF_VOLATILE_SAFE_MODE  0xc0a
#define global ERROR_VRF_VOLATILE_NOT_RUNNABLE_SYSTEM  0xc0b
#define global ERROR_VRF_VOLATILE_NOT_SUPPORTED_RULECLASS  0xc0c
#define global ERROR_VRF_VOLATILE_PROTECTED_DRIVER  0xc0d
#define global ERROR_VRF_VOLATILE_NMI_REGISTERED  0xc0e
#define global ERROR_VRF_VOLATILE_SETTINGS_CONFLICT  0xc0f
#define global ERROR_DIF_IOCALLBACK_NOT_REPLACED  0xc76
#define global ERROR_DIF_LIVEDUMP_LIMIT_EXCEEDED  0xc77
#define global ERROR_DIF_VOLATILE_SECTION_NOT_LOCKED  0xc78
#define global ERROR_DIF_VOLATILE_DRIVER_HOTPATCHED  0xc79
#define global ERROR_DIF_VOLATILE_INVALID_INFO  0xc7a
#define global ERROR_DIF_VOLATILE_DRIVER_IS_NOT_RUNNING  0xc7b
#define global ERROR_DIF_VOLATILE_PLUGIN_IS_NOT_RUNNING  0xc7c
#define global ERROR_DIF_VOLATILE_PLUGIN_CHANGE_NOT_ALLOWED  0xc7d
#define global ERROR_DIF_VOLATILE_NOT_ALLOWED  0xc7e
#define global ERROR_DIF_BINDING_API_NOT_FOUND  0xc7f
#define global ERROR_IO_REISSUE_AS_CACHED  0xf6e
#define global ERROR_WINS_INTERNAL  0xfa0
#define global ERROR_CAN_NOT_DEL_LOCAL_WINS  0xfa1
#define global ERROR_STATIC_INIT  0xfa2
#define global ERROR_INC_BACKUP  0xfa3
#define global ERROR_FULL_BACKUP  0xfa4
#define global ERROR_REC_NON_EXISTENT  0xfa5
#define global ERROR_RPL_NOT_ALLOWED  0xfa6
#define global ERROR_DHCP_ADDRESS_CONFLICT  0x1004
#define global ERROR_WMI_GUID_NOT_FOUND  0x1068
#define global ERROR_WMI_INSTANCE_NOT_FOUND  0x1069
#define global ERROR_WMI_ITEMID_NOT_FOUND  0x106a
#define global ERROR_WMI_TRY_AGAIN  0x106b
#define global ERROR_WMI_DP_NOT_FOUND  0x106c
#define global ERROR_WMI_UNRESOLVED_INSTANCE_REF  0x106d
#define global ERROR_WMI_ALREADY_ENABLED  0x106e
#define global ERROR_WMI_GUID_DISCONNECTED  0x106f
#define global ERROR_WMI_SERVER_UNAVAILABLE  0x1070
#define global ERROR_WMI_DP_FAILED  0x1071
#define global ERROR_WMI_INVALID_MOF  0x1072
#define global ERROR_WMI_INVALID_REGINFO  0x1073
#define global ERROR_WMI_ALREADY_DISABLED  0x1074
#define global ERROR_WMI_READ_ONLY  0x1075
#define global ERROR_WMI_SET_FAILURE  0x1076
#define global ERROR_NOT_APPCONTAINER  0x109a
#define global ERROR_APPCONTAINER_REQUIRED  0x109b
#define global ERROR_NOT_SUPPORTED_IN_APPCONTAINER  0x109c
#define global ERROR_INVALID_PACKAGE_SID_LENGTH  0x109d
#define global ERROR_INVALID_MEDIA  0x10cc
#define global ERROR_INVALID_LIBRARY  0x10cd
#define global ERROR_INVALID_MEDIA_POOL  0x10ce
#define global ERROR_DRIVE_MEDIA_MISMATCH  0x10cf
#define global ERROR_MEDIA_OFFLINE  0x10d0
#define global ERROR_LIBRARY_OFFLINE  0x10d1
#define global ERROR_EMPTY  0x10d2
#define global ERROR_NOT_EMPTY  0x10d3
#define global ERROR_MEDIA_UNAVAILABLE  0x10d4
#define global ERROR_RESOURCE_DISABLED  0x10d5
#define global ERROR_INVALID_CLEANER  0x10d6
#define global ERROR_UNABLE_TO_CLEAN  0x10d7
#define global ERROR_OBJECT_NOT_FOUND  0x10d8
#define global ERROR_DATABASE_FAILURE  0x10d9
#define global ERROR_DATABASE_FULL  0x10da
#define global ERROR_MEDIA_INCOMPATIBLE  0x10db
#define global ERROR_RESOURCE_NOT_PRESENT  0x10dc
#define global ERROR_INVALID_OPERATION  0x10dd
#define global ERROR_MEDIA_NOT_AVAILABLE  0x10de
#define global ERROR_DEVICE_NOT_AVAILABLE  0x10df
#define global ERROR_REQUEST_REFUSED  0x10e0
#define global ERROR_INVALID_DRIVE_OBJECT  0x10e1
#define global ERROR_LIBRARY_FULL  0x10e2
#define global ERROR_MEDIUM_NOT_ACCESSIBLE  0x10e3
#define global ERROR_UNABLE_TO_LOAD_MEDIUM  0x10e4
#define global ERROR_UNABLE_TO_INVENTORY_DRIVE  0x10e5
#define global ERROR_UNABLE_TO_INVENTORY_SLOT  0x10e6
#define global ERROR_UNABLE_TO_INVENTORY_TRANSPORT  0x10e7
#define global ERROR_TRANSPORT_FULL  0x10e8
#define global ERROR_CONTROLLING_IEPORT  0x10e9
#define global ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA  0x10ea
#define global ERROR_CLEANER_SLOT_SET  0x10eb
#define global ERROR_CLEANER_SLOT_NOT_SET  0x10ec
#define global ERROR_CLEANER_CARTRIDGE_SPENT  0x10ed
#define global ERROR_UNEXPECTED_OMID  0x10ee
#define global ERROR_CANT_DELETE_LAST_ITEM  0x10ef
#define global ERROR_MESSAGE_EXCEEDS_MAX_SIZE  0x10f0
#define global ERROR_VOLUME_CONTAINS_SYS_FILES  0x10f1
#define global ERROR_INDIGENOUS_TYPE  0x10f2
#define global ERROR_NO_SUPPORTING_DRIVES  0x10f3
#define global ERROR_CLEANER_CARTRIDGE_INSTALLED  0x10f4
#define global ERROR_IEPORT_FULL  0x10f5
#define global ERROR_FILE_OFFLINE  0x10fe
#define global ERROR_REMOTE_STORAGE_NOT_ACTIVE  0x10ff
#define global ERROR_REMOTE_STORAGE_MEDIA_ERROR  0x1100
#define global ERROR_NOT_A_REPARSE_POINT  0x1126
#define global ERROR_REPARSE_ATTRIBUTE_CONFLICT  0x1127
#define global ERROR_INVALID_REPARSE_DATA  0x1128
#define global ERROR_REPARSE_TAG_INVALID  0x1129
#define global ERROR_REPARSE_TAG_MISMATCH  0x112a
#define global ERROR_REPARSE_POINT_ENCOUNTERED  0x112b
#define global ERROR_APP_DATA_NOT_FOUND  0x1130
#define global ERROR_APP_DATA_EXPIRED  0x1131
#define global ERROR_APP_DATA_CORRUPT  0x1132
#define global ERROR_APP_DATA_LIMIT_EXCEEDED  0x1133
#define global ERROR_APP_DATA_REBOOT_REQUIRED  0x1134
#define global ERROR_SECUREBOOT_ROLLBACK_DETECTED  0x1144
#define global ERROR_SECUREBOOT_POLICY_VIOLATION  0x1145
#define global ERROR_SECUREBOOT_INVALID_POLICY  0x1146
#define global ERROR_SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND  0x1147
#define global ERROR_SECUREBOOT_POLICY_NOT_SIGNED  0x1148
#define global ERROR_SECUREBOOT_NOT_ENABLED  0x1149
#define global ERROR_SECUREBOOT_FILE_REPLACED  0x114a
#define global ERROR_SECUREBOOT_POLICY_NOT_AUTHORIZED  0x114b
#define global ERROR_SECUREBOOT_POLICY_UNKNOWN  0x114c
#define global ERROR_SECUREBOOT_POLICY_MISSING_ANTIROLLBACKVERSION  0x114d
#define global ERROR_SECUREBOOT_PLATFORM_ID_MISMATCH  0x114e
#define global ERROR_SECUREBOOT_POLICY_ROLLBACK_DETECTED  0x114f
#define global ERROR_SECUREBOOT_POLICY_UPGRADE_MISMATCH  0x1150
#define global ERROR_SECUREBOOT_REQUIRED_POLICY_FILE_MISSING  0x1151
#define global ERROR_SECUREBOOT_NOT_BASE_POLICY  0x1152
#define global ERROR_SECUREBOOT_NOT_SUPPLEMENTAL_POLICY  0x1153
#define global ERROR_OFFLOAD_READ_FLT_NOT_SUPPORTED  0x1158
#define global ERROR_OFFLOAD_WRITE_FLT_NOT_SUPPORTED  0x1159
#define global ERROR_OFFLOAD_READ_FILE_NOT_SUPPORTED  0x115a
#define global ERROR_OFFLOAD_WRITE_FILE_NOT_SUPPORTED  0x115b
#define global ERROR_ALREADY_HAS_STREAM_ID  0x115c
#define global ERROR_SMR_GARBAGE_COLLECTION_REQUIRED  0x115d
#define global ERROR_WOF_WIM_HEADER_CORRUPT  0x115e
#define global ERROR_WOF_WIM_RESOURCE_TABLE_CORRUPT  0x115f
#define global ERROR_WOF_FILE_RESOURCE_TABLE_CORRUPT  0x1160
#define global ERROR_OBJECT_IS_IMMUTABLE  0x1161
#define global ERROR_VOLUME_NOT_SIS_ENABLED  0x1194
#define global ERROR_SYSTEM_INTEGRITY_ROLLBACK_DETECTED  0x11c6
#define global ERROR_SYSTEM_INTEGRITY_POLICY_VIOLATION  0x11c7
#define global ERROR_SYSTEM_INTEGRITY_INVALID_POLICY  0x11c8
#define global ERROR_SYSTEM_INTEGRITY_POLICY_NOT_SIGNED  0x11c9
#define global ERROR_SYSTEM_INTEGRITY_TOO_MANY_POLICIES  0x11ca
#define global ERROR_SYSTEM_INTEGRITY_SUPPLEMENTAL_POLICY_NOT_AUTHORIZED  0x11cb
#define global ERROR_SYSTEM_INTEGRITY_REPUTATION_MALICIOUS  0x11cc
#define global ERROR_SYSTEM_INTEGRITY_REPUTATION_PUA  0x11cd
#define global ERROR_SYSTEM_INTEGRITY_REPUTATION_DANGEROUS_EXT  0x11ce
#define global ERROR_SYSTEM_INTEGRITY_REPUTATION_OFFLINE  0x11cf
#define global ERROR_VSM_NOT_INITIALIZED  0x11d0
#define global ERROR_VSM_DMA_PROTECTION_NOT_IN_USE  0x11d1
#define global ERROR_PLATFORM_MANIFEST_NOT_AUTHORIZED  0x11da
#define global ERROR_PLATFORM_MANIFEST_INVALID  0x11db
#define global ERROR_PLATFORM_MANIFEST_FILE_NOT_AUTHORIZED  0x11dc
#define global ERROR_PLATFORM_MANIFEST_CATALOG_NOT_AUTHORIZED  0x11dd
#define global ERROR_PLATFORM_MANIFEST_BINARY_ID_NOT_FOUND  0x11de
#define global ERROR_PLATFORM_MANIFEST_NOT_ACTIVE  0x11df
#define global ERROR_PLATFORM_MANIFEST_NOT_SIGNED  0x11e0
#define global ERROR_SYSTEM_INTEGRITY_REPUTATION_UNFRIENDLY_FILE  0x11e4
#define global ERROR_SYSTEM_INTEGRITY_REPUTATION_UNATTAINABLE  0x11e5
#define global ERROR_SYSTEM_INTEGRITY_REPUTATION_EXPLICIT_DENY_FILE  0x11e6
#define global ERROR_DEPENDENT_RESOURCE_EXISTS  0x1389
#define global ERROR_DEPENDENCY_NOT_FOUND  0x138a
#define global ERROR_DEPENDENCY_ALREADY_EXISTS  0x138b
#define global ERROR_RESOURCE_NOT_ONLINE  0x138c
#define global ERROR_HOST_NODE_NOT_AVAILABLE  0x138d
#define global ERROR_RESOURCE_NOT_AVAILABLE  0x138e
#define global ERROR_RESOURCE_NOT_FOUND  0x138f
#define global ERROR_SHUTDOWN_CLUSTER  0x1390
#define global ERROR_CANT_EVICT_ACTIVE_NODE  0x1391
#define global ERROR_OBJECT_ALREADY_EXISTS  0x1392
#define global ERROR_OBJECT_IN_LIST  0x1393
#define global ERROR_GROUP_NOT_AVAILABLE  0x1394
#define global ERROR_GROUP_NOT_FOUND  0x1395
#define global ERROR_GROUP_NOT_ONLINE  0x1396
#define global ERROR_HOST_NODE_NOT_RESOURCE_OWNER  0x1397
#define global ERROR_HOST_NODE_NOT_GROUP_OWNER  0x1398
#define global ERROR_RESMON_CREATE_FAILED  0x1399
#define global ERROR_RESMON_ONLINE_FAILED  0x139a
#define global ERROR_RESOURCE_ONLINE  0x139b
#define global ERROR_QUORUM_RESOURCE  0x139c
#define global ERROR_NOT_QUORUM_CAPABLE  0x139d
#define global ERROR_CLUSTER_SHUTTING_DOWN  0x139e
#define global ERROR_INVALID_STATE  0x139f
#define global ERROR_RESOURCE_PROPERTIES_STORED  0x13a0
#define global ERROR_NOT_QUORUM_CLASS  0x13a1
#define global ERROR_CORE_RESOURCE  0x13a2
#define global ERROR_QUORUM_RESOURCE_ONLINE_FAILED  0x13a3
#define global ERROR_QUORUMLOG_OPEN_FAILED  0x13a4
#define global ERROR_CLUSTERLOG_CORRUPT  0x13a5
#define global ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE  0x13a6
#define global ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE  0x13a7
#define global ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND  0x13a8
#define global ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE  0x13a9
#define global ERROR_QUORUM_OWNER_ALIVE  0x13aa
#define global ERROR_NETWORK_NOT_AVAILABLE  0x13ab
#define global ERROR_NODE_NOT_AVAILABLE  0x13ac
#define global ERROR_ALL_NODES_NOT_AVAILABLE  0x13ad
#define global ERROR_RESOURCE_FAILED  0x13ae
#define global ERROR_CLUSTER_INVALID_NODE  0x13af
#define global ERROR_CLUSTER_NODE_EXISTS  0x13b0
#define global ERROR_CLUSTER_JOIN_IN_PROGRESS  0x13b1
#define global ERROR_CLUSTER_NODE_NOT_FOUND  0x13b2
#define global ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND  0x13b3
#define global ERROR_CLUSTER_NETWORK_EXISTS  0x13b4
#define global ERROR_CLUSTER_NETWORK_NOT_FOUND  0x13b5
#define global ERROR_CLUSTER_NETINTERFACE_EXISTS  0x13b6
#define global ERROR_CLUSTER_NETINTERFACE_NOT_FOUND  0x13b7
#define global ERROR_CLUSTER_INVALID_REQUEST  0x13b8
#define global ERROR_CLUSTER_INVALID_NETWORK_PROVIDER  0x13b9
#define global ERROR_CLUSTER_NODE_DOWN  0x13ba
#define global ERROR_CLUSTER_NODE_UNREACHABLE  0x13bb
#define global ERROR_CLUSTER_NODE_NOT_MEMBER  0x13bc
#define global ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS  0x13bd
#define global ERROR_CLUSTER_INVALID_NETWORK  0x13be
#define global ERROR_CLUSTER_NODE_UP  0x13c0
#define global ERROR_CLUSTER_IPADDR_IN_USE  0x13c1
#define global ERROR_CLUSTER_NODE_NOT_PAUSED  0x13c2
#define global ERROR_CLUSTER_NO_SECURITY_CONTEXT  0x13c3
#define global ERROR_CLUSTER_NETWORK_NOT_INTERNAL  0x13c4
#define global ERROR_CLUSTER_NODE_ALREADY_UP  0x13c5
#define global ERROR_CLUSTER_NODE_ALREADY_DOWN  0x13c6
#define global ERROR_CLUSTER_NETWORK_ALREADY_ONLINE  0x13c7
#define global ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE  0x13c8
#define global ERROR_CLUSTER_NODE_ALREADY_MEMBER  0x13c9
#define global ERROR_CLUSTER_LAST_INTERNAL_NETWORK  0x13ca
#define global ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS  0x13cb
#define global ERROR_INVALID_OPERATION_ON_QUORUM  0x13cc
#define global ERROR_DEPENDENCY_NOT_ALLOWED  0x13cd
#define global ERROR_CLUSTER_NODE_PAUSED  0x13ce
#define global ERROR_NODE_CANT_HOST_RESOURCE  0x13cf
#define global ERROR_CLUSTER_NODE_NOT_READY  0x13d0
#define global ERROR_CLUSTER_NODE_SHUTTING_DOWN  0x13d1
#define global ERROR_CLUSTER_JOIN_ABORTED  0x13d2
#define global ERROR_CLUSTER_INCOMPATIBLE_VERSIONS  0x13d3
#define global ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED  0x13d4
#define global ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED  0x13d5
#define global ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND  0x13d6
#define global ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED  0x13d7
#define global ERROR_CLUSTER_RESNAME_NOT_FOUND  0x13d8
#define global ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED  0x13d9
#define global ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST  0x13da
#define global ERROR_CLUSTER_DATABASE_SEQMISMATCH  0x13db
#define global ERROR_RESMON_INVALID_STATE  0x13dc
#define global ERROR_CLUSTER_GUM_NOT_LOCKER  0x13dd
#define global ERROR_QUORUM_DISK_NOT_FOUND  0x13de
#define global ERROR_DATABASE_BACKUP_CORRUPT  0x13df
#define global ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT  0x13e0
#define global ERROR_RESOURCE_PROPERTY_UNCHANGEABLE  0x13e1
#define global ERROR_NO_ADMIN_ACCESS_POINT  0x13e2
#define global ERROR_CLUSTER_MEMBERSHIP_INVALID_STATE  0x1702
#define global ERROR_CLUSTER_QUORUMLOG_NOT_FOUND  0x1703
#define global ERROR_CLUSTER_MEMBERSHIP_HALT  0x1704
#define global ERROR_CLUSTER_INSTANCE_ID_MISMATCH  0x1705
#define global ERROR_CLUSTER_NETWORK_NOT_FOUND_FOR_IP  0x1706
#define global ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH  0x1707
#define global ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP  0x1708
#define global ERROR_CLUSTER_PARAMETER_MISMATCH  0x1709
#define global ERROR_NODE_CANNOT_BE_CLUSTERED  0x170a
#define global ERROR_CLUSTER_WRONG_OS_VERSION  0x170b
#define global ERROR_CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME  0x170c
#define global ERROR_CLUSCFG_ALREADY_COMMITTED  0x170d
#define global ERROR_CLUSCFG_ROLLBACK_FAILED  0x170e
#define global ERROR_CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT  0x170f
#define global ERROR_CLUSTER_OLD_VERSION  0x1710
#define global ERROR_CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME  0x1711
#define global ERROR_CLUSTER_NO_NET_ADAPTERS  0x1712
#define global ERROR_CLUSTER_POISONED  0x1713
#define global ERROR_CLUSTER_GROUP_MOVING  0x1714
#define global ERROR_CLUSTER_RESOURCE_TYPE_BUSY  0x1715
#define global ERROR_RESOURCE_CALL_TIMED_OUT  0x1716
#define global ERROR_INVALID_CLUSTER_IPV6_ADDRESS  0x1717
#define global ERROR_CLUSTER_INTERNAL_INVALID_FUNCTION  0x1718
#define global ERROR_CLUSTER_PARAMETER_OUT_OF_BOUNDS  0x1719
#define global ERROR_CLUSTER_PARTIAL_SEND  0x171a
#define global ERROR_CLUSTER_REGISTRY_INVALID_FUNCTION  0x171b
#define global ERROR_CLUSTER_INVALID_STRING_TERMINATION  0x171c
#define global ERROR_CLUSTER_INVALID_STRING_FORMAT  0x171d
#define global ERROR_CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS  0x171e
#define global ERROR_CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS  0x171f
#define global ERROR_CLUSTER_NULL_DATA  0x1720
#define global ERROR_CLUSTER_PARTIAL_READ  0x1721
#define global ERROR_CLUSTER_PARTIAL_WRITE  0x1722
#define global ERROR_CLUSTER_CANT_DESERIALIZE_DATA  0x1723
#define global ERROR_DEPENDENT_RESOURCE_PROPERTY_CONFLICT  0x1724
#define global ERROR_CLUSTER_NO_QUORUM  0x1725
#define global ERROR_CLUSTER_INVALID_IPV6_NETWORK  0x1726
#define global ERROR_CLUSTER_INVALID_IPV6_TUNNEL_NETWORK  0x1727
#define global ERROR_QUORUM_NOT_ALLOWED_IN_THIS_GROUP  0x1728
#define global ERROR_DEPENDENCY_TREE_TOO_COMPLEX  0x1729
#define global ERROR_EXCEPTION_IN_RESOURCE_CALL  0x172a
#define global ERROR_CLUSTER_RHS_FAILED_INITIALIZATION  0x172b
#define global ERROR_CLUSTER_NOT_INSTALLED  0x172c
#define global ERROR_CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE  0x172d
#define global ERROR_CLUSTER_MAX_NODES_IN_CLUSTER  0x172e
#define global ERROR_CLUSTER_TOO_MANY_NODES  0x172f
#define global ERROR_CLUSTER_OBJECT_ALREADY_USED  0x1730
#define global ERROR_NONCORE_GROUPS_FOUND  0x1731
#define global ERROR_FILE_SHARE_RESOURCE_CONFLICT  0x1732
#define global ERROR_CLUSTER_EVICT_INVALID_REQUEST  0x1733
#define global ERROR_CLUSTER_SINGLETON_RESOURCE  0x1734
#define global ERROR_CLUSTER_GROUP_SINGLETON_RESOURCE  0x1735
#define global ERROR_CLUSTER_RESOURCE_PROVIDER_FAILED  0x1736
#define global ERROR_CLUSTER_RESOURCE_CONFIGURATION_ERROR  0x1737
#define global ERROR_CLUSTER_GROUP_BUSY  0x1738
#define global ERROR_CLUSTER_NOT_SHARED_VOLUME  0x1739
#define global ERROR_CLUSTER_INVALID_SECURITY_DESCRIPTOR  0x173a
#define global ERROR_CLUSTER_SHARED_VOLUMES_IN_USE  0x173b
#define global ERROR_CLUSTER_USE_SHARED_VOLUMES_API  0x173c
#define global ERROR_CLUSTER_BACKUP_IN_PROGRESS  0x173d
#define global ERROR_NON_CSV_PATH  0x173e
#define global ERROR_CSV_VOLUME_NOT_LOCAL  0x173f
#define global ERROR_CLUSTER_WATCHDOG_TERMINATING  0x1740
#define global ERROR_CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES  0x1741
#define global ERROR_CLUSTER_INVALID_NODE_WEIGHT  0x1742
#define global ERROR_CLUSTER_RESOURCE_VETOED_CALL  0x1743
#define global ERROR_RESMON_SYSTEM_RESOURCES_LACKING  0x1744
#define global ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION  0x1745
#define global ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE  0x1746
#define global ERROR_CLUSTER_GROUP_QUEUED  0x1747
#define global ERROR_CLUSTER_RESOURCE_LOCKED_STATUS  0x1748
#define global ERROR_CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED  0x1749
#define global ERROR_CLUSTER_NODE_DRAIN_IN_PROGRESS  0x174a
#define global ERROR_CLUSTER_DISK_NOT_CONNECTED  0x174b
#define global ERROR_DISK_NOT_CSV_CAPABLE  0x174c
#define global ERROR_RESOURCE_NOT_IN_AVAILABLE_STORAGE  0x174d
#define global ERROR_CLUSTER_SHARED_VOLUME_REDIRECTED  0x174e
#define global ERROR_CLUSTER_SHARED_VOLUME_NOT_REDIRECTED  0x174f
#define global ERROR_CLUSTER_CANNOT_RETURN_PROPERTIES  0x1750
#define global ERROR_CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES  0x1751
#define global ERROR_CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE  0x1752
#define global ERROR_CLUSTER_AFFINITY_CONFLICT  0x1753
#define global ERROR_CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE  0x1754
#define global ERROR_CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS  0x1755
#define global ERROR_CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED  0x1756
#define global ERROR_CLUSTER_UPGRADE_RESTART_REQUIRED  0x1757
#define global ERROR_CLUSTER_UPGRADE_IN_PROGRESS  0x1758
#define global ERROR_CLUSTER_UPGRADE_INCOMPLETE  0x1759
#define global ERROR_CLUSTER_NODE_IN_GRACE_PERIOD  0x175a
#define global ERROR_CLUSTER_CSV_IO_PAUSE_TIMEOUT  0x175b
#define global ERROR_NODE_NOT_ACTIVE_CLUSTER_MEMBER  0x175c
#define global ERROR_CLUSTER_RESOURCE_NOT_MONITORED  0x175d
#define global ERROR_CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED  0x175e
#define global ERROR_CLUSTER_RESOURCE_IS_REPLICATED  0x175f
#define global ERROR_CLUSTER_NODE_ISOLATED  0x1760
#define global ERROR_CLUSTER_NODE_QUARANTINED  0x1761
#define global ERROR_CLUSTER_DATABASE_UPDATE_CONDITION_FAILED  0x1762
#define global ERROR_CLUSTER_SPACE_DEGRADED  0x1763
#define global ERROR_CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED  0x1764
#define global ERROR_CLUSTER_CSV_INVALID_HANDLE  0x1765
#define global ERROR_CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR  0x1766
#define global ERROR_GROUPSET_NOT_AVAILABLE  0x1767
#define global ERROR_GROUPSET_NOT_FOUND  0x1768
#define global ERROR_GROUPSET_CANT_PROVIDE  0x1769
#define global ERROR_CLUSTER_FAULT_DOMAIN_PARENT_NOT_FOUND  0x176a
#define global ERROR_CLUSTER_FAULT_DOMAIN_INVALID_HIERARCHY  0x176b
#define global ERROR_CLUSTER_FAULT_DOMAIN_FAILED_S2D_VALIDATION  0x176c
#define global ERROR_CLUSTER_FAULT_DOMAIN_S2D_CONNECTIVITY_LOSS  0x176d
#define global ERROR_CLUSTER_INVALID_INFRASTRUCTURE_FILESERVER_NAME  0x176e
#define global ERROR_CLUSTERSET_MANAGEMENT_CLUSTER_UNREACHABLE  0x176f
#define global ERROR_ENCRYPTION_FAILED  0x1770
#define global ERROR_DECRYPTION_FAILED  0x1771
#define global ERROR_FILE_ENCRYPTED  0x1772
#define global ERROR_NO_RECOVERY_POLICY  0x1773
#define global ERROR_NO_EFS  0x1774
#define global ERROR_WRONG_EFS  0x1775
#define global ERROR_NO_USER_KEYS  0x1776
#define global ERROR_FILE_NOT_ENCRYPTED  0x1777
#define global ERROR_NOT_EXPORT_FORMAT  0x1778
#define global ERROR_FILE_READ_ONLY  0x1779
#define global ERROR_DIR_EFS_DISALLOWED  0x177a
#define global ERROR_EFS_SERVER_NOT_TRUSTED  0x177b
#define global ERROR_BAD_RECOVERY_POLICY  0x177c
#define global ERROR_EFS_ALG_BLOB_TOO_BIG  0x177d
#define global ERROR_VOLUME_NOT_SUPPORT_EFS  0x177e
#define global ERROR_EFS_DISABLED  0x177f
#define global ERROR_EFS_VERSION_NOT_SUPPORT  0x1780
#define global ERROR_CS_ENCRYPTION_INVALID_SERVER_RESPONSE  0x1781
#define global ERROR_CS_ENCRYPTION_UNSUPPORTED_SERVER  0x1782
#define global ERROR_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE  0x1783
#define global ERROR_CS_ENCRYPTION_NEW_ENCRYPTED_FILE  0x1784
#define global ERROR_CS_ENCRYPTION_FILE_NOT_CSE  0x1785
#define global ERROR_ENCRYPTION_POLICY_DENIES_OPERATION  0x1786
#define global ERROR_WIP_ENCRYPTION_FAILED  0x1787
#define global ERROR_NO_BROWSER_SERVERS_FOUND  0x17e6
#define global ERROR_CLUSTER_OBJECT_IS_CLUSTER_SET_VM  0x186a
#define global ERROR_LOG_SECTOR_INVALID  0x19c8
#define global ERROR_LOG_SECTOR_PARITY_INVALID  0x19c9
#define global ERROR_LOG_SECTOR_REMAPPED  0x19ca
#define global ERROR_LOG_BLOCK_INCOMPLETE  0x19cb
#define global ERROR_LOG_INVALID_RANGE  0x19cc
#define global ERROR_LOG_BLOCKS_EXHAUSTED  0x19cd
#define global ERROR_LOG_READ_CONTEXT_INVALID  0x19ce
#define global ERROR_LOG_RESTART_INVALID  0x19cf
#define global ERROR_LOG_BLOCK_VERSION  0x19d0
#define global ERROR_LOG_BLOCK_INVALID  0x19d1
#define global ERROR_LOG_READ_MODE_INVALID  0x19d2
#define global ERROR_LOG_NO_RESTART  0x19d3
#define global ERROR_LOG_METADATA_CORRUPT  0x19d4
#define global ERROR_LOG_METADATA_INVALID  0x19d5
#define global ERROR_LOG_METADATA_INCONSISTENT  0x19d6
#define global ERROR_LOG_RESERVATION_INVALID  0x19d7
#define global ERROR_LOG_CANT_DELETE  0x19d8
#define global ERROR_LOG_CONTAINER_LIMIT_EXCEEDED  0x19d9
#define global ERROR_LOG_START_OF_LOG  0x19da
#define global ERROR_LOG_POLICY_ALREADY_INSTALLED  0x19db
#define global ERROR_LOG_POLICY_NOT_INSTALLED  0x19dc
#define global ERROR_LOG_POLICY_INVALID  0x19dd
#define global ERROR_LOG_POLICY_CONFLICT  0x19de
#define global ERROR_LOG_PINNED_ARCHIVE_TAIL  0x19df
#define global ERROR_LOG_RECORD_NONEXISTENT  0x19e0
#define global ERROR_LOG_RECORDS_RESERVED_INVALID  0x19e1
#define global ERROR_LOG_SPACE_RESERVED_INVALID  0x19e2
#define global ERROR_LOG_TAIL_INVALID  0x19e3
#define global ERROR_LOG_FULL  0x19e4
#define global ERROR_COULD_NOT_RESIZE_LOG  0x19e5
#define global ERROR_LOG_MULTIPLEXED  0x19e6
#define global ERROR_LOG_DEDICATED  0x19e7
#define global ERROR_LOG_ARCHIVE_NOT_IN_PROGRESS  0x19e8
#define global ERROR_LOG_ARCHIVE_IN_PROGRESS  0x19e9
#define global ERROR_LOG_EPHEMERAL  0x19ea
#define global ERROR_LOG_NOT_ENOUGH_CONTAINERS  0x19eb
#define global ERROR_LOG_CLIENT_ALREADY_REGISTERED  0x19ec
#define global ERROR_LOG_CLIENT_NOT_REGISTERED  0x19ed
#define global ERROR_LOG_FULL_HANDLER_IN_PROGRESS  0x19ee
#define global ERROR_LOG_CONTAINER_READ_FAILED  0x19ef
#define global ERROR_LOG_CONTAINER_WRITE_FAILED  0x19f0
#define global ERROR_LOG_CONTAINER_OPEN_FAILED  0x19f1
#define global ERROR_LOG_CONTAINER_STATE_INVALID  0x19f2
#define global ERROR_LOG_STATE_INVALID  0x19f3
#define global ERROR_LOG_PINNED  0x19f4
#define global ERROR_LOG_METADATA_FLUSH_FAILED  0x19f5
#define global ERROR_LOG_INCONSISTENT_SECURITY  0x19f6
#define global ERROR_LOG_APPENDED_FLUSH_FAILED  0x19f7
#define global ERROR_LOG_PINNED_RESERVATION  0x19f8
#define global ERROR_INVALID_TRANSACTION  0x1a2c
#define global ERROR_TRANSACTION_NOT_ACTIVE  0x1a2d
#define global ERROR_TRANSACTION_REQUEST_NOT_VALID  0x1a2e
#define global ERROR_TRANSACTION_NOT_REQUESTED  0x1a2f
#define global ERROR_TRANSACTION_ALREADY_ABORTED  0x1a30
#define global ERROR_TRANSACTION_ALREADY_COMMITTED  0x1a31
#define global ERROR_TM_INITIALIZATION_FAILED  0x1a32
#define global ERROR_RESOURCEMANAGER_READ_ONLY  0x1a33
#define global ERROR_TRANSACTION_NOT_JOINED  0x1a34
#define global ERROR_TRANSACTION_SUPERIOR_EXISTS  0x1a35
#define global ERROR_CRM_PROTOCOL_ALREADY_EXISTS  0x1a36
#define global ERROR_TRANSACTION_PROPAGATION_FAILED  0x1a37
#define global ERROR_CRM_PROTOCOL_NOT_FOUND  0x1a38
#define global ERROR_TRANSACTION_INVALID_MARSHALL_BUFFER  0x1a39
#define global ERROR_CURRENT_TRANSACTION_NOT_VALID  0x1a3a
#define global ERROR_TRANSACTION_NOT_FOUND  0x1a3b
#define global ERROR_RESOURCEMANAGER_NOT_FOUND  0x1a3c
#define global ERROR_ENLISTMENT_NOT_FOUND  0x1a3d
#define global ERROR_TRANSACTIONMANAGER_NOT_FOUND  0x1a3e
#define global ERROR_TRANSACTIONMANAGER_NOT_ONLINE  0x1a3f
#define global ERROR_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION  0x1a40
#define global ERROR_TRANSACTION_NOT_ROOT  0x1a41
#define global ERROR_TRANSACTION_OBJECT_EXPIRED  0x1a42
#define global ERROR_TRANSACTION_RESPONSE_NOT_ENLISTED  0x1a43
#define global ERROR_TRANSACTION_RECORD_TOO_LONG  0x1a44
#define global ERROR_IMPLICIT_TRANSACTION_NOT_SUPPORTED  0x1a45
#define global ERROR_TRANSACTION_INTEGRITY_VIOLATED  0x1a46
#define global ERROR_TRANSACTIONMANAGER_IDENTITY_MISMATCH  0x1a47
#define global ERROR_RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT  0x1a48
#define global ERROR_TRANSACTION_MUST_WRITETHROUGH  0x1a49
#define global ERROR_TRANSACTION_NO_SUPERIOR  0x1a4a
#define global ERROR_HEURISTIC_DAMAGE_POSSIBLE  0x1a4b
#define global ERROR_TRANSACTIONAL_CONFLICT  0x1a90
#define global ERROR_RM_NOT_ACTIVE  0x1a91
#define global ERROR_RM_METADATA_CORRUPT  0x1a92
#define global ERROR_DIRECTORY_NOT_RM  0x1a93
#define global ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE  0x1a95
#define global ERROR_LOG_RESIZE_INVALID_SIZE  0x1a96
#define global ERROR_OBJECT_NO_LONGER_EXISTS  0x1a97
#define global ERROR_STREAM_MINIVERSION_NOT_FOUND  0x1a98
#define global ERROR_STREAM_MINIVERSION_NOT_VALID  0x1a99
#define global ERROR_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION  0x1a9a
#define global ERROR_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT  0x1a9b
#define global ERROR_CANT_CREATE_MORE_STREAM_MINIVERSIONS  0x1a9c
#define global ERROR_REMOTE_FILE_VERSION_MISMATCH  0x1a9e
#define global ERROR_HANDLE_NO_LONGER_VALID  0x1a9f
#define global ERROR_NO_TXF_METADATA  0x1aa0
#define global ERROR_LOG_CORRUPTION_DETECTED  0x1aa1
#define global ERROR_CANT_RECOVER_WITH_HANDLE_OPEN  0x1aa2
#define global ERROR_RM_DISCONNECTED  0x1aa3
#define global ERROR_ENLISTMENT_NOT_SUPERIOR  0x1aa4
#define global ERROR_RECOVERY_NOT_NEEDED  0x1aa5
#define global ERROR_RM_ALREADY_STARTED  0x1aa6
#define global ERROR_FILE_IDENTITY_NOT_PERSISTENT  0x1aa7
#define global ERROR_CANT_BREAK_TRANSACTIONAL_DEPENDENCY  0x1aa8
#define global ERROR_CANT_CROSS_RM_BOUNDARY  0x1aa9
#define global ERROR_TXF_DIR_NOT_EMPTY  0x1aaa
#define global ERROR_INDOUBT_TRANSACTIONS_EXIST  0x1aab
#define global ERROR_TM_VOLATILE  0x1aac
#define global ERROR_ROLLBACK_TIMER_EXPIRED  0x1aad
#define global ERROR_TXF_ATTRIBUTE_CORRUPT  0x1aae
#define global ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION  0x1aaf
#define global ERROR_TRANSACTIONAL_OPEN_NOT_ALLOWED  0x1ab0
#define global ERROR_LOG_GROWTH_FAILED  0x1ab1
#define global ERROR_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE  0x1ab2
#define global ERROR_TXF_METADATA_ALREADY_PRESENT  0x1ab3
#define global ERROR_TRANSACTION_SCOPE_CALLBACKS_NOT_SET  0x1ab4
#define global ERROR_TRANSACTION_REQUIRED_PROMOTION  0x1ab5
#define global ERROR_CANNOT_EXECUTE_FILE_IN_TRANSACTION  0x1ab6
#define global ERROR_TRANSACTIONS_NOT_FROZEN  0x1ab7
#define global ERROR_TRANSACTION_FREEZE_IN_PROGRESS  0x1ab8
#define global ERROR_NOT_SNAPSHOT_VOLUME  0x1ab9
#define global ERROR_NO_SAVEPOINT_WITH_OPEN_FILES  0x1aba
#define global ERROR_DATA_LOST_REPAIR  0x1abb
#define global ERROR_SPARSE_NOT_ALLOWED_IN_TRANSACTION  0x1abc
#define global ERROR_TM_IDENTITY_MISMATCH  0x1abd
#define global ERROR_FLOATED_SECTION  0x1abe
#define global ERROR_CANNOT_ACCEPT_TRANSACTED_WORK  0x1abf
#define global ERROR_CANNOT_ABORT_TRANSACTIONS  0x1ac0
#define global ERROR_BAD_CLUSTERS  0x1ac1
#define global ERROR_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION  0x1ac2
#define global ERROR_VOLUME_DIRTY  0x1ac3
#define global ERROR_NO_LINK_TRACKING_IN_TRANSACTION  0x1ac4
#define global ERROR_OPERATION_NOT_SUPPORTED_IN_TRANSACTION  0x1ac5
#define global ERROR_EXPIRED_HANDLE  0x1ac6
#define global ERROR_TRANSACTION_NOT_ENLISTED  0x1ac7
#define global ERROR_CTX_WINSTATION_NAME_INVALID  0x1b59
#define global ERROR_CTX_INVALID_PD  0x1b5a
#define global ERROR_CTX_PD_NOT_FOUND  0x1b5b
#define global ERROR_CTX_WD_NOT_FOUND  0x1b5c
#define global ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY  0x1b5d
#define global ERROR_CTX_SERVICE_NAME_COLLISION  0x1b5e
#define global ERROR_CTX_CLOSE_PENDING  0x1b5f
#define global ERROR_CTX_NO_OUTBUF  0x1b60
#define global ERROR_CTX_MODEM_INF_NOT_FOUND  0x1b61
#define global ERROR_CTX_INVALID_MODEMNAME  0x1b62
#define global ERROR_CTX_MODEM_RESPONSE_ERROR  0x1b63
#define global ERROR_CTX_MODEM_RESPONSE_TIMEOUT  0x1b64
#define global ERROR_CTX_MODEM_RESPONSE_NO_CARRIER  0x1b65
#define global ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE  0x1b66
#define global ERROR_CTX_MODEM_RESPONSE_BUSY  0x1b67
#define global ERROR_CTX_MODEM_RESPONSE_VOICE  0x1b68
#define global ERROR_CTX_TD_ERROR  0x1b69
#define global ERROR_CTX_WINSTATION_NOT_FOUND  0x1b6e
#define global ERROR_CTX_WINSTATION_ALREADY_EXISTS  0x1b6f
#define global ERROR_CTX_WINSTATION_BUSY  0x1b70
#define global ERROR_CTX_BAD_VIDEO_MODE  0x1b71
#define global ERROR_CTX_GRAPHICS_INVALID  0x1b7b
#define global ERROR_CTX_LOGON_DISABLED  0x1b7d
#define global ERROR_CTX_NOT_CONSOLE  0x1b7e
#define global ERROR_CTX_CLIENT_QUERY_TIMEOUT  0x1b80
#define global ERROR_CTX_CONSOLE_DISCONNECT  0x1b81
#define global ERROR_CTX_CONSOLE_CONNECT  0x1b82
#define global ERROR_CTX_SHADOW_DENIED  0x1b84
#define global ERROR_CTX_WINSTATION_ACCESS_DENIED  0x1b85
#define global ERROR_CTX_INVALID_WD  0x1b89
#define global ERROR_CTX_SHADOW_INVALID  0x1b8a
#define global ERROR_CTX_SHADOW_DISABLED  0x1b8b
#define global ERROR_CTX_CLIENT_LICENSE_IN_USE  0x1b8c
#define global ERROR_CTX_CLIENT_LICENSE_NOT_SET  0x1b8d
#define global ERROR_CTX_LICENSE_NOT_AVAILABLE  0x1b8e
#define global ERROR_CTX_LICENSE_CLIENT_INVALID  0x1b8f
#define global ERROR_CTX_LICENSE_EXPIRED  0x1b90
#define global ERROR_CTX_SHADOW_NOT_RUNNING  0x1b91
#define global ERROR_CTX_SHADOW_ENDED_BY_MODE_CHANGE  0x1b92
#define global ERROR_ACTIVATION_COUNT_EXCEEDED  0x1b93
#define global ERROR_CTX_WINSTATIONS_DISABLED  0x1b94
#define global ERROR_CTX_ENCRYPTION_LEVEL_REQUIRED  0x1b95
#define global ERROR_CTX_SESSION_IN_USE  0x1b96
#define global ERROR_CTX_NO_FORCE_LOGOFF  0x1b97
#define global ERROR_CTX_ACCOUNT_RESTRICTION  0x1b98
#define global ERROR_RDP_PROTOCOL_ERROR  0x1b99
#define global ERROR_CTX_CDM_CONNECT  0x1b9a
#define global ERROR_CTX_CDM_DISCONNECT  0x1b9b
#define global ERROR_CTX_SECURITY_LAYER_ERROR  0x1b9c
#define global ERROR_TS_INCOMPATIBLE_SESSIONS  0x1b9d
#define global ERROR_TS_VIDEO_SUBSYSTEM_ERROR  0x1b9e
#define global ERROR_DS_NOT_INSTALLED  0x2008
#define global ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY  0x2009
#define global ERROR_DS_NO_ATTRIBUTE_OR_VALUE  0x200a
#define global ERROR_DS_INVALID_ATTRIBUTE_SYNTAX  0x200b
#define global ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED  0x200c
#define global ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS  0x200d
#define global ERROR_DS_BUSY  0x200e
#define global ERROR_DS_UNAVAILABLE  0x200f
#define global ERROR_DS_NO_RIDS_ALLOCATED  0x2010
#define global ERROR_DS_NO_MORE_RIDS  0x2011
#define global ERROR_DS_INCORRECT_ROLE_OWNER  0x2012
#define global ERROR_DS_RIDMGR_INIT_ERROR  0x2013
#define global ERROR_DS_OBJ_CLASS_VIOLATION  0x2014
#define global ERROR_DS_CANT_ON_NON_LEAF  0x2015
#define global ERROR_DS_CANT_ON_RDN  0x2016
#define global ERROR_DS_CANT_MOD_OBJ_CLASS  0x2017
#define global ERROR_DS_CROSS_DOM_MOVE_ERROR  0x2018
#define global ERROR_DS_GC_NOT_AVAILABLE  0x2019
#define global ERROR_SHARED_POLICY  0x201a
#define global ERROR_POLICY_OBJECT_NOT_FOUND  0x201b
#define global ERROR_POLICY_ONLY_IN_DS  0x201c
#define global ERROR_PROMOTION_ACTIVE  0x201d
#define global ERROR_NO_PROMOTION_ACTIVE  0x201e
#define global ERROR_DS_OPERATIONS_ERROR  0x2020
#define global ERROR_DS_PROTOCOL_ERROR  0x2021
#define global ERROR_DS_TIMELIMIT_EXCEEDED  0x2022
#define global ERROR_DS_SIZELIMIT_EXCEEDED  0x2023
#define global ERROR_DS_ADMIN_LIMIT_EXCEEDED  0x2024
#define global ERROR_DS_COMPARE_FALSE  0x2025
#define global ERROR_DS_COMPARE_TRUE  0x2026
#define global ERROR_DS_AUTH_METHOD_NOT_SUPPORTED  0x2027
#define global ERROR_DS_STRONG_AUTH_REQUIRED  0x2028
#define global ERROR_DS_INAPPROPRIATE_AUTH  0x2029
#define global ERROR_DS_AUTH_UNKNOWN  0x202a
#define global ERROR_DS_REFERRAL  0x202b
#define global ERROR_DS_UNAVAILABLE_CRIT_EXTENSION  0x202c
#define global ERROR_DS_CONFIDENTIALITY_REQUIRED  0x202d
#define global ERROR_DS_INAPPROPRIATE_MATCHING  0x202e
#define global ERROR_DS_CONSTRAINT_VIOLATION  0x202f
#define global ERROR_DS_NO_SUCH_OBJECT  0x2030
#define global ERROR_DS_ALIAS_PROBLEM  0x2031
#define global ERROR_DS_INVALID_DN_SYNTAX  0x2032
#define global ERROR_DS_IS_LEAF  0x2033
#define global ERROR_DS_ALIAS_DEREF_PROBLEM  0x2034
#define global ERROR_DS_UNWILLING_TO_PERFORM  0x2035
#define global ERROR_DS_LOOP_DETECT  0x2036
#define global ERROR_DS_NAMING_VIOLATION  0x2037
#define global ERROR_DS_OBJECT_RESULTS_TOO_LARGE  0x2038
#define global ERROR_DS_AFFECTS_MULTIPLE_DSAS  0x2039
#define global ERROR_DS_SERVER_DOWN  0x203a
#define global ERROR_DS_LOCAL_ERROR  0x203b
#define global ERROR_DS_ENCODING_ERROR  0x203c
#define global ERROR_DS_DECODING_ERROR  0x203d
#define global ERROR_DS_FILTER_UNKNOWN  0x203e
#define global ERROR_DS_PARAM_ERROR  0x203f
#define global ERROR_DS_NOT_SUPPORTED  0x2040
#define global ERROR_DS_NO_RESULTS_RETURNED  0x2041
#define global ERROR_DS_CONTROL_NOT_FOUND  0x2042
#define global ERROR_DS_CLIENT_LOOP  0x2043
#define global ERROR_DS_REFERRAL_LIMIT_EXCEEDED  0x2044
#define global ERROR_DS_SORT_CONTROL_MISSING  0x2045
#define global ERROR_DS_OFFSET_RANGE_ERROR  0x2046
#define global ERROR_DS_RIDMGR_DISABLED  0x2047
#define global ERROR_DS_ROOT_MUST_BE_NC  0x206d
#define global ERROR_DS_ADD_REPLICA_INHIBITED  0x206e
#define global ERROR_DS_ATT_NOT_DEF_IN_SCHEMA  0x206f
#define global ERROR_DS_MAX_OBJ_SIZE_EXCEEDED  0x2070
#define global ERROR_DS_OBJ_STRING_NAME_EXISTS  0x2071
#define global ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA  0x2072
#define global ERROR_DS_RDN_DOESNT_MATCH_SCHEMA  0x2073
#define global ERROR_DS_NO_REQUESTED_ATTS_FOUND  0x2074
#define global ERROR_DS_USER_BUFFER_TO_SMALL  0x2075
#define global ERROR_DS_ATT_IS_NOT_ON_OBJ  0x2076
#define global ERROR_DS_ILLEGAL_MOD_OPERATION  0x2077
#define global ERROR_DS_OBJ_TOO_LARGE  0x2078
#define global ERROR_DS_BAD_INSTANCE_TYPE  0x2079
#define global ERROR_DS_MASTERDSA_REQUIRED  0x207a
#define global ERROR_DS_OBJECT_CLASS_REQUIRED  0x207b
#define global ERROR_DS_MISSING_REQUIRED_ATT  0x207c
#define global ERROR_DS_ATT_NOT_DEF_FOR_CLASS  0x207d
#define global ERROR_DS_ATT_ALREADY_EXISTS  0x207e
#define global ERROR_DS_CANT_ADD_ATT_VALUES  0x2080
#define global ERROR_DS_SINGLE_VALUE_CONSTRAINT  0x2081
#define global ERROR_DS_RANGE_CONSTRAINT  0x2082
#define global ERROR_DS_ATT_VAL_ALREADY_EXISTS  0x2083
#define global ERROR_DS_CANT_REM_MISSING_ATT  0x2084
#define global ERROR_DS_CANT_REM_MISSING_ATT_VAL  0x2085
#define global ERROR_DS_ROOT_CANT_BE_SUBREF  0x2086
#define global ERROR_DS_NO_CHAINING  0x2087
#define global ERROR_DS_NO_CHAINED_EVAL  0x2088
#define global ERROR_DS_NO_PARENT_OBJECT  0x2089
#define global ERROR_DS_PARENT_IS_AN_ALIAS  0x208a
#define global ERROR_DS_CANT_MIX_MASTER_AND_REPS  0x208b
#define global ERROR_DS_CHILDREN_EXIST  0x208c
#define global ERROR_DS_OBJ_NOT_FOUND  0x208d
#define global ERROR_DS_ALIASED_OBJ_MISSING  0x208e
#define global ERROR_DS_BAD_NAME_SYNTAX  0x208f
#define global ERROR_DS_ALIAS_POINTS_TO_ALIAS  0x2090
#define global ERROR_DS_CANT_DEREF_ALIAS  0x2091
#define global ERROR_DS_OUT_OF_SCOPE  0x2092
#define global ERROR_DS_OBJECT_BEING_REMOVED  0x2093
#define global ERROR_DS_CANT_DELETE_DSA_OBJ  0x2094
#define global ERROR_DS_GENERIC_ERROR  0x2095
#define global ERROR_DS_DSA_MUST_BE_INT_MASTER  0x2096
#define global ERROR_DS_CLASS_NOT_DSA  0x2097
#define global ERROR_DS_INSUFF_ACCESS_RIGHTS  0x2098
#define global ERROR_DS_ILLEGAL_SUPERIOR  0x2099
#define global ERROR_DS_ATTRIBUTE_OWNED_BY_SAM  0x209a
#define global ERROR_DS_NAME_TOO_MANY_PARTS  0x209b
#define global ERROR_DS_NAME_TOO_LONG  0x209c
#define global ERROR_DS_NAME_VALUE_TOO_LONG  0x209d
#define global ERROR_DS_NAME_UNPARSEABLE  0x209e
#define global ERROR_DS_NAME_TYPE_UNKNOWN  0x209f
#define global ERROR_DS_NOT_AN_OBJECT  0x20a0
#define global ERROR_DS_SEC_DESC_TOO_SHORT  0x20a1
#define global ERROR_DS_SEC_DESC_INVALID  0x20a2
#define global ERROR_DS_NO_DELETED_NAME  0x20a3
#define global ERROR_DS_SUBREF_MUST_HAVE_PARENT  0x20a4
#define global ERROR_DS_NCNAME_MUST_BE_NC  0x20a5
#define global ERROR_DS_CANT_ADD_SYSTEM_ONLY  0x20a6
#define global ERROR_DS_CLASS_MUST_BE_CONCRETE  0x20a7
#define global ERROR_DS_INVALID_DMD  0x20a8
#define global ERROR_DS_OBJ_GUID_EXISTS  0x20a9
#define global ERROR_DS_NOT_ON_BACKLINK  0x20aa
#define global ERROR_DS_NO_CROSSREF_FOR_NC  0x20ab
#define global ERROR_DS_SHUTTING_DOWN  0x20ac
#define global ERROR_DS_UNKNOWN_OPERATION  0x20ad
#define global ERROR_DS_INVALID_ROLE_OWNER  0x20ae
#define global ERROR_DS_COULDNT_CONTACT_FSMO  0x20af
#define global ERROR_DS_CROSS_NC_DN_RENAME  0x20b0
#define global ERROR_DS_CANT_MOD_SYSTEM_ONLY  0x20b1
#define global ERROR_DS_REPLICATOR_ONLY  0x20b2
#define global ERROR_DS_OBJ_CLASS_NOT_DEFINED  0x20b3
#define global ERROR_DS_OBJ_CLASS_NOT_SUBCLASS  0x20b4
#define global ERROR_DS_NAME_REFERENCE_INVALID  0x20b5
#define global ERROR_DS_CROSS_REF_EXISTS  0x20b6
#define global ERROR_DS_CANT_DEL_MASTER_CROSSREF  0x20b7
#define global ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD  0x20b8
#define global ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX  0x20b9
#define global ERROR_DS_DUP_RDN  0x20ba
#define global ERROR_DS_DUP_OID  0x20bb
#define global ERROR_DS_DUP_MAPI_ID  0x20bc
#define global ERROR_DS_DUP_SCHEMA_ID_GUID  0x20bd
#define global ERROR_DS_DUP_LDAP_DISPLAY_NAME  0x20be
#define global ERROR_DS_SEMANTIC_ATT_TEST  0x20bf
#define global ERROR_DS_SYNTAX_MISMATCH  0x20c0
#define global ERROR_DS_EXISTS_IN_MUST_HAVE  0x20c1
#define global ERROR_DS_EXISTS_IN_MAY_HAVE  0x20c2
#define global ERROR_DS_NONEXISTENT_MAY_HAVE  0x20c3
#define global ERROR_DS_NONEXISTENT_MUST_HAVE  0x20c4
#define global ERROR_DS_AUX_CLS_TEST_FAIL  0x20c5
#define global ERROR_DS_NONEXISTENT_POSS_SUP  0x20c6
#define global ERROR_DS_SUB_CLS_TEST_FAIL  0x20c7
#define global ERROR_DS_BAD_RDN_ATT_ID_SYNTAX  0x20c8
#define global ERROR_DS_EXISTS_IN_AUX_CLS  0x20c9
#define global ERROR_DS_EXISTS_IN_SUB_CLS  0x20ca
#define global ERROR_DS_EXISTS_IN_POSS_SUP  0x20cb
#define global ERROR_DS_RECALCSCHEMA_FAILED  0x20cc
#define global ERROR_DS_TREE_DELETE_NOT_FINISHED  0x20cd
#define global ERROR_DS_CANT_DELETE  0x20ce
#define global ERROR_DS_ATT_SCHEMA_REQ_ID  0x20cf
#define global ERROR_DS_BAD_ATT_SCHEMA_SYNTAX  0x20d0
#define global ERROR_DS_CANT_CACHE_ATT  0x20d1
#define global ERROR_DS_CANT_CACHE_CLASS  0x20d2
#define global ERROR_DS_CANT_REMOVE_ATT_CACHE  0x20d3
#define global ERROR_DS_CANT_REMOVE_CLASS_CACHE  0x20d4
#define global ERROR_DS_CANT_RETRIEVE_DN  0x20d5
#define global ERROR_DS_MISSING_SUPREF  0x20d6
#define global ERROR_DS_CANT_RETRIEVE_INSTANCE  0x20d7
#define global ERROR_DS_CODE_INCONSISTENCY  0x20d8
#define global ERROR_DS_DATABASE_ERROR  0x20d9
#define global ERROR_DS_GOVERNSID_MISSING  0x20da
#define global ERROR_DS_MISSING_EXPECTED_ATT  0x20db
#define global ERROR_DS_NCNAME_MISSING_CR_REF  0x20dc
#define global ERROR_DS_SECURITY_CHECKING_ERROR  0x20dd
#define global ERROR_DS_SCHEMA_NOT_LOADED  0x20de
#define global ERROR_DS_SCHEMA_ALLOC_FAILED  0x20df
#define global ERROR_DS_ATT_SCHEMA_REQ_SYNTAX  0x20e0
#define global ERROR_DS_GCVERIFY_ERROR  0x20e1
#define global ERROR_DS_DRA_SCHEMA_MISMATCH  0x20e2
#define global ERROR_DS_CANT_FIND_DSA_OBJ  0x20e3
#define global ERROR_DS_CANT_FIND_EXPECTED_NC  0x20e4
#define global ERROR_DS_CANT_FIND_NC_IN_CACHE  0x20e5
#define global ERROR_DS_CANT_RETRIEVE_CHILD  0x20e6
#define global ERROR_DS_SECURITY_ILLEGAL_MODIFY  0x20e7
#define global ERROR_DS_CANT_REPLACE_HIDDEN_REC  0x20e8
#define global ERROR_DS_BAD_HIERARCHY_FILE  0x20e9
#define global ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED  0x20ea
#define global ERROR_DS_CONFIG_PARAM_MISSING  0x20eb
#define global ERROR_DS_COUNTING_AB_INDICES_FAILED  0x20ec
#define global ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED  0x20ed
#define global ERROR_DS_INTERNAL_FAILURE  0x20ee
#define global ERROR_DS_UNKNOWN_ERROR  0x20ef
#define global ERROR_DS_ROOT_REQUIRES_CLASS_TOP  0x20f0
#define global ERROR_DS_REFUSING_FSMO_ROLES  0x20f1
#define global ERROR_DS_MISSING_FSMO_SETTINGS  0x20f2
#define global ERROR_DS_UNABLE_TO_SURRENDER_ROLES  0x20f3
#define global ERROR_DS_DRA_GENERIC  0x20f4
#define global ERROR_DS_DRA_INVALID_PARAMETER  0x20f5
#define global ERROR_DS_DRA_BUSY  0x20f6
#define global ERROR_DS_DRA_BAD_DN  0x20f7
#define global ERROR_DS_DRA_BAD_NC  0x20f8
#define global ERROR_DS_DRA_DN_EXISTS  0x20f9
#define global ERROR_DS_DRA_INTERNAL_ERROR  0x20fa
#define global ERROR_DS_DRA_INCONSISTENT_DIT  0x20fb
#define global ERROR_DS_DRA_CONNECTION_FAILED  0x20fc
#define global ERROR_DS_DRA_BAD_INSTANCE_TYPE  0x20fd
#define global ERROR_DS_DRA_OUT_OF_MEM  0x20fe
#define global ERROR_DS_DRA_MAIL_PROBLEM  0x20ff
#define global ERROR_DS_DRA_REF_ALREADY_EXISTS  0x2100
#define global ERROR_DS_DRA_REF_NOT_FOUND  0x2101
#define global ERROR_DS_DRA_OBJ_IS_REP_SOURCE  0x2102
#define global ERROR_DS_DRA_DB_ERROR  0x2103
#define global ERROR_DS_DRA_NO_REPLICA  0x2104
#define global ERROR_DS_DRA_ACCESS_DENIED  0x2105
#define global ERROR_DS_DRA_NOT_SUPPORTED  0x2106
#define global ERROR_DS_DRA_RPC_CANCELLED  0x2107
#define global ERROR_DS_DRA_SOURCE_DISABLED  0x2108
#define global ERROR_DS_DRA_SINK_DISABLED  0x2109
#define global ERROR_DS_DRA_NAME_COLLISION  0x210a
#define global ERROR_DS_DRA_SOURCE_REINSTALLED  0x210b
#define global ERROR_DS_DRA_MISSING_PARENT  0x210c
#define global ERROR_DS_DRA_PREEMPTED  0x210d
#define global ERROR_DS_DRA_ABANDON_SYNC  0x210e
#define global ERROR_DS_DRA_SHUTDOWN  0x210f
#define global ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET  0x2110
#define global ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA  0x2111
#define global ERROR_DS_DRA_EXTN_CONNECTION_FAILED  0x2112
#define global ERROR_DS_INSTALL_SCHEMA_MISMATCH  0x2113
#define global ERROR_DS_DUP_LINK_ID  0x2114
#define global ERROR_DS_NAME_ERROR_RESOLVING  0x2115
#define global ERROR_DS_NAME_ERROR_NOT_FOUND  0x2116
#define global ERROR_DS_NAME_ERROR_NOT_UNIQUE  0x2117
#define global ERROR_DS_NAME_ERROR_NO_MAPPING  0x2118
#define global ERROR_DS_NAME_ERROR_DOMAIN_ONLY  0x2119
#define global ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING  0x211a
#define global ERROR_DS_CONSTRUCTED_ATT_MOD  0x211b
#define global ERROR_DS_WRONG_OM_OBJ_CLASS  0x211c
#define global ERROR_DS_DRA_REPL_PENDING  0x211d
#define global ERROR_DS_DS_REQUIRED  0x211e
#define global ERROR_DS_INVALID_LDAP_DISPLAY_NAME  0x211f
#define global ERROR_DS_NON_BASE_SEARCH  0x2120
#define global ERROR_DS_CANT_RETRIEVE_ATTS  0x2121
#define global ERROR_DS_BACKLINK_WITHOUT_LINK  0x2122
#define global ERROR_DS_EPOCH_MISMATCH  0x2123
#define global ERROR_DS_SRC_NAME_MISMATCH  0x2124
#define global ERROR_DS_SRC_AND_DST_NC_IDENTICAL  0x2125
#define global ERROR_DS_DST_NC_MISMATCH  0x2126
#define global ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC  0x2127
#define global ERROR_DS_SRC_GUID_MISMATCH  0x2128
#define global ERROR_DS_CANT_MOVE_DELETED_OBJECT  0x2129
#define global ERROR_DS_PDC_OPERATION_IN_PROGRESS  0x212a
#define global ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD  0x212b
#define global ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION  0x212c
#define global ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS  0x212d
#define global ERROR_DS_NC_MUST_HAVE_NC_PARENT  0x212e
#define global ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE  0x212f
#define global ERROR_DS_DST_DOMAIN_NOT_NATIVE  0x2130
#define global ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER  0x2131
#define global ERROR_DS_CANT_MOVE_ACCOUNT_GROUP  0x2132
#define global ERROR_DS_CANT_MOVE_RESOURCE_GROUP  0x2133
#define global ERROR_DS_INVALID_SEARCH_FLAG  0x2134
#define global ERROR_DS_NO_TREE_DELETE_ABOVE_NC  0x2135
#define global ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE  0x2136
#define global ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE  0x2137
#define global ERROR_DS_SAM_INIT_FAILURE  0x2138
#define global ERROR_DS_SENSITIVE_GROUP_VIOLATION  0x2139
#define global ERROR_DS_CANT_MOD_PRIMARYGROUPID  0x213a
#define global ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD  0x213b
#define global ERROR_DS_NONSAFE_SCHEMA_CHANGE  0x213c
#define global ERROR_DS_SCHEMA_UPDATE_DISALLOWED  0x213d
#define global ERROR_DS_CANT_CREATE_UNDER_SCHEMA  0x213e
#define global ERROR_DS_INSTALL_NO_SRC_SCH_VERSION  0x213f
#define global ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE  0x2140
#define global ERROR_DS_INVALID_GROUP_TYPE  0x2141
#define global ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN  0x2142
#define global ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN  0x2143
#define global ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER  0x2144
#define global ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER  0x2145
#define global ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER  0x2146
#define global ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER  0x2147
#define global ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER  0x2148
#define global ERROR_DS_HAVE_PRIMARY_MEMBERS  0x2149
#define global ERROR_DS_STRING_SD_CONVERSION_FAILED  0x214a
#define global ERROR_DS_NAMING_MASTER_GC  0x214b
#define global ERROR_DS_DNS_LOOKUP_FAILURE  0x214c
#define global ERROR_DS_COULDNT_UPDATE_SPNS  0x214d
#define global ERROR_DS_CANT_RETRIEVE_SD  0x214e
#define global ERROR_DS_KEY_NOT_UNIQUE  0x214f
#define global ERROR_DS_WRONG_LINKED_ATT_SYNTAX  0x2150
#define global ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD  0x2151
#define global ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY  0x2152
#define global ERROR_DS_CANT_START  0x2153
#define global ERROR_DS_INIT_FAILURE  0x2154
#define global ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION  0x2155
#define global ERROR_DS_SOURCE_DOMAIN_IN_FOREST  0x2156
#define global ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST  0x2157
#define global ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED  0x2158
#define global ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN  0x2159
#define global ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER  0x215a
#define global ERROR_DS_SRC_SID_EXISTS_IN_FOREST  0x215b
#define global ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH  0x215c
#define global ERROR_SAM_INIT_FAILURE  0x215d
#define global ERROR_DS_DRA_SCHEMA_INFO_SHIP  0x215e
#define global ERROR_DS_DRA_SCHEMA_CONFLICT  0x215f
#define global ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT  0x2160
#define global ERROR_DS_DRA_OBJ_NC_MISMATCH  0x2161
#define global ERROR_DS_NC_STILL_HAS_DSAS  0x2162
#define global ERROR_DS_GC_REQUIRED  0x2163
#define global ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY  0x2164
#define global ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS  0x2165
#define global ERROR_DS_CANT_ADD_TO_GC  0x2166
#define global ERROR_DS_NO_CHECKPOINT_WITH_PDC  0x2167
#define global ERROR_DS_SOURCE_AUDITING_NOT_ENABLED  0x2168
#define global ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC  0x2169
#define global ERROR_DS_INVALID_NAME_FOR_SPN  0x216a
#define global ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS  0x216b
#define global ERROR_DS_UNICODEPWD_NOT_IN_QUOTES  0x216c
#define global ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED  0x216d
#define global ERROR_DS_MUST_BE_RUN_ON_DST_DC  0x216e
#define global ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER  0x216f
#define global ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ  0x2170
#define global ERROR_DS_INIT_FAILURE_CONSOLE  0x2171
#define global ERROR_DS_SAM_INIT_FAILURE_CONSOLE  0x2172
#define global ERROR_DS_FOREST_VERSION_TOO_HIGH  0x2173
#define global ERROR_DS_DOMAIN_VERSION_TOO_HIGH  0x2174
#define global ERROR_DS_FOREST_VERSION_TOO_LOW  0x2175
#define global ERROR_DS_DOMAIN_VERSION_TOO_LOW  0x2176
#define global ERROR_DS_INCOMPATIBLE_VERSION  0x2177
#define global ERROR_DS_LOW_DSA_VERSION  0x2178
#define global ERROR_DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN  0x2179
#define global ERROR_DS_NOT_SUPPORTED_SORT_ORDER  0x217a
#define global ERROR_DS_NAME_NOT_UNIQUE  0x217b
#define global ERROR_DS_MACHINE_ACCOUNT_CREATED_PRENT4  0x217c
#define global ERROR_DS_OUT_OF_VERSION_STORE  0x217d
#define global ERROR_DS_INCOMPATIBLE_CONTROLS_USED  0x217e
#define global ERROR_DS_NO_REF_DOMAIN  0x217f
#define global ERROR_DS_RESERVED_LINK_ID  0x2180
#define global ERROR_DS_LINK_ID_NOT_AVAILABLE  0x2181
#define global ERROR_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER  0x2182
#define global ERROR_DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE  0x2183
#define global ERROR_DS_NO_OBJECT_MOVE_IN_SCHEMA_NC  0x2184
#define global ERROR_DS_MODIFYDN_DISALLOWED_BY_FLAG  0x2185
#define global ERROR_DS_MODIFYDN_WRONG_GRANDPARENT  0x2186
#define global ERROR_DS_NAME_ERROR_TRUST_REFERRAL  0x2187
#define global ERROR_NOT_SUPPORTED_ON_STANDARD_SERVER  0x2188
#define global ERROR_DS_CANT_ACCESS_REMOTE_PART_OF_AD  0x2189
#define global ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE_V2  0x218a
#define global ERROR_DS_THREAD_LIMIT_EXCEEDED  0x218b
#define global ERROR_DS_NOT_CLOSEST  0x218c
#define global ERROR_DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF  0x218d
#define global ERROR_DS_SINGLE_USER_MODE_FAILED  0x218e
#define global ERROR_DS_NTDSCRIPT_SYNTAX_ERROR  0x218f
#define global ERROR_DS_NTDSCRIPT_PROCESS_ERROR  0x2190
#define global ERROR_DS_DIFFERENT_REPL_EPOCHS  0x2191
#define global ERROR_DS_DRS_EXTENSIONS_CHANGED  0x2192
#define global ERROR_DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR  0x2193
#define global ERROR_DS_NO_MSDS_INTID  0x2194
#define global ERROR_DS_DUP_MSDS_INTID  0x2195
#define global ERROR_DS_EXISTS_IN_RDNATTID  0x2196
#define global ERROR_DS_AUTHORIZATION_FAILED  0x2197
#define global ERROR_DS_INVALID_SCRIPT  0x2198
#define global ERROR_DS_REMOTE_CROSSREF_OP_FAILED  0x2199
#define global ERROR_DS_CROSS_REF_BUSY  0x219a
#define global ERROR_DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN  0x219b
#define global ERROR_DS_CANT_DEMOTE_WITH_WRITEABLE_NC  0x219c
#define global ERROR_DS_DUPLICATE_ID_FOUND  0x219d
#define global ERROR_DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT  0x219e
#define global ERROR_DS_GROUP_CONVERSION_ERROR  0x219f
#define global ERROR_DS_CANT_MOVE_APP_BASIC_GROUP  0x21a0
#define global ERROR_DS_CANT_MOVE_APP_QUERY_GROUP  0x21a1
#define global ERROR_DS_ROLE_NOT_VERIFIED  0x21a2
#define global ERROR_DS_WKO_CONTAINER_CANNOT_BE_SPECIAL  0x21a3
#define global ERROR_DS_DOMAIN_RENAME_IN_PROGRESS  0x21a4
#define global ERROR_DS_EXISTING_AD_CHILD_NC  0x21a5
#define global ERROR_DS_REPL_LIFETIME_EXCEEDED  0x21a6
#define global ERROR_DS_DISALLOWED_IN_SYSTEM_CONTAINER  0x21a7
#define global ERROR_DS_LDAP_SEND_QUEUE_FULL  0x21a8
#define global ERROR_DS_DRA_OUT_SCHEDULE_WINDOW  0x21a9
#define global ERROR_DS_POLICY_NOT_KNOWN  0x21aa
#define global ERROR_NO_SITE_SETTINGS_OBJECT  0x21ab
#define global ERROR_NO_SECRETS  0x21ac
#define global ERROR_NO_WRITABLE_DC_FOUND  0x21ad
#define global ERROR_DS_NO_SERVER_OBJECT  0x21ae
#define global ERROR_DS_NO_NTDSA_OBJECT  0x21af
#define global ERROR_DS_NON_ASQ_SEARCH  0x21b0
#define global ERROR_DS_AUDIT_FAILURE  0x21b1
#define global ERROR_DS_INVALID_SEARCH_FLAG_SUBTREE  0x21b2
#define global ERROR_DS_INVALID_SEARCH_FLAG_TUPLE  0x21b3
#define global ERROR_DS_HIERARCHY_TABLE_TOO_DEEP  0x21b4
#define global ERROR_DS_DRA_CORRUPT_UTD_VECTOR  0x21b5
#define global ERROR_DS_DRA_SECRETS_DENIED  0x21b6
#define global ERROR_DS_RESERVED_MAPI_ID  0x21b7
#define global ERROR_DS_MAPI_ID_NOT_AVAILABLE  0x21b8
#define global ERROR_DS_DRA_MISSING_KRBTGT_SECRET  0x21b9
#define global ERROR_DS_DOMAIN_NAME_EXISTS_IN_FOREST  0x21ba
#define global ERROR_DS_FLAT_NAME_EXISTS_IN_FOREST  0x21bb
#define global ERROR_INVALID_USER_PRINCIPAL_NAME  0x21bc
#define global ERROR_DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS  0x21bd
#define global ERROR_DS_OID_NOT_FOUND  0x21be
#define global ERROR_DS_DRA_RECYCLED_TARGET  0x21bf
#define global ERROR_DS_DISALLOWED_NC_REDIRECT  0x21c0
#define global ERROR_DS_HIGH_ADLDS_FFL  0x21c1
#define global ERROR_DS_HIGH_DSA_VERSION  0x21c2
#define global ERROR_DS_LOW_ADLDS_FFL  0x21c3
#define global ERROR_DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION  0x21c4
#define global ERROR_DS_UNDELETE_SAM_VALIDATION_FAILED  0x21c5
#define global ERROR_INCORRECT_ACCOUNT_TYPE  0x21c6
#define global ERROR_DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST  0x21c7
#define global ERROR_DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST  0x21c8
#define global ERROR_DS_MISSING_FOREST_TRUST  0x21c9
#define global ERROR_DS_VALUE_KEY_NOT_UNIQUE  0x21ca
#define global ERROR_WEAK_WHFBKEY_BLOCKED  0x21cb
#define global ERROR_DS_PER_ATTRIBUTE_AUTHZ_FAILED_DURING_ADD  0x21cc
#define global ERROR_LOCAL_POLICY_MODIFICATION_NOT_SUPPORTED  0x21cd
#define global ERROR_POLICY_CONTROLLED_ACCOUNT  0x21ce
#define global ERROR_LAPS_LEGACY_SCHEMA_MISSING  0x21cf
#define global ERROR_LAPS_SCHEMA_MISSING  0x21d0
#define global ERROR_LAPS_ENCRYPTION_REQUIRES_2016_DFL  0x21d1
#define global DNS_ERROR_RESPONSE_CODES_BASE  0x2328
#define global DNS_ERROR_RCODE_NO_ERROR  0x0
#define global DNS_ERROR_MASK  0x2328
#define global DNS_ERROR_RCODE_FORMAT_ERROR  0x2329
#define global DNS_ERROR_RCODE_SERVER_FAILURE  0x232a
#define global DNS_ERROR_RCODE_NAME_ERROR  0x232b
#define global DNS_ERROR_RCODE_NOT_IMPLEMENTED  0x232c
#define global DNS_ERROR_RCODE_REFUSED  0x232d
#define global DNS_ERROR_RCODE_YXDOMAIN  0x232e
#define global DNS_ERROR_RCODE_YXRRSET  0x232f
#define global DNS_ERROR_RCODE_NXRRSET  0x2330
#define global DNS_ERROR_RCODE_NOTAUTH  0x2331
#define global DNS_ERROR_RCODE_NOTZONE  0x2332
#define global DNS_ERROR_RCODE_BADSIG  0x2338
#define global DNS_ERROR_RCODE_BADKEY  0x2339
#define global DNS_ERROR_RCODE_BADTIME  0x233a
#define global DNS_ERROR_RCODE_LAST  0x233a
#define global DNS_ERROR_DNSSEC_BASE  0x238c
#define global DNS_ERROR_KEYMASTER_REQUIRED  0x238d
#define global DNS_ERROR_NOT_ALLOWED_ON_SIGNED_ZONE  0x238e
#define global DNS_ERROR_NSEC3_INCOMPATIBLE_WITH_RSA_SHA1  0x238f
#define global DNS_ERROR_NOT_ENOUGH_SIGNING_KEY_DESCRIPTORS  0x2390
#define global DNS_ERROR_UNSUPPORTED_ALGORITHM  0x2391
#define global DNS_ERROR_INVALID_KEY_SIZE  0x2392
#define global DNS_ERROR_SIGNING_KEY_NOT_ACCESSIBLE  0x2393
#define global DNS_ERROR_KSP_DOES_NOT_SUPPORT_PROTECTION  0x2394
#define global DNS_ERROR_UNEXPECTED_DATA_PROTECTION_ERROR  0x2395
#define global DNS_ERROR_UNEXPECTED_CNG_ERROR  0x2396
#define global DNS_ERROR_UNKNOWN_SIGNING_PARAMETER_VERSION  0x2397
#define global DNS_ERROR_KSP_NOT_ACCESSIBLE  0x2398
#define global DNS_ERROR_TOO_MANY_SKDS  0x2399
#define global DNS_ERROR_INVALID_ROLLOVER_PERIOD  0x239a
#define global DNS_ERROR_INVALID_INITIAL_ROLLOVER_OFFSET  0x239b
#define global DNS_ERROR_ROLLOVER_IN_PROGRESS  0x239c
#define global DNS_ERROR_STANDBY_KEY_NOT_PRESENT  0x239d
#define global DNS_ERROR_NOT_ALLOWED_ON_ZSK  0x239e
#define global DNS_ERROR_NOT_ALLOWED_ON_ACTIVE_SKD  0x239f
#define global DNS_ERROR_ROLLOVER_ALREADY_QUEUED  0x23a0
#define global DNS_ERROR_NOT_ALLOWED_ON_UNSIGNED_ZONE  0x23a1
#define global DNS_ERROR_BAD_KEYMASTER  0x23a2
#define global DNS_ERROR_INVALID_SIGNATURE_VALIDITY_PERIOD  0x23a3
#define global DNS_ERROR_INVALID_NSEC3_ITERATION_COUNT  0x23a4
#define global DNS_ERROR_DNSSEC_IS_DISABLED  0x23a5
#define global DNS_ERROR_INVALID_XML  0x23a6
#define global DNS_ERROR_NO_VALID_TRUST_ANCHORS  0x23a7
#define global DNS_ERROR_ROLLOVER_NOT_POKEABLE  0x23a8
#define global DNS_ERROR_NSEC3_NAME_COLLISION  0x23a9
#define global DNS_ERROR_NSEC_INCOMPATIBLE_WITH_NSEC3_RSA_SHA1  0x23aa
#define global DNS_ERROR_PACKET_FMT_BASE  0x251c
#define global DNS_ERROR_BAD_PACKET  0x251e
#define global DNS_ERROR_NO_PACKET  0x251f
#define global DNS_ERROR_RCODE  0x2520
#define global DNS_ERROR_UNSECURE_PACKET  0x2521
#define global DNS_ERROR_NO_MEMORY  0xe
#define global DNS_ERROR_INVALID_NAME  0x7b
#define global DNS_ERROR_INVALID_DATA  0xd
#define global DNS_ERROR_GENERAL_API_BASE  0x254e
#define global DNS_ERROR_INVALID_TYPE  0x254f
#define global DNS_ERROR_INVALID_IP_ADDRESS  0x2550
#define global DNS_ERROR_INVALID_PROPERTY  0x2551
#define global DNS_ERROR_TRY_AGAIN_LATER  0x2552
#define global DNS_ERROR_NOT_UNIQUE  0x2553
#define global DNS_ERROR_NON_RFC_NAME  0x2554
#define global DNS_ERROR_INVALID_NAME_CHAR  0x2558
#define global DNS_ERROR_NUMERIC_NAME  0x2559
#define global DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER  0x255a
#define global DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION  0x255b
#define global DNS_ERROR_CANNOT_FIND_ROOT_HINTS  0x255c
#define global DNS_ERROR_INCONSISTENT_ROOT_HINTS  0x255d
#define global DNS_ERROR_DWORD_VALUE_TOO_SMALL  0x255e
#define global DNS_ERROR_DWORD_VALUE_TOO_LARGE  0x255f
#define global DNS_ERROR_BACKGROUND_LOADING  0x2560
#define global DNS_ERROR_NOT_ALLOWED_ON_RODC  0x2561
#define global DNS_ERROR_NOT_ALLOWED_UNDER_DNAME  0x2562
#define global DNS_ERROR_DELEGATION_REQUIRED  0x2563
#define global DNS_ERROR_INVALID_POLICY_TABLE  0x2564
#define global DNS_ERROR_ADDRESS_REQUIRED  0x2565
#define global DNS_ERROR_ZONE_BASE  0x2580
#define global DNS_ERROR_ZONE_DOES_NOT_EXIST  0x2581
#define global DNS_ERROR_NO_ZONE_INFO  0x2582
#define global DNS_ERROR_INVALID_ZONE_OPERATION  0x2583
#define global DNS_ERROR_ZONE_CONFIGURATION_ERROR  0x2584
#define global DNS_ERROR_ZONE_HAS_NO_SOA_RECORD  0x2585
#define global DNS_ERROR_ZONE_HAS_NO_NS_RECORDS  0x2586
#define global DNS_ERROR_ZONE_LOCKED  0x2587
#define global DNS_ERROR_ZONE_CREATION_FAILED  0x2588
#define global DNS_ERROR_ZONE_ALREADY_EXISTS  0x2589
#define global DNS_ERROR_AUTOZONE_ALREADY_EXISTS  0x258a
#define global DNS_ERROR_INVALID_ZONE_TYPE  0x258b
#define global DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP  0x258c
#define global DNS_ERROR_ZONE_NOT_SECONDARY  0x258d
#define global DNS_ERROR_NEED_SECONDARY_ADDRESSES  0x258e
#define global DNS_ERROR_WINS_INIT_FAILED  0x258f
#define global DNS_ERROR_NEED_WINS_SERVERS  0x2590
#define global DNS_ERROR_NBSTAT_INIT_FAILED  0x2591
#define global DNS_ERROR_SOA_DELETE_INVALID  0x2592
#define global DNS_ERROR_FORWARDER_ALREADY_EXISTS  0x2593
#define global DNS_ERROR_ZONE_REQUIRES_MASTER_IP  0x2594
#define global DNS_ERROR_ZONE_IS_SHUTDOWN  0x2595
#define global DNS_ERROR_ZONE_LOCKED_FOR_SIGNING  0x2596
#define global DNS_ERROR_DATAFILE_BASE  0x25b2
#define global DNS_ERROR_PRIMARY_REQUIRES_DATAFILE  0x25b3
#define global DNS_ERROR_INVALID_DATAFILE_NAME  0x25b4
#define global DNS_ERROR_DATAFILE_OPEN_FAILURE  0x25b5
#define global DNS_ERROR_FILE_WRITEBACK_FAILED  0x25b6
#define global DNS_ERROR_DATAFILE_PARSING  0x25b7
#define global DNS_ERROR_DATABASE_BASE  0x25e4
#define global DNS_ERROR_RECORD_DOES_NOT_EXIST  0x25e5
#define global DNS_ERROR_RECORD_FORMAT  0x25e6
#define global DNS_ERROR_NODE_CREATION_FAILED  0x25e7
#define global DNS_ERROR_UNKNOWN_RECORD_TYPE  0x25e8
#define global DNS_ERROR_RECORD_TIMED_OUT  0x25e9
#define global DNS_ERROR_NAME_NOT_IN_ZONE  0x25ea
#define global DNS_ERROR_CNAME_LOOP  0x25eb
#define global DNS_ERROR_NODE_IS_CNAME  0x25ec
#define global DNS_ERROR_CNAME_COLLISION  0x25ed
#define global DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT  0x25ee
#define global DNS_ERROR_RECORD_ALREADY_EXISTS  0x25ef
#define global DNS_ERROR_SECONDARY_DATA  0x25f0
#define global DNS_ERROR_NO_CREATE_CACHE_DATA  0x25f1
#define global DNS_ERROR_NAME_DOES_NOT_EXIST  0x25f2
#define global DNS_ERROR_DS_UNAVAILABLE  0x25f5
#define global DNS_ERROR_DS_ZONE_ALREADY_EXISTS  0x25f6
#define global DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE  0x25f7
#define global DNS_ERROR_NODE_IS_DNAME  0x25f8
#define global DNS_ERROR_DNAME_COLLISION  0x25f9
#define global DNS_ERROR_ALIAS_LOOP  0x25fa
#define global DNS_ERROR_OPERATION_BASE  0x2616
#define global DNS_ERROR_AXFR  0x2618
#define global DNS_ERROR_SECURE_BASE  0x2648
#define global DNS_ERROR_SETUP_BASE  0x267a
#define global DNS_ERROR_NO_TCPIP  0x267b
#define global DNS_ERROR_NO_DNS_SERVERS  0x267c
#define global DNS_ERROR_DP_BASE  0x26ac
#define global DNS_ERROR_DP_DOES_NOT_EXIST  0x26ad
#define global DNS_ERROR_DP_ALREADY_EXISTS  0x26ae
#define global DNS_ERROR_DP_NOT_ENLISTED  0x26af
#define global DNS_ERROR_DP_ALREADY_ENLISTED  0x26b0
#define global DNS_ERROR_DP_NOT_AVAILABLE  0x26b1
#define global DNS_ERROR_DP_FSMO_ERROR  0x26b2
#define global DNS_ERROR_RRL_NOT_ENABLED  0x26b7
#define global DNS_ERROR_RRL_INVALID_WINDOW_SIZE  0x26b8
#define global DNS_ERROR_RRL_INVALID_IPV4_PREFIX  0x26b9
#define global DNS_ERROR_RRL_INVALID_IPV6_PREFIX  0x26ba
#define global DNS_ERROR_RRL_INVALID_TC_RATE  0x26bb
#define global DNS_ERROR_RRL_INVALID_LEAK_RATE  0x26bc
#define global DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE  0x26bd
#define global DNS_ERROR_VIRTUALIZATION_INSTANCE_ALREADY_EXISTS  0x26c1
#define global DNS_ERROR_VIRTUALIZATION_INSTANCE_DOES_NOT_EXIST  0x26c2
#define global DNS_ERROR_VIRTUALIZATION_TREE_LOCKED  0x26c3
#define global DNS_ERROR_INVAILD_VIRTUALIZATION_INSTANCE_NAME  0x26c4
#define global DNS_ERROR_DEFAULT_VIRTUALIZATION_INSTANCE  0x26c5
#define global DNS_ERROR_ZONESCOPE_ALREADY_EXISTS  0x26df
#define global DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST  0x26e0
#define global DNS_ERROR_DEFAULT_ZONESCOPE  0x26e1
#define global DNS_ERROR_INVALID_ZONESCOPE_NAME  0x26e2
#define global DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES  0x26e3
#define global DNS_ERROR_LOAD_ZONESCOPE_FAILED  0x26e4
#define global DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED  0x26e5
#define global DNS_ERROR_INVALID_SCOPE_NAME  0x26e6
#define global DNS_ERROR_SCOPE_DOES_NOT_EXIST  0x26e7
#define global DNS_ERROR_DEFAULT_SCOPE  0x26e8
#define global DNS_ERROR_INVALID_SCOPE_OPERATION  0x26e9
#define global DNS_ERROR_SCOPE_LOCKED  0x26ea
#define global DNS_ERROR_SCOPE_ALREADY_EXISTS  0x26eb
#define global DNS_ERROR_POLICY_ALREADY_EXISTS  0x26f3
#define global DNS_ERROR_POLICY_DOES_NOT_EXIST  0x26f4
#define global DNS_ERROR_POLICY_INVALID_CRITERIA  0x26f5
#define global DNS_ERROR_POLICY_INVALID_SETTINGS  0x26f6
#define global DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED  0x26f7
#define global DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST  0x26f8
#define global DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS  0x26f9
#define global DNS_ERROR_SUBNET_DOES_NOT_EXIST  0x26fa
#define global DNS_ERROR_SUBNET_ALREADY_EXISTS  0x26fb
#define global DNS_ERROR_POLICY_LOCKED  0x26fc
#define global DNS_ERROR_POLICY_INVALID_WEIGHT  0x26fd
#define global DNS_ERROR_POLICY_INVALID_NAME  0x26fe
#define global DNS_ERROR_POLICY_MISSING_CRITERIA  0x26ff
#define global DNS_ERROR_INVALID_CLIENT_SUBNET_NAME  0x2700
#define global DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID  0x2701
#define global DNS_ERROR_POLICY_SCOPE_MISSING  0x2702
#define global DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED  0x2703
#define global DNS_ERROR_SERVERSCOPE_IS_REFERENCED  0x2704
#define global DNS_ERROR_ZONESCOPE_IS_REFERENCED  0x2705
#define global DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET  0x2706
#define global DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL  0x2707
#define global DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL  0x2708
#define global DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE  0x2709
#define global DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN  0x270a
#define global DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE  0x270b
#define global DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY  0x270c
#define global ERROR_IPSEC_QM_POLICY_EXISTS  0x32c8
#define global ERROR_IPSEC_QM_POLICY_NOT_FOUND  0x32c9
#define global ERROR_IPSEC_QM_POLICY_IN_USE  0x32ca
#define global ERROR_IPSEC_MM_POLICY_EXISTS  0x32cb
#define global ERROR_IPSEC_MM_POLICY_NOT_FOUND  0x32cc
#define global ERROR_IPSEC_MM_POLICY_IN_USE  0x32cd
#define global ERROR_IPSEC_MM_FILTER_EXISTS  0x32ce
#define global ERROR_IPSEC_MM_FILTER_NOT_FOUND  0x32cf
#define global ERROR_IPSEC_TRANSPORT_FILTER_EXISTS  0x32d0
#define global ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND  0x32d1
#define global ERROR_IPSEC_MM_AUTH_EXISTS  0x32d2
#define global ERROR_IPSEC_MM_AUTH_NOT_FOUND  0x32d3
#define global ERROR_IPSEC_MM_AUTH_IN_USE  0x32d4
#define global ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND  0x32d5
#define global ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND  0x32d6
#define global ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND  0x32d7
#define global ERROR_IPSEC_TUNNEL_FILTER_EXISTS  0x32d8
#define global ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND  0x32d9
#define global ERROR_IPSEC_MM_FILTER_PENDING_DELETION  0x32da
#define global ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION  0x32db
#define global ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION  0x32dc
#define global ERROR_IPSEC_MM_POLICY_PENDING_DELETION  0x32dd
#define global ERROR_IPSEC_MM_AUTH_PENDING_DELETION  0x32de
#define global ERROR_IPSEC_QM_POLICY_PENDING_DELETION  0x32df
#define global ERROR_IPSEC_IKE_NEG_STATUS_BEGIN  0x35e8
#define global ERROR_IPSEC_IKE_AUTH_FAIL  0x35e9
#define global ERROR_IPSEC_IKE_ATTRIB_FAIL  0x35ea
#define global ERROR_IPSEC_IKE_NEGOTIATION_PENDING  0x35eb
#define global ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR  0x35ec
#define global ERROR_IPSEC_IKE_TIMED_OUT  0x35ed
#define global ERROR_IPSEC_IKE_NO_CERT  0x35ee
#define global ERROR_IPSEC_IKE_SA_DELETED  0x35ef
#define global ERROR_IPSEC_IKE_SA_REAPED  0x35f0
#define global ERROR_IPSEC_IKE_MM_ACQUIRE_DROP  0x35f1
#define global ERROR_IPSEC_IKE_QM_ACQUIRE_DROP  0x35f2
#define global ERROR_IPSEC_IKE_QUEUE_DROP_MM  0x35f3
#define global ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM  0x35f4
#define global ERROR_IPSEC_IKE_DROP_NO_RESPONSE  0x35f5
#define global ERROR_IPSEC_IKE_MM_DELAY_DROP  0x35f6
#define global ERROR_IPSEC_IKE_QM_DELAY_DROP  0x35f7
#define global ERROR_IPSEC_IKE_ERROR  0x35f8
#define global ERROR_IPSEC_IKE_CRL_FAILED  0x35f9
#define global ERROR_IPSEC_IKE_INVALID_KEY_USAGE  0x35fa
#define global ERROR_IPSEC_IKE_INVALID_CERT_TYPE  0x35fb
#define global ERROR_IPSEC_IKE_NO_PRIVATE_KEY  0x35fc
#define global ERROR_IPSEC_IKE_SIMULTANEOUS_REKEY  0x35fd
#define global ERROR_IPSEC_IKE_DH_FAIL  0x35fe
#define global ERROR_IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED  0x35ff
#define global ERROR_IPSEC_IKE_INVALID_HEADER  0x3600
#define global ERROR_IPSEC_IKE_NO_POLICY  0x3601
#define global ERROR_IPSEC_IKE_INVALID_SIGNATURE  0x3602
#define global ERROR_IPSEC_IKE_KERBEROS_ERROR  0x3603
#define global ERROR_IPSEC_IKE_NO_PUBLIC_KEY  0x3604
#define global ERROR_IPSEC_IKE_PROCESS_ERR  0x3605
#define global ERROR_IPSEC_IKE_PROCESS_ERR_SA  0x3606
#define global ERROR_IPSEC_IKE_PROCESS_ERR_PROP  0x3607
#define global ERROR_IPSEC_IKE_PROCESS_ERR_TRANS  0x3608
#define global ERROR_IPSEC_IKE_PROCESS_ERR_KE  0x3609
#define global ERROR_IPSEC_IKE_PROCESS_ERR_ID  0x360a
#define global ERROR_IPSEC_IKE_PROCESS_ERR_CERT  0x360b
#define global ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ  0x360c
#define global ERROR_IPSEC_IKE_PROCESS_ERR_HASH  0x360d
#define global ERROR_IPSEC_IKE_PROCESS_ERR_SIG  0x360e
#define global ERROR_IPSEC_IKE_PROCESS_ERR_NONCE  0x360f
#define global ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY  0x3610
#define global ERROR_IPSEC_IKE_PROCESS_ERR_DELETE  0x3611
#define global ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR  0x3612
#define global ERROR_IPSEC_IKE_INVALID_PAYLOAD  0x3613
#define global ERROR_IPSEC_IKE_LOAD_SOFT_SA  0x3614
#define global ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN  0x3615
#define global ERROR_IPSEC_IKE_INVALID_COOKIE  0x3616
#define global ERROR_IPSEC_IKE_NO_PEER_CERT  0x3617
#define global ERROR_IPSEC_IKE_PEER_CRL_FAILED  0x3618
#define global ERROR_IPSEC_IKE_POLICY_CHANGE  0x3619
#define global ERROR_IPSEC_IKE_NO_MM_POLICY  0x361a
#define global ERROR_IPSEC_IKE_NOTCBPRIV  0x361b
#define global ERROR_IPSEC_IKE_SECLOADFAIL  0x361c
#define global ERROR_IPSEC_IKE_FAILSSPINIT  0x361d
#define global ERROR_IPSEC_IKE_FAILQUERYSSP  0x361e
#define global ERROR_IPSEC_IKE_SRVACQFAIL  0x361f
#define global ERROR_IPSEC_IKE_SRVQUERYCRED  0x3620
#define global ERROR_IPSEC_IKE_GETSPIFAIL  0x3621
#define global ERROR_IPSEC_IKE_INVALID_FILTER  0x3622
#define global ERROR_IPSEC_IKE_OUT_OF_MEMORY  0x3623
#define global ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED  0x3624
#define global ERROR_IPSEC_IKE_INVALID_POLICY  0x3625
#define global ERROR_IPSEC_IKE_UNKNOWN_DOI  0x3626
#define global ERROR_IPSEC_IKE_INVALID_SITUATION  0x3627
#define global ERROR_IPSEC_IKE_DH_FAILURE  0x3628
#define global ERROR_IPSEC_IKE_INVALID_GROUP  0x3629
#define global ERROR_IPSEC_IKE_ENCRYPT  0x362a
#define global ERROR_IPSEC_IKE_DECRYPT  0x362b
#define global ERROR_IPSEC_IKE_POLICY_MATCH  0x362c
#define global ERROR_IPSEC_IKE_UNSUPPORTED_ID  0x362d
#define global ERROR_IPSEC_IKE_INVALID_HASH  0x362e
#define global ERROR_IPSEC_IKE_INVALID_HASH_ALG  0x362f
#define global ERROR_IPSEC_IKE_INVALID_HASH_SIZE  0x3630
#define global ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG  0x3631
#define global ERROR_IPSEC_IKE_INVALID_AUTH_ALG  0x3632
#define global ERROR_IPSEC_IKE_INVALID_SIG  0x3633
#define global ERROR_IPSEC_IKE_LOAD_FAILED  0x3634
#define global ERROR_IPSEC_IKE_RPC_DELETE  0x3635
#define global ERROR_IPSEC_IKE_BENIGN_REINIT  0x3636
#define global ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY  0x3637
#define global ERROR_IPSEC_IKE_INVALID_MAJOR_VERSION  0x3638
#define global ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN  0x3639
#define global ERROR_IPSEC_IKE_MM_LIMIT  0x363a
#define global ERROR_IPSEC_IKE_NEGOTIATION_DISABLED  0x363b
#define global ERROR_IPSEC_IKE_QM_LIMIT  0x363c
#define global ERROR_IPSEC_IKE_MM_EXPIRED  0x363d
#define global ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID  0x363e
#define global ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH  0x363f
#define global ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID  0x3640
#define global ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD  0x3641
#define global ERROR_IPSEC_IKE_DOS_COOKIE_SENT  0x3642
#define global ERROR_IPSEC_IKE_SHUTTING_DOWN  0x3643
#define global ERROR_IPSEC_IKE_CGA_AUTH_FAILED  0x3644
#define global ERROR_IPSEC_IKE_PROCESS_ERR_NATOA  0x3645
#define global ERROR_IPSEC_IKE_INVALID_MM_FOR_QM  0x3646
#define global ERROR_IPSEC_IKE_QM_EXPIRED  0x3647
#define global ERROR_IPSEC_IKE_TOO_MANY_FILTERS  0x3648
#define global ERROR_IPSEC_IKE_NEG_STATUS_END  0x3649
#define global ERROR_IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL  0x364a
#define global ERROR_IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE  0x364b
#define global ERROR_IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING  0x364c
#define global ERROR_IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING  0x364d
#define global ERROR_IPSEC_IKE_COEXISTENCE_SUPPRESS  0x364e
#define global ERROR_IPSEC_IKE_RATELIMIT_DROP  0x364f
#define global ERROR_IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE  0x3650
#define global ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE  0x3651
#define global ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE  0x3652
#define global ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY  0x3653
#define global ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE  0x3654
#define global ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END  0x3655
#define global ERROR_IPSEC_BAD_SPI  0x3656
#define global ERROR_IPSEC_SA_LIFETIME_EXPIRED  0x3657
#define global ERROR_IPSEC_WRONG_SA  0x3658
#define global ERROR_IPSEC_REPLAY_CHECK_FAILED  0x3659
#define global ERROR_IPSEC_INVALID_PACKET  0x365a
#define global ERROR_IPSEC_INTEGRITY_CHECK_FAILED  0x365b
#define global ERROR_IPSEC_CLEAR_TEXT_DROP  0x365c
#define global ERROR_IPSEC_AUTH_FIREWALL_DROP  0x365d
#define global ERROR_IPSEC_THROTTLE_DROP  0x365e
#define global ERROR_IPSEC_DOSP_BLOCK  0x3665
#define global ERROR_IPSEC_DOSP_RECEIVED_MULTICAST  0x3666
#define global ERROR_IPSEC_DOSP_INVALID_PACKET  0x3667
#define global ERROR_IPSEC_DOSP_STATE_LOOKUP_FAILED  0x3668
#define global ERROR_IPSEC_DOSP_MAX_ENTRIES  0x3669
#define global ERROR_IPSEC_DOSP_KEYMOD_NOT_ALLOWED  0x366a
#define global ERROR_IPSEC_DOSP_NOT_INSTALLED  0x366b
#define global ERROR_IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES  0x366c
#define global ERROR_SXS_SECTION_NOT_FOUND  0x36b0
#define global ERROR_SXS_CANT_GEN_ACTCTX  0x36b1
#define global ERROR_SXS_INVALID_ACTCTXDATA_FORMAT  0x36b2
#define global ERROR_SXS_ASSEMBLY_NOT_FOUND  0x36b3
#define global ERROR_SXS_MANIFEST_FORMAT_ERROR  0x36b4
#define global ERROR_SXS_MANIFEST_PARSE_ERROR  0x36b5
#define global ERROR_SXS_ACTIVATION_CONTEXT_DISABLED  0x36b6
#define global ERROR_SXS_KEY_NOT_FOUND  0x36b7
#define global ERROR_SXS_VERSION_CONFLICT  0x36b8
#define global ERROR_SXS_WRONG_SECTION_TYPE  0x36b9
#define global ERROR_SXS_THREAD_QUERIES_DISABLED  0x36ba
#define global ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET  0x36bb
#define global ERROR_SXS_UNKNOWN_ENCODING_GROUP  0x36bc
#define global ERROR_SXS_UNKNOWN_ENCODING  0x36bd
#define global ERROR_SXS_INVALID_XML_NAMESPACE_URI  0x36be
#define global ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED  0x36bf
#define global ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED  0x36c0
#define global ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE  0x36c1
#define global ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE  0x36c2
#define global ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE  0x36c3
#define global ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT  0x36c4
#define global ERROR_SXS_DUPLICATE_DLL_NAME  0x36c5
#define global ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME  0x36c6
#define global ERROR_SXS_DUPLICATE_CLSID  0x36c7
#define global ERROR_SXS_DUPLICATE_IID  0x36c8
#define global ERROR_SXS_DUPLICATE_TLBID  0x36c9
#define global ERROR_SXS_DUPLICATE_PROGID  0x36ca
#define global ERROR_SXS_DUPLICATE_ASSEMBLY_NAME  0x36cb
#define global ERROR_SXS_FILE_HASH_MISMATCH  0x36cc
#define global ERROR_SXS_POLICY_PARSE_ERROR  0x36cd
#define global ERROR_SXS_XML_E_MISSINGQUOTE  0x36ce
#define global ERROR_SXS_XML_E_COMMENTSYNTAX  0x36cf
#define global ERROR_SXS_XML_E_BADSTARTNAMECHAR  0x36d0
#define global ERROR_SXS_XML_E_BADNAMECHAR  0x36d1
#define global ERROR_SXS_XML_E_BADCHARINSTRING  0x36d2
#define global ERROR_SXS_XML_E_XMLDECLSYNTAX  0x36d3
#define global ERROR_SXS_XML_E_BADCHARDATA  0x36d4
#define global ERROR_SXS_XML_E_MISSINGWHITESPACE  0x36d5
#define global ERROR_SXS_XML_E_EXPECTINGTAGEND  0x36d6
#define global ERROR_SXS_XML_E_MISSINGSEMICOLON  0x36d7
#define global ERROR_SXS_XML_E_UNBALANCEDPAREN  0x36d8
#define global ERROR_SXS_XML_E_INTERNALERROR  0x36d9
#define global ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE  0x36da
#define global ERROR_SXS_XML_E_INCOMPLETE_ENCODING  0x36db
#define global ERROR_SXS_XML_E_MISSING_PAREN  0x36dc
#define global ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE  0x36dd
#define global ERROR_SXS_XML_E_MULTIPLE_COLONS  0x36de
#define global ERROR_SXS_XML_E_INVALID_DECIMAL  0x36df
#define global ERROR_SXS_XML_E_INVALID_HEXIDECIMAL  0x36e0
#define global ERROR_SXS_XML_E_INVALID_UNICODE  0x36e1
#define global ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK  0x36e2
#define global ERROR_SXS_XML_E_UNEXPECTEDENDTAG  0x36e3
#define global ERROR_SXS_XML_E_UNCLOSEDTAG  0x36e4
#define global ERROR_SXS_XML_E_DUPLICATEATTRIBUTE  0x36e5
#define global ERROR_SXS_XML_E_MULTIPLEROOTS  0x36e6
#define global ERROR_SXS_XML_E_INVALIDATROOTLEVEL  0x36e7
#define global ERROR_SXS_XML_E_BADXMLDECL  0x36e8
#define global ERROR_SXS_XML_E_MISSINGROOT  0x36e9
#define global ERROR_SXS_XML_E_UNEXPECTEDEOF  0x36ea
#define global ERROR_SXS_XML_E_BADPEREFINSUBSET  0x36eb
#define global ERROR_SXS_XML_E_UNCLOSEDSTARTTAG  0x36ec
#define global ERROR_SXS_XML_E_UNCLOSEDENDTAG  0x36ed
#define global ERROR_SXS_XML_E_UNCLOSEDSTRING  0x36ee
#define global ERROR_SXS_XML_E_UNCLOSEDCOMMENT  0x36ef
#define global ERROR_SXS_XML_E_UNCLOSEDDECL  0x36f0
#define global ERROR_SXS_XML_E_UNCLOSEDCDATA  0x36f1
#define global ERROR_SXS_XML_E_RESERVEDNAMESPACE  0x36f2
#define global ERROR_SXS_XML_E_INVALIDENCODING  0x36f3
#define global ERROR_SXS_XML_E_INVALIDSWITCH  0x36f4
#define global ERROR_SXS_XML_E_BADXMLCASE  0x36f5
#define global ERROR_SXS_XML_E_INVALID_STANDALONE  0x36f6
#define global ERROR_SXS_XML_E_UNEXPECTED_STANDALONE  0x36f7
#define global ERROR_SXS_XML_E_INVALID_VERSION  0x36f8
#define global ERROR_SXS_XML_E_MISSINGEQUALS  0x36f9
#define global ERROR_SXS_PROTECTION_RECOVERY_FAILED  0x36fa
#define global ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT  0x36fb
#define global ERROR_SXS_PROTECTION_CATALOG_NOT_VALID  0x36fc
#define global ERROR_SXS_UNTRANSLATABLE_HRESULT  0x36fd
#define global ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING  0x36fe
#define global ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE  0x36ff
#define global ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME  0x3700
#define global ERROR_SXS_ASSEMBLY_MISSING  0x3701
#define global ERROR_SXS_CORRUPT_ACTIVATION_STACK  0x3702
#define global ERROR_SXS_CORRUPTION  0x3703
#define global ERROR_SXS_EARLY_DEACTIVATION  0x3704
#define global ERROR_SXS_INVALID_DEACTIVATION  0x3705
#define global ERROR_SXS_MULTIPLE_DEACTIVATION  0x3706
#define global ERROR_SXS_PROCESS_TERMINATION_REQUESTED  0x3707
#define global ERROR_SXS_RELEASE_ACTIVATION_CONTEXT  0x3708
#define global ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY  0x3709
#define global ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE  0x370a
#define global ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME  0x370b
#define global ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE  0x370c
#define global ERROR_SXS_IDENTITY_PARSE_ERROR  0x370d
#define global ERROR_MALFORMED_SUBSTITUTION_STRING  0x370e
#define global ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN  0x370f
#define global ERROR_UNMAPPED_SUBSTITUTION_STRING  0x3710
#define global ERROR_SXS_ASSEMBLY_NOT_LOCKED  0x3711
#define global ERROR_SXS_COMPONENT_STORE_CORRUPT  0x3712
#define global ERROR_ADVANCED_INSTALLER_FAILED  0x3713
#define global ERROR_XML_ENCODING_MISMATCH  0x3714
#define global ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT  0x3715
#define global ERROR_SXS_IDENTITIES_DIFFERENT  0x3716
#define global ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT  0x3717
#define global ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY  0x3718
#define global ERROR_SXS_MANIFEST_TOO_BIG  0x3719
#define global ERROR_SXS_SETTING_NOT_REGISTERED  0x371a
#define global ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE  0x371b
#define global ERROR_SMI_PRIMITIVE_INSTALLER_FAILED  0x371c
#define global ERROR_GENERIC_COMMAND_FAILED  0x371d
#define global ERROR_SXS_FILE_HASH_MISSING  0x371e
#define global ERROR_SXS_DUPLICATE_ACTIVATABLE_CLASS  0x371f
#define global ERROR_EVT_INVALID_CHANNEL_PATH  0x3a98
#define global ERROR_EVT_INVALID_QUERY  0x3a99
#define global ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND  0x3a9a
#define global ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND  0x3a9b
#define global ERROR_EVT_INVALID_PUBLISHER_NAME  0x3a9c
#define global ERROR_EVT_INVALID_EVENT_DATA  0x3a9d
#define global ERROR_EVT_CHANNEL_NOT_FOUND  0x3a9f
#define global ERROR_EVT_MALFORMED_XML_TEXT  0x3aa0
#define global ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL  0x3aa1
#define global ERROR_EVT_CONFIGURATION_ERROR  0x3aa2
#define global ERROR_EVT_QUERY_RESULT_STALE  0x3aa3
#define global ERROR_EVT_QUERY_RESULT_INVALID_POSITION  0x3aa4
#define global ERROR_EVT_NON_VALIDATING_MSXML  0x3aa5
#define global ERROR_EVT_FILTER_ALREADYSCOPED  0x3aa6
#define global ERROR_EVT_FILTER_NOTELTSET  0x3aa7
#define global ERROR_EVT_FILTER_INVARG  0x3aa8
#define global ERROR_EVT_FILTER_INVTEST  0x3aa9
#define global ERROR_EVT_FILTER_INVTYPE  0x3aaa
#define global ERROR_EVT_FILTER_PARSEERR  0x3aab
#define global ERROR_EVT_FILTER_UNSUPPORTEDOP  0x3aac
#define global ERROR_EVT_FILTER_UNEXPECTEDTOKEN  0x3aad
#define global ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL  0x3aae
#define global ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE  0x3aaf
#define global ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE  0x3ab0
#define global ERROR_EVT_CHANNEL_CANNOT_ACTIVATE  0x3ab1
#define global ERROR_EVT_FILTER_TOO_COMPLEX  0x3ab2
#define global ERROR_EVT_MESSAGE_NOT_FOUND  0x3ab3
#define global ERROR_EVT_MESSAGE_ID_NOT_FOUND  0x3ab4
#define global ERROR_EVT_UNRESOLVED_VALUE_INSERT  0x3ab5
#define global ERROR_EVT_UNRESOLVED_PARAMETER_INSERT  0x3ab6
#define global ERROR_EVT_MAX_INSERTS_REACHED  0x3ab7
#define global ERROR_EVT_EVENT_DEFINITION_NOT_FOUND  0x3ab8
#define global ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND  0x3ab9
#define global ERROR_EVT_VERSION_TOO_OLD  0x3aba
#define global ERROR_EVT_VERSION_TOO_NEW  0x3abb
#define global ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY  0x3abc
#define global ERROR_EVT_PUBLISHER_DISABLED  0x3abd
#define global ERROR_EVT_FILTER_OUT_OF_RANGE  0x3abe
#define global ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE  0x3ae8
#define global ERROR_EC_LOG_DISABLED  0x3ae9
#define global ERROR_EC_CIRCULAR_FORWARDING  0x3aea
#define global ERROR_EC_CREDSTORE_FULL  0x3aeb
#define global ERROR_EC_CRED_NOT_FOUND  0x3aec
#define global ERROR_EC_NO_ACTIVE_CHANNEL  0x3aed
#define global ERROR_MUI_FILE_NOT_FOUND  0x3afc
#define global ERROR_MUI_INVALID_FILE  0x3afd
#define global ERROR_MUI_INVALID_RC_CONFIG  0x3afe
#define global ERROR_MUI_INVALID_LOCALE_NAME  0x3aff
#define global ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME  0x3b00
#define global ERROR_MUI_FILE_NOT_LOADED  0x3b01
#define global ERROR_RESOURCE_ENUM_USER_STOP  0x3b02
#define global ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED  0x3b03
#define global ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME  0x3b04
#define global ERROR_MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE  0x3b06
#define global ERROR_MRM_INVALID_PRICONFIG  0x3b07
#define global ERROR_MRM_INVALID_FILE_TYPE  0x3b08
#define global ERROR_MRM_UNKNOWN_QUALIFIER  0x3b09
#define global ERROR_MRM_INVALID_QUALIFIER_VALUE  0x3b0a
#define global ERROR_MRM_NO_CANDIDATE  0x3b0b
#define global ERROR_MRM_NO_MATCH_OR_DEFAULT_CANDIDATE  0x3b0c
#define global ERROR_MRM_RESOURCE_TYPE_MISMATCH  0x3b0d
#define global ERROR_MRM_DUPLICATE_MAP_NAME  0x3b0e
#define global ERROR_MRM_DUPLICATE_ENTRY  0x3b0f
#define global ERROR_MRM_INVALID_RESOURCE_IDENTIFIER  0x3b10
#define global ERROR_MRM_FILEPATH_TOO_LONG  0x3b11
#define global ERROR_MRM_UNSUPPORTED_DIRECTORY_TYPE  0x3b12
#define global ERROR_MRM_INVALID_PRI_FILE  0x3b16
#define global ERROR_MRM_NAMED_RESOURCE_NOT_FOUND  0x3b17
#define global ERROR_MRM_MAP_NOT_FOUND  0x3b1f
#define global ERROR_MRM_UNSUPPORTED_PROFILE_TYPE  0x3b20
#define global ERROR_MRM_INVALID_QUALIFIER_OPERATOR  0x3b21
#define global ERROR_MRM_INDETERMINATE_QUALIFIER_VALUE  0x3b22
#define global ERROR_MRM_AUTOMERGE_ENABLED  0x3b23
#define global ERROR_MRM_TOO_MANY_RESOURCES  0x3b24
#define global ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE  0x3b25
#define global ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE  0x3b26
#define global ERROR_MRM_NO_CURRENT_VIEW_ON_THREAD  0x3b27
#define global ERROR_DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST  0x3b28
#define global ERROR_OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT  0x3b29
#define global ERROR_MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE  0x3b2a
#define global ERROR_MRM_GENERATION_COUNT_MISMATCH  0x3b2b
#define global ERROR_PRI_MERGE_VERSION_MISMATCH  0x3b2c
#define global ERROR_PRI_MERGE_MISSING_SCHEMA  0x3b2d
#define global ERROR_PRI_MERGE_LOAD_FILE_FAILED  0x3b2e
#define global ERROR_PRI_MERGE_ADD_FILE_FAILED  0x3b2f
#define global ERROR_PRI_MERGE_WRITE_FILE_FAILED  0x3b30
#define global ERROR_PRI_MERGE_MULTIPLE_PACKAGE_FAMILIES_NOT_ALLOWED  0x3b31
#define global ERROR_PRI_MERGE_MULTIPLE_MAIN_PACKAGES_NOT_ALLOWED  0x3b32
#define global ERROR_PRI_MERGE_BUNDLE_PACKAGES_NOT_ALLOWED  0x3b33
#define global ERROR_PRI_MERGE_MAIN_PACKAGE_REQUIRED  0x3b34
#define global ERROR_PRI_MERGE_RESOURCE_PACKAGE_REQUIRED  0x3b35
#define global ERROR_PRI_MERGE_INVALID_FILE_NAME  0x3b36
#define global ERROR_MRM_PACKAGE_NOT_FOUND  0x3b37
#define global ERROR_MRM_MISSING_DEFAULT_LANGUAGE  0x3b38
#define global ERROR_MRM_SCOPE_ITEM_CONFLICT  0x3b39
#define global ERROR_MCA_INVALID_CAPABILITIES_STRING  0x3b60
#define global ERROR_MCA_INVALID_VCP_VERSION  0x3b61
#define global ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION  0x3b62
#define global ERROR_MCA_MCCS_VERSION_MISMATCH  0x3b63
#define global ERROR_MCA_UNSUPPORTED_MCCS_VERSION  0x3b64
#define global ERROR_MCA_INTERNAL_ERROR  0x3b65
#define global ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED  0x3b66
#define global ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE  0x3b67
#define global ERROR_AMBIGUOUS_SYSTEM_DEVICE  0x3b92
#define global ERROR_SYSTEM_DEVICE_NOT_FOUND  0x3bc3
#define global ERROR_HASH_NOT_SUPPORTED  0x3bc4
#define global ERROR_HASH_NOT_PRESENT  0x3bc5
#define global ERROR_SECONDARY_IC_PROVIDER_NOT_REGISTERED  0x3bd9
#define global ERROR_GPIO_CLIENT_INFORMATION_INVALID  0x3bda
#define global ERROR_GPIO_VERSION_NOT_SUPPORTED  0x3bdb
#define global ERROR_GPIO_INVALID_REGISTRATION_PACKET  0x3bdc
#define global ERROR_GPIO_OPERATION_DENIED  0x3bdd
#define global ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE  0x3bde
#define global ERROR_GPIO_INTERRUPT_ALREADY_UNMASKED  0x3bdf
#define global ERROR_CANNOT_SWITCH_RUNLEVEL  0x3c28
#define global ERROR_INVALID_RUNLEVEL_SETTING  0x3c29
#define global ERROR_RUNLEVEL_SWITCH_TIMEOUT  0x3c2a
#define global ERROR_RUNLEVEL_SWITCH_AGENT_TIMEOUT  0x3c2b
#define global ERROR_RUNLEVEL_SWITCH_IN_PROGRESS  0x3c2c
#define global ERROR_SERVICES_FAILED_AUTOSTART  0x3c2d
#define global ERROR_COM_TASK_STOP_PENDING  0x3c8d
#define global ERROR_INSTALL_OPEN_PACKAGE_FAILED  0x3cf0
#define global ERROR_INSTALL_PACKAGE_NOT_FOUND  0x3cf1
#define global ERROR_INSTALL_INVALID_PACKAGE  0x3cf2
#define global ERROR_INSTALL_RESOLVE_DEPENDENCY_FAILED  0x3cf3
#define global ERROR_INSTALL_OUT_OF_DISK_SPACE  0x3cf4
#define global ERROR_INSTALL_NETWORK_FAILURE  0x3cf5
#define global ERROR_INSTALL_REGISTRATION_FAILURE  0x3cf6
#define global ERROR_INSTALL_DEREGISTRATION_FAILURE  0x3cf7
#define global ERROR_INSTALL_CANCEL  0x3cf8
#define global ERROR_INSTALL_FAILED  0x3cf9
#define global ERROR_REMOVE_FAILED  0x3cfa
#define global ERROR_PACKAGE_ALREADY_EXISTS  0x3cfb
#define global ERROR_NEEDS_REMEDIATION  0x3cfc
#define global ERROR_INSTALL_PREREQUISITE_FAILED  0x3cfd
#define global ERROR_PACKAGE_REPOSITORY_CORRUPTED  0x3cfe
#define global ERROR_INSTALL_POLICY_FAILURE  0x3cff
#define global ERROR_PACKAGE_UPDATING  0x3d00
#define global ERROR_DEPLOYMENT_BLOCKED_BY_POLICY  0x3d01
#define global ERROR_PACKAGES_IN_USE  0x3d02
#define global ERROR_RECOVERY_FILE_CORRUPT  0x3d03
#define global ERROR_INVALID_STAGED_SIGNATURE  0x3d04
#define global ERROR_DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED  0x3d05
#define global ERROR_INSTALL_PACKAGE_DOWNGRADE  0x3d06
#define global ERROR_SYSTEM_NEEDS_REMEDIATION  0x3d07
#define global ERROR_APPX_INTEGRITY_FAILURE_CLR_NGEN  0x3d08
#define global ERROR_RESILIENCY_FILE_CORRUPT  0x3d09
#define global ERROR_INSTALL_FIREWALL_SERVICE_NOT_RUNNING  0x3d0a
#define global ERROR_PACKAGE_MOVE_FAILED  0x3d0b
#define global ERROR_INSTALL_VOLUME_NOT_EMPTY  0x3d0c
#define global ERROR_INSTALL_VOLUME_OFFLINE  0x3d0d
#define global ERROR_INSTALL_VOLUME_CORRUPT  0x3d0e
#define global ERROR_NEEDS_REGISTRATION  0x3d0f
#define global ERROR_INSTALL_WRONG_PROCESSOR_ARCHITECTURE  0x3d10
#define global ERROR_DEV_SIDELOAD_LIMIT_EXCEEDED  0x3d11
#define global ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE  0x3d12
#define global ERROR_PACKAGE_NOT_SUPPORTED_ON_FILESYSTEM  0x3d13
#define global ERROR_PACKAGE_MOVE_BLOCKED_BY_STREAMING  0x3d14
#define global ERROR_INSTALL_OPTIONAL_PACKAGE_APPLICATIONID_NOT_UNIQUE  0x3d15
#define global ERROR_PACKAGE_STAGING_ONHOLD  0x3d16
#define global ERROR_INSTALL_INVALID_RELATED_SET_UPDATE  0x3d17
#define global ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY  0x3d18
#define global ERROR_DEPLOYMENT_BLOCKED_BY_USER_LOG_OFF  0x3d19
#define global ERROR_PROVISION_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_PROVISIONED  0x3d1a
#define global ERROR_PACKAGES_REPUTATION_CHECK_FAILED  0x3d1b
#define global ERROR_PACKAGES_REPUTATION_CHECK_TIMEDOUT  0x3d1c
#define global ERROR_DEPLOYMENT_OPTION_NOT_SUPPORTED  0x3d1d
#define global ERROR_APPINSTALLER_ACTIVATION_BLOCKED  0x3d1e
#define global ERROR_REGISTRATION_FROM_REMOTE_DRIVE_NOT_SUPPORTED  0x3d1f
#define global ERROR_APPX_RAW_DATA_WRITE_FAILED  0x3d20
#define global ERROR_DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_PACKAGE  0x3d21
#define global ERROR_DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_MACHINE  0x3d22
#define global ERROR_DEPLOYMENT_BLOCKED_BY_PROFILE_POLICY  0x3d23
#define global ERROR_DEPLOYMENT_FAILED_CONFLICTING_MUTABLE_PACKAGE_DIRECTORY  0x3d24
#define global ERROR_SINGLETON_RESOURCE_INSTALLED_IN_ACTIVE_USER  0x3d25
#define global ERROR_DIFFERENT_VERSION_OF_PACKAGED_SERVICE_INSTALLED  0x3d26
#define global ERROR_SERVICE_EXISTS_AS_NON_PACKAGED_SERVICE  0x3d27
#define global ERROR_PACKAGED_SERVICE_REQUIRES_ADMIN_PRIVILEGES  0x3d28
#define global ERROR_REDIRECTION_TO_DEFAULT_ACCOUNT_NOT_ALLOWED  0x3d29
#define global ERROR_PACKAGE_LACKS_CAPABILITY_TO_DEPLOY_ON_HOST  0x3d2a
#define global ERROR_UNSIGNED_PACKAGE_INVALID_CONTENT  0x3d2b
#define global ERROR_UNSIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE  0x3d2c
#define global ERROR_SIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE  0x3d2d
#define global ERROR_PACKAGE_EXTERNAL_LOCATION_NOT_ALLOWED  0x3d2e
#define global ERROR_INSTALL_FULLTRUST_HOSTRUNTIME_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY  0x3d2f
#define global ERROR_PACKAGE_LACKS_CAPABILITY_FOR_MANDATORY_STARTUPTASKS  0x3d30
#define global ERROR_INSTALL_RESOLVE_HOSTRUNTIME_DEPENDENCY_FAILED  0x3d31
#define global ERROR_MACHINE_SCOPE_NOT_ALLOWED  0x3d32
#define global ERROR_CLASSIC_COMPAT_MODE_NOT_ALLOWED  0x3d33
#define global ERROR_STAGEFROMUPDATEAGENT_PACKAGE_NOT_APPLICABLE  0x3d34
#define global ERROR_PACKAGE_NOT_REGISTERED_FOR_USER  0x3d35
#define global ERROR_PACKAGE_NAME_MISMATCH  0x3d36
#define global ERROR_APPINSTALLER_URI_IN_USE  0x3d37
#define global ERROR_APPINSTALLER_IS_MANAGED_BY_SYSTEM  0x3d38
#define global APPMODEL_ERROR_NO_PACKAGE  0x3d54
#define global APPMODEL_ERROR_PACKAGE_RUNTIME_CORRUPT  0x3d55
#define global APPMODEL_ERROR_PACKAGE_IDENTITY_CORRUPT  0x3d56
#define global APPMODEL_ERROR_NO_APPLICATION  0x3d57
#define global APPMODEL_ERROR_DYNAMIC_PROPERTY_READ_FAILED  0x3d58
#define global APPMODEL_ERROR_DYNAMIC_PROPERTY_INVALID  0x3d59
#define global APPMODEL_ERROR_PACKAGE_NOT_AVAILABLE  0x3d5a
#define global APPMODEL_ERROR_NO_MUTABLE_DIRECTORY  0x3d5b
#define global ERROR_STATE_LOAD_STORE_FAILED  0x3db8
#define global ERROR_STATE_GET_VERSION_FAILED  0x3db9
#define global ERROR_STATE_SET_VERSION_FAILED  0x3dba
#define global ERROR_STATE_STRUCTURED_RESET_FAILED  0x3dbb
#define global ERROR_STATE_OPEN_CONTAINER_FAILED  0x3dbc
#define global ERROR_STATE_CREATE_CONTAINER_FAILED  0x3dbd
#define global ERROR_STATE_DELETE_CONTAINER_FAILED  0x3dbe
#define global ERROR_STATE_READ_SETTING_FAILED  0x3dbf
#define global ERROR_STATE_WRITE_SETTING_FAILED  0x3dc0
#define global ERROR_STATE_DELETE_SETTING_FAILED  0x3dc1
#define global ERROR_STATE_QUERY_SETTING_FAILED  0x3dc2
#define global ERROR_STATE_READ_COMPOSITE_SETTING_FAILED  0x3dc3
#define global ERROR_STATE_WRITE_COMPOSITE_SETTING_FAILED  0x3dc4
#define global ERROR_STATE_ENUMERATE_CONTAINER_FAILED  0x3dc5
#define global ERROR_STATE_ENUMERATE_SETTINGS_FAILED  0x3dc6
#define global ERROR_STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED  0x3dc7
#define global ERROR_STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED  0x3dc8
#define global ERROR_STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED  0x3dc9
#define global ERROR_STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED  0x3dca
#define global ERROR_API_UNAVAILABLE  0x3de1
#define global ERROR_NDIS_INTERFACE_CLOSING  0x80340002
#define global ERROR_NDIS_BAD_VERSION  0x80340004
#define global ERROR_NDIS_BAD_CHARACTERISTICS  0x80340005
#define global ERROR_NDIS_ADAPTER_NOT_FOUND  0x80340006
#define global ERROR_NDIS_OPEN_FAILED  0x80340007
#define global ERROR_NDIS_DEVICE_FAILED  0x80340008
#define global ERROR_NDIS_MULTICAST_FULL  0x80340009
#define global ERROR_NDIS_MULTICAST_EXISTS  0x8034000a
#define global ERROR_NDIS_MULTICAST_NOT_FOUND  0x8034000b
#define global ERROR_NDIS_REQUEST_ABORTED  0x8034000c
#define global ERROR_NDIS_RESET_IN_PROGRESS  0x8034000d
#define global ERROR_NDIS_NOT_SUPPORTED  0x803400bb
#define global ERROR_NDIS_INVALID_PACKET  0x8034000f
#define global ERROR_NDIS_ADAPTER_NOT_READY  0x80340011
#define global ERROR_NDIS_INVALID_LENGTH  0x80340014
#define global ERROR_NDIS_INVALID_DATA  0x80340015
#define global ERROR_NDIS_BUFFER_TOO_SHORT  0x80340016
#define global ERROR_NDIS_INVALID_OID  0x80340017
#define global ERROR_NDIS_ADAPTER_REMOVED  0x80340018
#define global ERROR_NDIS_UNSUPPORTED_MEDIA  0x80340019
#define global ERROR_NDIS_GROUP_ADDRESS_IN_USE  0x8034001a
#define global ERROR_NDIS_FILE_NOT_FOUND  0x8034001b
#define global ERROR_NDIS_ERROR_READING_FILE  0x8034001c
#define global ERROR_NDIS_ALREADY_MAPPED  0x8034001d
#define global ERROR_NDIS_RESOURCE_CONFLICT  0x8034001e
#define global ERROR_NDIS_MEDIA_DISCONNECTED  0x8034001f
#define global ERROR_NDIS_INVALID_ADDRESS  0x80340022
#define global ERROR_NDIS_INVALID_DEVICE_REQUEST  0x80340010
#define global ERROR_NDIS_PAUSED  0x8034002a
#define global ERROR_NDIS_INTERFACE_NOT_FOUND  0x8034002b
#define global ERROR_NDIS_UNSUPPORTED_REVISION  0x8034002c
#define global ERROR_NDIS_INVALID_PORT  0x8034002d
#define global ERROR_NDIS_INVALID_PORT_STATE  0x8034002e
#define global ERROR_NDIS_LOW_POWER_STATE  0x8034002f
#define global ERROR_NDIS_REINIT_REQUIRED  0x80340030
#define global ERROR_NDIS_NO_QUEUES  0x80340031
#define global ERROR_NDIS_DOT11_AUTO_CONFIG_ENABLED  0x80342000
#define global ERROR_NDIS_DOT11_MEDIA_IN_USE  0x80342001
#define global ERROR_NDIS_DOT11_POWER_STATE_INVALID  0x80342002
#define global ERROR_NDIS_PM_WOL_PATTERN_LIST_FULL  0x80342003
#define global ERROR_NDIS_PM_PROTOCOL_OFFLOAD_LIST_FULL  0x80342004
#define global ERROR_NDIS_DOT11_AP_CHANNEL_CURRENTLY_NOT_AVAILABLE  0x80342005
#define global ERROR_NDIS_DOT11_AP_BAND_CURRENTLY_NOT_AVAILABLE  0x80342006
#define global ERROR_NDIS_DOT11_AP_CHANNEL_NOT_ALLOWED  0x80342007
#define global ERROR_NDIS_DOT11_AP_BAND_NOT_ALLOWED  0x80342008
#define global ERROR_NDIS_INDICATION_REQUIRED  0x340001
#define global ERROR_NDIS_OFFLOAD_POLICY  0xc034100f
#define global ERROR_NDIS_OFFLOAD_CONNECTION_REJECTED  0xc0341012
#define global ERROR_NDIS_OFFLOAD_PATH_REJECTED  0xc0341013
#define global ERROR_HV_INVALID_HYPERCALL_CODE  0xc0350002
#define global ERROR_HV_INVALID_HYPERCALL_INPUT  0xc0350003
#define global ERROR_HV_INVALID_ALIGNMENT  0xc0350004
#define global ERROR_HV_INVALID_PARAMETER  0xc0350005
#define global ERROR_HV_ACCESS_DENIED  0xc0350006
#define global ERROR_HV_INVALID_PARTITION_STATE  0xc0350007
#define global ERROR_HV_OPERATION_DENIED  0xc0350008
#define global ERROR_HV_UNKNOWN_PROPERTY  0xc0350009
#define global ERROR_HV_PROPERTY_VALUE_OUT_OF_RANGE  0xc035000a
#define global ERROR_HV_INSUFFICIENT_MEMORY  0xc035000b
#define global ERROR_HV_PARTITION_TOO_DEEP  0xc035000c
#define global ERROR_HV_INVALID_PARTITION_ID  0xc035000d
#define global ERROR_HV_INVALID_VP_INDEX  0xc035000e
#define global ERROR_HV_INVALID_PORT_ID  0xc0350011
#define global ERROR_HV_INVALID_CONNECTION_ID  0xc0350012
#define global ERROR_HV_INSUFFICIENT_BUFFERS  0xc0350013
#define global ERROR_HV_NOT_ACKNOWLEDGED  0xc0350014
#define global ERROR_HV_INVALID_VP_STATE  0xc0350015
#define global ERROR_HV_ACKNOWLEDGED  0xc0350016
#define global ERROR_HV_INVALID_SAVE_RESTORE_STATE  0xc0350017
#define global ERROR_HV_INVALID_SYNIC_STATE  0xc0350018
#define global ERROR_HV_OBJECT_IN_USE  0xc0350019
#define global ERROR_HV_INVALID_PROXIMITY_DOMAIN_INFO  0xc035001a
#define global ERROR_HV_NO_DATA  0xc035001b
#define global ERROR_HV_INACTIVE  0xc035001c
#define global ERROR_HV_NO_RESOURCES  0xc035001d
#define global ERROR_HV_FEATURE_UNAVAILABLE  0xc035001e
#define global ERROR_HV_INSUFFICIENT_BUFFER  0xc0350033
#define global ERROR_HV_INSUFFICIENT_DEVICE_DOMAINS  0xc0350038
#define global ERROR_HV_CPUID_FEATURE_VALIDATION  0xc035003c
#define global ERROR_HV_CPUID_XSAVE_FEATURE_VALIDATION  0xc035003d
#define global ERROR_HV_PROCESSOR_STARTUP_TIMEOUT  0xc035003e
#define global ERROR_HV_SMX_ENABLED  0xc035003f
#define global ERROR_HV_INVALID_LP_INDEX  0xc0350041
#define global ERROR_HV_INVALID_REGISTER_VALUE  0xc0350050
#define global ERROR_HV_INVALID_VTL_STATE  0xc0350051
#define global ERROR_HV_NX_NOT_DETECTED  0xc0350055
#define global ERROR_HV_INVALID_DEVICE_ID  0xc0350057
#define global ERROR_HV_INVALID_DEVICE_STATE  0xc0350058
#define global ERROR_HV_PENDING_PAGE_REQUESTS  0x350059
#define global ERROR_HV_PAGE_REQUEST_INVALID  0xc0350060
#define global ERROR_HV_INVALID_CPU_GROUP_ID  0xc035006f
#define global ERROR_HV_INVALID_CPU_GROUP_STATE  0xc0350070
#define global ERROR_HV_OPERATION_FAILED  0xc0350071
#define global ERROR_HV_NOT_ALLOWED_WITH_NESTED_VIRT_ACTIVE  0xc0350072
#define global ERROR_HV_INSUFFICIENT_ROOT_MEMORY  0xc0350073
#define global ERROR_HV_EVENT_BUFFER_ALREADY_FREED  0xc0350074
#define global ERROR_HV_INSUFFICIENT_CONTIGUOUS_MEMORY  0xc0350075
#define global ERROR_HV_DEVICE_NOT_IN_DOMAIN  0xc0350076
#define global ERROR_HV_NESTED_VM_EXIT  0xc0350077
#define global ERROR_HV_MSR_ACCESS_FAILED  0xc0350080
#define global ERROR_HV_INSUFFICIENT_MEMORY_MIRRORING  0xc0350081
#define global ERROR_HV_INSUFFICIENT_CONTIGUOUS_MEMORY_MIRRORING  0xc0350082
#define global ERROR_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY  0xc0350083
#define global ERROR_HV_INSUFFICIENT_ROOT_MEMORY_MIRRORING  0xc0350084
#define global ERROR_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY_MIRRORING  0xc0350085
#define global ERROR_HV_NOT_PRESENT  0xc0351000
#define global ERROR_VID_DUPLICATE_HANDLER  0xc0370001
#define global ERROR_VID_TOO_MANY_HANDLERS  0xc0370002
#define global ERROR_VID_QUEUE_FULL  0xc0370003
#define global ERROR_VID_HANDLER_NOT_PRESENT  0xc0370004
#define global ERROR_VID_INVALID_OBJECT_NAME  0xc0370005
#define global ERROR_VID_PARTITION_NAME_TOO_LONG  0xc0370006
#define global ERROR_VID_MESSAGE_QUEUE_NAME_TOO_LONG  0xc0370007
#define global ERROR_VID_PARTITION_ALREADY_EXISTS  0xc0370008
#define global ERROR_VID_PARTITION_DOES_NOT_EXIST  0xc0370009
#define global ERROR_VID_PARTITION_NAME_NOT_FOUND  0xc037000a
#define global ERROR_VID_MESSAGE_QUEUE_ALREADY_EXISTS  0xc037000b
#define global ERROR_VID_EXCEEDED_MBP_ENTRY_MAP_LIMIT  0xc037000c
#define global ERROR_VID_MB_STILL_REFERENCED  0xc037000d
#define global ERROR_VID_CHILD_GPA_PAGE_SET_CORRUPTED  0xc037000e
#define global ERROR_VID_INVALID_NUMA_SETTINGS  0xc037000f
#define global ERROR_VID_INVALID_NUMA_NODE_INDEX  0xc0370010
#define global ERROR_VID_NOTIFICATION_QUEUE_ALREADY_ASSOCIATED  0xc0370011
#define global ERROR_VID_INVALID_MEMORY_BLOCK_HANDLE  0xc0370012
#define global ERROR_VID_PAGE_RANGE_OVERFLOW  0xc0370013
#define global ERROR_VID_INVALID_MESSAGE_QUEUE_HANDLE  0xc0370014
#define global ERROR_VID_INVALID_GPA_RANGE_HANDLE  0xc0370015
#define global ERROR_VID_NO_MEMORY_BLOCK_NOTIFICATION_QUEUE  0xc0370016
#define global ERROR_VID_MEMORY_BLOCK_LOCK_COUNT_EXCEEDED  0xc0370017
#define global ERROR_VID_INVALID_PPM_HANDLE  0xc0370018
#define global ERROR_VID_MBPS_ARE_LOCKED  0xc0370019
#define global ERROR_VID_MESSAGE_QUEUE_CLOSED  0xc037001a
#define global ERROR_VID_VIRTUAL_PROCESSOR_LIMIT_EXCEEDED  0xc037001b
#define global ERROR_VID_STOP_PENDING  0xc037001c
#define global ERROR_VID_INVALID_PROCESSOR_STATE  0xc037001d
#define global ERROR_VID_EXCEEDED_KM_CONTEXT_COUNT_LIMIT  0xc037001e
#define global ERROR_VID_KM_INTERFACE_ALREADY_INITIALIZED  0xc037001f
#define global ERROR_VID_MB_PROPERTY_ALREADY_SET_RESET  0xc0370020
#define global ERROR_VID_MMIO_RANGE_DESTROYED  0xc0370021
#define global ERROR_VID_INVALID_CHILD_GPA_PAGE_SET  0xc0370022
#define global ERROR_VID_RESERVE_PAGE_SET_IS_BEING_USED  0xc0370023
#define global ERROR_VID_RESERVE_PAGE_SET_TOO_SMALL  0xc0370024
#define global ERROR_VID_MBP_ALREADY_LOCKED_USING_RESERVED_PAGE  0xc0370025
#define global ERROR_VID_MBP_COUNT_EXCEEDED_LIMIT  0xc0370026
#define global ERROR_VID_SAVED_STATE_CORRUPT  0xc0370027
#define global ERROR_VID_SAVED_STATE_UNRECOGNIZED_ITEM  0xc0370028
#define global ERROR_VID_SAVED_STATE_INCOMPATIBLE  0xc0370029
#define global ERROR_VID_VTL_ACCESS_DENIED  0xc037002a
#define global ERROR_VID_INSUFFICIENT_RESOURCES_RESERVE  0xc037002b
#define global ERROR_VID_INSUFFICIENT_RESOURCES_PHYSICAL_BUFFER  0xc037002c
#define global ERROR_VID_INSUFFICIENT_RESOURCES_HV_DEPOSIT  0xc037002d
#define global ERROR_VID_MEMORY_TYPE_NOT_SUPPORTED  0xc037002e
#define global ERROR_VID_INSUFFICIENT_RESOURCES_WITHDRAW  0xc037002f
#define global ERROR_VID_PROCESS_ALREADY_SET  0xc0370030
#define global ERROR_VMCOMPUTE_TERMINATED_DURING_START  0xc0370100
#define global ERROR_VMCOMPUTE_IMAGE_MISMATCH  0xc0370101
#define global ERROR_VMCOMPUTE_HYPERV_NOT_INSTALLED  0xc0370102
#define global ERROR_VMCOMPUTE_OPERATION_PENDING  0xc0370103
#define global ERROR_VMCOMPUTE_TOO_MANY_NOTIFICATIONS  0xc0370104
#define global ERROR_VMCOMPUTE_INVALID_STATE  0xc0370105
#define global ERROR_VMCOMPUTE_UNEXPECTED_EXIT  0xc0370106
#define global ERROR_VMCOMPUTE_TERMINATED  0xc0370107
#define global ERROR_VMCOMPUTE_CONNECT_FAILED  0xc0370108
#define global ERROR_VMCOMPUTE_TIMEOUT  0xc0370109
#define global ERROR_VMCOMPUTE_CONNECTION_CLOSED  0xc037010a
#define global ERROR_VMCOMPUTE_UNKNOWN_MESSAGE  0xc037010b
#define global ERROR_VMCOMPUTE_UNSUPPORTED_PROTOCOL_VERSION  0xc037010c
#define global ERROR_VMCOMPUTE_INVALID_JSON  0xc037010d
#define global ERROR_VMCOMPUTE_SYSTEM_NOT_FOUND  0xc037010e
#define global ERROR_VMCOMPUTE_SYSTEM_ALREADY_EXISTS  0xc037010f
#define global ERROR_VMCOMPUTE_SYSTEM_ALREADY_STOPPED  0xc0370110
#define global ERROR_VMCOMPUTE_PROTOCOL_ERROR  0xc0370111
#define global ERROR_VMCOMPUTE_INVALID_LAYER  0xc0370112
#define global ERROR_VMCOMPUTE_WINDOWS_INSIDER_REQUIRED  0xc0370113
#define global ERROR_VNET_VIRTUAL_SWITCH_NAME_NOT_FOUND  0xc0370200
#define global ERROR_VID_REMOTE_NODE_PARENT_GPA_PAGES_USED  0x80370001
#define global ERROR_VSMB_SAVED_STATE_FILE_NOT_FOUND  0xc0370400
#define global ERROR_VSMB_SAVED_STATE_CORRUPT  0xc0370401
#define global ERROR_VOLMGR_INCOMPLETE_REGENERATION  0x80380001
#define global ERROR_VOLMGR_INCOMPLETE_DISK_MIGRATION  0x80380002
#define global ERROR_VOLMGR_DATABASE_FULL  0xc0380001
#define global ERROR_VOLMGR_DISK_CONFIGURATION_CORRUPTED  0xc0380002
#define global ERROR_VOLMGR_DISK_CONFIGURATION_NOT_IN_SYNC  0xc0380003
#define global ERROR_VOLMGR_PACK_CONFIG_UPDATE_FAILED  0xc0380004
#define global ERROR_VOLMGR_DISK_CONTAINS_NON_SIMPLE_VOLUME  0xc0380005
#define global ERROR_VOLMGR_DISK_DUPLICATE  0xc0380006
#define global ERROR_VOLMGR_DISK_DYNAMIC  0xc0380007
#define global ERROR_VOLMGR_DISK_ID_INVALID  0xc0380008
#define global ERROR_VOLMGR_DISK_INVALID  0xc0380009
#define global ERROR_VOLMGR_DISK_LAST_VOTER  0xc038000a
#define global ERROR_VOLMGR_DISK_LAYOUT_INVALID  0xc038000b
#define global ERROR_VOLMGR_DISK_LAYOUT_NON_BASIC_BETWEEN_BASIC_PARTITIONS  0xc038000c
#define global ERROR_VOLMGR_DISK_LAYOUT_NOT_CYLINDER_ALIGNED  0xc038000d
#define global ERROR_VOLMGR_DISK_LAYOUT_PARTITIONS_TOO_SMALL  0xc038000e
#define global ERROR_VOLMGR_DISK_LAYOUT_PRIMARY_BETWEEN_LOGICAL_PARTITIONS  0xc038000f
#define global ERROR_VOLMGR_DISK_LAYOUT_TOO_MANY_PARTITIONS  0xc0380010
#define global ERROR_VOLMGR_DISK_MISSING  0xc0380011
#define global ERROR_VOLMGR_DISK_NOT_EMPTY  0xc0380012
#define global ERROR_VOLMGR_DISK_NOT_ENOUGH_SPACE  0xc0380013
#define global ERROR_VOLMGR_DISK_REVECTORING_FAILED  0xc0380014
#define global ERROR_VOLMGR_DISK_SECTOR_SIZE_INVALID  0xc0380015
#define global ERROR_VOLMGR_DISK_SET_NOT_CONTAINED  0xc0380016
#define global ERROR_VOLMGR_DISK_USED_BY_MULTIPLE_MEMBERS  0xc0380017
#define global ERROR_VOLMGR_DISK_USED_BY_MULTIPLE_PLEXES  0xc0380018
#define global ERROR_VOLMGR_DYNAMIC_DISK_NOT_SUPPORTED  0xc0380019
#define global ERROR_VOLMGR_EXTENT_ALREADY_USED  0xc038001a
#define global ERROR_VOLMGR_EXTENT_NOT_CONTIGUOUS  0xc038001b
#define global ERROR_VOLMGR_EXTENT_NOT_IN_PUBLIC_REGION  0xc038001c
#define global ERROR_VOLMGR_EXTENT_NOT_SECTOR_ALIGNED  0xc038001d
#define global ERROR_VOLMGR_EXTENT_OVERLAPS_EBR_PARTITION  0xc038001e
#define global ERROR_VOLMGR_EXTENT_VOLUME_LENGTHS_DO_NOT_MATCH  0xc038001f
#define global ERROR_VOLMGR_FAULT_TOLERANT_NOT_SUPPORTED  0xc0380020
#define global ERROR_VOLMGR_INTERLEAVE_LENGTH_INVALID  0xc0380021
#define global ERROR_VOLMGR_MAXIMUM_REGISTERED_USERS  0xc0380022
#define global ERROR_VOLMGR_MEMBER_IN_SYNC  0xc0380023
#define global ERROR_VOLMGR_MEMBER_INDEX_DUPLICATE  0xc0380024
#define global ERROR_VOLMGR_MEMBER_INDEX_INVALID  0xc0380025
#define global ERROR_VOLMGR_MEMBER_MISSING  0xc0380026
#define global ERROR_VOLMGR_MEMBER_NOT_DETACHED  0xc0380027
#define global ERROR_VOLMGR_MEMBER_REGENERATING  0xc0380028
#define global ERROR_VOLMGR_ALL_DISKS_FAILED  0xc0380029
#define global ERROR_VOLMGR_NO_REGISTERED_USERS  0xc038002a
#define global ERROR_VOLMGR_NO_SUCH_USER  0xc038002b
#define global ERROR_VOLMGR_NOTIFICATION_RESET  0xc038002c
#define global ERROR_VOLMGR_NUMBER_OF_MEMBERS_INVALID  0xc038002d
#define global ERROR_VOLMGR_NUMBER_OF_PLEXES_INVALID  0xc038002e
#define global ERROR_VOLMGR_PACK_DUPLICATE  0xc038002f
#define global ERROR_VOLMGR_PACK_ID_INVALID  0xc0380030
#define global ERROR_VOLMGR_PACK_INVALID  0xc0380031
#define global ERROR_VOLMGR_PACK_NAME_INVALID  0xc0380032
#define global ERROR_VOLMGR_PACK_OFFLINE  0xc0380033
#define global ERROR_VOLMGR_PACK_HAS_QUORUM  0xc0380034
#define global ERROR_VOLMGR_PACK_WITHOUT_QUORUM  0xc0380035
#define global ERROR_VOLMGR_PARTITION_STYLE_INVALID  0xc0380036
#define global ERROR_VOLMGR_PARTITION_UPDATE_FAILED  0xc0380037
#define global ERROR_VOLMGR_PLEX_IN_SYNC  0xc0380038
#define global ERROR_VOLMGR_PLEX_INDEX_DUPLICATE  0xc0380039
#define global ERROR_VOLMGR_PLEX_INDEX_INVALID  0xc038003a
#define global ERROR_VOLMGR_PLEX_LAST_ACTIVE  0xc038003b
#define global ERROR_VOLMGR_PLEX_MISSING  0xc038003c
#define global ERROR_VOLMGR_PLEX_REGENERATING  0xc038003d
#define global ERROR_VOLMGR_PLEX_TYPE_INVALID  0xc038003e
#define global ERROR_VOLMGR_PLEX_NOT_RAID5  0xc038003f
#define global ERROR_VOLMGR_PLEX_NOT_SIMPLE  0xc0380040
#define global ERROR_VOLMGR_STRUCTURE_SIZE_INVALID  0xc0380041
#define global ERROR_VOLMGR_TOO_MANY_NOTIFICATION_REQUESTS  0xc0380042
#define global ERROR_VOLMGR_TRANSACTION_IN_PROGRESS  0xc0380043
#define global ERROR_VOLMGR_UNEXPECTED_DISK_LAYOUT_CHANGE  0xc0380044
#define global ERROR_VOLMGR_VOLUME_CONTAINS_MISSING_DISK  0xc0380045
#define global ERROR_VOLMGR_VOLUME_ID_INVALID  0xc0380046
#define global ERROR_VOLMGR_VOLUME_LENGTH_INVALID  0xc0380047
#define global ERROR_VOLMGR_VOLUME_LENGTH_NOT_SECTOR_SIZE_MULTIPLE  0xc0380048
#define global ERROR_VOLMGR_VOLUME_NOT_MIRRORED  0xc0380049
#define global ERROR_VOLMGR_VOLUME_NOT_RETAINED  0xc038004a
#define global ERROR_VOLMGR_VOLUME_OFFLINE  0xc038004b
#define global ERROR_VOLMGR_VOLUME_RETAINED  0xc038004c
#define global ERROR_VOLMGR_NUMBER_OF_EXTENTS_INVALID  0xc038004d
#define global ERROR_VOLMGR_DIFFERENT_SECTOR_SIZE  0xc038004e
#define global ERROR_VOLMGR_BAD_BOOT_DISK  0xc038004f
#define global ERROR_VOLMGR_PACK_CONFIG_OFFLINE  0xc0380050
#define global ERROR_VOLMGR_PACK_CONFIG_ONLINE  0xc0380051
#define global ERROR_VOLMGR_NOT_PRIMARY_PACK  0xc0380052
#define global ERROR_VOLMGR_PACK_LOG_UPDATE_FAILED  0xc0380053
#define global ERROR_VOLMGR_NUMBER_OF_DISKS_IN_PLEX_INVALID  0xc0380054
#define global ERROR_VOLMGR_NUMBER_OF_DISKS_IN_MEMBER_INVALID  0xc0380055
#define global ERROR_VOLMGR_VOLUME_MIRRORED  0xc0380056
#define global ERROR_VOLMGR_PLEX_NOT_SIMPLE_SPANNED  0xc0380057
#define global ERROR_VOLMGR_NO_VALID_LOG_COPIES  0xc0380058
#define global ERROR_VOLMGR_PRIMARY_PACK_PRESENT  0xc0380059
#define global ERROR_VOLMGR_NUMBER_OF_DISKS_INVALID  0xc038005a
#define global ERROR_VOLMGR_MIRROR_NOT_SUPPORTED  0xc038005b
#define global ERROR_VOLMGR_RAID5_NOT_SUPPORTED  0xc038005c
#define global ERROR_BCD_NOT_ALL_ENTRIES_IMPORTED  0x80390001
#define global ERROR_BCD_TOO_MANY_ELEMENTS  0xc0390002
#define global ERROR_BCD_NOT_ALL_ENTRIES_SYNCHRONIZED  0x80390003
#define global ERROR_VHD_DRIVE_FOOTER_MISSING  0xc03a0001
#define global ERROR_VHD_DRIVE_FOOTER_CHECKSUM_MISMATCH  0xc03a0002
#define global ERROR_VHD_DRIVE_FOOTER_CORRUPT  0xc03a0003
#define global ERROR_VHD_FORMAT_UNKNOWN  0xc03a0004
#define global ERROR_VHD_FORMAT_UNSUPPORTED_VERSION  0xc03a0005
#define global ERROR_VHD_SPARSE_HEADER_CHECKSUM_MISMATCH  0xc03a0006
#define global ERROR_VHD_SPARSE_HEADER_UNSUPPORTED_VERSION  0xc03a0007
#define global ERROR_VHD_SPARSE_HEADER_CORRUPT  0xc03a0008
#define global ERROR_VHD_BLOCK_ALLOCATION_FAILURE  0xc03a0009
#define global ERROR_VHD_BLOCK_ALLOCATION_TABLE_CORRUPT  0xc03a000a
#define global ERROR_VHD_INVALID_BLOCK_SIZE  0xc03a000b
#define global ERROR_VHD_BITMAP_MISMATCH  0xc03a000c
#define global ERROR_VHD_PARENT_VHD_NOT_FOUND  0xc03a000d
#define global ERROR_VHD_CHILD_PARENT_ID_MISMATCH  0xc03a000e
#define global ERROR_VHD_CHILD_PARENT_TIMESTAMP_MISMATCH  0xc03a000f
#define global ERROR_VHD_METADATA_READ_FAILURE  0xc03a0010
#define global ERROR_VHD_METADATA_WRITE_FAILURE  0xc03a0011
#define global ERROR_VHD_INVALID_SIZE  0xc03a0012
#define global ERROR_VHD_INVALID_FILE_SIZE  0xc03a0013
#define global ERROR_VIRTDISK_PROVIDER_NOT_FOUND  0xc03a0014
#define global ERROR_VIRTDISK_NOT_VIRTUAL_DISK  0xc03a0015
#define global ERROR_VHD_PARENT_VHD_ACCESS_DENIED  0xc03a0016
#define global ERROR_VHD_CHILD_PARENT_SIZE_MISMATCH  0xc03a0017
#define global ERROR_VHD_DIFFERENCING_CHAIN_CYCLE_DETECTED  0xc03a0018
#define global ERROR_VHD_DIFFERENCING_CHAIN_ERROR_IN_PARENT  0xc03a0019
#define global ERROR_VIRTUAL_DISK_LIMITATION  0xc03a001a
#define global ERROR_VHD_INVALID_TYPE  0xc03a001b
#define global ERROR_VHD_INVALID_STATE  0xc03a001c
#define global ERROR_VIRTDISK_UNSUPPORTED_DISK_SECTOR_SIZE  0xc03a001d
#define global ERROR_VIRTDISK_DISK_ALREADY_OWNED  0xc03a001e
#define global ERROR_VIRTDISK_DISK_ONLINE_AND_WRITABLE  0xc03a001f
#define global ERROR_CTLOG_TRACKING_NOT_INITIALIZED  0xc03a0020
#define global ERROR_CTLOG_LOGFILE_SIZE_EXCEEDED_MAXSIZE  0xc03a0021
#define global ERROR_CTLOG_VHD_CHANGED_OFFLINE  0xc03a0022
#define global ERROR_CTLOG_INVALID_TRACKING_STATE  0xc03a0023
#define global ERROR_CTLOG_INCONSISTENT_TRACKING_FILE  0xc03a0024
#define global ERROR_VHD_RESIZE_WOULD_TRUNCATE_DATA  0xc03a0025
#define global ERROR_VHD_COULD_NOT_COMPUTE_MINIMUM_VIRTUAL_SIZE  0xc03a0026
#define global ERROR_VHD_ALREADY_AT_OR_BELOW_MINIMUM_VIRTUAL_SIZE  0xc03a0027
#define global ERROR_VHD_METADATA_FULL  0xc03a0028
#define global ERROR_VHD_INVALID_CHANGE_TRACKING_ID  0xc03a0029
#define global ERROR_VHD_CHANGE_TRACKING_DISABLED  0xc03a002a
#define global ERROR_VHD_MISSING_CHANGE_TRACKING_INFORMATION  0xc03a0030
#define global ERROR_VHD_UNEXPECTED_ID  0xc03a0034
#define global ERROR_QUERY_STORAGE_ERROR  0x803a0001

; WIN_HTTP_CREATE_URL_FLAGS
#define global ICU_ESCAPE  0x80000000
#define global ICU_REJECT_USERPWD  0x4000
#define global ICU_DECODE  0x10000000

; WINDOW_DISPLAY_AFFINITY
#define global WDA_NONE  0x0
#define global WDA_MONITOR  0x1
#define global WDA_EXCLUDEFROMCAPTURE  0x11

; WINDOW_EX_STYLE
#define global WS_EX_DLGMODALFRAME  0x1
#define global WS_EX_NOPARENTNOTIFY  0x4
#define global WS_EX_TOPMOST  0x8
#define global WS_EX_ACCEPTFILES  0x10
#define global WS_EX_TRANSPARENT  0x20
#define global WS_EX_MDICHILD  0x40
#define global WS_EX_TOOLWINDOW  0x80
#define global WS_EX_WINDOWEDGE  0x100
#define global WS_EX_CLIENTEDGE  0x200
#define global WS_EX_CONTEXTHELP  0x400
#define global WS_EX_RIGHT  0x1000
#define global WS_EX_LEFT  0x0
#define global WS_EX_RTLREADING  0x2000
#define global WS_EX_LTRREADING  0x0
#define global WS_EX_LEFTSCROLLBAR  0x4000
#define global WS_EX_RIGHTSCROLLBAR  0x0
#define global WS_EX_CONTROLPARENT  0x10000
#define global WS_EX_STATICEDGE  0x20000
#define global WS_EX_APPWINDOW  0x40000
#define global WS_EX_OVERLAPPEDWINDOW  0x300
#define global WS_EX_PALETTEWINDOW  0x188
#define global WS_EX_LAYERED  0x80000
#define global WS_EX_NOINHERITLAYOUT  0x100000
#define global WS_EX_NOREDIRECTIONBITMAP  0x200000
#define global WS_EX_LAYOUTRTL  0x400000
#define global WS_EX_COMPOSITED  0x2000000
#define global WS_EX_NOACTIVATE  0x8000000

; WINDOW_LONG_PTR_INDEX
#define global GWL_EXSTYLE  -20
#define global GWLP_HINSTANCE  -6
#define global GWLP_HWNDPARENT  -8
#define global GWLP_ID  -12
#define global GWL_STYLE  -16
#define global GWLP_USERDATA  -21
#define global GWLP_WNDPROC  -4
#define global GWL_HINSTANCE  -6
#define global GWL_ID  -12
#define global GWL_USERDATA  -21
#define global GWL_WNDPROC  -4
#define global GWL_HWNDPARENT  -8

; WINDOW_MESSAGE_FILTER_ACTION
#define global MSGFLT_ALLOW  0x1
#define global MSGFLT_DISALLOW  0x2
#define global MSGFLT_RESET  0x0

; WINDOW_STYLE
#define global WS_OVERLAPPED  0x0
#define global WS_POPUP  0x80000000
#define global WS_CHILD  0x40000000
#define global WS_MINIMIZE  0x20000000
#define global WS_VISIBLE  0x10000000
#define global WS_DISABLED  0x8000000
#define global WS_CLIPSIBLINGS  0x4000000
#define global WS_CLIPCHILDREN  0x2000000
#define global WS_MAXIMIZE  0x1000000
#define global WS_CAPTION  0xc00000
#define global WS_BORDER  0x800000
#define global WS_DLGFRAME  0x400000
#define global WS_VSCROLL  0x200000
#define global WS_HSCROLL  0x100000
#define global WS_SYSMENU  0x80000
#define global WS_THICKFRAME  0x40000
#define global WS_GROUP  0x20000
#define global WS_TABSTOP  0x10000
#define global WS_MINIMIZEBOX  0x20000
#define global WS_MAXIMIZEBOX  0x10000
#define global WS_TILED  0x0
#define global WS_ICONIC  0x20000000
#define global WS_SIZEBOX  0x40000
#define global WS_TILEDWINDOW  0xcf0000
#define global WS_OVERLAPPEDWINDOW  0xcf0000
#define global WS_POPUPWINDOW  0x80880000
#define global WS_CHILDWINDOW  0x40000000
#define global WS_ACTIVECAPTION  0x1

; WINDOWPLACEMENT_FLAGS
#define global WPF_ASYNCWINDOWPLACEMENT  0x4
#define global WPF_RESTORETOMAXIMIZED  0x2
#define global WPF_SETMINPOSITION  0x1

; WINDOWS_HOOK_ID
#define global WH_CALLWNDPROC  0x4
#define global WH_CALLWNDPROCRET  0xc
#define global WH_CBT  0x5
#define global WH_DEBUG  0x9
#define global WH_FOREGROUNDIDLE  0xb
#define global WH_GETMESSAGE  0x3
#define global WH_JOURNALPLAYBACK  0x1
#define global WH_JOURNALRECORD  0x0
#define global WH_KEYBOARD  0x2
#define global WH_KEYBOARD_LL  0xd
#define global WH_MOUSE  0x7
#define global WH_MOUSE_LL  0xe
#define global WH_MSGFILTER  -1
#define global WH_SHELL  0xa
#define global WH_SYSMSGFILTER  0x6

; WINDOWTHEMEATTRIBUTETYPE
#define global WTA_NONCLIENT  0x1

; WINHTTP_ACCESS_TYPE
#define global WINHTTP_ACCESS_TYPE_NO_PROXY  0x1
#define global WINHTTP_ACCESS_TYPE_DEFAULT_PROXY  0x0
#define global WINHTTP_ACCESS_TYPE_NAMED_PROXY  0x3
#define global WINHTTP_ACCESS_TYPE_AUTOMATIC_PROXY  0x4

; WINHTTP_INTERNET_SCHEME
#define global WINHTTP_INTERNET_SCHEME_HTTP  0x1
#define global WINHTTP_INTERNET_SCHEME_HTTPS  0x2
#define global WINHTTP_INTERNET_SCHEME_FTP  0x3
#define global WINHTTP_INTERNET_SCHEME_SOCKS  0x4

; WINHTTP_OPEN_REQUEST_FLAGS
#define global WINHTTP_FLAG_BYPASS_PROXY_CACHE  0x100
#define global WINHTTP_FLAG_ESCAPE_DISABLE  0x40
#define global WINHTTP_FLAG_ESCAPE_DISABLE_QUERY  0x80
#define global WINHTTP_FLAG_ESCAPE_PERCENT  0x4
#define global WINHTTP_FLAG_NULL_CODEPAGE  0x8
#define global WINHTTP_FLAG_REFRESH  0x100
#define global WINHTTP_FLAG_SECURE  0x800000

; WINHTTP_WEB_SOCKET_BUFFER_TYPE
#define global WINHTTP_WEB_SOCKET_BINARY_MESSAGE_BUFFER_TYPE  0x0
#define global WINHTTP_WEB_SOCKET_BINARY_FRAGMENT_BUFFER_TYPE  0x1
#define global WINHTTP_WEB_SOCKET_UTF8_MESSAGE_BUFFER_TYPE  0x2
#define global WINHTTP_WEB_SOCKET_UTF8_FRAGMENT_BUFFER_TYPE  0x3
#define global WINHTTP_WEB_SOCKET_CLOSE_BUFFER_TYPE  0x4

; WLAN_AUTOCONF_OPCODE
#define global wlan_autoconf_opcode_start  0x0
#define global wlan_autoconf_opcode_show_denied_networks  0x1
#define global wlan_autoconf_opcode_power_setting  0x2
#define global wlan_autoconf_opcode_only_use_gp_profiles_for_allowed_networks  0x3
#define global wlan_autoconf_opcode_allow_explicit_creds  0x4
#define global wlan_autoconf_opcode_block_period  0x5
#define global wlan_autoconf_opcode_allow_virtual_station_extensibility  0x6
#define global wlan_autoconf_opcode_end  0x7

; WLAN_CONNECTION_MODE
#define global wlan_connection_mode_profile  0x0
#define global wlan_connection_mode_temporary_profile  0x1
#define global wlan_connection_mode_discovery_secure  0x2
#define global wlan_connection_mode_discovery_unsecure  0x3
#define global wlan_connection_mode_auto  0x4
#define global wlan_connection_mode_invalid  0x5

; WLAN_FILTER_LIST_TYPE
#define global wlan_filter_list_type_gp_permit  0x0
#define global wlan_filter_list_type_gp_deny  0x1
#define global wlan_filter_list_type_user_permit  0x2
#define global wlan_filter_list_type_user_deny  0x3

; WLAN_HOSTED_NETWORK_OPCODE
#define global wlan_hosted_network_opcode_connection_settings  0x0
#define global wlan_hosted_network_opcode_security_settings  0x1
#define global wlan_hosted_network_opcode_station_profile  0x2
#define global wlan_hosted_network_opcode_enable  0x3

; WLAN_HOSTED_NETWORK_PEER_AUTH_STATE
#define global wlan_hosted_network_peer_state_invalid  0x0
#define global wlan_hosted_network_peer_state_authenticated  0x1

; WLAN_HOSTED_NETWORK_REASON
#define global wlan_hosted_network_reason_success  0x0
#define global wlan_hosted_network_reason_unspecified  0x1
#define global wlan_hosted_network_reason_bad_parameters  0x2
#define global wlan_hosted_network_reason_service_shutting_down  0x3
#define global wlan_hosted_network_reason_insufficient_resources  0x4
#define global wlan_hosted_network_reason_elevation_required  0x5
#define global wlan_hosted_network_reason_read_only  0x6
#define global wlan_hosted_network_reason_persistence_failed  0x7
#define global wlan_hosted_network_reason_crypt_error  0x8
#define global wlan_hosted_network_reason_impersonation  0x9
#define global wlan_hosted_network_reason_stop_before_start  0xa
#define global wlan_hosted_network_reason_interface_available  0xb
#define global wlan_hosted_network_reason_interface_unavailable  0xc
#define global wlan_hosted_network_reason_miniport_stopped  0xd
#define global wlan_hosted_network_reason_miniport_started  0xe
#define global wlan_hosted_network_reason_incompatible_connection_started  0xf
#define global wlan_hosted_network_reason_incompatible_connection_stopped  0x10
#define global wlan_hosted_network_reason_user_action  0x11
#define global wlan_hosted_network_reason_client_abort  0x12
#define global wlan_hosted_network_reason_ap_start_failed  0x13
#define global wlan_hosted_network_reason_peer_arrived  0x14
#define global wlan_hosted_network_reason_peer_departed  0x15
#define global wlan_hosted_network_reason_peer_timeout  0x16
#define global wlan_hosted_network_reason_gp_denied  0x17
#define global wlan_hosted_network_reason_service_unavailable  0x18
#define global wlan_hosted_network_reason_device_change  0x19
#define global wlan_hosted_network_reason_properties_change  0x1a
#define global wlan_hosted_network_reason_virtual_station_blocking_use  0x1b
#define global wlan_hosted_network_reason_service_available_on_virtual_station  0x1c

; WLAN_HOSTED_NETWORK_STATE
#define global wlan_hosted_network_unavailable  0x0
#define global wlan_hosted_network_idle  0x1
#define global wlan_hosted_network_active  0x2

; WLAN_IHV_CONTROL_TYPE
#define global wlan_ihv_control_type_service  0x0
#define global wlan_ihv_control_type_driver  0x1

; WLAN_INTERFACE_STATE
#define global wlan_interface_state_not_ready  0x0
#define global wlan_interface_state_connected  0x1
#define global wlan_interface_state_ad_hoc_network_formed  0x2
#define global wlan_interface_state_disconnecting  0x3
#define global wlan_interface_state_disconnected  0x4
#define global wlan_interface_state_associating  0x5
#define global wlan_interface_state_discovering  0x6
#define global wlan_interface_state_authenticating  0x7

; WLAN_INTERFACE_TYPE
#define global wlan_interface_type_emulated_802_11  0x0
#define global wlan_interface_type_native_802_11  0x1
#define global wlan_interface_type_invalid  0x2

; WLAN_INTF_OPCODE
#define global wlan_intf_opcode_autoconf_start  0x0
#define global wlan_intf_opcode_autoconf_enabled  0x1
#define global wlan_intf_opcode_background_scan_enabled  0x2
#define global wlan_intf_opcode_media_streaming_mode  0x3
#define global wlan_intf_opcode_radio_state  0x4
#define global wlan_intf_opcode_bss_type  0x5
#define global wlan_intf_opcode_interface_state  0x6
#define global wlan_intf_opcode_current_connection  0x7
#define global wlan_intf_opcode_channel_number  0x8
#define global wlan_intf_opcode_supported_infrastructure_auth_cipher_pairs  0x9
#define global wlan_intf_opcode_supported_adhoc_auth_cipher_pairs  0xa
#define global wlan_intf_opcode_supported_country_or_region_string_list  0xb
#define global wlan_intf_opcode_current_operation_mode  0xc
#define global wlan_intf_opcode_supported_safe_mode  0xd
#define global wlan_intf_opcode_certified_safe_mode  0xe
#define global wlan_intf_opcode_hosted_network_capable  0xf
#define global wlan_intf_opcode_management_frame_protection_capable  0x10
#define global wlan_intf_opcode_secondary_sta_interfaces  0x11
#define global wlan_intf_opcode_secondary_sta_synchronized_connections  0x12
#define global wlan_intf_opcode_autoconf_end  0xfffffff
#define global wlan_intf_opcode_msm_start  0x10000100
#define global wlan_intf_opcode_statistics  0x10000101
#define global wlan_intf_opcode_rssi  0x10000102
#define global wlan_intf_opcode_msm_end  0x1fffffff
#define global wlan_intf_opcode_security_start  0x20010000
#define global wlan_intf_opcode_security_end  0x2fffffff
#define global wlan_intf_opcode_ihv_start  0x30000000
#define global wlan_intf_opcode_ihv_end  0x3fffffff

; WLAN_NOTIFICATION_SOURCES
#define global WLAN_NOTIFICATION_SOURCE_NONE  0x0
#define global WLAN_NOTIFICATION_SOURCE_ALL  0xffff
#define global WLAN_NOTIFICATION_SOURCE_ACM  0x8
#define global WLAN_NOTIFICATION_SOURCE_MSM  0x10
#define global WLAN_NOTIFICATION_SOURCE_SECURITY  0x20
#define global WLAN_NOTIFICATION_SOURCE_IHV  0x40
#define global WLAN_NOTIFICATION_SOURCE_HNWK  0x80
#define global WLAN_NOTIFICATION_SOURCE_ONEX  0x4
#define global WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE  0x800

; WLAN_OPCODE_VALUE_TYPE
#define global wlan_opcode_value_type_query_only  0x0
#define global wlan_opcode_value_type_set_by_group_policy  0x1
#define global wlan_opcode_value_type_set_by_user  0x2
#define global wlan_opcode_value_type_invalid  0x3

; WLAN_SECURABLE_OBJECT
#define global wlan_secure_permit_list  0x0
#define global wlan_secure_deny_list  0x1
#define global wlan_secure_ac_enabled  0x2
#define global wlan_secure_bc_scan_enabled  0x3
#define global wlan_secure_bss_type  0x4
#define global wlan_secure_show_denied  0x5
#define global wlan_secure_interface_properties  0x6
#define global wlan_secure_ihv_control  0x7
#define global wlan_secure_all_user_profiles_order  0x8
#define global wlan_secure_add_new_all_user_profiles  0x9
#define global wlan_secure_add_new_per_user_profiles  0xa
#define global wlan_secure_media_streaming_mode_enabled  0xb
#define global wlan_secure_current_operation_mode  0xc
#define global wlan_secure_get_plaintext_key  0xd
#define global wlan_secure_hosted_network_elevated_access  0xe
#define global wlan_secure_virtual_station_extensibility  0xf
#define global wlan_secure_wfd_elevated_access  0x10
#define global WLAN_SECURABLE_OBJECT_COUNT  0x11

; WLAN_SET_EAPHOST_FLAGS
#define global WLAN_SET_EAPHOST_DATA_ALL_USERS  0x1

; WMT_ATTR_DATATYPE
#define global WMT_TYPE_DWORD  0x0
#define global WMT_TYPE_STRING  0x1
#define global WMT_TYPE_BINARY  0x2
#define global WMT_TYPE_BOOL  0x3
#define global WMT_TYPE_QWORD  0x4
#define global WMT_TYPE_WORD  0x5
#define global WMT_TYPE_GUID  0x6

; WMT_NET_PROTOCOL
#define global WMT_PROTOCOL_HTTP  0x0

; WMT_STATUS
#define global WMT_ERROR  0x0
#define global WMT_OPENED  0x1
#define global WMT_BUFFERING_START  0x2
#define global WMT_BUFFERING_STOP  0x3
#define global WMT_EOF  0x4
#define global WMT_END_OF_FILE  0x4
#define global WMT_END_OF_SEGMENT  0x5
#define global WMT_END_OF_STREAMING  0x6
#define global WMT_LOCATING  0x7
#define global WMT_CONNECTING  0x8
#define global WMT_NO_RIGHTS  0x9
#define global WMT_MISSING_CODEC  0xa
#define global WMT_STARTED  0xb
#define global WMT_STOPPED  0xc
#define global WMT_CLOSED  0xd
#define global WMT_STRIDING  0xe
#define global WMT_TIMER  0xf
#define global WMT_INDEX_PROGRESS  0x10
#define global WMT_SAVEAS_START  0x11
#define global WMT_SAVEAS_STOP  0x12
#define global WMT_NEW_SOURCEFLAGS  0x13
#define global WMT_NEW_METADATA  0x14
#define global WMT_BACKUPRESTORE_BEGIN  0x15
#define global WMT_SOURCE_SWITCH  0x16
#define global WMT_ACQUIRE_LICENSE  0x17
#define global WMT_INDIVIDUALIZE  0x18
#define global WMT_NEEDS_INDIVIDUALIZATION  0x19
#define global WMT_NO_RIGHTS_EX  0x1a
#define global WMT_BACKUPRESTORE_END  0x1b
#define global WMT_BACKUPRESTORE_CONNECTING  0x1c
#define global WMT_BACKUPRESTORE_DISCONNECTING  0x1d
#define global WMT_ERROR_WITHURL  0x1e
#define global WMT_RESTRICTED_LICENSE  0x1f
#define global WMT_CLIENT_CONNECT  0x20
#define global WMT_CLIENT_DISCONNECT  0x21
#define global WMT_NATIVE_OUTPUT_PROPS_CHANGED  0x22
#define global WMT_RECONNECT_START  0x23
#define global WMT_RECONNECT_END  0x24
#define global WMT_CLIENT_CONNECT_EX  0x25
#define global WMT_CLIENT_DISCONNECT_EX  0x26
#define global WMT_SET_FEC_SPAN  0x27
#define global WMT_PREROLL_READY  0x28
#define global WMT_PREROLL_COMPLETE  0x29
#define global WMT_CLIENT_PROPERTIES  0x2a
#define global WMT_LICENSEURL_SIGNATURE_STATE  0x2b
#define global WMT_INIT_PLAYLIST_BURN  0x2c
#define global WMT_TRANSCRYPTOR_INIT  0x2d
#define global WMT_TRANSCRYPTOR_SEEKED  0x2e
#define global WMT_TRANSCRYPTOR_READ  0x2f
#define global WMT_TRANSCRYPTOR_CLOSED  0x30
#define global WMT_PROXIMITY_RESULT  0x31
#define global WMT_PROXIMITY_COMPLETED  0x32
#define global WMT_CONTENT_ENABLER  0x33

; WMT_STREAM_SELECTION
#define global WMT_OFF  0x0
#define global WMT_CLEANPOINT_ONLY  0x1
#define global WMT_ON  0x2

; WMT_VERSION
#define global WMT_VER_4_0  0x40000
#define global WMT_VER_7_0  0x70000
#define global WMT_VER_8_0  0x80000
#define global WMT_VER_9_0  0x90000

; WNDCLASS_STYLES
#define global CS_VREDRAW  0x1
#define global CS_HREDRAW  0x2
#define global CS_DBLCLKS  0x8
#define global CS_OWNDC  0x20
#define global CS_CLASSDC  0x40
#define global CS_PARENTDC  0x80
#define global CS_NOCLOSE  0x200
#define global CS_SAVEBITS  0x800
#define global CS_BYTEALIGNCLIENT  0x1000
#define global CS_BYTEALIGNWINDOW  0x2000
#define global CS_GLOBALCLASS  0x4000
#define global CS_IME  0x10000
#define global CS_DROPSHADOW  0x20000

; WORKER_THREAD_FLAGS
#define global WT_EXECUTEDEFAULT  0x0
#define global WT_EXECUTEINIOTHREAD  0x1
#define global WT_EXECUTEINPERSISTENTTHREAD  0x80
#define global WT_EXECUTEINWAITTHREAD  0x4
#define global WT_EXECUTELONGFUNCTION  0x10
#define global WT_EXECUTEONLYONCE  0x8
#define global WT_TRANSFER_IMPERSONATION  0x100
#define global WT_EXECUTEINTIMERTHREAD  0x20

; WPAD_CACHE_DELETE
#define global WPAD_CACHE_DELETE_CURRENT  0x0
#define global WPAD_CACHE_DELETE_ALL  0x1

; WrapMode
#define global WrapModeTile  0x0
#define global WrapModeTileFlipX  0x1
#define global WrapModeTileFlipY  0x2
#define global WrapModeTileFlipXY  0x3
#define global WrapModeClamp  0x4

; WSA_ERROR
#define global WSA_IO_PENDING  0x3e5
#define global WSA_IO_INCOMPLETE  0x3e4
#define global WSA_INVALID_HANDLE  0x6
#define global WSA_INVALID_PARAMETER  0x57
#define global WSA_NOT_ENOUGH_MEMORY  0x8
#define global WSA_OPERATION_ABORTED  0x3e3
#define global WSA_WAIT_EVENT_0  0x0
#define global WSA_WAIT_IO_COMPLETION  0xc0
#define global WSABASEERR  0x2710
#define global WSAEINTR  0x2714
#define global WSAEBADF  0x2719
#define global WSAEACCES  0x271d
#define global WSAEFAULT  0x271e
#define global WSAEINVAL  0x2726
#define global WSAEMFILE  0x2728
#define global WSAEWOULDBLOCK  0x2733
#define global WSAEINPROGRESS  0x2734
#define global WSAEALREADY  0x2735
#define global WSAENOTSOCK  0x2736
#define global WSAEDESTADDRREQ  0x2737
#define global WSAEMSGSIZE  0x2738
#define global WSAEPROTOTYPE  0x2739
#define global WSAENOPROTOOPT  0x273a
#define global WSAEPROTONOSUPPORT  0x273b
#define global WSAESOCKTNOSUPPORT  0x273c
#define global WSAEOPNOTSUPP  0x273d
#define global WSAEPFNOSUPPORT  0x273e
#define global WSAEAFNOSUPPORT  0x273f
#define global WSAEADDRINUSE  0x2740
#define global WSAEADDRNOTAVAIL  0x2741
#define global WSAENETDOWN  0x2742
#define global WSAENETUNREACH  0x2743
#define global WSAENETRESET  0x2744
#define global WSAECONNABORTED  0x2745
#define global WSAECONNRESET  0x2746
#define global WSAENOBUFS  0x2747
#define global WSAEISCONN  0x2748
#define global WSAENOTCONN  0x2749
#define global WSAESHUTDOWN  0x274a
#define global WSAETOOMANYREFS  0x274b
#define global WSAETIMEDOUT  0x274c
#define global WSAECONNREFUSED  0x274d
#define global WSAELOOP  0x274e
#define global WSAENAMETOOLONG  0x274f
#define global WSAEHOSTDOWN  0x2750
#define global WSAEHOSTUNREACH  0x2751
#define global WSAENOTEMPTY  0x2752
#define global WSAEPROCLIM  0x2753
#define global WSAEUSERS  0x2754
#define global WSAEDQUOT  0x2755
#define global WSAESTALE  0x2756
#define global WSAEREMOTE  0x2757
#define global WSASYSNOTREADY  0x276b
#define global WSAVERNOTSUPPORTED  0x276c
#define global WSANOTINITIALISED  0x276d
#define global WSAEDISCON  0x2775
#define global WSAENOMORE  0x2776
#define global WSAECANCELLED  0x2777
#define global WSAEINVALIDPROCTABLE  0x2778
#define global WSAEINVALIDPROVIDER  0x2779
#define global WSAEPROVIDERFAILEDINIT  0x277a
#define global WSASYSCALLFAILURE  0x277b
#define global WSASERVICE_NOT_FOUND  0x277c
#define global WSATYPE_NOT_FOUND  0x277d
#define global WSA_E_NO_MORE  0x277e
#define global WSA_E_CANCELLED  0x277f
#define global WSAEREFUSED  0x2780
#define global WSAHOST_NOT_FOUND  0x2af9
#define global WSATRY_AGAIN  0x2afa
#define global WSANO_RECOVERY  0x2afb
#define global WSANO_DATA  0x2afc
#define global WSA_QOS_RECEIVERS  0x2afd
#define global WSA_QOS_SENDERS  0x2afe
#define global WSA_QOS_NO_SENDERS  0x2aff
#define global WSA_QOS_NO_RECEIVERS  0x2b00
#define global WSA_QOS_REQUEST_CONFIRMED  0x2b01
#define global WSA_QOS_ADMISSION_FAILURE  0x2b02
#define global WSA_QOS_POLICY_FAILURE  0x2b03
#define global WSA_QOS_BAD_STYLE  0x2b04
#define global WSA_QOS_BAD_OBJECT  0x2b05
#define global WSA_QOS_TRAFFIC_CTRL_ERROR  0x2b06
#define global WSA_QOS_GENERIC_ERROR  0x2b07
#define global WSA_QOS_ESERVICETYPE  0x2b08
#define global WSA_QOS_EFLOWSPEC  0x2b09
#define global WSA_QOS_EPROVSPECBUF  0x2b0a
#define global WSA_QOS_EFILTERSTYLE  0x2b0b
#define global WSA_QOS_EFILTERTYPE  0x2b0c
#define global WSA_QOS_EFILTERCOUNT  0x2b0d
#define global WSA_QOS_EOBJLENGTH  0x2b0e
#define global WSA_QOS_EFLOWCOUNT  0x2b0f
#define global WSA_QOS_EUNKOWNPSOBJ  0x2b10
#define global WSA_QOS_EPOLICYOBJ  0x2b11
#define global WSA_QOS_EFLOWDESC  0x2b12
#define global WSA_QOS_EPSFLOWSPEC  0x2b13
#define global WSA_QOS_EPSFILTERSPEC  0x2b14
#define global WSA_QOS_ESDMODEOBJ  0x2b15
#define global WSA_QOS_ESHAPERATEOBJ  0x2b16
#define global WSA_QOS_RESERVED_PETYPE  0x2b17
#define global WSA_SECURE_HOST_NOT_FOUND  0x2b18
#define global WSA_IPSEC_NAME_POLICY_ERROR  0x2b19

; WSACOMPLETIONTYPE
#define global NSP_NOTIFY_IMMEDIATELY  0x0
#define global NSP_NOTIFY_HWND  0x1
#define global NSP_NOTIFY_EVENT  0x2
#define global NSP_NOTIFY_PORT  0x3
#define global NSP_NOTIFY_APC  0x4

; WSAECOMPARATOR
#define global COMP_EQUAL  0x0
#define global COMP_NOTLESS  0x1

; WSAESETSERVICEOP
#define global RNRSERVICE_REGISTER  0x0
#define global RNRSERVICE_DEREGISTER  0x1
#define global RNRSERVICE_DELETE  0x2

; WSAPOLL_EVENT_FLAGS
#define global POLLRDNORM  0x100
#define global POLLRDBAND  0x200
#define global POLLIN  0x300
#define global POLLPRI  0x400
#define global POLLWRNORM  0x10
#define global POLLOUT  0x10
#define global POLLWRBAND  0x20
#define global POLLERR  0x1
#define global POLLHUP  0x2
#define global POLLNVAL  0x4

; WSB_PROP
#define global WSB_PROP_CXHSCROLL  0x2
#define global WSB_PROP_CXHTHUMB  0x10
#define global WSB_PROP_CXVSCROLL  0x8
#define global WSB_PROP_CYHSCROLL  0x4
#define global WSB_PROP_CYVSCROLL  0x1
#define global WSB_PROP_CYVTHUMB  0x20
#define global WSB_PROP_HBKGCOLOR  0x80
#define global WSB_PROP_HSTYLE  0x200
#define global WSB_PROP_PALETTE  0x800
#define global WSB_PROP_VBKGCOLOR  0x40
#define global WSB_PROP_VSTYLE  0x100
#define global WSB_PROP_WINSTYLE  0x400

; WSC_PROVIDER_INFO_TYPE
#define global ProviderInfoLspCategories  0x0
#define global ProviderInfoAudit  0x1

; WTS_CONFIG_CLASS
#define global WTSUserConfigInitialProgram  0x0
#define global WTSUserConfigWorkingDirectory  0x1
#define global WTSUserConfigfInheritInitialProgram  0x2
#define global WTSUserConfigfAllowLogonTerminalServer  0x3
#define global WTSUserConfigTimeoutSettingsConnections  0x4
#define global WTSUserConfigTimeoutSettingsDisconnections  0x5
#define global WTSUserConfigTimeoutSettingsIdle  0x6
#define global WTSUserConfigfDeviceClientDrives  0x7
#define global WTSUserConfigfDeviceClientPrinters  0x8
#define global WTSUserConfigfDeviceClientDefaultPrinter  0x9
#define global WTSUserConfigBrokenTimeoutSettings  0xa
#define global WTSUserConfigReconnectSettings  0xb
#define global WTSUserConfigModemCallbackSettings  0xc
#define global WTSUserConfigModemCallbackPhoneNumber  0xd
#define global WTSUserConfigShadowingSettings  0xe
#define global WTSUserConfigTerminalServerProfilePath  0xf
#define global WTSUserConfigTerminalServerHomeDir  0x10
#define global WTSUserConfigTerminalServerHomeDirDrive  0x11
#define global WTSUserConfigfTerminalServerRemoteHomeDir  0x12
#define global WTSUserConfigUser  0x13

; WTS_CONNECTSTATE_CLASS
#define global WTSActive  0x0
#define global WTSConnected  0x1
#define global WTSConnectQuery  0x2
#define global WTSShadow  0x3
#define global WTSDisconnected  0x4
#define global WTSIdle  0x5
#define global WTSListen  0x6
#define global WTSReset  0x7
#define global WTSDown  0x8
#define global WTSInit  0x9

; WTS_INFO_CLASS
#define global WTSInitialProgram  0x0
#define global WTSApplicationName  0x1
#define global WTSWorkingDirectory  0x2
#define global WTSOEMId  0x3
#define global WTSSessionId  0x4
#define global WTSUserName  0x5
#define global WTSWinStationName  0x6
#define global WTSDomainName  0x7
#define global WTSConnectState  0x8
#define global WTSClientBuildNumber  0x9
#define global WTSClientName  0xa
#define global WTSClientDirectory  0xb
#define global WTSClientProductId  0xc
#define global WTSClientHardwareId  0xd
#define global WTSClientAddress  0xe
#define global WTSClientDisplay  0xf
#define global WTSClientProtocolType  0x10
#define global WTSIdleTime  0x11
#define global WTSLogonTime  0x12
#define global WTSIncomingBytes  0x13
#define global WTSOutgoingBytes  0x14
#define global WTSIncomingFrames  0x15
#define global WTSOutgoingFrames  0x16
#define global WTSClientInfo  0x17
#define global WTSSessionInfo  0x18
#define global WTSSessionInfoEx  0x19
#define global WTSConfigInfo  0x1a
#define global WTSValidationInfo  0x1b
#define global WTSSessionAddressV4  0x1c
#define global WTSIsRemoteSession  0x1d

; WTS_TYPE_CLASS
#define global WTSTypeProcessInfoLevel0  0x0
#define global WTSTypeProcessInfoLevel1  0x1
#define global WTSTypeSessionInfoLevel1  0x2

; WTS_VIRTUAL_CLASS
#define global WTSVirtualClientData  0x0
#define global WTSVirtualFileHandle  0x1

; XAUDIO2_FILTER_TYPE
#define global LowPassFilter  0x0
#define global BandPassFilter  0x1
#define global HighPassFilter  0x2
#define global NotchFilter  0x3
#define global LowPassOnePoleFilter  0x4
#define global HighPassOnePoleFilter  0x5

#endif

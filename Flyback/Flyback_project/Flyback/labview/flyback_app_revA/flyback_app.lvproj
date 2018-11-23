<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="15008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Type definitions" Type="Folder">
			<Item Name="SingleAcq.ctl" Type="VI" URL="../UI/SingleAcq.ctl"/>
			<Item Name="UI Data.ctl" Type="VI" URL="../UI/UI Data.ctl"/>
		</Item>
		<Item Name="Support VIs" Type="Folder">
			<Item Name="Set Enable State on Multiple Controls.vi" Type="VI" URL="../Support/Set Enable State on Multiple Controls.vi"/>
			<Item Name="Stop Event.lvlib" Type="Library" URL="../Support/Stop Event/Stop Event.lvlib"/>
			<Item Name="Message Queue.lvlib" Type="Library" URL="../Support/Message Queue/Message Queue.lvlib"/>
		</Item>
		<Item Name="Hardware.lvlib" Type="Library" URL="../Acquisition/Hardware.lvlib"/>
		<Item Name="Control.lvlib" Type="Library" URL="../Control/Control.lvlib"/>
		<Item Name="Settings.lvlib" Type="Library" URL="../Settings/Settings.lvlib"/>
		<Item Name="Main.vi" Type="VI" URL="../Main.vi"/>
		<Item Name="serial_test.vi" Type="VI" URL="../serial_test.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="3Phase_GUI" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{D3FE22BD-5CD9-4475-9910-CDA655FF0714}</Property>
				<Property Name="App_INI_GUID" Type="Str">{830CD31A-B5C5-4B45-96A7-35D8FCB474BD}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{4C53216A-1AE8-4193-85FD-52F9739D86F5}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">3Phase_GUI</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/3Phase_GUI</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{571FB326-4304-4720-B102-1100CA163E88}</Property>
				<Property Name="Bld_version.build" Type="Int">1</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">3Phase_GUI.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/3Phase_GUI/3Phase_GUI.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/3Phase_GUI/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{EC27C4B7-C8F8-43B6-96B7-9DA39E7AC6E9}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Main.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">UC3M</Property>
				<Property Name="TgtF_fileDescription" Type="Str">3Phase_GUI</Property>
				<Property Name="TgtF_internalName" Type="Str">3Phase_GUI</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2017 UC3M</Property>
				<Property Name="TgtF_productName" Type="Str">3Phase_GUI</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{88183399-1662-4CC8-A1F7-C6B38FA1B822}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">3Phase_GUI.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>

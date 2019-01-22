// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Terrain_Mask"
{
	Properties
	{
		_Trans_Distance("Trans_Distance", Float) = 0
		_Trans_Falloff("Trans_Falloff", Float) = 0
		_MainTexture_L("MainTexture_L", 2D) = "white" {}

		_Pebbles_T("Pebbles_T", 2D) = "white" {}
		_Pebbles_M("Pebbles_M", 2D) = "white" {}

		_Rock_T("Rock_T", 2D) = "white" {}
		_Rock_M("Rock_M", 2D) = "white" {}

		_Snow_T("Snow_T", 2D) = "white" {}
		_Snow_M("Snow_M", 2D) = "white" {}

		_MudHouse_T("Mud House_T", 2D) = "white" {}
		_MudHouse_M("Mud House_M", 2D) = "white" {}

		_Mud_T("Mud_T", 2D) = "white" {}
		_Mud_M("Mud_M", 2D) = "white" {}

		_Main_T("Main_T", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
		};

		uniform sampler2D _Main_T;
		uniform float4 _Main_T_ST;
		uniform sampler2D _Mud_T;
		uniform float4 _Mud_T_ST;
		uniform sampler2D _Mud_M;
		uniform float4 _Mud_M_ST;
		uniform sampler2D _Pebbles_T;
		uniform float4 _Pebbles_T_ST;
		uniform sampler2D _Pebbles_M;
		uniform float4 _Pebbles_M_ST;
		uniform sampler2D _Rock_T;
		uniform float4 _Rock_T_ST;
		uniform sampler2D _Rock_M;
		uniform float4 _Rock_M_ST;
		uniform sampler2D _Snow_T;
		uniform float4 _Snow_T_ST;
		uniform sampler2D _Snow_M;
		uniform float4 _Snow_M_ST;
		uniform sampler2D _MudHouse_T;
		uniform float4 _MudHouse_T_ST;
		uniform sampler2D _MudHouse_M;
		uniform float4 _MudHouse_M_ST;
		uniform sampler2D _MainTexture_L;
		uniform float4 _MainTexture_L_ST;
		uniform float _Trans_Distance;
		uniform float _Trans_Falloff;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Main_T = i.uv_texcoord * _Main_T_ST.xy + _Main_T_ST.zw;
			float2 uv_Mud_T = i.uv_texcoord * _Mud_T_ST.xy + _Mud_T_ST.zw;
			float2 uv_Mud_M = i.uv_texcoord * _Mud_M_ST.xy + _Mud_M_ST.zw;
			float4 lerpResult37 = lerp( tex2D( _Main_T, uv_Main_T ) , tex2D( _Mud_T, uv_Mud_T ) , tex2D( _Mud_M, uv_Mud_M ).r);
			float2 uv_Pebbles_T = i.uv_texcoord * _Pebbles_T_ST.xy + _Pebbles_T_ST.zw;
			float2 uv_Pebbles_M = i.uv_texcoord * _Pebbles_M_ST.xy + _Pebbles_M_ST.zw;
			float4 lerpResult42 = lerp( lerpResult37 , tex2D( _Pebbles_T, uv_Pebbles_T ) , tex2D( _Pebbles_M, uv_Pebbles_M ).r);
			float2 uv_Rock_T = i.uv_texcoord * _Rock_T_ST.xy + _Rock_T_ST.zw;
			float2 uv_Rock_M = i.uv_texcoord * _Rock_M_ST.xy + _Rock_M_ST.zw;
			float4 lerpResult44 = lerp( lerpResult42 , tex2D( _Rock_T, uv_Rock_T ) , tex2D( _Rock_M, uv_Rock_M ).r);
			float2 uv_Snow_T = i.uv_texcoord * _Snow_T_ST.xy + _Snow_T_ST.zw;
			float2 uv_Snow_M = i.uv_texcoord * _Snow_M_ST.xy + _Snow_M_ST.zw;
			float4 lerpResult46 = lerp( lerpResult44 , tex2D( _Snow_T, uv_Snow_T ) , tex2D( _Snow_M, uv_Snow_M ).r);
			float2 uv_MudHouse_T = i.uv_texcoord * _MudHouse_T_ST.xy + _MudHouse_T_ST.zw;
			float2 uv_MudHouse_M = i.uv_texcoord * _MudHouse_M_ST.xy + _MudHouse_M_ST.zw;
			float4 lerpResult70 = lerp( lerpResult46 , tex2D( _MudHouse_T, uv_MudHouse_T ) , tex2D( _MudHouse_M, uv_MudHouse_M ));
			float2 uv_MainTexture_L = i.uv_texcoord * _MainTexture_L_ST.xy + _MainTexture_L_ST.zw;
			float3 ase_worldPos = i.worldPos;
			float clampResult13 = clamp( pow( ( distance( ase_worldPos , _WorldSpaceCameraPos ) / _Trans_Distance ) , _Trans_Falloff ) , 0.0 , 1.0 );
			float4 lerpResult3 = lerp( lerpResult70 , tex2D( _MainTexture_L, uv_MainTexture_L ) , clampResult13);
			o.Albedo = lerpResult3.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=14401
8;30;1904;998;2527.5;3294.046;3.734534;True;True
Node;AmplifyShaderEditor.SamplerNode;38;-887.9009,-1356.086;Float;True;Property;_Mud_M;Mud_M;11;0;Create;True;None;e8bba22254670d94282b68e8c1467452;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;20;-711.6704,489.4219;Float;False;1411.939;656.5592;Final;9;14;8;13;11;9;5;7;10;12;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;50;-865.2473,-1546.691;Float;True;Property;_Mud_T;Mud_T;12;0;Create;True;None;ec3c80b64bf8b704ebc3ce1aaea6c433;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;49;-860.4632,-1773.35;Float;True;Property;_Main_T;Main_T;13;0;Create;True;None;d167c02f802f0d04aa5c602da745deee;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;5;-661.6704,584.6792;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceCameraPos;7;-658.6415,764.796;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;51;-836.9203,-1145.851;Float;True;Property;_Pebbles_T;Pebbles_T;3;0;Create;True;None;97afc7baefd608442b171351c2861868;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;37;-416.7941,-1684.908;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;39;-846.4028,-949.22;Float;True;Property;_Pebbles_M;Pebbles_M;4;0;Create;True;None;c6dd474691936214198bbab23cd6ebb1;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;8;-267.3493,825.3957;Float;True;2;0;FLOAT3;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;43;-820.1836,-558.0641;Float;True;Property;_Rock_M;Rock_M;8;0;Create;True;None;fb0ec9757c0f3ad468a6e67f1d4c7159;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;42;-179.513,-1530.601;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;52;-828.6204,-740.1508;Float;True;Property;_Rock_T;Rock_T;5;0;Create;True;None;8316d2e6b9ef8124e8ff54f1095719aa;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;10;-586.1382,931.9233;Float;False;Property;_Trans_Distance;Trans_Distance;0;0;Create;True;0;89.19;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;45;-894.9442,-124.8163;Float;True;Property;_Snow_M;Snow_M;6;0;Create;True;None;aaa37e9f48169f74db829c99ee9a1873;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;53;-890.4059,-342.4948;Float;True;Property;_Snow_T;Snow_T;10;0;Create;True;None;4112a019314dad94f9ffc2f8481f31bc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;44;124.7023,-1349.285;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;9;-15.54924,769.0671;Float;False;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-416.1316,1030.981;Float;False;Property;_Trans_Falloff;Trans_Falloff;2;0;Create;True;0;2.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;46;322.8575,-1206.6;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;68;-891.2969,88.36436;Float;True;Property;_MudHouse_T;Mud House_T;9;0;Create;True;None;ca1a5e504324857499d1fdeb25489439;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;11;122.1975,680.8807;Float;False;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;69;-895.8352,279.2482;Float;True;Property;_MudHouse_M;Mud House_M;7;0;Create;True;None;6364537fb5dea8041a45aa6953544164;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;70;339.608,-916.376;Float;False;3;0;COLOR;0.0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;14;-413.1966,577.6779;Float;True;Property;_MainTexture_L;MainTexture_L;1;0;Create;True;None;4aa30610d0f470a46bfa9cb191372284;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;13;286.2386,614.8284;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3;623.6317,-798.5232;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2160.511,-906.54;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Terrain_Mask;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;37;0;49;0
WireConnection;37;1;50;0
WireConnection;37;2;38;0
WireConnection;8;0;5;0
WireConnection;8;1;7;0
WireConnection;42;0;37;0
WireConnection;42;1;51;0
WireConnection;42;2;39;0
WireConnection;44;0;42;0
WireConnection;44;1;52;0
WireConnection;44;2;43;0
WireConnection;9;0;8;0
WireConnection;9;1;10;0
WireConnection;46;0;44;0
WireConnection;46;1;53;0
WireConnection;46;2;45;0
WireConnection;11;0;9;0
WireConnection;11;1;12;0
WireConnection;70;0;46;0
WireConnection;70;1;68;0
WireConnection;70;2;69;0
WireConnection;13;0;11;0
WireConnection;3;0;70;0
WireConnection;3;1;14;0
WireConnection;3;2;13;0
WireConnection;0;0;3;0
ASEEND*/
//CHKSM=6261A72BB619E4F6762D04B8165B79B16180FC14
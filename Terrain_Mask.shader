// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Terrain_Mask"
{
	Properties
	{
		_Trans_Distance("Trans_Distance", Float) = 0
		_MainTexture_L("MainTexture_L", 2D) = "white" {}
		_Trans_Falloff("Trans_Falloff", Float) = 0
		_Pebbles_T("Pebbles_T", 2D) = "white" {}
		_Pebbles_M("Pebbles_M", 2D) = "white" {}
		_Rock_T("Rock_T", 2D) = "white" {}
		_Snow_M("Snow_M", 2D) = "white" {}
		_MudHouse_M("Mud House_M", 2D) = "white" {}
		_Rock_M("Rock_M", 2D) = "white" {}
		_MudHouse_T("Mud House_T", 2D) = "white" {}
		_Snow_T("Snow_T", 2D) = "white" {}
		_Mud_M("Mud_M", 2D) = "white" {}
		_Mud_T("Mud_T", 2D) = "white" {}
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
			float4 lerpResult70 = lerp( lerpResult46 , tex2D( _MudHouse_T, uv_MudHouse_T ) , tex2D( _MudHouse_M, uv_MudHouse_M ).r);
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
161;49;2546;1004;7047.417;3736.933;4.720857;True;True
Node;AmplifyShaderEditor.SamplerNode;49;-1468.374,-2594.701;Float;True;Property;_Main_T;Main_T;13;0;Create;True;None;abad529f5e6fdfb4d84cb56c0d7d7f32;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;38;-1467.078,-2211.384;Float;True;Property;_Mud_M;Mud_M;11;0;Create;True;None;e332f283c031b8b4798cf258ce2efa56;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;50;-1468.289,-2403.755;Float;True;Property;_Mud_T;Mud_T;12;0;Create;True;None;18d9a632a5012bf49ad1132bb856d710;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;20;-948.2297,405.2227;Float;False;1411.939;656.5592;Final;9;14;8;13;11;9;5;7;10;12;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;51;-1466.644,-2019.47;Float;True;Property;_Pebbles_T;Pebbles_T;3;0;Create;True;None;a51dff7ab1345ba48a769c60bc309b49;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;39;-1466.621,-1823.09;Float;True;Property;_Pebbles_M;Pebbles_M;4;0;Create;True;None;d84dfe420be1d944f90acae9767fa2fb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;37;-929.6511,-2565.205;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WorldPosInputsNode;5;-898.2297,500.4803;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceCameraPos;7;-895.2008,680.5972;Float;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SamplerNode;43;-1463.274,-1435.974;Float;True;Property;_Rock_M;Rock_M;8;0;Create;True;None;f17cc9c133be29640873623859a51153;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;52;-1464.912,-1627.613;Float;True;Property;_Rock_T;Rock_T;5;0;Create;True;None;abad529f5e6fdfb4d84cb56c0d7d7f32;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DistanceOpNode;8;-503.9086,741.1968;Float;True;2;0;FLOAT3;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-822.6975,847.7244;Float;False;Property;_Trans_Distance;Trans_Distance;0;0;Create;True;0;234.52;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;42;-680.981,-2513.396;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;45;-1460.816,-1053.891;Float;True;Property;_Snow_M;Snow_M;6;0;Create;True;None;649914774b8a4ab46b2d37a82cff5ff2;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;53;-1459.563,-1240.144;Float;True;Property;_Snow_T;Snow_T;10;0;Create;True;None;7e63e36c845845b4dbdcbf06b0bbc453;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;44;-430.863,-2229.582;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-652.6909,946.782;Float;False;Property;_Trans_Falloff;Trans_Falloff;2;0;Create;True;0;1.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;9;-252.1085,684.8682;Float;False;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;69;-1464.318,-676.8267;Float;True;Property;_MudHouse_M;Mud House_M;7;0;Create;True;None;5518d51dbaf2b1a4eb64d37ec5d46a7d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;11;-114.3617,596.6818;Float;False;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;46;-275.4157,-2078.355;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;68;-1463.627,-863.9464;Float;True;Property;_MudHouse_T;Mud House_T;9;0;Create;True;None;a8c9c9d6a5d8b124ebf54fb30a5313dc;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;13;49.67933,530.6296;Float;False;3;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;1.0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;70;-28.04109,-1887.784;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;14;-577.2035,491.7094;Float;True;Property;_MainTexture_L;MainTexture_L;1;0;Create;True;None;75d402c5e5566004a8cd3db77612a4b5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;3;166.551,-1147.348;Float;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;3043.81,-1253.946;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Terrain_Mask;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;0;0;0;0;False;2;15;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;OFF;OFF;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;0;False;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;FLOAT;0.0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
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
WireConnection;11;0;9;0
WireConnection;11;1;12;0
WireConnection;46;0;44;0
WireConnection;46;1;53;0
WireConnection;46;2;45;0
WireConnection;13;0;11;0
WireConnection;70;0;46;0
WireConnection;70;1;68;0
WireConnection;70;2;69;0
WireConnection;3;0;70;0
WireConnection;3;1;14;0
WireConnection;3;2;13;0
WireConnection;0;0;3;0
ASEEND*/
//CHKSM=B80E34AC7799D090AEFBFA4BB7D10D5EFFA8FBBF
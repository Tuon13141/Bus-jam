﻿Shader "Toony Colors Pro 2/Hybrid Shader 2" {
	Properties {
		[Enum(Front, 2, Back, 1, Both, 0)] _Cull ("Render Face", Float) = 2
		[TCP2ToggleNoKeyword] _ZWrite ("Depth Write", Float) = 1
		[Toggle(_ALPHATEST_ON)] _UseAlphaTest ("Alpha Clipping", Float) = 0
		_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
		_BaseColor ("Color", Vector) = (1,1,1,1)
		_BaseMap ("Albedo", 2D) = "white" {}
		[TCP2ColorNoAlpha] _HColor ("Highlight Color", Vector) = (1,1,1,1)
		[TCP2ColorNoAlpha] _SColor ("Shadow Color", Vector) = (0.2,0.2,0.2,1)
		[Toggle(TCP2_SHADOW_LIGHT_COLOR)] _ShadowColorLightAtten ("Main Light affects Shadow Color", Float) = 1
		[Toggle(TCP2_SHADOW_TEXTURE)] _UseShadowTexture ("Enable Shadow Albedo Texture", Float) = 0
		[NoScaleOffset] _ShadowBaseMap ("Shadow Albedo", 2D) = "gray" {}
		[TCP2MaterialKeywordEnumNoPrefix(Default,_,Crisp,TCP2_RAMP_CRISP,Bands,TCP2_RAMP_BANDS,Bands Crisp,TCP2_RAMP_BANDS_CRISP,Texture,TCP2_RAMPTEXT)] _RampType ("Ramp Type", Float) = 0
		[TCP2Gradient] _Ramp ("Ramp Texture (RGB)", 2D) = "gray" {}
		_RampScale ("Scale", Float) = 1
		_RampOffset ("Offset", Float) = 0
		[PowerSlider(0.415)] _RampThreshold ("Threshold", Range(0.01, 1)) = 0.75
		_RampSmoothing ("Smoothing", Range(0, 1)) = 0.1
		[IntRange] _RampBands ("Bands Count", Range(1, 20)) = 4
		_RampBandsSmoothing ("Bands Smoothing", Range(0, 1)) = 0.1
		[TCP2HeaderToggle(TCP2_SPECULAR)] _UseSpecular ("Specular", Float) = 0
		[TCP2MaterialKeywordEnumNoPrefix(GGX,_,Stylized,TCP2_SPECULAR_STYLIZED,Crisp,TCP2_SPECULAR_CRISP)] _SpecularType ("Type", Float) = 0
		[TCP2ColorNoAlpha] [HDR] _SpecularColor ("Color", Vector) = (0.75,0.75,0.75,1)
		[PowerSlider(5.0)] _SpecularToonSize ("Size", Range(0.001, 1)) = 0.25
		_SpecularToonSmoothness ("Smoothing", Range(0, 1)) = 0.05
		_SpecularRoughness ("Roughness", Range(0, 1)) = 0.5
		[Enum(Disabled,0,Albedo Alpha,1,Custom R,2,Custom G,3,Custom B,4,Custom A,5)] _SpecularMapType ("Specular Map#Specular Map (A)", Float) = 0
		[NoScaleOffset] _SpecGlossMap ("Specular Texture", 2D) = "white" {}
		_IndirectIntensity ("Strength", Range(0, 1)) = 1
		[TCP2ToggleNoKeyword] _SingleIndirectColor ("Single Indirect Color", Float) = 0
		[TCP2HeaderToggle] _UseOutline ("Outline", Float) = 0
		[HDR] _OutlineColor ("Color", Vector) = (0,0,0,1)
		[TCP2MaterialKeywordEnumNoPrefix(Disabled,_,Vertex Shader,TCP2_OUTLINE_TEXTURED_VERTEX,Pixel Shader,TCP2_OUTLINE_TEXTURED_FRAGMENT)] _OutlineTextureType ("Texture", Float) = 0
		_OutlineTextureLOD ("Texture LOD", Range(0, 8)) = 5
		_OutlineWidth ("Width", Range(0, 10)) = 1
		[TCP2MaterialKeywordEnumNoPrefix(Disabled,_,Constant,TCP2_OUTLINE_CONST_SIZE,Minimum,TCP2_OUTLINE_MIN_SIZE,Min Max,TCP2_OUTLINE_MIN_MAX_SIZE)] _OutlinePixelSizeType ("Pixel Size", Float) = 0
		_OutlineMinWidth ("Minimum Width (Pixels)", Float) = 1
		_OutlineMaxWidth ("Maximum Width (Pixels)", Float) = 1
		[TCP2MaterialKeywordEnumNoPrefix(Normal, _, Vertex Colors, TCP2_COLORS_AS_NORMALS, Tangents, TCP2_TANGENT_AS_NORMALS, UV1, TCP2_UV1_AS_NORMALS, UV2, TCP2_UV2_AS_NORMALS, UV3, TCP2_UV3_AS_NORMALS, UV4, TCP2_UV4_AS_NORMALS)] _NormalsSource ("Outline Normals Source", Float) = 0
		[TCP2MaterialKeywordEnumNoPrefix(Full XYZ, TCP2_UV_NORMALS_FULL, Compressed XY, _, Compressed ZW, TCP2_UV_NORMALS_ZW)] _NormalsUVType ("UV Data Type", Float) = 0
		[TCP2MaterialKeywordEnumNoPrefix(Disabled,_,Main Directional Light,TCP2_OUTLINE_LIGHTING_MAIN,All Lights,TCP2_OUTLINE_LIGHTING_ALL,Indirect Only, TCP2_OUTLINE_LIGHTING_INDIRECT)] _OutlineLightingTypeURP ("Lighting", Float) = 0
		[TCP2MaterialKeywordEnumNoPrefix(Disabled,_,Main Directional Light,TCP2_OUTLINE_LIGHTING_MAIN,Indirect Only, TCP2_OUTLINE_LIGHTING_INDIRECT)] _OutlineLightingType ("Lighting", Float) = 0
		_DirectIntensityOutline ("Direct Strength", Range(0, 1)) = 1
		_IndirectIntensityOutline ("Indirect Strength", Range(0, 1)) = 0
		[ToggleOff(_RECEIVE_SHADOWS_OFF)] _ReceiveShadowsOff ("Receive Shadows", Float) = 1
		[HideInInspector] _RenderingMode ("rendering mode", Float) = 0
		[HideInInspector] _SrcBlend ("blending source", Float) = 1
		[HideInInspector] _DstBlend ("blending destination", Float) = 0
		[HideInInspector] _UseMobileMode ("Mobile mode", Float) = 0
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0
		float4 _BaseColor;

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			 o.Albedo = _BaseColor.rgb;

		}
		ENDCG
	}
	Fallback "Hidden/InternalErrorShader"
	//CustomEditor "ToonyColorsPro.ShaderGenerator.MaterialInspector_Hybrid"
}
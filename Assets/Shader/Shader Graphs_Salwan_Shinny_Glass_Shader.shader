Shader "Shader Graphs/Salwan_Shinny_Glass_Shader" {
	Properties {
		[NoScaleOffset] _MainTex ("MainTex", 2D) = "white" {}
		[NoScaleOffset] _DirtTex ("DirtTex", 2D) = "white" {}
		[NoScaleOffset] _DirtMask ("DirtMask", 2D) = "white" {}
		_Alpha ("Alpha", Range(0, 1)) = 1
		Vector1_b68d98f6551d4b6ba8197728b6226880 ("ReflectionTrans", Range(0, 1)) = 0
		_Fresnel ("Fresnel", Vector) = (0,1,0,0)
		[NoScaleOffset] Texture2D_5e10b36c5dff453fb3fa1a2d44a717c8 ("FakeReflection", 2D) = "white" {}
		Color_a23579cb1fa84dbb95a78a7165a1e636 ("MainColor", Vector) = (0.07778203,1,0,0)
		Color_edbe2a7fc6ee41049d9e0885f8757400 ("ReflectionColor", Vector) = (1,0,0,0)
		Vector2_07455fba5f7f45ecbd9e5c348ec929f3 ("Remap", Vector) = (0,1,0,0)
		Vector2_d51ac0cd31744eb7a2f992ea1fe32c20 ("Add", Vector) = (0,0,0,0)
		[HideInInspector] _QueueOffset ("_QueueOffset", Float) = 0
		[HideInInspector] _QueueControl ("_QueueControl", Float) = -1
		[HideInInspector] [NoScaleOffset] unity_Lightmaps ("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_LightmapsInd ("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector] [NoScaleOffset] unity_ShadowMasks ("unity_ShadowMasks", 2DArray) = "" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200
		CGPROGRAM
#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	Fallback "Hidden/Shader Graph/FallbackError"
	//CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
}
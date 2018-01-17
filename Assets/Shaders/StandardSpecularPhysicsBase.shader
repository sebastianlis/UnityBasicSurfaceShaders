Shader "MyShader/SimpleStandardSpecularPhysicsB" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_SpecColor ("Specular color", Color) = (1,1,1,1)
	}
	SubShader {
		CGPROGRAM
		#pragma surface surf StandardSpecular

		struct Input {
			float2 uv_MainTex;
		};

		sampler2D _MainTex;
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutputStandardSpecular o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = _Color.rgb;
			o.Specular = _SpecColor.rgb;
			o.Smoothness = c.r;
		}
		ENDCG
	}
	FallBack "Diffuse"
}

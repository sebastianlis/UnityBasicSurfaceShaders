﻿Shader "MyShader/MySimpleShader" {
    Properties {
        _Color("Color", Color) = (1,1,1,1)
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float2 uvMainTex;
            };

            float4 _Color;

            void surf(Input IN, inout SurfaceOutput o) {
                o.Albedo.rgb = _Color.rgb;
            }

        ENDCG
    }

    FallBack "Diffuse"
}

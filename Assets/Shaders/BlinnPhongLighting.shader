﻿Shader "MyShader/BlinnPhongLighting" {

    Properties {
        _Color("Color", Color) = (1,1,1,1)
        _Specular("Specular Range", Range(0,1)) = 0.5
        _Gloss("Gloss Range", Range(0,1)) = 0.5
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf BlinnPhong
            float4 _Color;
            half _Specular;
            float _Gloss;

            struct Input {
                float2 uv_MainTex;
            };

            void surf(Input IN, inout SurfaceOutput o) {
                o.Albedo = _Color.rgb;
                o.Specular = _Specular;
                o.Gloss = _Gloss;
            }

        ENDCG
    }

    FallBack "Diffuse"
}

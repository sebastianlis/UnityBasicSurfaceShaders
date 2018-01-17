Shader "MyShader/SimpleCubeMap" {
    Properties {
        _Cube("Cube Map", CUBE) = "white" {}
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            samplerCUBE _Cube;

            struct Input {
                float2 uv_Cube;
                float3 worldRefl;
            };

            void surf(Input IN, inout SurfaceOutput o) {
                o.Albedo = texCUBE(_Cube, IN.worldRefl).rgb;
            }
        ENDCG
    }

    FallBack "Diffuse"
}

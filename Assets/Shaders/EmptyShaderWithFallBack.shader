Shader "MyShader/EmptyShaderWithFallBack" {
    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float2 uvMainTex;
            };

            void surf(Input IN, inout SurfaceOutput o) {

            }

        ENDCG
    }
    FallBack "Diffuse"
}

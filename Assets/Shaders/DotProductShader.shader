Shader "MyShader/DotProduct" {

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float3 viewDir;
            };

            void surf(Input IN, inout SurfaceOutput o) {
                half dotProduct = dot(IN.viewDir, o.Normal);
                o.Albedo = float3(1,0,dotProduct);
            }
        ENDCG
    }
    FallBack "Diffuse"
}

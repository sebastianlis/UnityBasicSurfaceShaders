Shader "MyShader/OneMinusDotProduct" {
    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float3 viewDir;
            };

            void surf (Input IN, inout SurfaceOutput o) {
                half dotProd = 1-dot(IN.viewDir, o.Normal);
                o.Albedo = float3(dotProd,dotProd,1);
            }
        ENDCG
    }
}

Shader "MyShader/SimpleCutOffFrac" {
    Properties {
        _simpleRim("Simple Rim Color", Color) = (1,1,1,1)
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float3 viewDir;
                float3 worldPos;
            };

            float4 _simpleRim;

            void surf(Input IN, inout SurfaceOutput o) {
                half rimDotProd = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));

                o.Emission = frac(IN.worldPos.y*10*0.5)>0.4?
                float3(0.3,0.45,0)*rimDotProd:rimDotProd>0.3?float3(1,0.7,0)*rimDotProd:float3(0.8,0.5,0.2)*rimDotProd;
            }
        ENDCG
    }

    FallBack "Diffuse"

}

Shader "MyShader/SimpleCutOffConstantColorCondition" {
    Properties {
        _simpleRim("Simple Rim Color", Color) = (1,1,1,1)
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float3 viewDir;
            };

            float4 _simpleRim;

            void surf(Input IN, inout SurfaceOutput o) {
                half rimDotProd = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));

                o.Emission = rimDotProd>0.5?
                float3(0.3,0.45,0):rimDotProd>0.3?float3(1,0.7,0):float3(0.8,0.5,0.2);
            }
        ENDCG
    }

    FallBack "Diffuse"

}

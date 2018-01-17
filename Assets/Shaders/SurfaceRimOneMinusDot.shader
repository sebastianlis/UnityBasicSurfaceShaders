Shader "MyShader/SimpleRimOneMinusDot" {
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
                o.Emission = _simpleRim.rgb*rimDotProd;
            }
        ENDCG
    }

    FallBack "Diffuse"
}

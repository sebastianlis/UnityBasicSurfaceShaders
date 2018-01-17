Shader "MyShader/SimpleCutOffHalf" {
    Properties {
        _simpleRim("Simple Rim Color", Color) = (1,1,1,1)
        _colorHeight("Height of Color", Range(0.0, 2.0)) = 1
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float3 viewDir;
                float3 worldPos;
            };

            float4 _simpleRim;
            float _colorHeight;

            void surf(Input IN, inout SurfaceOutput o) {
                half rimDotProd = 1 - saturate(dot(normalize(IN.viewDir),
                o.Normal));

                o.Emission = IN.worldPos.y>_colorHeight? float3(0.3,0.45,0):float3(1,0.7,0);
            }
        ENDCG
    }

    FallBack "Diffuse"

}

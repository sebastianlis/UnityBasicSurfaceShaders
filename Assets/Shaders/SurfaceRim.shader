Shader "MyShader/SimpleRim" {
    Properties {
        _simpleRim("Simple Rim Color", Color) = (1,1,1,1)
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert
            float4 _simpleRim;

            struct Input {
                float3 viewDir;
            };

            void surf(Input IN, inout SurfaceOutput o) {
                half rimDotProduct = dot(normalize(IN.viewDir), o.Normal);
                o.Emission = _simpleRim.rgb * rimDotProduct;
            }
        ENDCG
    }

    FallBack "Diffuse"
}

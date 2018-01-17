Shader "MyShader/HoloSlices" {
    Properties {
        _Color("Color", Color) = (0, 0.5, 0.5, 0.0)
        _Power("Power", Range(0.5,8.0)) = 3.0
    }

    SubShader {
        Tags{"Queue" = "Transparent"}

        CGPROGRAM
            #pragma surface surf Lambert alpha:fade

            struct Input {
                float3 viewDir;
                float3 worldPos;
            };

            float4 _Color;
            float _Power;

            void surf(Input IN, inout SurfaceOutput o) {
                clip(frac((IN.worldPos.y+IN.worldPos.z*0.1)*9)-0.5);
                half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
                o.Emission = _Color.rgb * pow(rim, _Power) * 10;
                o.Alpha = pow(rim, _Power);
            }
        ENDCG
    }

    FallBack "Diffuse"

}

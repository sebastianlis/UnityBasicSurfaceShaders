Shader "MyShader/SimpleTextureShader" {
    Properties {
        _Texture("Texture", 2D) = "white" {}
    }

    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _Texture;

            struct Input {
                float2 uv_Texture;
            };

            void surf(Input IN, inout SurfaceOutput o) {
                o.Albedo = tex2D(_Texture, IN.uv_Texture).rgb;
            }
        ENDCG
    }

}

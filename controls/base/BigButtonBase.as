package controls.base
{
   import controls.BigButton1;
   import utils.FontParamsUtil;
   
   public class BigButtonBase extends BigButton1
   {
      public function BigButtonBase()
      {
         super();
         _label.sharpness = FontParamsUtil.SHARPNESS_LABEL_BASE;
         _label.thickness = FontParamsUtil.THICKNESS_LABEL_BASE;
         _info.sharpness = FontParamsUtil.SHARPNESS_LABEL_BASE;
         _info.thickness = FontParamsUtil.THICKNESS_LABEL_BASE;
      }
   }
}


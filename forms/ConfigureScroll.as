package forms
{
   import fl.controls.List;
   
   public class ConfigureScroll
   {
      public function ConfigureScroll()
      {
         super();
      }
      
      public static function configScrollList(param1:List, param2:Class, param3:Class, param4:Class, param5:Class) : void
      {
         param1.setStyle("downArrowUpSkin",param2);
         param1.setStyle("downArrowDownSkin",param2);
         param1.setStyle("downArrowOverSkin",param2);
         param1.setStyle("downArrowDisabledSkin",param2);
         param1.setStyle("upArrowUpSkin",param3);
         param1.setStyle("upArrowDownSkin",param3);
         param1.setStyle("upArrowOverSkin",param3);
         param1.setStyle("upArrowDisabledSkin",param3);
         param1.setStyle("trackUpSkin",param4);
         param1.setStyle("trackDownSkin",param4);
         param1.setStyle("trackOverSkin",param4);
         param1.setStyle("trackDisabledSkin",param4);
         param1.setStyle("thumbUpSkin",param5);
         param1.setStyle("thumbDownSkin",param5);
         param1.setStyle("thumbOverSkin",param5);
         param1.setStyle("thumbDisabledSkin",param5);
      }
   }
}


package assets.cellrenderer.battlelist
{
   import flash.filters.GlowFilter;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol4")]
   public class CellRenderer_downSkin extends CellNormalUp
   {
      public function CellRenderer_downSkin()
      {
         super();
         filters = [new GlowFilter(16777215,0.1,20,20,2,1,true)];
      }
   }
}


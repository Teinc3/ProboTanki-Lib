package assets.cellrenderer.battlelist
{
   import flash.filters.GlowFilter;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol7")]
   public class CellRenderer_selectedDownSkin extends CellNormalSelected
   {
      public function CellRenderer_selectedDownSkin()
      {
         super();
         filters = [new GlowFilter(0,0.1,20,20,2,1,true)];
      }
   }
}


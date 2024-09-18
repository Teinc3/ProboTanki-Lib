package §3"q§
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import flash.geom.Point;
   
   public class §throw set super§ implements §0<§
   {
      protected var faces:Vector.<Face>;
      
      protected var rotation:Number;
      
      protected var vertices:Vector.<Vertex>;
      
      protected var §class package native§:Vector.<Point>;
      
      public function §throw set super§()
      {
         this.faces = new Vector.<Face>();
         this.vertices = new Vector.<Vertex>();
         this.§class package native§ = new Vector.<Point>();
         super();
         this.rotation = 0;
      }
      
      public function addFace(param1:Face) : void
      {
         this.faces.push(param1);
      }
      
      public function init() : void
      {
         var _loc1_:Face = null;
         var _loc2_:Vertex = null;
         for each(_loc1_ in this.faces)
         {
            for each(_loc2_ in _loc1_.vertices)
            {
               this.vertices.push(_loc2_);
               this.§class package native§.push(new Point(_loc2_.u,_loc2_.v));
            }
         }
      }
      
      public function §28§(param1:Material) : void
      {
         var _loc2_:Face = null;
         for each(_loc2_ in this.faces)
         {
            _loc2_.material = param1;
         }
      }
      
      public function rotate(param1:Number) : void
      {
         this.rotation += param1;
      }
      
      public function reset() : void
      {
         this.rotation = 0;
      }
   }
}


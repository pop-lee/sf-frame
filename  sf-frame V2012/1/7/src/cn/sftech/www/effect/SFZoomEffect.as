package cn.sftech.www.effect
{
	import cn.sftech.www.effect.base.SFEffectBase;
	
	import com.greensock.data.TweenLiteVars;
	
	import flash.display.DisplayObject;
	
	public class SFZoomEffect extends SFEffectBase
	{
		private var _zoomXTo : Number;
		
		private var _zoomXFrom : Number;
		
		private var _zoomYTo : Number;
		
		private var _zoomYFrom : Number;
		
		public function SFZoomEffect()
		{
			super();
			vars = new TweenLiteVars();
		}
		
		public function set zoomXTo(value : Number) : void
		{
			_zoomXTo = value;
		}
		
		public function set zoomXFrom(value : Number) : void
		{
			_zoomXFrom = value;
		}
		
		public function set zoomYTo(value : Number) : void
		{
			_zoomYTo = value;
		}
		
		public function set zoomYFrom(value : Number) : void
		{
			_zoomYFrom = value;
		}
		
		override public function play():void
		{
			if(!isNaN(_zoomXFrom))
				target.scaleX = _zoomXFrom;
			if(!isNaN(_zoomYFrom))
				target.scaleY = _zoomYFrom;
			if(!isNaN(_zoomXTo))
				vars.prop("scaleX",_zoomXTo);
			if(!isNaN(_zoomYTo))
				vars.prop("scaleY",_zoomYTo);
			super.play();
		}
		
	}
}
package cn.sftech.www.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import mx.effects.Move;
	
	public class SFMovieClip extends Sprite
	{
		private var _backgroundClass : Class;
		
		private var _background : MovieClip;
		
		public function SFMovieClip()
		{
			super();
		}
		
		public function set backgroundImage(value : *) : void
		{
			if(_background) {
				removeChildAt(0);
			}
			_backgroundClass = value;
			_background = new _backgroundClass();
			_background.stop();
			addChildAt(_background,0);
			
		}
		
		public function get backgroundImage() : MovieClip
		{
			if(this._background != null) {
				return _background;
			}
			return null;
		}
	}
}
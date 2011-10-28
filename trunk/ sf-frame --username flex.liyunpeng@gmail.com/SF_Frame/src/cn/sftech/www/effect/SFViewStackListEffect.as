package cn.sftech.www.effect
{
	import cn.sftech.www.effect.base.SFEffect;
	import cn.sftech.www.effect.base.SFEffectGroup;
	import cn.sftech.www.effect.base.SFViewStackEffect;
	
	import com.greensock.data.TweenLiteVars;

	public class SFViewStackListEffect extends SFViewStackEffect
	{
		public function SFViewStackListEffect()
		{
			super();
		}
		
		override public function get showEffect():SFEffect
		{
			var effect : SFEffect = new SFEffect();
			_viewStack.getChildAt(_viewStack.selectedIndex).visible = true;
			effect.target = _viewStack.getChildAt(_viewStack.selectedIndex);
			effect.duration = _duration;
//			effect.isTo = false;
			_vars = new TweenLiteVars()
//			if(_viewStack.selectedIndex > _viewStack.oldSelectIndex) {
//				_viewStack.getChildAt(_viewStack.selectedIndex).x = _viewStack.width;
//			} else {
//				_viewStack.getChildAt(_viewStack.selectedIndex).x = -_viewStack.width;
//			}
			_vars.prop("x",0);
			effect.vars = _vars;
			
			return effect;
		}
		
		override public function get hideEffect():SFEffect
		{
			var effect : SFEffect = new SFEffect();
			effect.target = _viewStack.getChildAt(_viewStack.oldSelectIndex);
			effect.duration = _duration;
			_vars = new TweenLiteVars();
			if(_viewStack.selectedIndex > _viewStack.oldSelectIndex) {
				_vars.prop("x",-_viewStack.width);
			} else {
				_vars.prop("x",_viewStack.width);
			}
			effect.vars = _vars;
			effect.onComplete = hideOnComplete;
			
			return effect;
		}
		
		private function hideOnComplete() : void
		{
			_viewStack.getChildAt(_viewStack.oldSelectIndex).visible = false;
		}
	}
}
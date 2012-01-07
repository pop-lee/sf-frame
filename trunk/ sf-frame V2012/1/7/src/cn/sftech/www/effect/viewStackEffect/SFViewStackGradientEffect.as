package cn.sftech.www.effect.viewStackEffect
{
	import cn.sftech.www.effect.SFGradientEffect;
	import cn.sftech.www.effect.base.SFEffect;
	import cn.sftech.www.effect.base.SFViewStackEffect;
	
	import flash.display.DisplayObject;

	public class SFViewStackGradientEffect extends SFViewStackEffect
	{
		public function SFViewStackGradientEffect()
		{
			super();
		}
		
		private var _showEffect : SFGradientEffect = new SFGradientEffect();
		
		private var _hideEffect : SFGradientEffect = new SFGradientEffect();
		
		private var _effectArr : Vector.<SFGradientEffect> = new Vector.<SFGradientEffect>();
		
		/**
		 * 描述效果播放特效的逻辑
		 * 
		 */		
		override protected function playEffect() : void
		{
			target.getChildAt(target.oldSelectIndex).visible = true;
			_hideEffect.target = target.getChildAt(target.oldSelectIndex);
			_hideEffect.duration = duration;
			_hideEffect.alphaFrom = 1;
			_hideEffect.alphaTo = 0;
			_hideEffect.vars.onComplete(effectOnComplete,[_hideEffect.target]);
			_hideEffect.play();
			
			_showEffect.target = target.getChildAt(target.selectedIndex);
			_showEffect.duration = duration;
			_showEffect.alphaFrom = 0;
			_showEffect.alphaTo = 1;
			_showEffect.play();
		}
		
		override protected function stopEffect():void
		{
			
		}
		
		private function effectOnComplete(object : DisplayObject) : void
		{
			object.visible = false;
		}
	}
}
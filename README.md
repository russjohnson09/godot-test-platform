



# Platforms
So, I'm ignoring the first part of this, but the second part is important for these platforms. They are not affected by phyics but affect other physics bodies in their path.

CharacterBody2D is a specialized class for physics bodies that are meant to be user-controlled. They are not affected by physics at all, 
but they affect other physics bodies in their path. 


The funny thing is I might have better luck with what I want to do with the player character being a rigidbody instead?




https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html


https://github.com/godotengine/godot-demo-projects/tree/master/2d/kinematic_character

So I guess the use of CharacterBody2D is exactly what is done in this demo project ^^. Strange that the docs make it seem like this type is useful only for actual playable characters.


Also it uses AnimationPlayer to change the position and not PathFollow2D. This is actually easier for me to follow anyways. and results in the CharacterBody2D being the root with AnimationPlayer being the child. This is all much easier to follow.

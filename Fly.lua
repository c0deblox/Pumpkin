function Fly()local a=Instance.new("BodyGyro",L)a.P=9e4;a.maxTorque=Vector3.new(9e9,9e9,9e9)a.cframe=L.CFrame;local b=Instance.new("BodyVelocity",L)b.velocity=Vector3.new(0,0.1,0)b.maxForce=Vector3.new(9e9,9e9,9e9)repeat wait()z.Character.Humanoid.PlatformStand=true;if O.l+O.r~=0 or O.f+O.b~=0 then H=H+.5+H/Q;if H>Q then H=Q end elseif not(O.l+O.r~=0 or O.f+O.b~=0)and H~=0 then H=H-1;if H<0 then H=0 end end;if O.l+O.r~=0 or O.f+O.b~=0 then b.velocity=(game.Workspace.CurrentCamera.CoordinateFrame.lookVector*(O.f+O.b)+game.Workspace.CurrentCamera.CoordinateFrame*CFrame.new(O.l+O.r,(O.f+O.b)*.2,0).p-game.Workspace.CurrentCamera.CoordinateFrame.p)*H;P={f=O.f,b=O.b,l=O.l,r=O.r}elseif O.l+O.r==0 and O.f+O.b==0 and H~=0 then b.velocity=(game.Workspace.CurrentCamera.CoordinateFrame.lookVector*(P.f+P.b)+game.Workspace.CurrentCamera.CoordinateFrame*CFrame.new(P.l+P.r,(P.f+P.b)*.2,0).p-game.Workspace.CurrentCamera.CoordinateFrame.p)*H else b.velocity=Vector3.new(0,0.1,0)end;a.cframe=game.Workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad((O.f+O.b)*50*H/Q),0,0)until not M;O={f=0,b=0,l=0,r=0}P={f=0,b=0,l=0,r=0}H=0;a:Destroy()b:Destroy()z.Character.Humanoid.PlatformStand=false end;y.KeyDown:connect(function(c)if c:lower()=="e"then if M then M=false else M=true;Fly()end elseif c:lower()=="w"then O.f=1 elseif c:lower()=="s"then O.b=-1 elseif c:lower()=="a"then O.l=-1 elseif c:lower()=="d"then O.r=1 end end)y.KeyUp:connect(function(c)if c:lower()=="w"then O.f=0 elseif c:lower()=="s"then O.b=0 elseif c:lower()=="a"then O.l=0 elseif c:lower()=="d"then O.r=0 end end)Fly()
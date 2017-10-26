Pod::Spec.new do |s|
    s.name = "ImmediateAnimationController"
    s.version = "1.0.0"
    s.summary = "ImmediateAnimationController implements UIViewControllerAnimatedTransitioning without any animation"
    s.homepage = "https://github.com/ladeiko/ImmediateAnimationController"
    s.license = { :type => "CUSTOM", :file => "LICENSE" }
    s.author = { "Siarhei Ladzeika" => "sergey.ladeiko@bpmobile.com" }
    s.platform = :ios, "9.0"
    s.source = { :git => "https://github.com/ladeiko/ImmediateAnimationController.git", :tag => "#{s.version}" }
    s.source_files = "Classes/**/*.{m,s,swift}"
    s.frameworks = "UIKit"
    s.requires_arc = true
end

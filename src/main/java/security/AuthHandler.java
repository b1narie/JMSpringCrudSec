package security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

public class AuthHandler implements AuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        String targetUri = handle(authentication);
        redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, targetUri);
    }

    private String handle(Authentication authentication) {
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        boolean isAdmin = false;
        boolean isUser = false;
        for (GrantedAuthority authority : authorities) {
            if (authority.getAuthority().equals("admin")) {
                isAdmin = true;
                break;
            } else if (authority.getAuthority().equals("user")) {
                isUser = true;
                break;
            }
        }
        if (isAdmin) {
            return "/admin/list";
        } else if (isUser) {
            return "/user";
        } else {
            throw new IllegalStateException();
        }
    }
}

package web2018.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;


@Configuration
@EnableWebSecurity
public class ConfiguracionSeguridad extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select NOMBRE_USUARIO,CONTRASENA,HABILITADO from USUARIO where NOMBRE_USUARIO=?")
                .authoritiesByUsernameQuery("select NOMBRE_USUARIO, ROL  from USUARIO where NOMBRE_USUARIO=?");
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/index", "/usuarios","/alquileres","/equipos","/clientes").authenticated()
                .anyRequest().permitAll()
                .antMatchers("/usuarios/").hasAnyRole("ADMINISTRADOR")
                .and()
                .formLogin().loginPage("/login").permitAll().successForwardUrl("/index")
                .usernameParameter("username").passwordParameter("password")
                .defaultSuccessUrl("/index")
                .and()
                .logout().logoutSuccessUrl("/logout")
                .and()
                .exceptionHandling().accessDeniedPage("/403")
                .and()
                .csrf()
                .and()
                .exceptionHandling().accessDeniedPage("/error");
    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using System.DirectoryServices.AccountManagement;

namespace WebApiJwt.Controllers
{
    [Route("[controller]/[action]")]
    public class AccountController : Controller
    {

        private readonly IConfiguration _configuration;

        public AccountController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [Authorize]
        [HttpGet]
        public async Task<object> Protected()
        {
            return "You are not premium.";
        }
        [HttpPost]
        public string Login([FromBody] LoginDto model)
        {

            var user = new IdentityUser
            {
                UserName = model.Username,
                Email = model.Username
            };

            bool result = ActiveDirectoryAuthenticate(model.Username, model.Password);

            if(result)
            return  GenerateJwtToken(model.Username, user);

            throw new ApplicationException("INVALID_LOGIN_ATTEMPT");
        }


        private string GenerateJwtToken(string email, IdentityUser user)
        {
            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.Sub, email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(ClaimTypes.NameIdentifier, user.Id)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtKey"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var expires = DateTime.Now.AddDays(Convert.ToDouble(_configuration["JwtExpireDays"]));

            var token = new JwtSecurityToken(
                _configuration["JwtIssuer"],
                _configuration["JwtIssuer"],
                claims,
                expires: expires,
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        public class LoginDto
        {
            [Required]
            public string Username { get; set; }

            [Required]
            public string Password { get; set; }

        }

        public static bool ActiveDirectoryAuthenticate(string login, string password)
        {
            bool isValid = false;
            using (PrincipalContext pc = new PrincipalContext(ContextType.Domain, "pentacomp"))
            {
                isValid = pc.ValidateCredentials(login, password);
            }
            return isValid;
        }
    }
}